using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
//---------------------------------------
using System.Collections.Specialized;
using System.Data.SqlClient;
//---------------------------------------

/// <summary>
/// DBCOnnection Class is used to manage data base connections and database operations 
/// </summary>
public class DBConnection
{
    public DBConnection()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    private static string GetAppSetting(string strSetting)
    {
        HttpContext objHttpContext = HttpContext.Current;
        string strVal;
        try
        {
            strVal = (string)((NameValueCollection)objHttpContext.GetSection("appSettings"))[strSetting];
        }
        catch (NullReferenceException)
        {
            strVal = "";
        }

        if (strVal == null)
            strVal = "";

        return strVal;
    }

    public static string getConnectionString()
    {
        try
        {
            //IS AVILABE IN CACHE??
            if (HttpContext.Current.Cache["DBConnectionString"] == null)
            {
                return RefreshDBCache();
            }
            else
            {
                //LOADING FROM CACHE
                return (string)HttpContext.Current.Cache["DBConnectionString"];
            }
        }
        catch(Exception EX)
        {
            ErrorLog.WriteErrorLog("DBConnection.getConnectionString", EX);
            return null;
        }
    }

    public static SqlConnection GetSqlConnection()
    {
        
        SqlConnection objConnection = new SqlConnection();
        objConnection.ConnectionString = getConnectionString();

        return objConnection;
    }

    public static string RefreshDBCache()
    {
        //LOADING FROM CONFIG FILE
        string strConnectionString = "server=" + GetAppSetting("datasource") + ";database=" + GetAppSetting("database") +
                                        ";uid=" + GetAppSetting("userid") + ";pwd=" + GetAppSetting("password") +
                                        ((GetAppSetting("timeout").Length > 0) ? ";Connection Timeout=" + GetAppSetting("timeout") : "");
        //ADDING INTO CACHE
        HttpContext.Current.Cache["DBConnectionString"] = strConnectionString;
        //RETURN VALUE
        return strConnectionString;
    }

}
