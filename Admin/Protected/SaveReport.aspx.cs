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

public partial class Admin_Protected_SaveReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable objDataTable = MatrimonialSales.GetSalesReport();
        DB2Excel objExport = new DB2Excel();
        objExport.Export(objDataTable, DB2Excel.ExportFormat.Excel, "Query_Results_." + DateTime.Now.ToShortDateString() + ".xls");
        Server.Transfer("~/Admin/Protected/SaleReport.aspx");
    }
}
