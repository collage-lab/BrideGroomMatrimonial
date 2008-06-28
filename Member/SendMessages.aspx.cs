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

public partial class Member_SendMessages : System.Web.UI.Page
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



            txtCount.Text = TB_Message.MaxLength.ToString();

            //Adding Attributes to Text Box

            TB_Message.Attributes.Add("onKeyUp",
               "javascript:document.getElementById('" + txtCount.ClientID +
               "').setAttribute('value', (" + TB_Message.MaxLength +
               " - parseInt(document.getElementById('" + TB_Message.ClientID +
               "').getAttribute('value').length)));");

        }
        else
        {
            try
            {
                // Getting User Information
                HttpCookieCollection objHttpCookieCollection = Request.Cookies;
                HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");

                string strMatID = Crypto.DeCrypto(objHttpCookie.Values[2]);

                // Send Message
                switch (InternalMessage.SendMessage(strMatID, HF_ToID.Value, TB_Message.Text))
                {
                    case true:// Sucess
                        Server.Transfer("../extras/Sucess.aspx?id=Your message has been send");
                        break;
                    default: // Oops some error had happened
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


    public int MaxLength
    {
        get { return TB_Message.MaxLength; }
        set { TB_Message.MaxLength = value; }
    }
}
