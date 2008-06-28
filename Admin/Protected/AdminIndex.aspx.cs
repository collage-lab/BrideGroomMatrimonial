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

public partial class Admin_Protected_AdminIndex : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            HttpCookieCollection objHttpCookieCollection = Request.Cookies;
            HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatAdmCookie5456sb");

            string strApplicationID = Crypto.DeCrypto(objHttpCookie.Values["UserID"]);

            if (Crypto.DeCrypto(objHttpCookie["UserType"]) == "Administrator")
            {
                HL_AccountsSettings.Enabled = true;
                HL_ContactsSettings.Enabled = true;
                HL_CreateUser.Enabled = true;
                HL_DBSettings.Enabled = true;
                HL_DBStatus.Enabled = true;
                HL_MemberShipSettings.Enabled = true;
                HL_QueryChecker.Enabled = true;
                HL_WebSettings.Enabled = true;
                HL_WebState.Enabled = true;
            }
        }

    }
}
