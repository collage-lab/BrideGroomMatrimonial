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

public partial class Admin_Protected_CheckSuccessStory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        { 
            //Check Which Form To load

            //is it have a ssID
            string strType = Request.QueryString["id"];
            if ((strType != "") && (strType != null))
            {
                //Make all Controls invisible
                PN_Delete.Visible = false;
                PN_CheckAnon.Visible =false;
                PN_NoRecords.Visible = false;

                //Setting Controls
                switch (strType)
                { 
                    case "1":
                        LoadCheckList();
                        this.Title = "Check Abuse Success Stories";
                        break;
                    case "2":
                        L_Label.Text = "DELETE";
                        this.Title = "Delete Success Story";
                        PN_Delete.Visible = true;
                        break;
                    default:
                        LoadCheckList();
                        this.Title = "Check Abuse Success Stories";
                        break;
                }
            }
            else
            {
                LoadCheckList();
                this.Title = "Check Abuse Success Stories";
            }
        }
        else //Search
        {
            //Does The ID Has A SS
            string SSID = MatrimonialSuccessStoryManager.GetSStoryID(TB_ID.Text, RB_MatID.Checked);

            if (SSID!=null)
            {
                //Yes It Have
                Response.Redirect("DelSuccessStory.aspx?id="+SSID);
            }
            else
            {
                //No Matching
                PN_NoRecords.Visible = true;
            }

        }
    }

    private void LoadCheckList()
    {
        //MAKE CONTROLS VISIBLE
        L_Label.Text = "MANAGE";
        PN_CheckAnon.Visible = true;

        //LOAD CONTROLS

        //Getting List OF Abuse Success Storys in the data base
        DataTable objDataTableAbuseList = MatrimonialSuccessStoryManager.AbuseSStoryList();

        // >1
        if (objDataTableAbuseList != null)
        {
            // Load Table Row For Each Element in the list
            string strMessage = "";
            foreach (DataRow objDataRowList in objDataTableAbuseList.Rows)
            {

                //Get SSList
                DataTable objDataTableStory = MatrimonialSuccessStoryManager.GetSStory(objDataRowList["SStoryID"].ToString(), false);
                //>1

                strMessage = objDataRowList["Message"].ToString();

                if (objDataTableStory != null)
                {
                    LiteralControl objLiteralControl;
                    TableCell objTableCell;

                    string strTemp;
                    DateTime dateTemp;
                    
                    //Loading Coloum Contans 
                    foreach (DataRow objDataRowStory in objDataTableStory.Rows)
                    {
                        TableRow objTableRow = new TableRow();
                        Table_View.Rows.Add(objTableRow);

                        //Coloum 1
                        objLiteralControl = new LiteralControl(objDataRowStory["SStoryID"].ToString());
                        objTableCell = new TableCell();
                        objTableCell.Controls.Add(objLiteralControl);
                        objTableRow.Cells.Add(objTableCell);

                        //Coloum 2
                        objLiteralControl = new LiteralControl(objDataRowStory["MatrimonialID"].ToString());
                        objTableCell = new TableCell();
                        objTableCell.Controls.Add(objLiteralControl);
                        objTableRow.Cells.Add(objTableCell);

                        //Coloum 3
                        objLiteralControl = new LiteralControl(strMessage);
                        objTableCell = new TableCell();
                        objTableCell.Controls.Add(objLiteralControl);
                        objTableRow.Cells.Add(objTableCell);


                        // Link To Delete The SStory
                        HyperLink newHyperLink = new HyperLink();
                        newHyperLink.NavigateUrl = "DelSuccessStory.aspx?id=" + objDataRowStory["SStoryID"].ToString();
                        newHyperLink.ImageUrl = "~/Resources/btnSelect.gif";
                        //Coloum 6
                        objTableCell = new TableCell();
                        objTableCell.Controls.Add(newHyperLink);
                        objTableCell.HorizontalAlign = HorizontalAlign.Center;
                        objTableCell.VerticalAlign = VerticalAlign.Middle;
                        objTableRow.Cells.Add(objTableCell);


                    }

                }
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
