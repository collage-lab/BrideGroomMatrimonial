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

public partial class Member_RFrame : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if ((Request.QueryString["id"] == "") || (Request.QueryString["typ"] == ""))
            {
                this.Visible = false;
            }
            else
            {
                HF_ID.Value = Request.QueryString["id"];
                HF_Type.Value = Request.QueryString["typ"];
            }
        }
    }
    protected void IMG_Grand_Click(object sender, ImageClickEventArgs e)
    {
        HttpCookieCollection objHttpCookieCollection = Request.Cookies;
        HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");

        string strMatID = Crypto.DeCrypto(objHttpCookie.Values["MatrimonialID"]);


        switch (HF_Type.Value.ToLower())
        {
            case "photo":
                InternalMessage.GrandPhotoRequest(HF_ID.Value,strMatID, true);
                IMG_Grand.Visible = false;
                IMG_Granted.Visible = true;
                break;
            case "horoscope":
                InternalMessage.GrandPhotoRequest(HF_ID.Value,strMatID, false);
                IMG_Grand.Visible = false;
                IMG_Granted.Visible = true;
                break;
            default:
                IMG_Grand.Visible = false;
                IMG_Granted.Visible = true;
                break;
        }
    }
}
