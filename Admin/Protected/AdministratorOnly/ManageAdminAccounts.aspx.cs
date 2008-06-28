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

public partial class Admin_Protected_ManageAdminAccounts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable objDataTable = MatrimonialAdministratorMembership.GetAccounts();

            if (objDataTable != null)
            {
                LiteralControl objLiteralControl;
                TableCell objTableCell;

                string strTemp;
                DateTime dateTemp;

                foreach (DataRow objDataRow in objDataTable.Rows)
                {
                    TableRow objTableRow = new TableRow();
                    Table_View.Rows.Add(objTableRow);

                    strTemp = Crypto.DeCrypto(objDataRow["UserID"].ToString());

                    objLiteralControl = new LiteralControl(strTemp);
                    objTableCell = new TableCell();
                    objTableCell.Controls.Add(objLiteralControl);
                    objTableRow.Cells.Add(objTableCell);

                    objLiteralControl = new LiteralControl(Crypto.DeCrypto(objDataRow["UserName"].ToString()));
                    objTableCell = new TableCell();
                    objTableCell.Controls.Add(objLiteralControl);
                    objTableRow.Cells.Add(objTableCell);

                    objLiteralControl = new LiteralControl(Crypto.DeCrypto(objDataRow["MailID"].ToString()));
                    objTableCell = new TableCell();
                    objTableCell.Controls.Add(objLiteralControl);
                    objTableRow.Cells.Add(objTableCell);

                    dateTemp = Convert.ToDateTime(objDataRow["LastLogIN"]);
                    strTemp = dateTemp.Day.ToString() + "-" + dateTemp.Month.ToString() + "-" + dateTemp.Year.ToString();
                    objLiteralControl = new LiteralControl(strTemp);
                    objTableCell = new TableCell();
                    objTableCell.Controls.Add(objLiteralControl);
                    objTableRow.Cells.Add(objTableCell);

                    dateTemp = Convert.ToDateTime(objDataRow["CreatedIN"]);
                    strTemp = dateTemp.Day.ToString() + "-" + dateTemp.Month.ToString() + "-" + dateTemp.Year.ToString();
                    objLiteralControl = new LiteralControl(strTemp);
                    objTableCell = new TableCell();
                    objTableCell.Controls.Add(objLiteralControl);
                    objTableRow.Cells.Add(objTableCell);

                    strTemp = Crypto.DeCrypto(objDataRow["UserID"].ToString());

                    // Does Admin
                    if (strTemp.Equals("Administrator"))
                    {
                        int i = 0;

                        // is the cuurent user the administrator allow viewing and updating
                        BuildImageButton(objTableRow, "ChangeAccountSettings.aspx?id=" + strTemp);

                        // never allow delete button for administrator account
                        objLiteralControl = new LiteralControl("&nbsp;");
                        objTableCell = new TableCell();
                        objTableCell.Controls.Add(objLiteralControl);
                        objTableRow.Cells.Add(objTableCell);
                    }
                    else
                    {
                        BuildImageButton(objTableRow, "ChangeAccountSettings.aspx?id=" + strTemp);
                        BuildImageButton(objTableRow, "RemoveAccount.aspx?id=" + strTemp);
                    }

                }
            }
            else
            { }
        }

    }


    private void BuildImageButton(TableRow tableRow, string NavigateUrl)
    {
        HyperLink newHyperLink = new HyperLink();
        newHyperLink.NavigateUrl = NavigateUrl;

        newHyperLink.ImageUrl = "~/Resources/btnSelect.gif";

        TableCell objTableCell = new TableCell();
        objTableCell.Controls.Add(newHyperLink);
        objTableCell.HorizontalAlign = HorizontalAlign.Center;
        objTableCell.VerticalAlign = VerticalAlign.Middle;

        tableRow.Cells.Add(objTableCell);
    }
}
