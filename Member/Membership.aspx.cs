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

public partial class Member_Membership : System.Web.UI.Page
{
    bool boolPaidMember;
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookieCollection objHttpCookieCollection = Request.Cookies;
        HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");

        string strMtaID = Crypto.DeCrypto(objHttpCookie.Values["MatrimonialID"]);

        L_MatID.Text = strMtaID;
        MembershipDetails objMembeship = new MembershipDetails(strMtaID);
        L_Name.Text = objMembeship.Name;
        if (objMembeship.ISPaidMember)
        {
            L_membership.Text = "Paid member";
            boolPaidMember = true;
            HL_Renew_Upgrade.Text = "Renew Membership";
            HL_Renew_Upgrade.ImageUrl = "~/Resources/Renewicon.gif";
        }
        else
        {
            L_membership.Text = "Free member";
            boolPaidMember = false;
            HL_Renew_Upgrade.Text = "Upgrade Membership";
            HL_Renew_Upgrade.ImageUrl = "~/Resources/upgradenow.gif";
        }
        L_CreatedOn.Text = objMembeship.CreatedOn;
        L_CLiks.Text = objMembeship.Cliks.ToString();
        L_PaidMemberFrom.Text = objMembeship.PaidMemberForm;
        L_PaidMemberUpTo.Text = objMembeship.PaidMemberupto;
        L_Plan.Text = objMembeship.Plan;
        objMembeship = null;
    }
    protected void Display(bool ISStart)
    {
        if (!boolPaidMember)
        {
            if (ISStart)
            {
                Response.Write("<!--");
            }
            else
            {
                Response.Write("-->");
            }

        }
    
    }
}
