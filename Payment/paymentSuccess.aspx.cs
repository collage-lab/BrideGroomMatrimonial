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

public partial class Payment_paymentSuccess : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            HttpCookieCollection objHttpCookieCollection = Request.Cookies;
            HttpCookie objHttpCookie2 = objHttpCookieCollection.Get("MatCookie5639sb");

            string strMtaID = Crypto.DeCrypto(objHttpCookie2.Values["MatrimonialID"]);

            HttpCookieCollection objHttpCookieCollection2 = Request.Cookies;
            HttpCookie objHttpCookie = objHttpCookieCollection.Get("ebanker");

            sbyte PlanID = sbyte.Parse(Crypto.DeCrypto(objHttpCookie.Values["PLanID"]));

            if (Crypto.DeCrypto(objHttpCookie2.Values["UserType"]).ToLower() != "paidmember")
            {
                MatrimonialProfileManager.InsertPaidMember(strMtaID, PlanID);

            }
            else
            {
                MatrimonialMemberShip.RenewPaidMembership(strMtaID, PlanID);
            }
            Response.Redirect("~/Member/Membership.aspx");
        }
        catch (Exception)
        { }
    }
}
