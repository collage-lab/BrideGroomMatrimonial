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

public partial class Payment_PayPalCheckOut : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            try
            {

                HttpCookieCollection objHttpCookieCollection = Request.Cookies;
                HttpCookie objHttpCookie = objHttpCookieCollection.Get("ebanker");

                //store data
                Session["Invoice"] = Crypto.DeCrypto(objHttpCookie.Values["PLanID"]);

                //redirect
                Response.Redirect("PayPalProcessing.aspx");
            }
            catch
            {
                Response.Redirect("~/Extras/ErrorReport.aspx?id=cookie");
            }

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}
