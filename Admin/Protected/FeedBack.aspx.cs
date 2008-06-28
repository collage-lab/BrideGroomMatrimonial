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

public partial class Admin_Protected_FeedBack : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            switch (Request.QueryString["id"])
            {
                case "1":
                    PN_Settings.Visible = true;
                    PN_CheckAnon.Visible = false;
                    PN_NoRecords.Visible = false;
                    L_Label.Text = "FeedBack Filter Settings";
                    this.Title = "FeedBack Filter Settings";
                    short shortLifeTime = MatrimonialCoustomerSupportManager.ReadFilter();
                    if (shortLifeTime == 0)
                    {
                        RB_Filter_Off.Checked = true;
                        RB_Filter_ON.Checked = false;
                        TB_Lifetime.Enabled = false;
                    }
                    else
                    {
                        RB_Filter_Off.Checked = false;
                        RB_Filter_ON.Checked = true;
                        TB_Lifetime.Enabled = true;
                        TB_Lifetime.Text = shortLifeTime.ToString();
                    }
                    break;
                default:
                    L_Alert.Visible = false;
                    PN_Settings.Visible = false;
                    PN_CheckAnon.Visible = true;
                    L_Label.Text = "FeedBacks";
                    this.Title = "FeedBacks";
                    loadFeedBack();
                    break;
            }
        }
        else
        {
            MatrimonialCoustomerSupportManager.SetFeedBackFilter(RB_Filter_ON.Checked, short.Parse(TB_Lifetime.Text));
            L_Alert.Visible = true;
        }
    }

    private void loadFeedBack()
    {
        DataTable objDataTableProfile = MatrimonialCoustomerSupportManager.ReadFeedBack();
        //>1
        if (objDataTableProfile != null)
        {
            LiteralControl objLiteralControl;
            TableCell objTableCell;

            DateTime dateTemp;

            //Loading Coloum Contans 
            foreach (DataRow objDataRowStory in objDataTableProfile.Rows)
            {
                TableRow objTableRow = new TableRow();
                Table_View.Rows.Add(objTableRow);

                dateTemp = Convert.ToDateTime(objDataRowStory["Date"]);

                //Coloum 1
                objLiteralControl = new LiteralControl(dateTemp.Day.ToString() + ":" + dateTemp.Month.ToString() + ":" + dateTemp.Year.ToString());
                objTableCell = new TableCell();
                objTableCell.Controls.Add(objLiteralControl);
                objTableRow.Cells.Add(objTableCell);

                //Coloum 2
                objLiteralControl = new LiteralControl(objDataRowStory["Name"].ToString());
                objTableCell = new TableCell();
                objTableCell.Controls.Add(objLiteralControl);
                objTableRow.Cells.Add(objTableCell);

                //Coloum 3
                //objLiteralControl = new LiteralControl(objDataRowStory["Email"].ToString());
                //objTableCell = new TableCell();
                //objTableCell.Controls.Add(objLiteralControl);
                //objTableRow.Cells.Add(objTableCell);

                HyperLink newHyperLink = new HyperLink();
                newHyperLink.NavigateUrl = "NewsLetters.aspx?id=5&mailto=" + Server.UrlEncode(objDataRowStory["Email"].ToString());
                newHyperLink.Text = objDataRowStory["Email"].ToString();
                //Coloum 6
                objTableCell = new TableCell();
                objTableCell.Controls.Add(newHyperLink);
                objTableCell.HorizontalAlign = HorizontalAlign.Left;
                objTableCell.VerticalAlign = VerticalAlign.Middle;
                objTableRow.Cells.Add(objTableCell);

                //Coloum 4
                objLiteralControl = new LiteralControl(objDataRowStory["Message"].ToString());
                objTableCell = new TableCell();
                objTableCell.Controls.Add(objLiteralControl);
                objTableRow.Cells.Add(objTableCell);


                //// Link To Delete The SStory
                //HyperLink newHyperLink = new HyperLink();
                //newHyperLink.NavigateUrl = "DeleteMembers.aspx?id=" + objDataRowStory["MatrimonialID"].ToString();
                //newHyperLink.ImageUrl = "~/Resources/btnSelect.gif";
                ////Coloum 6
                //objTableCell = new TableCell();
                //objTableCell.Controls.Add(newHyperLink);
                //objTableCell.HorizontalAlign = HorizontalAlign.Center;
                //objTableCell.VerticalAlign = VerticalAlign.Middle;
                //objTableRow.Cells.Add(objTableCell);


            }
        }
    }
}