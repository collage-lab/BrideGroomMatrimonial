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

public partial class Member_logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Siging out
        FormsAuthentication.SignOut();

        //removing cookie information
        //HttpCookieCollection objHttpCookieCollection = new HttpCookieCollection();
        //objHttpCookieCollection.Remove("MatCookie5639sb");

        HttpCookieCollection objHttpCookieCollections = Request.Cookies;
        HttpCookie objHttpCookie = objHttpCookieCollections.Get("MatCookie5639sb");

        objHttpCookie.Expires = DateTime.Now;

        if (Request.QueryString["id"] == "del")
            Response.Redirect("~/Guest/Home.aspx");
        else
            Response.Redirect("~/Guest/Login.aspx");
    }
}
