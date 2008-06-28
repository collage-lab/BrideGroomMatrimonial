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

public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (WebConfig.GetValues("SiteStatus").ToLower() == "setup")
        {
            IMG_Setup.Attributes.Add("onMouseOver", "javascript:displayDiv(0);");
            IMG_Setup.Attributes.Add("style", "cursor: pointer;");
        }
        else
        {
            IMG_Setup.Visible = false;
            IMG_AdminLogin.Attributes.Add("onMouseOver", "javascript:displayDiv(1);");
            IMG_AdminLogin.Attributes.Add("style", "cursor: pointer;");
            IMG_GoMatrimonial.Attributes.Add("onmouseover", "javascript:displayDiv(2);");
            IMG_GoMatrimonial.Attributes.Add("style", "cursor: pointer;");
        }
    }

    //Setup
    
    protected void B_Submit_Click1(object sender, EventArgs e)
    {
        /// check whether key is correct
        /// 
        /// If(Serial.KeyCheck(key)
        /// {
        FormsAuthentication.SetAuthCookie("Administrator",false);
        Response.Redirect("PasswordSettings.aspx");
        /// }
        /// else
        /// {
        /// Inform password is incorrect
        /// }
    }


    protected void B_LogIn_Click(object sender, EventArgs e)
    {

         string URL = FormsAuthentication.GetRedirectUrl("", false);

         SimpleUser objUser = MatrimonialAdministratorMembership.AdminAuthentication(TB_Admin.Text, TB_Password.Text);
        if (objUser.AuthenticationStatus)
        {
           HttpCookie objHttpCookie ;

           switch (objUser.Membership)
           {
               case SimpleUser.UserType.Administrator:
                   //Authentication
                   FormsAuthentication.SetAuthCookie("Administrator", true);//<<< ForTesting >>>>
                   //Setting Cookie
                   objHttpCookie = new HttpCookie("MatAdmCookie5456sb");
                   objHttpCookie.Values["ApplicationID"] = Crypto.EnCrypto(objUser.ApplicationID);
                   objHttpCookie.Values["UserName"] = Crypto.EnCrypto(objUser.UserName);
                   objHttpCookie.Values["UserID"] = Crypto.EnCrypto(objUser.MatrimonialID);
                   objHttpCookie.Values["UserType"] = Crypto.EnCrypto("Administrator");

                   Response.Cookies.Add(objHttpCookie);
                   //Go to Admin index
                   Response.Redirect("Protected/Adminindex.aspx");
                   break;
               case SimpleUser.UserType.PowerUser:
                   //Authentication
                   FormsAuthentication.SetAuthCookie("PowerUser", false);
                   //Setting Cookie
                   objHttpCookie = new HttpCookie("MatAdmCookie5456sb");
                   objHttpCookie.Values["ApplicationID"] = Crypto.EnCrypto(objUser.ApplicationID);
                   objHttpCookie.Values["UserName"] = Crypto.EnCrypto(objUser.UserName);
                   objHttpCookie.Values["UserID"] = Crypto.EnCrypto(objUser.MatrimonialID);
                   objHttpCookie.Values["UserType"] = Crypto.EnCrypto("PowerUser");
                   Response.Cookies.Add(objHttpCookie);
                   //Go to Admin index
                   Response.Redirect("Protected/Adminindex.aspx");

                   break;
               default:
                   L_invalidLogin.Visible = true;
                   break;
           }
        }
        else
        {
            L_invalidLogin.Visible = true;
        }

    }
}
