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

public partial class Admin_Protected_invoice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if ((Request.QueryString["id"] != "") && (Request.QueryString["id"] != null))
            {
                try
                {
                    DataRow objDataRow = MatrimonialSales.GetInvoice(Request.QueryString["id"]).Rows[0];


                    L_CoustmerName_1.Text = objDataRow["Name"].ToString();
                    L_CoustmerAddress_.Text = objDataRow["Name"].ToString();
                    L_Price_1.Text = objDataRow["Amount"].ToString();
                    L_Price_2.Text = objDataRow["Amount"].ToString();
                    L_Price_3.Text = objDataRow["Amount"].ToString();
                    L_PlanName.Text = objDataRow["PlanName"].ToString();
                    L_LifeTime.Text = objDataRow["Duration"].ToString();
                    
                    DateTime dateTemp = Convert.ToDateTime(objDataRow["DateOfParches"]);
                    L_Date.Text = dateTemp.Day.ToString() + ":" + dateTemp.Month.ToString() + ":" + dateTemp.Year.ToString();
                    L_SelNo.Text = objDataRow["SerialNo"].ToString();
                }
                catch (Exception)
                {
                    Server.Transfer("~/Extras/ErrorReport.aspx");
                }

            }
            else
            {
                Server.Transfer("~/Extras/ErrorReport.aspx?id=405");
            }
        }
    }
}
