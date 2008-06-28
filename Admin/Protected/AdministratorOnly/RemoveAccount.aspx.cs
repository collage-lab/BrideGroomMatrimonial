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

public partial class Admin_Protected_RemoveAccount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Does i have a QueryString
            if (Request.QueryString["id"] != "")
            {
                //Load user details
                SimpleUser objUser = MatrimonialAdministratorMembership.GetAdminAccountDetails(Request.QueryString["id"]);
                TB_MailAdd.Text = objUser.EmailID;
                TB_UserID.Text = objUser.MatrimonialID;
                TB_UserName.Text = objUser.UserName;
                TB_UserType.Text = objUser.Membership.ToString();
                
            }
            else
            {
                //Some error happend
                Server.Transfer("~/Extras/ErrorReport.aspx");
            }
        }
        else//Update Informations
        {
            if (CB_Del.Checked)
            {
                //Delete Account
                if (MatrimonialAdministratorMembership.DeleteAdminAccount(TB_UserID.Text))
                {
                    L_Error.Visible = true;
                    B_Delete.Visible = false;
                    CB_Del.Visible = false;
                }
                else
                {
                    //Some error happend
                    Server.Transfer("~/Extras/ErrorReport.aspx");
                }
            }
            else
            {
                CB_Del.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
