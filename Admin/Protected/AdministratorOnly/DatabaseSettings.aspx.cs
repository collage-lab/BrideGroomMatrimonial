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

public partial class Admin_Protected_DatabaseSettings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        if (IsPostBack)
        {
            Page.Validate();

            lblConnectError.Text = "";

            if (Page.IsValid)
            {
                try
                {
                    /// testing whether Database Connected
                    SqlConnection objConnection = new SqlConnection();
                    objConnection.ConnectionString = "server=" + TB_DataSource.Text + ";database=" + TB_Database.Text +
                        ";uid=" + TB_UserID.Text + ";pwd=" + TB_Password.Text + ((TB_Timeout.Text.Length > 0) ?
                        ";Connection Timeout=" + TB_Timeout.Text : "");


                    SqlDataAdapter objAdapter = new SqlDataAdapter("SELECT * FROM ApplicationDataBaseTest", objConnection);

                    // Can we get to the database?
                    DataSet objDataSet = new DataSet();
                    objAdapter.Fill(objDataSet, "ApplicationDataBaseTest");

                    UpdateConfigWeb(TB_Database.Text, TB_DataSource.Text, TB_UserID.Text, TB_Password.Text, TB_Timeout.Text);
                    /// redirect to adminindex
                    /// database is connected 
                    L_Report.Text = "Settings Updated";
                    //Response.Redirect("AdminIndex.aspx");
                    return;
                }
                catch (Exception err)
                {
                    lblConnectError.Text = err.Message;
                }
            }
            lblErrorHeader.Text = "Sorry, cannot connect to your database the following errors occured:";
        }
        else
        {

            TB_Database.Text = WebConfig.GetValues("database");
            if (TB_Database.Text.Length <= 0)
            {
                TB_Database.Text = "BnGMatrimonial";
            }
            TB_DataSource.Text = WebConfig.GetValues("datasource");
            TB_UserID.Text = WebConfig.GetValues("userid");
            TB_Password.Text = WebConfig.GetValues("password");
            TB_Timeout.Text = WebConfig.GetValues("timeout");
            //TB_SMTP.Text = "Test Smtp";

        }


    }
    protected void B_Submit_Click(object sender, EventArgs e)
    {

    }


    #region"Member Function"
    protected void UpdateConfigWeb(string database, string datasource, string userid, string password, string timeout)
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
                    "   <add key=\"sitestatus\" value=\"Setup\" />\n" +
                    "   <add key=\"message\" value=\"Test Message to display\" />" +
                //Mail Settings
                "<!--     Mail Settings -->" +
                "<add key=\"mailserver\" value=\"mail.matrimonilal.com\"/>\n" +
                //Database Settings
                "<!--     DataBase Settings -->" +
                "    <add key=\"database\" value=\"" + database + "\" />\n" +
                "    <add key=\"datasource\" value=\"" + datasource + "\" />\n" +
                "    <add key=\"userid\" value=\"" + userid + "\" />\n" +
                "    <add key=\"password\" value=\"" + password + "\" />\n" +
                "    <add key=\"timeout\" value=\"" + timeout + "\" />\n" +
                //WebSettings
                "<!--     Web Settings -->" +
                "    <add key=\"sitename\" value=\"http://www.bngmatrimonials.com\" />\n" +
                "    <add key=\"fname\" value=\"Matrimonials\" />\n" +
                "    <add key=\"logopath\" value=\"MatrimonialIDResources/logo.jpg\" />\n" +
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
            bool isdatabase = false;
            bool isdatasource = false;
            bool isuserid = false;
            bool ispassword = false;
            bool istimeout = false;

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
                    if (tmpNode.Value.Equals("database"))
                    {
                        tmpNodeValue.Value = database;
                        isdatabase = true;
                    }
                    else if (tmpNode.Value.Equals("datasource"))
                    {
                        tmpNodeValue.Value = datasource;
                        isdatasource = true;
                    }
                    else if (tmpNode.Value.Equals("userid"))
                    {
                        tmpNodeValue.Value = userid;
                        isuserid = true;
                    }
                    else if (tmpNode.Value.Equals("password"))
                    {
                        tmpNodeValue.Value = password;
                        ispassword = true;
                    }
                    else if (tmpNode.Value.Equals("timeout"))
                    {
                        tmpNodeValue.Value = timeout;
                        istimeout = true;
                    }

                }

                // if any entries are missing insert mising keys

                XmlDocumentFragment newAppSetting = objXmlDocument.CreateDocumentFragment();

                if (!isdatabase)
                {
                    newAppSetting.InnerXml = ("\n    <add key=\"database\" value=\"" + database + "\" />");
                    ((XmlElement)(objXmlNodeList.Item(i))).AppendChild(newAppSetting);
                }
                if (!isdatasource)
                {
                    newAppSetting.InnerXml = ("\n    <add key=\"datasource\" value=\"" + datasource + "\" />");
                    ((XmlElement)(objXmlNodeList.Item(i))).AppendChild(newAppSetting);
                }
                if (!isuserid)
                {
                    newAppSetting.InnerXml = ("\n    <add key=\"userid\" value=\"" + userid + "\" />");
                    ((XmlElement)(objXmlNodeList.Item(i))).AppendChild(newAppSetting);
                }
                if (!ispassword)
                {
                    newAppSetting.InnerXml = ("\n    <add key=\"password\" value=\"" + password + "\" />");
                    ((XmlElement)(objXmlNodeList.Item(i))).AppendChild(newAppSetting);
                }
                if (!istimeout)
                {
                    newAppSetting.InnerXml = ("\n    <add key=\"timeout\" value=\"" + timeout + "\" />");
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
