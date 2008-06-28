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
        if (!IsPostBack)
        {
  
            // Adding meta Discription
            HtmlMeta objMeta = new HtmlMeta();
            objMeta.Name = "Description";
            objMeta.Content = WebConfig.GetValues("MetaDiscription");
            this.Header.Controls.Add(objMeta);

            // Adding meta KeyWords
            objMeta = new HtmlMeta();
            objMeta.Name = "keywords";
            objMeta.Content = WebConfig.GetValues("MetaKeword");
            this.Header.Controls.Add(objMeta);

            txtCount.Text = TB_Message.MaxLength.ToString();

            TB_Message.Attributes.Add("onKeyUp",
               "javascript:document.getElementById('" + txtCount.ClientID +
               "').setAttribute('value', (" + TB_Message.MaxLength +
               " - parseInt(document.getElementById('" + TB_Message.ClientID +
               "').getAttribute('value').length)));");
        }
        else
        {
            string emailSubject = "Invitation to join Free in " + WebConfig.GetValues("Fname")+" By "+TB_SName.Text;
            //Creating Link
            string _Link = WebConfig.GetValues("SiteName") + "~/Guest/Verification.aspx?id=r&key=" + DateTime.Today.ToString() + "#" + Crypto.EnCrypto(TB_REMail.Text);
            Response.Write(_Link);
            // Making Body
            string emailBody = "Body";//<<<<<<<<<< ForTesting >>>>>>>>

            //Sending Mail
            if (EmailManager.SendMail(TB_REMail.Text,TB_SEmail.Text, emailSubject, emailBody))
            {
                Response.Redirect("../Extras/Sucess.aspx?message=" + Server.UrlEncode("Your mail is sussfully send"));
            }
            else
            {
                ///display error message
                Response.Redirect("../Extras/Sucess.aspx?message=" + Server.UrlEncode("error in sending your mail"));
            }

        }

    }
    protected void IB_Submit_Click(object sender, ImageClickEventArgs e)
    {

    }

    public int MaxLength
    {
        get { return TB_Message.MaxLength; }
        set { TB_Message.MaxLength = value; }
    }
}
