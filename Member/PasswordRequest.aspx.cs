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

public partial class Member_PasswordRequest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            // Filling Hiden Folder

            HF_ToID.Value = Request.QueryString["id"];
            if (HF_ToID.Value.Equals("")) // Error
            {
                Server.Transfer("../extras/Sucess.aspx?id=" + Server.UrlEncode("Error in url"));
            }
            else
            {
                L_ToMatID.Text = HF_ToID.Value;
                // Type?
                switch (Request.QueryString["typ"])
                {
                    case "h":
                        L_Request_Type.Text = "Horoscope";
                        break;
                    case "p":
                        L_Request_Type.Text = "Photo";
                        break;
                    default:
                        Server.Transfer("../extras/Sucess.aspx?id=" + Server.UrlEncode("URL Not found"));
                        break;
                }
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

                // Sending Request

                switch (L_Request_Type.Text)
                {
                    case "Horoscope":
                        if (InternalMessage.SendPhotoRequest(strMatID, HF_ToID.Value, false))
                        {
                            Server.Transfer("../extras/Sucess.aspx?id=Your Request has been send");
                        }
                        else
                        {
                            Server.Transfer("../extras/Sucess.aspx?id=" + Server.UrlEncode("Sorry Server is not responding now"));
                        }
                        break;
                    case "Photo":
                        if (InternalMessage.SendPhotoRequest(strMatID, HF_ToID.Value, true))
                        {
                            Server.Transfer("../extras/Sucess.aspx?id=Your Request has been send");
                        }
                        else
                        {
                            Server.Transfer("../extras/Sucess.aspx?id=" + Server.UrlEncode("Sorry Server is not responding now"));
                        }
                        break;
                    default:
                        Server.Transfer("../extras/Sucess.aspx?id=" + Server.UrlEncode("Sorry Server is not responding now"));
                        break;
                }
            }
            catch (Exception Ex)
            {
                // Some unexpected error Write Log
                ErrorLog.WriteErrorLog("Member-SendMessages.aspx", Ex);
            }
        }
    }
}
