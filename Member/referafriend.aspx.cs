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

public partial class referafriend : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            /// send link to join to the friend 
            /// redirect to mail send
            Response.Redirect("../Extras/MailSend.aspx");
        }
    }
    protected void IB_Submit_Click(object sender, ImageClickEventArgs e)
    {

    }
}
