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

public partial class SearchBar : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string PreviousLink
    {
        set 
        { 
            HL_Previous.Visible = true;
            HL_Previous.NavigateUrl = "?dir=1&end=" + value;
        }
    
    }
    public string NextLink
    {
        set
        {
            HL_Next.Visible = true;
            HL_Next.NavigateUrl = "?dir=2&start=" + value;
        }

    }

    public int PageNo
    {
        set
        {
            L_Current.Text = value.ToString();
        }
    }

    public int PageFound
    {
        set
        {
            L_PFound.Text = value.ToString();
            L_Last.Text = value.ToString();
        }
    }



}
