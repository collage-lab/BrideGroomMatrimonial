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

public partial class Admin_Protected_CreatNewUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            //Creat new User
            switch (MatrimonialAdministratorMembership.CreatNewUser(TB_UserName.Text, TB_UserID.Text, TB_Password.Text, TB_MailAdd.Text, RB_Admin.Checked))
            {
                case 1:// Sucessfully Created
                    L_Error.Text = "User Account Created..";
                    L_Error.Visible = true;
                    break;
                case 2:// User Replication Error
                    L_Error.Visible = true;
                    L_Error.Text = "User-Name,User-ID or EmailAddress Is already exists in database";
                    break;
                case 3:// Error in server
                    L_Error.Visible = true;
                    L_Error.Text = "Server NotResponding";

                    break;
                default://Error in server
                    L_Error.Visible = true;
                    L_Error.Text = "Server NotResponding";
                    break;
            }
        }
        else
        {
            L_Error.Visible = false;
            L_Error.Text = "User Account Created";

        }
    }
}
