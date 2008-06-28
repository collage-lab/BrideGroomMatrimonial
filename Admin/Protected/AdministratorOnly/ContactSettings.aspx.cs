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

using System.Xml;
using System.IO;


public partial class Admin_Protected_ContactSettings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            Page.Validate();


            if ((Page.IsValid) && (UpdateConfigWeb(TB_SMTP.Text, TB_From.Text, TB_To.Text, TB_FeedBack.Text, TB_Contact.Text, TB_Sales.Text, TB_Photo.Text, TB_Horoscop.Text, TB_SStory.Text)))
            {
                L_Report.Text = "Settings Updated";
            }
            else
            {
                L_Report.Text = "Error in  Updated";
            }


        }
        else
        {
            TB_SMTP.Text = WebConfig.GetValues("mailserver");

            TB_From.Text = WebConfig.GetValues("emailFrom");
            TB_To.Text = WebConfig.GetValues("emailTo");
            TB_FeedBack.Text = WebConfig.GetValues("emailFeedBack");
            TB_Contact.Text = WebConfig.GetValues("emailContact");
            TB_Sales.Text = WebConfig.GetValues("emailSales");
            TB_Photo.Text = WebConfig.GetValues("emailPhoto");
            TB_Horoscop.Text = WebConfig.GetValues("emailHoro");
            TB_SStory.Text = WebConfig.GetValues("emailSStory");
        }

    }


    #region"Member Function"

    // place in complete WebSettings section

    public bool UpdateConfigWeb(string mailServer, string emailFrom, string emailTo, string emailFeedBack, string emailContact, string emailSales, string emailPhoto, string emailHoro, string emailSStory)
    {
        try
        {
            XmlReader xtr = new XmlTextReader(File.OpenRead(Server.MapPath("~/web.config")));

            XmlDocument doc = new XmlDocument();
            doc.Load(xtr);
            xtr.Close();

            XmlElement root = doc.DocumentElement;
            XmlNodeList nodes = root.GetElementsByTagName("appSettings");

            if (nodes.Count <= 0)
            {
                // place in complete appsettings section
                XmlDocumentFragment newAppSettings = doc.CreateDocumentFragment();
                newAppSettings.InnerXml = ("<!-- This section sets all the custom application settings\n    -->" +
                    "<appSettings>\n" +
                    "   <add key=\"sitestatus\" value=\"Setup\" />\n" +
                    "   <add key=\"message\" value=\"Test Message to display\" />"+

                    //Mail Settings
                    "<!--     Mail Settings -->" +
                    "<add key=\"mailserver\" value=\"mail.chakkara.com\"/>\n" +
                    // DataBAse Settings
                    "<!--     DB Settings -->" +
                    "    <add key=\"database\" value=\"\" />\n" +
                    "    <add key=\"datasource\" value=\"\" />\n" +
                    "    <add key=\"userid\" value=\"\" />\n" +
                    "    <add key=\"password\" value=\"\" />\n" +
                    "    <add key=\"timeout\" value=\"\" />\n\n" +
                    // Web Settings
                    "<!--     Web Settings -->" +
                    "    <add key=\"sitename\" value=\"http://www.bngmatrimonials.com\" />\n" +
                    "    <add key=\"FName\" value=\"Matrimonials\" />\n" +
                    "    <add key=\"logopath\" value=\"~/Resources/logo.jpg\" />\n" +
                    "    <add key=\"Title\" value=\"Bride n Groom Matrimonials\" />\n" +
                    "    <add key=\"metadiscription\" value=\"Best India Site\" />\n" +
                    "    <add key=\"metakeword\" value=\"Bride,groom\" />\n" +
                    "    <add key=\"webfooter\" value=\"Footer \" />\n\n" +
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
                root.AppendChild(newAppSettings);
            }
            else
            {
                bool ismailServer = false;

                bool isemailFrom = false;
                bool isemailTo = false;
                bool isemailFeedBack = false;
                bool isemailContact = false;
                bool isemailSales = false;
                bool isemailPhoto = false;
                bool isemailHoro = false;
                bool isemailSStory = false;

                for (int i = 0; i < nodes.Count; i++)
                {
                    XmlNodeList appnodes = ((XmlElement)(nodes.Item(i))).GetElementsByTagName("add");

                    for (int j = 0; j < appnodes.Count; j++)
                    {
                        // replace with new values 
                        // record to make sure none are missing 
                        XmlAttributeCollection attrColl = appnodes.Item(j).Attributes;
                        XmlAttribute tmpNode = (XmlAttribute)attrColl.GetNamedItem("key");
                        XmlAttribute tmpNodeValue = (XmlAttribute)attrColl.GetNamedItem("value");
                        if (tmpNode.Value.Equals("mailserver"))
                        {
                            // will be set to true later
                            tmpNodeValue.Value = emailFrom;
                            isemailFrom = true;
                        }
                        else if (tmpNode.Value.Equals("emailfrom"))
                        {
                            // will be set to true later
                            tmpNodeValue.Value = emailFrom;
                            isemailFrom = true;
                        }
                        else if (tmpNode.Value.Equals("emailto"))
                        {
                            tmpNodeValue.Value = emailTo;
                            isemailTo = true;
                        }
                        else if (tmpNode.Value.Equals("emailcontact"))
                        {
                            tmpNodeValue.Value = emailContact;
                            isemailFeedBack = true;
                        }
                        else if (tmpNode.Value.Equals("emailfeedback"))
                        {
                            tmpNodeValue.Value = emailFeedBack;
                            isemailContact = true;
                        }
                        else if (tmpNode.Value.Equals("emailsales"))
                        {
                            tmpNodeValue.Value = emailSales;
                            isemailSales = true;
                        }
                        else if (tmpNode.Value.Equals("emailphoto"))
                        {
                            tmpNodeValue.Value = emailPhoto;
                            isemailPhoto = true;
                        }
                        else if (tmpNode.Value.Equals("emailhoro"))
                        {
                            tmpNodeValue.Value = emailHoro;
                            isemailHoro = true;
                        }
                        else if (tmpNode.Value.Equals("emailsstory"))
                        {
                            tmpNodeValue.Value = emailSStory;
                            isemailSStory = true;
                        }

                    }

                    // if any entries are missing insert mising keys

                    XmlDocumentFragment newAppSetting = doc.CreateDocumentFragment();


                    if (!ismailServer)
                    {
                        newAppSetting.InnerXml = ("\n    <add key=\"mailserver\" value=\"" + mailServer + "\" />");
                        ((XmlElement)(nodes.Item(i))).AppendChild(newAppSetting);
                    }

                    if (!isemailFrom)
                    {
                        newAppSetting.InnerXml = ("\n    <add key=\"emailfrom\" value=\"" + emailFrom + "\" />");
                        ((XmlElement)(nodes.Item(i))).AppendChild(newAppSetting);
                    }
                    if (!isemailTo)
                    {
                        newAppSetting.InnerXml = ("\n    <add key=\"emailto\" value=\"" + emailTo + "\" />");
                        ((XmlElement)(nodes.Item(i))).AppendChild(newAppSetting);
                    }
                    if (!isemailFeedBack)
                    {
                        newAppSetting.InnerXml = ("\n    <add key=\"emailfeedback\" value=\"" + emailFeedBack + "\" />");
                        ((XmlElement)(nodes.Item(i))).AppendChild(newAppSetting);

                    }
                    if (!isemailContact)
                    {
                        newAppSetting.InnerXml = ("\n    <add key=\"emailcontact\" value=\"" + emailContact + "\" />");
                        ((XmlElement)(nodes.Item(i))).AppendChild(newAppSetting);
                    }
                    if (!isemailSales)
                    {
                        newAppSetting.InnerXml = ("\n    <add key=\"emailsales\" value=\"" + emailSales + "\" />");
                        ((XmlElement)(nodes.Item(i))).AppendChild(newAppSetting);
                    }
                    if (!isemailPhoto)
                    {
                        newAppSetting.InnerXml = ("\n    <add key=\"emailphoto\" value=\"" + emailPhoto + "\" />");
                        ((XmlElement)(nodes.Item(i))).AppendChild(newAppSetting);
                    }
                    if (!isemailHoro)
                    {
                        newAppSetting.InnerXml = ("\n    <add key=\"emailhoro\" value=\"" + emailHoro + "\" />");
                        ((XmlElement)(nodes.Item(i))).AppendChild(newAppSetting);
                    }
                    if (!isemailSStory)
                    {
                        newAppSetting.InnerXml = ("\n    <add key=\"emailsstory\" value=\"" + emailSStory + "\" />");
                        ((XmlElement)(nodes.Item(i))).AppendChild(newAppSetting);
                    }

                }
            }

            // making a back up of web.config

            File.Copy(Server.MapPath("~/web.config"), Server.MapPath("~/web.config.003"), true);
            File.Delete(Server.MapPath("~/web.config"));

            StreamWriter sr = new StreamWriter(File.OpenWrite(Server.MapPath("~/web.config")));
            doc.Save(sr);
            sr.Close();
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }


    #endregion




}

