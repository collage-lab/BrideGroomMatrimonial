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

public partial class Member_expressint : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // is from right place
            HF_ToID.Value = Request.QueryString["to"];
            if (HF_ToID.Value.Equals("")) // Error
            {
                Server.Transfer("../extras/Sucess.aspx?id="+Server.UrlEncode("Error in url"));            
            }
        }
        else
        {
            try
            {
                // Getting User Information
                HttpCookieCollection objHttpCookieCollection = Request.Cookies;
                HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");

                string strMatID = Crypto.DeCrypto(objHttpCookie.Values[2]);
                
                // Inserting into data base
                InternalMessage.IntrestType MessageType = InternalMessage.IntrestType.Type1;
                // Which Type Intrest
                if (RB_T1.Checked)
                { MessageType = InternalMessage.IntrestType.Type1; }
                else if (RB_T2.Checked)
                { MessageType = InternalMessage.IntrestType.Type2; }
                else if (RB_T3.Checked)
                { MessageType = InternalMessage.IntrestType.Type3; }
                else if (RB_T4.Checked)
                { MessageType = InternalMessage.IntrestType.Type4; }
                else if (RB_T5.Checked)
                { MessageType = InternalMessage.IntrestType.Type5; }

                // INSERT
                switch (InternalMessage.ExpressIntrest(strMatID, HF_ToID.Value, MessageType))
                { 
                    case 1:// Sucess
                        Server.Transfer("../extras/Sucess.aspx");
                        break;
                    case 2: // Duplication of Intrest
                        Server.Transfer("../extras/Sucess.aspx?id=" + Server.UrlEncode("One persopn can send only one intrest to another"));
                        break;
                    default: // Oops some error had happened
                        Server.Transfer("../extras/Sucess.aspx?id="+Server.UrlEncode("Sorry Server is not responding now"));
                        break;                
                }
            }
            catch (Exception Ex)
            {
                // Some unexpected error Write Log
                ErrorLog.WriteErrorLog("Member_expressint.aspx", Ex);
                Server.Transfer("../extras/Sucess.aspx?id=" + Server.UrlEncode("Sorry Server is not responding now"));
            }
        }
    }
}
