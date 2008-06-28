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

public partial class Admin_Protected_ChangeAccountSettings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Loading Account Settings

        if (!IsPostBack)
        {
            //Does i have a QueryString
            if (Request.QueryString["id"]!="")
            {   
                //Load user details
                SimpleUser objUser = MatrimonialAdministratorMembership.GetAdminAccountDetails(Request.QueryString["id"]);
                TB_MailAdd.Text = objUser.EmailID;
                TB_UserID.Text = objUser.MatrimonialID;
                TB_UserName.Text = objUser.UserName;
                switch (objUser.Membership)
                {
                    case SimpleUser.UserType.Administrator:
                        RB_Admin.Checked = true;
                        RB_PUser.Checked = false;
                        break;
                    case SimpleUser.UserType.PowerUser:
                        RB_PUser.Checked = true;
                        RB_Admin.Checked = false;
                        break;
                    default:
                        break;
                }
            }
            else
            {
                //Some error happend
                Server.Transfer("~/Extras/ErrorReport.aspx");
            }
        }
        else//Update Informations
        {
            //Update details
            if (MatrimonialAdministratorMembership.UpdateAdminAccountDetails(TB_UserID.Text, TB_MailAdd.Text, RB_Admin.Checked))
            {
                L_Error.Visible = true;
            }
            else
            {
                //Some error happend
                Server.Transfer("~/Extras/ErrorReport.aspx");
            }
        }
    }
}
