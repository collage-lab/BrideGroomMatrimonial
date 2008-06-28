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

public partial class Admin_Protected_EditUserProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            string strUserName = MatrimonialMemberShip.GetUserName(TB_MatrimonialID.Text, true);
            if (strUserName != null)
            {
                //Is password Valid
                SimpleUser objUser = MatrimonialMemberShip.Authentication(strUserName, FormsAuthentication.HashPasswordForStoringInConfigFile(TB_Password.Text, "MD5"));
                // YES
                if (objUser.AuthenticationStatus == true)
                {
                    string SeqtKey = RandomString.GenerateStirng(6, false);
                    Session.Add(SeqtKey, TB_MatrimonialID.Text);
                    Response.Redirect("EditProfile1.aspx?id=0&seqtkey=" + Server.UrlEncode(SeqtKey));
                }
                else
                {
                    L_Wron_Pass.Visible = true;
                }
            }
            else
            {
                PN_NoRecords.Visible = true;
                this.Title = "No Profiles Matching";
            }

        }
    }




 
}
