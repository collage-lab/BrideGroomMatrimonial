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

public partial class Admin_Protected_SaleReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //onmouseover="this.bgColor='gold';" onmouseout="this.bgColor='#FFFFFF';"
        if (!IsPostBack)
        {
            this.Title = "Matrimonial Sales Report";

            DataTable objDataTable = MatrimonialSales.GetSalesReport();

            //>1
            if (objDataTable != null)
            {
                LiteralControl objLiteralControl;
                TableCell objTableCell;

                DateTime dateTemp;

                //Loading Coloum Contans 
                foreach (DataRow objDataRow in objDataTable.Rows)
                {
                    TableRow objTableRow = new TableRow();
                    Table_View.Rows.Add(objTableRow);

                    
                    //Coloum 1
                    HyperLink newHyperLink = new HyperLink();
                    newHyperLink.NavigateUrl = "~/MyProfile/" + objDataRow["MatrimonialID"].ToString()+".aspx";
                    newHyperLink.Text= objDataRow["Name"].ToString();
                    newHyperLink.Target = "_Blank";
                    newHyperLink.NavigateUrl = "~/Member/PrintProfile.aspx?id=" + Server.UrlEncode(objDataRow["MatrimonialID"].ToString());

                    objTableCell = new TableCell();
                    objTableCell.Controls.Add(newHyperLink);
                    objTableCell.HorizontalAlign = HorizontalAlign.Center;
                    objTableCell.VerticalAlign = VerticalAlign.Middle;
                    objTableRow.Cells.Add(objTableCell);

                    //Coloum 2 Message
                    objLiteralControl = new LiteralControl(objDataRow["Address"].ToString());
                    objTableCell = new TableCell();
                    objTableCell.Controls.Add(objLiteralControl);
                    objTableRow.Cells.Add(objTableCell);

                    //Coloum 3 Message
                    objLiteralControl = new LiteralControl(objDataRow["Amount"].ToString());
                    objTableCell = new TableCell();
                    objTableCell.Controls.Add(objLiteralControl);
                    objTableRow.Cells.Add(objTableCell);

                    //Coloum 4 Message
                    dateTemp = Convert.ToDateTime(objDataRow["DateOfParches"]);
                    objLiteralControl = new LiteralControl(dateTemp.Day.ToString() + ":" + dateTemp.Month.ToString() + ":" + dateTemp.Year.ToString());
                    objTableCell = new TableCell();
                    objTableCell.Controls.Add(objLiteralControl);
                    objTableRow.Cells.Add(objTableCell);

                    //Coloum 5
                    newHyperLink = new HyperLink();
                    newHyperLink.Attributes.Add("style", "cursor: pointer;");
                    newHyperLink.Text = "Invoice";
                    newHyperLink.Attributes.Add("onclick", "newWindow('invoice.aspx?id=" + objDataRow["MatrimonialID"].ToString() + "','','790','500')");

                    objTableCell = new TableCell();
                    objTableCell.Controls.Add(newHyperLink);
                    objTableCell.HorizontalAlign = HorizontalAlign.Center;
                    objTableCell.VerticalAlign = VerticalAlign.Middle;
                    objTableRow.Cells.Add(objTableCell);

                    // Link To Delete The SStory

                }

            }
        }

    }
    protected void LB_Next_Click(object sender, EventArgs e)
    {

    }
    protected void LB_Previous_Click(object sender, EventArgs e)
    {

    }
}
