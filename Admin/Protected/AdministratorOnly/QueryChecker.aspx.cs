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

public partial class Admin_Protected_MQueryChecker : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void B_Submit_Click(object sender, EventArgs e)
    {
        if (TB_SQL_Query.Text != "")
        {
            try
            {
                string strSQL = TB_SQL_Query.Text.Trim();

                if ((strSQL.ToLower().IndexOf("select") >= 0))
                {
                    using (SqlConnection objConnection = DBConnection.GetSqlConnection())
                    {
                        //Database Operations
                        SqlDataAdapter objAdapter = new SqlDataAdapter(strSQL, objConnection);
                        DataSet objDataSet = new DataSet();
                        // OpenConnection 
                        objConnection.Open();
                        objAdapter.Fill(objDataSet, "ResultSet");
                        //Load Control
                        GV_Query.Visible = true;
                        GV_Query.DataSource = objDataSet;
                        GV_Query.DataBind();
                        //Cloase Connection
                        objConnection.Close();
                        HF_Query.Value = strSQL;
                        // Make visibility
                        B_NewQuery.Visible = true;
                        B_SaveExcel.Visible = true;
                        B_Submit.Visible = false;
                        TB_SQL_Query.Visible = false;
                    }
                }
                else// No Sellect Command
                {
                    L_noSelectError.Visible = true;
                }
            }// Sql Command is not properly Coded
            catch (System.Data.SqlClient.SqlException)
            {
                L_QueryError.Visible = true;

            }
            catch (Exception Ex)// Some General Exception
            {
                ErrorLog.WriteErrorLog("Admin-Protected-QueryChecker", Ex);
                L_QueryError.Visible = true;
            }
        }
        else
        {
        }
    }
    protected void B_NewQuery_Click(object sender, EventArgs e)
    {
        GV_Query.Visible = false;
        B_NewQuery.Visible = false;
        B_SaveExcel.Visible = false;
        B_Submit.Visible = true;
        TB_SQL_Query.Visible = true;
        L_QueryError.Visible = false;
        L_noSelectError.Visible = false;



    }
    protected void B_SaveExcel_Click(object sender, EventArgs e)
    {
        if (HF_Query.Value != "")
        {
            try
            {
                string strSQL = TB_SQL_Query.Text.Trim();
                using (SqlConnection objConnection = DBConnection.GetSqlConnection())
                {
                    //Database Operations
                    SqlDataAdapter objAdapter = new SqlDataAdapter(strSQL, objConnection);
                    DataSet objDataSet = new DataSet();

                    // OpenConnection 
                    objConnection.Open();

                    objAdapter.Fill(objDataSet, "ResultSet");
                    //Load Control
                    // Close Connection 
                    objConnection.Close();

                    DataTable objDataTable = objDataSet.Tables["ResultSet"].Copy();

                    // DB2Excel all the details to Excel
                    DB2Excel objExport = new DB2Excel();
                    objExport.Export(objDataTable, DB2Excel.ExportFormat.Excel, "Query_Results_." + DateTime.Now.ToShortDateString() + ".xls");

                }
            }
            catch (System.Data.SqlClient.SqlException SqlEx)
            {
                L_QueryError.Visible = true;
                ErrorLog.WriteErrorLog("Admin-Protected-QueryChecker", SqlEx);

            }
            catch (Exception Ex)
            {
                ErrorLog.WriteErrorLog("Admin-Protected-QueryChecker", Ex);
                L_QueryError.Visible = true;
            }
        }
        else
        {
        }

    }
}

