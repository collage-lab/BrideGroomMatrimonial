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

public partial class ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {


            // Adding meta Discription
            HtmlMeta objMeta = new HtmlMeta();
            objMeta.Name = "Description";
            objMeta.Content = WebConfig.GetValues("MetaDiscription");
            this.Header.Controls.Add(objMeta);

            // Adding meta KeyWords
            objMeta = new HtmlMeta();
            objMeta.Name = "keywords";
            objMeta.Content = WebConfig.GetValues("MetaKeword");
            this.Header.Controls.Add(objMeta);
        }else
        {
            Page.Validate();
            if (IsValid)
            {

                HttpCookieCollection objHttpCookieCollection = Request.Cookies;
                HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");

                string strApplicationID = Crypto.DeCrypto(objHttpCookie.Values["ApplicationID"]);


                if (MatrimonialMemberShip.IsPasswordTrue(strApplicationID,
                            FormsAuthentication.HashPasswordForStoringInConfigFile(TB_Password_OLd.Text,"MD5")))// checkPassword(.text)
                {

                    MatrimonialMemberShip.SetPassword(strApplicationID,
                         FormsAuthentication.HashPasswordForStoringInConfigFile(TB_Password_New.Text, "MD5"),
                         FormsAuthentication.HashPasswordForStoringInConfigFile(TB_Password_OLd.Text, "MD5"));

                    L_PasswordChanged.Visible = true;
                    L_WrongPassword.Visible = false;
                }
                else
                {
                    L_WrongPassword.Visible = true;
                    L_PasswordChanged.Visible = false;
                }
            
            }
        
        }
    }

}
