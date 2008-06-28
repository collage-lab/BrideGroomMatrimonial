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

public partial class Member_ChangeIntrestStatus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if ((Request.QueryString["id"] != null) || (Request.QueryString["typ"] != null))
            {
                HF_ToID.Value = Request.QueryString["id"];

                switch (Request.QueryString["typ"])
                {
                    case "1":
                        RB_T1.Enabled = false;
                        break;
                    case "2":
                        RB_T2.Enabled = false;
                        break;
                    case "3":
                        RB_T3.Enabled = false;
                        break;
                    default:
                        RB_T1.Enabled = false;
                        RB_T2.Enabled = false;
                        RB_T3.Enabled = false;
                        IB_Send.Enabled = false;
                        L_Warning.Text = "Pls Refresh the page and try again";
                        break;                        
                }
            }
            else
            {
                //Error 405
                Server.Transfer("~/Extras/ErrorReport.aspx?id=405");
            }
        }
        else // Update Databse
        {

            HttpCookieCollection objHttpCookieCollection = Request.Cookies;
            HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");

            string strMtaID = Crypto.DeCrypto(objHttpCookie.Values["MatrimonialID"]);

            if (RB_T1.Checked)
            {
                InternalMessage.IntrestApprovel(strMtaID, HF_ToID.Value, InternalMessage.IntrestStatus.Pending);
            }
            else if (RB_T2.Checked)
            {
                InternalMessage.IntrestApprovel(strMtaID, HF_ToID.Value, InternalMessage.IntrestStatus.Accepted);
            }
            else if (RB_T3.Checked)
            {
                InternalMessage.IntrestApprovel(strMtaID, HF_ToID.Value, InternalMessage.IntrestStatus.Declined);
            }

            Server.Transfer("~/Extras/sucess.aspx");
        }
    }
}
