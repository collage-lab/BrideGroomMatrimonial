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

using System.IO;
using System.Xml;
using System.Data.SqlClient;

public partial class Admin_Protected_ChangeState : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            switch (WebConfig.GetValues("SiteStatus").ToLower())
            {
                case "running":
                    B_Submit.Text = "Bring the site Down";
                    L_SiteStatus.Text = "BRING SITE DOWN";
                    HF_State.Value = "running";
                    TB_Message.Visible = true;
                    L_Message.Visible = true;
                    break;
                case "Stoped":
                    B_Submit.Text = "Bring the site Up";
                    L_SiteStatus.Text = "BRING SITE UP";
                    TB_Message.Visible = false;
                    L_Message.Visible = false;
                    HF_State.Value = "stoped";
                    break;
                case "Setup":
                    break;
            }
            L_Alurt.Visible = false;
        }
        else
        {
            L_Alurt.Visible = false;


            HttpCookieCollection objHttpCookieCollection = Request.Cookies;
            HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatAdmCookie5456sb");
            if (CB_Conform.Checked)
            {

                if (MatrimonialAdministratorMembership.AdminAuthentication(Crypto.DeCrypto(objHttpCookie.Values["UserID"]), TB_PAssword.Text).AuthenticationStatus)
                {


                    switch (HF_State.Value)
                    {
                        case "running":
                            B_Submit.Text = "Bring the site Up";
                            L_SiteStatus.Text = "Bring the site Up";
                            TB_Message.Visible = false;
                            L_Message.Visible = false;
                            HF_State.Value = "stoped";
                            UpdateConfigWeb("Stoped", TB_Message.Text);
                            break;
                        case "stoped":
                            B_Submit.Text = "Bring the site Down";
                            L_SiteStatus.Text = "Bring the site Down";
                            TB_Message.Visible = true;
                            L_Message.Visible = true;
                            HF_State.Value = "running";
                            UpdateConfigWeb("Running", "Web Site IS running from " + DateTime.Now.ToString());
                            break;
                        case "setup":
                            break;
                    }
                }
                else
                {
                    L_Alurt.Visible = true;
                    L_Alurt.Text = "Wrong password ..";
                }
            }
            else
            {
                CB_Conform.ForeColor = System.Drawing.Color.Red;
                CB_Conform.Focus();
            }
        }
    }

    #region"Member Function"
    protected void UpdateConfigWeb(string Status, string Message)
    {
        XmlReader objXmlReader = new XmlTextReader(File.OpenRead(Server.MapPath("~/web.config")));

        XmlDocument objXmlDocument = new XmlDocument();
        objXmlDocument.Load(objXmlReader);
        objXmlReader.Close();

        XmlElement objXmlElement = objXmlDocument.DocumentElement;
        XmlNodeList objXmlNodeList = objXmlElement.GetElementsByTagName("appSettings");

        if (objXmlNodeList.Count <= 0)
        {
            // place in complete appsettings section
            XmlDocumentFragment newAppSettings = objXmlDocument.CreateDocumentFragment();
            newAppSettings.InnerXml = ("<!-- APPSETTINGS\n          This section sets all the custom application settings\n    -->" +
                "<appSettings>\n" +
                "   <add key=\"sitestatus\" value=\"" + Status + "\" />\n" +
                "   <add key=\"message\" value=\""+Message+"\" />" +
                //Mail Settings
                "<!--     mail settings -->" +
                "<add key=\"mailserver\" value=\"mail.matrimonilal.com\"/>\n" +
                //Database Settings
                "<!--     DataBase Settings -->" +
                "    <add key=\"database\" value=\"\" />\n" +
                "    <add key=\"datasource\" value=\"\" />\n" +
                "    <add key=\"userid\" value=\"\" />\n" +
                "    <add key=\"password\" value=\"\" />\n" +
                "    <add key=\"timeout\" value=\"\" />\n" +
                //WebSettings
                "<!--     Web Settings -->" +
                "    <add key=\"sitename\" value=\"http://www.bngmatrimonials.com\" />\n" +
                "    <add key=\"fname\" value=\"Matrimonials\" />\n" +
                "    <add key=\"logopath\" value=\"~/Resources/logo.jpg\" />\n" +
                "    <add key=\"title\" value=\"Bride n Groom Matrimonials\" />\n" +
                "    <add key=\"metadiscription\" value=\"Best India Site\" />\n" +
                "    <add key=\"metakeword\" value=\"Bride,groom\" />\n" +
                "    <add key=\"webfooter\" value=\"Footer \" />\n" +
                // Contacts Settings
                "<!--     Contact Settings -->" +
                "    <add key=\"emailfrom\" value=\"administrator@matrimony.com\" />\n" +
                "    <add key=\"emailto\" value=\"support@matrimony.com\" />\n" +
                "    <add key=\"emailfeedback\" value=\"Feedback@matrimony.com\" />\n" +
                "    <add key=\"emailcontact\" value=\"enquiry@matrimony.com\" />\n" +
                "    <add key=\"emailsales\" value=\"sales@example.com\" />\n" +
                "    <add key=\"emailphoto\" value=\"photos@example.com\" />\n" +
                "    <add key=\"emailhoro\" value=\"Horoscop@example.com\" />\n" +
                "    <add key=\"emailsstory\" value=\"Horoscop@example.com\" />\n" +
               "  </appSettings>");


            //add the new appsettings to the doc
            objXmlElement.AppendChild(newAppSettings);
        }
        else
        {
            bool issetup = false;
            bool ismessage = false;

            for (int i = 0; i < objXmlNodeList.Count; i++)
            {
                XmlNodeList appnodes = ((XmlElement)(objXmlNodeList.Item(i))).GetElementsByTagName("add");

                for (int j = 0; j < appnodes.Count; j++)
                {
                    // replace with new values 
                    // record to make sure none are missing 
                    XmlAttributeCollection attrColl = appnodes.Item(j).Attributes;
                    XmlAttribute tmpNode = (XmlAttribute)attrColl.GetNamedItem("key");
                    XmlAttribute tmpNodeValue = (XmlAttribute)attrColl.GetNamedItem("value");
                    if (tmpNode.Value.Equals("sitestatus"))
                    {
                        tmpNodeValue.Value = Status;
                        issetup = true;
                    }
                    else if (tmpNode.Value.Equals("message"))
                    {
                        tmpNodeValue.Value = Status;
                        ismessage = true;
                    }

                }

                // if any entries are missing insert mising keys

                XmlDocumentFragment newAppSetting = objXmlDocument.CreateDocumentFragment();

                if (!issetup)
                {
                    // will be set to true later
                    newAppSetting.InnerXml = ("\n    <add key=\"sitestatus\"value=\"" + Status + "\" />");
                    ((XmlElement)(objXmlNodeList.Item(i))).AppendChild(newAppSetting);
                }
                if (!ismessage)
                {
                    newAppSetting.InnerXml = ("\n    <add key=\"message\" value=\"" + Message + "\" />");
                    ((XmlElement)(objXmlNodeList.Item(i))).AppendChild(newAppSetting);
                }

            }
        }

        File.Copy(Server.MapPath("~/web.config"), Server.MapPath("~/web.config.001"), true);
        File.Delete(Server.MapPath("~/web.config"));

        StreamWriter sr = new StreamWriter(File.OpenWrite(Server.MapPath("~/web.config")));
        objXmlDocument.Save(sr);
        sr.Close();
    }


    #endregion
  
}
