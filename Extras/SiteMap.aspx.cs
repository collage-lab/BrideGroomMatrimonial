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

public partial class Extras_SiteMap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.QueryString["id"] != null)
        {

            string strUserType = null;
            try
            {
                HttpCookieCollection objHttpCookieCollection = Request.Cookies;
                HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");

                strUserType = Crypto.DeCrypto(objHttpCookie.Values["UserType"]);
            }
            catch (Exception)
            {
            }

            Response.Write(strUserType);
            switch (strUserType)
            {
                case "FreeMember":
                    Footer_G1.Visible = false;
                    Footer_M1.Visible = true;
                    GuestLeftPanel1.Visible = false;
                    MemberLeftPanel1.Visible = true;
                    Img_Guest.Visible = false;
                    Img_Member.Visible = true;
                    TD_Left.Attributes.Add("bgcolor", "#ffefed");
                    TBL_Member_Map.Visible = true;
                    TBL_Guest_Map.Visible = false;
                    break;
                case "PaidMember":
                    Footer_G1.Visible = false;
                    Footer_M1.Visible = true;
                    GuestLeftPanel1.Visible = false;
                    MemberLeftPanel1.Visible = true;
                    Img_Guest.Visible = false;
                    Img_Member.Visible = true;
                    TD_Left.Attributes.Add("bgcolor", "#ffefed");
                    TBL_Member_Map.Visible = true;
                    TBL_Guest_Map.Visible = false;
                    break;
                default:
                    Footer_G1.Visible = true;
                    Footer_M1.Visible = false;
                    GuestLeftPanel1.Visible = true;
                    MemberLeftPanel1.Visible = false;
                    Img_Guest.Visible = false;
                    Img_Member.Visible = true;
                    TBL_Member_Map.Visible = false;
                    TBL_Guest_Map.Visible = true;
                    TD_Left.Attributes.Add("bgcolor", "#f5f5f5");
                    break;
            }

        }
        else
        {
            Footer_G1.Visible = true;
            Footer_M1.Visible = false;
            GuestLeftPanel1.Visible = true;
            MemberLeftPanel1.Visible = false;
            Img_Guest.Visible = true;
            Img_Member.Visible = false;
            TBL_Member_Map.Visible = false;
            TBL_Guest_Map.Visible = true;
            TD_Left.Attributes.Add("bgcolor", "#f5f5f5");
        }

    }
}
