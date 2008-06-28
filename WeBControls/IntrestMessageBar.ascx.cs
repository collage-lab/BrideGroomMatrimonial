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

public partial class clt_IntrestMessageBar : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void Bind(int Current,int Last)
    {
        if (Current > 1)
        {
            HL_Previous.Visible = true;
            HL_Previous.NavigateUrl = "javascript:history.go(-1);";// + value; <<<<<<< ForTesting>>>>>>>>>>
        }
        L_Current.Text = Current.ToString();

        if (Last > Current)
        {
            HL_Next.Visible = true;
            HL_Previous.NavigateUrl = "javascript:history.go(1);";// + value; <<<<<<< ForTesting>>>>>>>>>>
        }
        L_Last.Text = Current.ToString();
    }


}
