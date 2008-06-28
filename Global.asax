<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    {
        // Code that runs when an unhandled error occurs
        //try
        //{
        //    Exception Ex = new Exception("UNHANDLED ERROR OCCURED !!");
        //    ErrorLog.WriteErrorLog("SYSTEM FAULT !!", Ex);
        //    //Server.Transfer("~/Extras/ErrorReport.aspx?error", true);
        //}
        //catch (Exception)
        //{ }

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }
    protected void Application_BeginRequest(object sender, EventArgs e)
    {

        HttpContext myContext = HttpContext.Current;
        // makking a regular expression of url
        Regex rewrite_regex = new Regex(@"(.+)\/((.+)\.aspx)", RegexOptions.IgnoreCase);

        try
        {
            string strURL = myContext.Request.Path.ToString().ToLower();

            // Does the URL points to Myprofile

            if (strURL.IndexOf("myprofile") > 0) // Yes
            {
                Match match_rewrite = rewrite_regex.Match(strURL);
                int index = match_rewrite.Groups[2].Captures[0].ToString().IndexOf(".aspx");
                strURL = match_rewrite.Groups[2].Captures[0].ToString().Remove(index).Trim();
                myContext.RewritePath("~/Member/viewprofile.aspx?matid=" + strURL, true);
            }// Else Do nothing
        }
        catch (System.ArgumentOutOfRangeException Ex)
        {
            // Do Nothing
        }
        catch (Exception Ex)//Oops Some Error Happend
        {
            //Writing Log
            ErrorLog.WriteErrorLog("Global.Asax", Ex);
        }
    }
    
    
    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
    
    
       
</script>
