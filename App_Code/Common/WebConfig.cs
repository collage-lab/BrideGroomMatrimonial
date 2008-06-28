using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Collections.Specialized;



/// <summary>
/// Summary description for WebConfig
/// </summary>
public class WebConfig
{
	public WebConfig()
	{
        
	}
    public static string GetValues(String Index)
    {

        HttpContext CurrentContext = HttpContext.Current;

        
        string val;
        try
        {
            val = (string)((NameValueCollection)CurrentContext.GetConfig("appSettings"))[Index.ToLower()];
        }
        catch (NullReferenceException)
        {
            val = "";
        }

        if (val == null)
            val = "";

        return val;
    }

    public enum ConfigurationItem
    {
        SiteStatus, 
        Message, 
        mailserver,
        server, 
        database, 
        datasource, 
        userid, 
        password,
        timeout,
        sitename, 
        fname, 
        logopath, 
        title, 
        metadiscription, 
        metakeword, 
        webfooter, 
        emailFrom, 
        emailTo, 
        emailFeedBack,
        emailContact,
        emailSales, 
        emailPhoto, 
        emailHoro, 
        emailSStory
    }


    public static string GetValues(ConfigurationItem Type)
    {

        switch (Type)
        {
            case ConfigurationItem.SiteStatus:
                      return GetValue("SiteStatus");
            break;
            case ConfigurationItem.Message:
                      return GetValue("message");
            break;
            case ConfigurationItem.mailserver:
                      return GetValue("mailserver");
            break;
            case ConfigurationItem.server:
                return GetValue("server");
            break;
            case ConfigurationItem.database:
                return GetValue("database");
            break;
            case ConfigurationItem.datasource:
                return GetValue("datasource");
            break;
            case ConfigurationItem.userid:
                return GetValue("userid");
            break;
            case ConfigurationItem.password:
                return GetValue("password");
            break;
            case ConfigurationItem.timeout:
                return GetValue("timeout");
            break;
            case ConfigurationItem.sitename :
            return GetValue("sitename ");
            break;
            case ConfigurationItem.fname:
                return GetValue("fname");
            break;
            case ConfigurationItem.logopath:
                return GetValue("logopath");
            break;
            case ConfigurationItem.title:
                return GetValue("title");
            break;
            case ConfigurationItem.metadiscription:return GetValue("metadiscription");
            break;
            case ConfigurationItem.metakeword:return GetValue("metakeword");
            break;
            case ConfigurationItem.webfooter:return GetValue("webfooter");
            break;
            case ConfigurationItem.emailFrom:return GetValue("emailFrom");
            break;
            case ConfigurationItem.emailTo: return GetValue("emailTo");
            break;
            case ConfigurationItem.emailFeedBack: return GetValue("emailFeedBack");
            break;
            case ConfigurationItem.emailContact: return GetValue("emailContact");
            break;
            case ConfigurationItem.emailSales:return GetValue("emailSales");
            break;
            case ConfigurationItem.emailPhoto:return GetValue("emailPhoto");
            break;
            case ConfigurationItem.emailHoro: return GetValue("emailHoro");
            break;
            case ConfigurationItem.emailSStory:return GetValue("emailSStory");
            break;
        }
        return null;
    }

    private static string GetValue(string Index)
    {
        HttpContext CurrentContext = HttpContext.Current;


        string val;
        try
        {
            val = (string)((NameValueCollection)CurrentContext.GetConfig("appSettings"))[Index.ToLower()];
        }
        catch (NullReferenceException)
        {
            val = "";
        }

        if (val == null)
            val = "";

        return val;
    }

}
