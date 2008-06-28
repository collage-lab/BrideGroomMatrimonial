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

public partial class Admin_Protected_WebSettings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            Page.Validate();


            if ((Page.IsValid)&& (UpdateConfigWeb(TB_SiteName.Text, TB_FName.Text, TB_Title.Text, TB_LPath.Text, TB_MetaDiscription.Text, TB_MetaKeword.Text, TB_WebFooter.Text)))
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
            ///Loading from web.config

            TB_SiteName.Text = WebConfig.GetValues("SiteName");
            TB_FName.Text = WebConfig.GetValues("FName");
            TB_Title.Text = WebConfig.GetValues("Title");
            TB_LPath.Text = WebConfig.GetValues("LogoPath");
            TB_MetaDiscription.Text = WebConfig.GetValues("MetaDiscription");
            TB_MetaKeword.Text = WebConfig.GetValues("MetaKeword");
            TB_WebFooter.Text = WebConfig.GetValues("WebFooter");

        }
    }
   


    #region"Member Function"

            // place in complete WebSettings section

    public bool UpdateConfigWeb(String SiteName, String FName, String Title, String LogoPath ,String MetaDiscription, String MetaKeywords, String WebFooter)
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
                newAppSettings.InnerXml = ("<!-- APPSETTINGS\n          This section sets all the custom application settings\n    -->" +
                    "<appSettings>\n" +
                    "   <add key=\"SiteStatus\" value=\"Setup\" />\n" +
                    "   <add key=\"message\" value=\"Test Message to display\" />" +
                    //Mail Settings
                    "<!--     Mail Settings -->" +
                    "<add key=\"mailserver\" value=\"mail.chakkara.com\"/>\n" +
                    //Database Settings

                    "<!--     DB Settings -->" +
                    "    <add key=\"database\" value=\"\" />\n" +
                    "    <add key=\"datasource\" value=\"\" />\n" +
                    "    <add key=\"userid\" value=\"\" />\n" +
                    "    <add key=\"password\" value=\"\" />\n" +
                    "    <add key=\"timeout\" value=\"\" />\n" +
                    // Web SAettings
                    "<!--     Web Settings -->" +
                    "    <add key=\"sitename\" value=\"http://www.bngmatrimonials.com\" />\n" +
                    "    <add key=\"fname\" value=\"Matrimonials\" />\n" +
                    "    <add key=\"togopath\" value=\"~/Resources/logo.jpg\" />\n" +
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
                root.AppendChild(newAppSettings);
            }
            else
            {


                bool isSiteName = false;
                bool isFName = false;
                bool isLogoPath = false;
                bool isTitle = false;
                bool isMetaDiscription = false;
                bool isMetaKeyword = false;
                bool isWebfooter = false;

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
                        if (tmpNode.Value.Equals("sitename"))
                        {
                            // will be set to true later
                            tmpNodeValue.Value = SiteName;
                            isSiteName = true;
                        }
                        else if (tmpNode.Value.Equals("fname"))
                        {
                            tmpNodeValue.Value = FName;
                            isFName = true;
                        }
                        else if (tmpNode.Value.Equals("logopath"))
                        {
                            tmpNodeValue.Value = LogoPath;
                            isLogoPath = true;
                        }
                        else if (tmpNode.Value.Equals("title"))
                        {
                            tmpNodeValue.Value = Title;
                            isTitle = true;
                        }
                        else if (tmpNode.Value.Equals("metadiscription"))
                        {
                            tmpNodeValue.Value = MetaDiscription;
                            isMetaDiscription = true;
                        }
                        else if (tmpNode.Value.Equals("metakeword"))
                        {
                            tmpNodeValue.Value = MetaKeywords;
                            isMetaKeyword = true;
                        }
                        else if (tmpNode.Value.Equals("webfooter"))
                        {
                            tmpNodeValue.Value = WebFooter;
                            isWebfooter = true;
                        }

                    }

                    // if any entries are missing insert mising keys

                    XmlDocumentFragment newAppSetting = doc.CreateDocumentFragment();

                    if (!isSiteName)
                    {
                        // will be set to true later
                        newAppSetting.InnerXml = ("\n    <add key=\"sitename\" value=\"" + SiteName + "\" />");
                        ((XmlElement)(nodes.Item(i))).AppendChild(newAppSetting);
                    }
                    if (!isFName)
                    {
                        newAppSetting.InnerXml = ("\n    <add key=\"fname\" value=\"" + FName + "\" />");
                        ((XmlElement)(nodes.Item(i))).AppendChild(newAppSetting);
                    }
                    if (!isLogoPath)
                    {
                        newAppSetting.InnerXml = ("\n    <add key=\"logopath\" value=\"" + LogoPath + "\" />");
                        ((XmlElement)(nodes.Item(i))).AppendChild(newAppSetting);
                    }
                    if (!isTitle)
                    {
                        newAppSetting.InnerXml = ("\n    <add key=\"title\" value=\"" + Title + "\" />");
                        ((XmlElement)(nodes.Item(i))).AppendChild(newAppSetting);
                    }
                    if (!isMetaDiscription)
                    {
                        newAppSetting.InnerXml = ("\n    <add key=\"metadiscription\" value=\"" + MetaDiscription + "\" />");
                        ((XmlElement)(nodes.Item(i))).AppendChild(newAppSetting);
                    }
                    if (!isMetaKeyword)
                    {
                        newAppSetting.InnerXml = ("\n    <add key=\"metakeword\" value=\"" + MetaKeywords + "\" />");
                        ((XmlElement)(nodes.Item(i))).AppendChild(newAppSetting);
                    }
                    if (!isWebfooter)
                    {
                        newAppSetting.InnerXml = ("\n    <add key=\"webfooter\" value=\"" + WebFooter + "\" />");
                        ((XmlElement)(nodes.Item(i))).AppendChild(newAppSetting);
                    }

                }
            }

            // making a back up of web.config

            File.Copy(Server.MapPath("~/web.config"), Server.MapPath("~/web.config.002"), true);
            File.Delete(Server.MapPath("~/web.config"));

            StreamWriter sr = new StreamWriter(File.OpenWrite(Server.MapPath("~/web.config")));
            doc.Save(sr);
            sr.Close();
            return true;
        }
        catch(Exception EX)
        {
            ErrorLog.WriteErrorLog("Admin_Protected_WebSettings.UpdateConfigWeb", EX);
            return false;
        }
    }


    #endregion





}
