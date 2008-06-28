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

using System.Data.SqlClient;

public partial class _TEst_frame : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        HF_ID.Value = Request.QueryString["id"];
        HF_Type.Value = Request.QueryString["typ"];
        if(HF_Type.Value =="2")       
        {
            IMG_AddLink.ImageUrl = "~/Resources/RemoveBookmark.gif";
            IMG_Label.ImageUrl = "~/Resources/bookMarkRemoved.gif";
        }
        else
        {
            HF_Type.Value = "1";
        }

        
    }
    protected void IMG_AddLink_Click(object sender, ImageClickEventArgs e)
    {
        //Add BookMark Into List
        //Getting User Informations
        HttpCookieCollection objHttpCookieCollection = Request.Cookies;
        HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");
        string strMatID = Crypto.DeCrypto(objHttpCookie.Values["MatrimonialID"]);

        switch (HF_Type.Value)
        {
            case "1":
                MatrimonialProfileManager.BookMark(strMatID, HF_ID.Value, false);
                IMG_AddLink.Visible = false;
                IMG_Label.Visible = true;
                break;
            case "2":
                MatrimonialProfileManager.BookMark(strMatID, HF_ID.Value, true);
                IMG_AddLink.Visible = false;
                IMG_Label.Visible = true;
                break;
            default:
                break;
        }
    }


}
