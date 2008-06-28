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

public partial class Admin_ApproveMembers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            switch (Request.QueryString["id"])
            {
                case "1":
                    HF_Type.Value = "1";
                    L_LAbel.Text = "APPROVE";
                    break;
                case "2":
                    HF_Type.Value = "2";
                    L_LAbel.Text = "ACTIVATE";
                    break;
                case "3":
                    HF_Type.Value = "3";
                    L_LAbel.Text = "RENEW";
                    break;
                case null:
                    Response.Redirect("~/Extras/ErrorReport.aspx?id=405");
                    break;
                default:
                    break;



            }
        }

    }

    protected void B_Search_Click(object sender, EventArgs e)
    {
        //Matrimonial ID Entered
        if (RB_MatID.Checked)
        {
            if (MatrimonialMemberShip.GetApplicationID(TB_ID.Text) != null)
            {
                LoadPannel(TB_ID.Text);

           }
            else
            {
                //No Matching
                PN_NoRecords.Visible = true;
            }
        }
        else //userID Entered
        {
            string strTemp = MatrimonialMemberShip.GetApplicationID(TB_ID.Text, true, false);
            if (strTemp != null)
            {
                //Yes It Have
                LoadPannel(MatrimonialMemberShip.GetMatrimonialID(strTemp));
            }
            else
            {
                Response.Write(strTemp);
                //No Matching
                PN_NoRecords.Visible = true;
            }
        }
    }

    private void LoadPannel(string MatrimonialID)
    {
        HF_ID.Value = MatrimonialID;

        switch (HF_Type.Value)
        {
            case "1":
                B_App.Visible = true;
                B_Renew.Visible = false;

                PN_Search.Visible = false;
                PN_NoRecords.Visible = false;
                PN_RenewPaid.Visible = true;
                PN_Activate.Visible = false;
                RB_MemberFree.Visible = false;
                MemberPannel_Renew.Bind(MatrimonialID);
                break;
            case "2":
                PN_Search.Visible = false;
                PN_NoRecords.Visible = false;
                PN_RenewPaid.Visible = false;
                PN_Activate.Visible = true;
                MemberPannel_Activate.Bind(MatrimonialID);
                break;
            case "3":
                B_App.Visible = false;
                B_Renew.Visible = true;
                RB_MemberFree.Visible = true;
                switch (MatrimonialMemberShip.GetMemberShipType(MatrimonialID))
                { 
                    case 1:
                        PN_Search.Visible = false;
                        PN_NoRecords.Visible = false;
                        PN_RenewPaid.Visible = true;
                        PN_Activate.Visible = false;
                        RB_MemberPlan1.Checked = true;
                        MemberPannel_Renew.Bind(MatrimonialID);
                        break;
                    case 2:
                        PN_Search.Visible = false;
                        PN_NoRecords.Visible = false;
                        PN_RenewPaid.Visible = true;
                        PN_Activate.Visible = false;
                        RB_MemberPlan2.Checked = true;
                        MemberPannel_Renew.Bind(MatrimonialID);
                        break;
                    case 3:
                        PN_Search.Visible = false;
                        PN_NoRecords.Visible = false;
                        PN_RenewPaid.Visible = true;
                        PN_Activate.Visible = false;
                        RB_MemberPlan3.Checked = true;
                        MemberPannel_Renew.Bind(MatrimonialID);
                        break;
                    default:
                        PN_NoRecords.Visible = true;
                        PN_Search.Visible = false;
                        PN_RenewPaid.Visible = false;
                        break;
                }
                break;
            default:
                PN_NoRecords.Visible = true;
                PN_Search.Visible = false;
                PN_RenewPaid.Visible = false;
                break;
        }
    }

    protected void B_Active_Click(object sender, EventArgs e)
    {
        MatrimonialMemberShip.ActivateMember(TB_ID.Text,RB_MatID.Checked);
        L_Report_2.Text = "Membership Activeted";
        L_Report_2.Visible = true;
        B_Active.Visible = false;
    }

    protected void B_App_Click(object sender, EventArgs e)
    {
        if (RB_MemberPlan1.Checked)
        {
            MatrimonialProfileManager.InsertPaidMember(HF_ID.Value, 1);
            L_Report_1.Text = "Added to Paid Member";
            L_Report_1.Visible = true;
            B_App.Visible = false;
            B_Renew.Visible = false;
        }
        else if (RB_MemberPlan2.Checked)
        {
            MatrimonialProfileManager.InsertPaidMember(HF_ID.Value, 2);
            L_Report_1.Text = "Membership Renewed";
            L_Report_1.Visible = true;
            B_App.Visible = false;
            B_Renew.Visible = false;
        }
        else if (RB_MemberPlan3.Checked)
        {
            MatrimonialProfileManager.InsertPaidMember(HF_ID.Value, 3);
            L_Report_1.Text = "Membership Renewed";
            L_Report_1.Visible= true;
            B_App.Visible = false;
            B_Renew.Visible = false;
            
        }
        else
        {
            // For Testing
        }
    }

    protected void B_Renew_Click(object sender, EventArgs e)
    {
        if (RB_MemberPlan1.Checked)
        {
            MatrimonialMemberShip.RenewPaidMembership(HF_ID.Value, 1); 
            L_Report_1.Text = "Membership Renewed";
            L_Report_1.Visible = true;
            B_App.Visible = false;
            B_Renew.Visible = false;
            RB_MemberPlan1.Visible = false;
            RB_MemberPlan2.Visible = false;
            RB_MemberPlan3.Visible = false;
            RB_MemberFree.Visible = false;

        }
        else if (RB_MemberPlan2.Checked)
        {
            MatrimonialMemberShip.RenewPaidMembership(HF_ID.Value, 2);
            L_Report_1.Text = "Membership Renewed";
            L_Report_1.Visible = true;
            B_App.Visible = false;
            B_Renew.Visible = false;
            RB_MemberPlan1.Visible = false;
            RB_MemberPlan2.Visible = false;
            RB_MemberPlan3.Visible = false;
            RB_MemberFree.Visible = false;
        }
        else if (RB_MemberPlan3.Checked)
        {
            MatrimonialMemberShip.RenewPaidMembership(HF_ID.Value, 3);
            L_Report_1.Text = "Membership Renewed";
            L_Report_1.Visible = true;
            B_App.Visible = false;
            B_Renew.Visible = false;
            RB_MemberPlan1.Visible = false;
            RB_MemberPlan2.Visible = false;
            RB_MemberPlan3.Visible = false;
            RB_MemberFree.Visible = false;
        }
        else if (RB_MemberFree.Checked)
        {
            MatrimonialMemberShip.RenewPaidMembership(HF_ID.Value, 0);
            L_Report_1.Text = "Membership Removed";
            L_Report_1.Visible = true;
            B_App.Visible = false;
            B_Renew.Visible = false;
            RB_MemberPlan1.Visible = false;
            RB_MemberPlan2.Visible = false;
            RB_MemberPlan3.Visible = false;
            RB_MemberFree.Visible = false;
        }
    }
}
