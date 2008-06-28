using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    private string URL = null;

    protected void Page_Load(object sender, EventArgs e)
    {
            switch(WebConfig.GetValues("SiteStatus"))
            {
                case "Running":
                    Response.Redirect("Guest/Home.aspx");
                    break;
                case "Stoped":
                    //show message
                    Img_Error.ImageUrl = "~/Resources/img_temp.gif";
                    //L_Message.Text = WebConfig.GetValues("SiteStatus");
                    break;
                case "Setup":
                    //show mwssage
                    Img_Error.ImageUrl = "~/Resources/img_sitecon.gif";
                    L_Message.Text = WebConfig.GetValues("SiteStatus");
                    break;
                default:
                    break;
            }
    }   // Page_load

}
