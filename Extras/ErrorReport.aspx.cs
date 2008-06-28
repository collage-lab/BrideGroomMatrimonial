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

public partial class Extras_ErrorReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strTemp = Request.QueryString["id"];
        if(strTemp==null)
            strTemp="Default";
        switch (strTemp.ToLower())
        {
            case "404":
                //change image
                Img_Error.ImageUrl = "~/Resources/img_erro_404.gif";
                //change heading 
                L_ErrorHeading.Text = "Resource not found";
                //change message
                L_Message.Text = "The resource you are looking for (or one of its dependencies) could have been removed, had its name changed, or is temporarily unavailable.  Please review the following URL and make sure that it is spelled correctly.";
                //change url
                //L_urlRequested.Text = Request.QueryString["id"];
                break;
            case "405":
                //change image
                Img_Error.ImageUrl = "~/Resources/img_erro_404.gif";
                //change heading 
                L_ErrorHeading.Text = "The page cannot be displayed";
                //change message
                L_Message.Text = "The page you are looking for cannot be displayed because the page address is incorrect.  Please review the following URL and make sure that it is spelled correctly.";
                //change url
                //L_urlRequested.Text = Request.QueryString["id"];
                break;
            case "406":
                //change image
                Img_Error.ImageUrl = "~/Resources/img_erro_404.gif";
                //change heading 
                L_ErrorHeading.Text = "Resource not found";
                //change message
                L_Message.Text = "The resource you are looking for (or one of its dependencies) could have been removed, had its name changed, or is temporarily unavailable.  Please review the following URL and make sure that it is spelled correctly.";
                //change url
                //L_urlRequested.Text = Request.QueryString["id"];
                break;
            case "403":
                //change image
                Img_Error.ImageUrl = "~/Resources/img_erro_403.gif";
                //change heading 
                L_ErrorHeading.Text = "You are not authorized to view this page";
                //change message
                L_Message.Text = "You do not have permission to view this directory or page using the credentials you supplied.";
                //change url
                //L_urlRequested.Text = Request.ApplicationPath;
                break;
            case "cookie":
                //change image
                Img_Error.ImageUrl = "~/Resources/img_erro_Cookie.gif";
                //change heading 
                L_ErrorHeading.Text = "Cookie Is Blocked";
                //change message
                L_Message.Text = "Write Some Caption"; //<<<< ForTesting >>>>
                //change url
                //L_urlRequested.Text = Request.ApplicationPath;
                break;
            case "session":
                //change image
                Img_Error.ImageUrl = "~/Resources/img_erro_Session.gif";
                //change heading 
                L_ErrorHeading.Text = "Session Expired ";
                //change message
                L_Message.Text = "Write Some Caption"; //<<<< ForTesting >>>>
                //change url
                //L_urlRequested.Text = Request.ApplicationPath;
                break;
            case "pnf":
                //change image
                Img_Error.ImageUrl = "~/Resources/img_erro_pnf.gif";
                //change heading 
                L_ErrorHeading.Text = "Profile Not Found ";
                //change message
                L_Message.Text = "The Profile you are looking for could have been removed, had its name is Diffrent, or is temporarily unavailable.  Please review the following URL and make sure that it is spelled correctly.";
                //change url
                //L_urlRequested.Text = Request.ApplicationPath;
                break;
            default:
                //change image
                Img_Error.ImageUrl = "~/Resources/img_erro.gif";
                //change heading
                L_ErrorHeading.Text = "Sorry, we were unable to service your request.";
                //change message
                L_Message.Text = "";
                //change url
                //L_urlRequested.Text = Request.RawUrl;
                break;
        }

    }
}
