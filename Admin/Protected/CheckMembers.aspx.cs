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

public partial class Admin_Protected_CheckMembers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            switch (Request.QueryString["id"])
            {
                case "1":
                    LoadAnonymus();
                    break;
                case "2":
                    PN_CheckAnon.Visible = false;
                    PN_NoRecords.Visible = false;
                    PN_Delete.Visible = true;
                    L_Label.Text = "REMOVE";
                    Img_icon.ImageUrl = "~/Resources/DeleteUser-ID32.gif";
                    this.Title = "Delete Member Profiles";
                    break;
                default:
                    Response.Redirect("~/ErrorReport.aspx?id=406");
                    break;
            }
        }
        else //Search
        {
            //Does The ID Has A SS
            string strTemp = MatrimonialMemberShip.GetApplicationID(TB_MatrimonialID.Text);

            if (strTemp != null)
            {
                //Yes It Have
                Response.Redirect("DeleteMembers.aspx?id=" + TB_MatrimonialID.Text);
            }
            else
            {
                //No Matching
                PN_NoRecords.Visible = true;
            }
        }

    }

    private void LoadAnonymus()
    {

        //MAKE CONTROLS VISIBLE
        PN_CheckAnon.Visible = true;
        PN_NoRecords.Visible = false;
        PN_Delete.Visible = false;

        L_Label.Text = "ANONYMUS";
        this.Title = "Anonymus Member Profiles";
        Img_icon.ImageUrl = "~/Resources/DeleteUser-paid32.gif";


        //LOAD CONTROLS

        //Get SSList
        DataTable objDataTableProfile = MatrimonialProfileManager.AbuseProfileLsit();
        //>1
        if (objDataTableProfile != null)
        {
            LiteralControl objLiteralControl;
            TableCell objTableCell;



            //Loading Coloum Contans 
            foreach (DataRow objDataRowStory in objDataTableProfile.Rows)
            {
                TableRow objTableRow = new TableRow();
                Table_View.Rows.Add(objTableRow);

                //Coloum 1
                objLiteralControl = new LiteralControl(objDataRowStory["MatrimonialID"].ToString());
                objTableCell = new TableCell();
                objTableCell.Controls.Add(objLiteralControl);
                objTableRow.Cells.Add(objTableCell);


                //Coloum 2 Message
                objLiteralControl = new LiteralControl(objDataRowStory["Message"].ToString());
                objTableCell = new TableCell();
                objTableCell.Controls.Add(objLiteralControl);
                objTableRow.Cells.Add(objTableCell);

                // Link To Delete The SStory
                HyperLink newHyperLink = new HyperLink();
                newHyperLink.NavigateUrl = "DeleteMembers.aspx?id=" + objDataRowStory["MatrimonialID"].ToString();
                newHyperLink.ImageUrl = "~/Resources/btnSelect.gif";
                //Coloum 6
                objTableCell = new TableCell();
                objTableCell.Controls.Add(newHyperLink);
                objTableCell.HorizontalAlign = HorizontalAlign.Center;
                objTableCell.VerticalAlign = VerticalAlign.Middle;
                objTableRow.Cells.Add(objTableCell);


            }

        }
        else
        {
            //NoStorys Are Present In the list
            PN_CheckAnon.Visible = false;
            PN_NoRecords.Visible = true;
        }
    }
}
