using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Data.SqlClient;

public partial class Admin_Protected_MatrimonialDataBase : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                using (SqlConnection objConnection = DBConnection.GetSqlConnection())
                {
                    SqlCommand objCommand = new SqlCommand("Matrimonials_DataBaseDetails", objConnection);
                    objCommand.CommandType = CommandType.StoredProcedure;

                    //Database Operations 
                    // Open Connection 
                    objConnection.Open();
                    SqlDataAdapter objAdapter = new SqlDataAdapter(objCommand);
                    DataSet objDataSet = new DataSet();
                    // Close Connection 
                    objConnection.Close();
                    objAdapter.Fill(objDataSet, "ResultSet");
                    GV_Query.DataSource = objDataSet;
                    GV_Query.DataBind();

                }
            }
            catch (Exception Ex)
            {
                ErrorLog.WriteErrorLog("Admin-Protected-MatrimonialDatabase", Ex);
                L_QueryError.Visible = true;
            }
        }
        else
        {

            try
            {
                using (SqlConnection objConnection = DBConnection.GetSqlConnection())
                {
                    SqlCommand objCommand = new SqlCommand("Matrimonials_DataBaseDetails", objConnection);
                    objCommand.CommandType = CommandType.StoredProcedure;
                    
                    //Database Operations 
                    // Open Connection 
                    objConnection.Open();
                    SqlDataAdapter objAdapter = new SqlDataAdapter(objCommand);
                    DataSet objDataSet = new DataSet();
                    objAdapter.Fill(objDataSet, "ResultSet");

                    //Save AS Excel

                    // Open Connection 
                    objConnection.Close();
                    DataTable objDataTable = objDataSet.Tables["ResultSet"].Copy();

                    // DB2Excel all the details to Excel
                    DB2Excel objExport = new DB2Excel();
                    objExport.Export(objDataTable, DB2Excel.ExportFormat.Excel, "Query_Results_." + DateTime.Now.ToShortDateString() + ".xls");

                }
            }
            catch (Exception Ex)//Oops Some Error Had Happend
            {
                ErrorLog.WriteErrorLog("Admin-Protected-Matrimonial Database", Ex);
                L_QueryError.Visible = true;
            }

        }

    }

}
