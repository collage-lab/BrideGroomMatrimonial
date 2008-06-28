using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Text;
using System.IO;

/// <summary>
/// Summary description for ErrorLog
/// </summary>
public class ErrorLog
{
	public ErrorLog()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static void WriteErrorLog(string From, Exception objException)
    {
        //Where to save 
        string path = HttpContext.Current.Server.MapPath("~/Logs\\ErrorLog.txt");
        // Getting information about the error
        string strException = objException.ToString();
        int Index = strException.IndexOf(" ");
        string strExceptionName = strException.Substring(0, Index - 1);

        // File operation starts
        try
        {
            //  Checking  file Exists.
            if (!File.Exists(path))
            {
                //  Checking Directory Exists
                if (!Directory.Exists(path.Replace("\\ErrorLog.txt", "")))
                {
                    // Creating Directory
                    DirectoryInfo di = Directory.CreateDirectory(path.Replace("\\ErrorLog.txt", ""));

                    // Setting Access Permision To Directory
                }
                // Create a file to write to.
                string createText = "Error Log Created At" + DateTime.Now.ToString() + Environment.NewLine + Environment.NewLine;
                File.WriteAllText(path, createText, Encoding.UTF8);
            }

            // Writing Error Log 
            string appendText = DateTime.Now.ToString() + "\t" + From + "\t\t" + strExceptionName + "\t\t" + objException.Message + Environment.NewLine;
            File.AppendAllText(path, appendText, Encoding.UTF8);
        }
        catch (Exception Ex)
        {
            // Nothing to Do
        }

    }

    public static void WriteLog(string Message)
    {
        //Where to save 
        string path = HttpContext.Current.Server.MapPath("~/Logs\\ErrorLog.txt");
        // Getting information about the error

        // File operation starts
        try
        {
            //  Checking  file Exists.
            if (!File.Exists(path))
            {
                //  Checking Directory Exists
                if (!Directory.Exists(path.Replace("\\ErrorLog.txt", "")))
                {
                    // Creating Directory
                    DirectoryInfo di = Directory.CreateDirectory(path.Replace("\\ErrorLog.txt", ""));

                    // Setting Access Permision To Directory
                }
                // Create a file to write to.
                string createText = "Error Log Created At" + DateTime.Now.ToString() + Environment.NewLine + Environment.NewLine;
                File.WriteAllText(path, createText, Encoding.UTF8);
            }

            // Writing Message 
            string appendText = DateTime.Now.ToString() + "\t" + Message + Environment.NewLine;
            File.AppendAllText(path, appendText, Encoding.UTF8);
        }
        catch (Exception Ex)
        {
            // Nothing to Do
        }

    }

}
