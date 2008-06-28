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

public partial class Admin_Protected_PasswordSettings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {

            HttpCookieCollection objHttpCookieCollection = Request.Cookies;
            HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatAdmCookie5456sb");

            string strApplicationID = Crypto.DeCrypto(objHttpCookie.Values["ApplicationID"]);

            string strUserID = Crypto.DeCrypto(objHttpCookie.Values["UserID"]);

            if (MatrimonialAdministratorMembership.AdminAuthentication(strUserID, TB_OLD.Text).AuthenticationStatus)
            {
                if (MatrimonialAdministratorMembership.ChangeAdminPassword(TB_OLD.Text, TB_Password_New_Conf.Text, strApplicationID))
                {
                    L_Alert.Visible = true;
                    L_Alert.Text = "Password Updated..";
                }
                else
                {
                    //Some Error Happned
                    L_Alert.Visible = true;
                    L_Alert.Text = "Server Not Responding..";
                    ErrorLog.WriteLog("Error In Admin_Protected_PasswordSettings ");
                }
            }
            else
            {
                //Password Wrong
                L_Alert.Visible = true;
                L_Alert.Text = "Wrong password..";

            }

        }
        else
        {

        }
    }
}
