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

public partial class Registration_image : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            IMG_NoPhoto.Visible = false;

            Response.BinaryWrite((byte[])Session["ImageToCrop"]);
        }
        catch(Exception)
        {
            IMG_NoPhoto.Visible = true;
        }
    }
}
