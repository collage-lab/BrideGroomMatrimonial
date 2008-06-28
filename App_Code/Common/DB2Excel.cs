using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
/////////////////////////////////////////
using System.IO;
using System.Text;
using System.Xml;
using System.Xml.Xsl;
using System.Threading;
/////////////////////////////////////////

/// <summary>
/// Summary description for DB2Excelcs
/// </summary>
public class DB2Excel
{
    public enum ExportFormat : int { CSV = 1, Excel = 2 }; // Export format enumeration	
	// private Declirations	
    System.Web.HttpResponse objHttpResponse;

    public DB2Excel()
    {
        objHttpResponse = System.Web.HttpContext.Current.Response;

    }

    #region "Public Methodes"

    //To get all the column headers in the datatable and exorts in CSV / Excel format with all columns

    public void Export(DataTable Table, ExportFormat FormatType, string FileName)
    {
        try
        {
            if (Table.Rows.Count == 0)
                throw new Exception("There are no details to export.");

            // Create Dataset
            DataSet objDataSet = new DataSet("Export");
            DataTable objDataTable = Table.Copy();
            objDataTable.TableName = "Values";
            objDataSet.Tables.Add(objDataTable);

            // Getting Field Names
            string[] strAHeaders = new string[objDataTable.Columns.Count];
            string[] strAFileds = new string[objDataTable.Columns.Count];

            for (int i = 0; i < objDataTable.Columns.Count; i++)
            {
                strAHeaders[i] = objDataTable.Columns[i].ColumnName;
                strAFileds[i] = ReplaceSpclChars(objDataTable.Columns[i].ColumnName);
            }

            ExportXSLT(objDataSet, strAHeaders, strAFileds, FormatType, FileName);
        }
        catch (Exception Ex)
        {
            ErrorLog.WriteErrorLog("DB2Excel-ExportDetails", Ex);

        }
    }

    // Purpose	 : To get the specified column headers in the datatable and exorts in CSV / Excel format with specified columns

    public void Export(DataTable DetailsTable, int[] ColumnList, ExportFormat FormatType, string FileName)
    {
        try
        {
            if (DetailsTable.Rows.Count == 0)
                throw new Exception("There are no details to export");

            // Create Dataset
            DataSet objDataSet = new DataSet("Export");
            DataTable objDataTable = DetailsTable.Copy();
            objDataTable.TableName = "Values";
            objDataSet.Tables.Add(objDataTable);

            if (ColumnList.Length > objDataTable.Columns.Count)
                throw new Exception("ExportColumn List should not exceed Total Columns");

            // Getting Field Names
            string[] strAHeaders = new string[ColumnList.Length];
            string[] strAFileds = new string[ColumnList.Length];

            for (int i = 0; i < ColumnList.Length; i++)
            {
                if ((ColumnList[i] < 0) || (ColumnList[i] >= objDataTable.Columns.Count))
                    throw new Exception("ExportColumn Number should not exceed Total Columns Range");

                strAHeaders[i] = objDataTable.Columns[ColumnList[i]].ColumnName;
                strAFileds[i] = ReplaceSpclChars(objDataTable.Columns[ColumnList[i]].ColumnName);
            }

                ExportXSLT(objDataSet, strAHeaders, strAFileds, FormatType, FileName);
        }
        catch (Exception Ex)
        {
                        throw Ex;//<<<<<<<<<<< ForTesting >>>>>>>>>>>.
        }
    }


    // To get the specified column headers in the datatable and	exorts in CSV / Excel format with specified columns and with specified headers

    public void Export(DataTable DetailsTable, int[] ColumnList, string[] Headers, ExportFormat FormatType,
        string FileName)
    {
        try
        {
            if (DetailsTable.Rows.Count == 0)
                throw new Exception("There are no details to export");

            // Create Dataset
            DataSet objDataSet = new DataSet("Export");
            DataTable objDataTable = DetailsTable.Copy();
            objDataTable.TableName = "Values";
            objDataSet.Tables.Add(objDataTable);

            if (ColumnList.Length != Headers.Length)
                throw new Exception("ExportColumn List and Headers List should be of same length");
            else if (ColumnList.Length > objDataTable.Columns.Count || Headers.Length > objDataTable.Columns.Count)
                throw new Exception("ExportColumn List should not exceed Total Columns");

            // Getting Field Names
            string[] strAFileds = new string[ColumnList.Length];

            for (int i = 0; i < ColumnList.Length; i++)
            {
                if ((ColumnList[i] < 0) || (ColumnList[i] >= objDataTable.Columns.Count))
                    throw new Exception("ExportColumn Number should not exceed Total Columns Range");

                strAFileds[i] = ReplaceSpclChars(objDataTable.Columns[ColumnList[i]].ColumnName);
            }

                ExportXSLT(objDataSet, Headers, strAFileds, FormatType, FileName);
        }
        catch (Exception Ex)
        {
                        throw Ex;//<<<<<<<<<<< ForTesting >>>>>>>>>>>.
        }
    }
    #endregion

    #region "Private Methodes"

    // Exports dataset into CSV / Excel format

    private void ExportXSLT(DataSet dsExport, string[] sHeaders, string[] sFileds, ExportFormat FormatType, string FileName)
    {
        try
        {
            // Appending Headers
            objHttpResponse.Clear();
            objHttpResponse.Buffer = true;

            if (FormatType == ExportFormat.CSV)
            {
                objHttpResponse.ContentType = "text/csv";
                objHttpResponse.AppendHeader("content-disposition", "attachment; filename=" + FileName);
            }
            else
            {
                objHttpResponse.ContentType = "application/vnd.ms-excel";
                objHttpResponse.AppendHeader("content-disposition", "attachment; filename=" + FileName);
            }

            // XSLT to use for transforming this dataset.						
            MemoryStream stream = new MemoryStream();
            XmlTextWriter writer = new XmlTextWriter(stream, Encoding.UTF8);

            CreateStylesheet(writer, sHeaders, sFileds, FormatType);
            writer.Flush();
            stream.Seek(0, SeekOrigin.Begin);

            XmlDataDocument xmlDoc = new XmlDataDocument(dsExport);
            //dsExport.WriteXml("Data.xml");
            XslTransform xslTran = new XslTransform();
            xslTran.Load(new XmlTextReader(stream), null, null);

            System.IO.StringWriter sw = new System.IO.StringWriter();
            xslTran.Transform(xmlDoc, null, sw, null);

            //Writeout the Content				
            objHttpResponse.Write(sw.ToString());
            sw.Close();
            writer.Close();
            stream.Close();
            objHttpResponse.End();
        }
        catch (ThreadAbortException Ex)
        {
            string ErrMsg = Ex.Message;
        }
        catch (Exception Ex)
        {
            ErrorLog.WriteErrorLog("DB2Excel-ExportDetails", Ex);
        }
    }


    // Creates XSLT file to apply on dataset's XML file 

    private void CreateStylesheet(XmlTextWriter writer, string[] Headers, string[] Fileds, ExportFormat FormatType)
    {
        try
        {
            // xsl:stylesheet
            string strHead = "http://www.w3.org/1999/XSL/Transform";
            writer.Formatting = Formatting.Indented;
            writer.WriteStartDocument();
            writer.WriteStartElement("xsl", "stylesheet", strHead);
            writer.WriteAttributeString("version", "1.0");
            writer.WriteStartElement("xsl:output");
            writer.WriteAttributeString("method", "text");
            writer.WriteAttributeString("version", "4.0");
            writer.WriteEndElement();

            // xsl-template
            writer.WriteStartElement("xsl:template");
            writer.WriteAttributeString("match", "/");

            // xsl:value-of for headers
            for (int i = 0; i < Headers.Length; i++)
            {
                writer.WriteString("\"");
                writer.WriteStartElement("xsl:value-of");
                writer.WriteAttributeString("select", "'" + Headers[i] + "'");
                writer.WriteEndElement(); // xsl:value-of
                writer.WriteString("\"");
                if (i != Fileds.Length - 1) writer.WriteString((FormatType == ExportFormat.CSV) ? "," : "	");
            }

            // xsl:for-each
            writer.WriteStartElement("xsl:for-each");
            writer.WriteAttributeString("select", "Export/Values");
            writer.WriteString("\r\n");

            // xsl:value-of for data fields
            for (int i = 0; i < Fileds.Length; i++)
            {
                writer.WriteString("\"");
                writer.WriteStartElement("xsl:value-of");
                writer.WriteAttributeString("select", Fileds[i]);
                writer.WriteEndElement(); // xsl:value-of
                writer.WriteString("\"");
                if (i != Fileds.Length - 1) writer.WriteString((FormatType == ExportFormat.CSV) ? "," : "	");
            }

            writer.WriteEndElement(); // xsl:for-each
            writer.WriteEndElement(); // xsl-template
            writer.WriteEndElement(); // xsl:stylesheet
            writer.WriteEndDocument();
        }
        catch (Exception Ex)
        {
                        throw Ex;//<<<<<<<<<<< ForTesting >>>>>>>>>>>.
        }
    }

    // Replaces special characters with XML codes 

    private string ReplaceSpclChars(string fieldName)
    {
        //			space 	-> 	_x0020_
        //			%		-> 	_x0025_
        //			#		->	_x0023_
        //			&		->	_x0026_
        //			/		->	_x002F_

        fieldName = fieldName.Replace(" ", "_x0020_");
        fieldName = fieldName.Replace("%", "_x0025_");
        fieldName = fieldName.Replace("#", "_x0023_");
        fieldName = fieldName.Replace("&", "_x0026_");
        fieldName = fieldName.Replace("/", "_x002F_");
        return fieldName;
    }

    #endregion
}
