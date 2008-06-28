//------------------------------------------------------------------------------------------------------------------------
//                                                  Matrimonial Home Page
//------------------------------------------------------------------------------------------------------------------------
// Operations 
//------------
// Login
// Search
//------------
// User Roles
//------------
// Common
//------------------------------------------------------------------------------------------------------------------------

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
//--------------------------------
using System.Data.SqlClient;
//--------------------------------

public partial class Guest_Home : System.Web.UI.Page
{
    //-------------------------------------------------------------
    private string strURL = null;
    //-------------------------------------------------------------
    protected void Page_Load(object sender, EventArgs e)
    {
        //-------------------------------------------------------------------------------------
        if (!IsPostBack)
        {
            //-------------------------------------------------------------------------------------
            // Adding meta Discription
            HtmlMeta objMeta = new HtmlMeta();
            objMeta.Name = "Description";
            objMeta.Content = WebConfig.GetValues(WebConfig.ConfigurationItem.metadiscription);
            this.Header.Controls.Add(objMeta);
            //-------------------------------------------------------------------------------------
            // Adding meta KeyWords
            objMeta = new HtmlMeta();
            objMeta.Name = "keywords";
            objMeta.Content = WebConfig.GetValues(WebConfig.ConfigurationItem.metakeword);
            this.Header.Controls.Add(objMeta);
            //-------------------------------------------------------------------------------------
            this.Title = WebConfig.GetValues(WebConfig.ConfigurationItem.title);
            //-------------------------------------------------------------------------------------
        }   //if
    }   // Page_load
    //  Login Button Click
    protected void IB_LogIn_Click(object sender, ImageClickEventArgs e)
    {
        //---------------------------------------------------------------------------------------------------------------
        strURL = FormsAuthentication.GetRedirectUrl("", false);
        //  Getting User Details
        SimpleUser objUser = MatrimonialMemberShip.Authentication(TB_ID.Text, FormsAuthentication.HashPasswordForStoringInConfigFile(TB_Password.Text, "MD5"));
        //---------------------------------------------------------------------------------------------------------------
        // user authentication
        if (objUser.AuthenticationStatus == true)
        {
            HttpCookie objHttpCookie;
            //Redirection Depending on the user
            switch (objUser.Membership)
            {
                //---------------------------------------------------------------------------------------------------------------
                case SimpleUser.UserType.RegistrationStep1://-->>Registration Step1
                    //Setting Registration Cookie
                    FormsAuthentication.SetAuthCookie("Registar", false);
                    //Adding Information Into Cookie
                    objHttpCookie = new HttpCookie("MatRegInfo");
                    objHttpCookie.Values["ApplicationID"] = Crypto.EnCrypto(objUser.ApplicationID);
                    Response.Cookies.Add(objHttpCookie);
                    //Transfering control to step 2
                    Server.Transfer("~/Registration/RegistrationStep2.aspx");
                    break;
                //---------------------------------------------------------------------------------------------------------------
                case SimpleUser.UserType.RegistrationStep2://-->>Registration Step3
                    FormsAuthentication.SetAuthCookie("Registar", false);
                    //Adding Information Into Cookie
                    objHttpCookie = new HttpCookie("MatRegInfo");
                    objHttpCookie.Values["ApplicationID"] = Crypto.EnCrypto(objUser.ApplicationID);
                    Response.Cookies.Add(objHttpCookie);
                    //Transfering control to step 3
                    Server.Transfer("~/Registration/RegistrationStep3.aspx");
                    break;
                //---------------------------------------------------------------------------------------------------------------
                case SimpleUser.UserType.RegistrationStep3://-->>Registration Step4
                    FormsAuthentication.SetAuthCookie("Registar", false);
                    //Adding Information Into Cookie
                    objHttpCookie = new HttpCookie("MatRegInfo");
                    objHttpCookie.Values["ApplicationID"] = Crypto.EnCrypto(objUser.ApplicationID);
                    Response.Cookies.Add(objHttpCookie);
                    //Transfering control to step 4
                    Server.Transfer("~/Registration/RegistrationStep4.aspx");
                    break;
                //---------------------------------------------------------------------------------------------------------------
                case SimpleUser.UserType.FreeMember: // FreeMember
                    // setting Cookie
                    objHttpCookie = new HttpCookie("MatCookie5639sb");
                    objHttpCookie.Values["ApplicationID"] = Crypto.EnCrypto(objUser.ApplicationID);
                    objHttpCookie.Values["UserName"] = Crypto.EnCrypto(objUser.UserName);
                    objHttpCookie.Values["MatrimonialID"] = Crypto.EnCrypto(objUser.MatrimonialID);
                    objHttpCookie.Values["UserType"] = Crypto.EnCrypto(objUser.Membership.ToString());
                    Response.Cookies.Add(objHttpCookie);
                    //Setting Form Authentication
                    FormsAuthentication.RedirectFromLoginPage("Members", false);
                    break;
                //---------------------------------------------------------------------------------------------------------------
                case SimpleUser.UserType.PaidMember:// Paid User
                    // setting Cookie
                    objHttpCookie = new HttpCookie("MatCookie5639sb");
                    objHttpCookie.Values["ApplicationID"] = Crypto.EnCrypto(objUser.ApplicationID);
                    objHttpCookie.Values["UserName"] = Crypto.EnCrypto(objUser.UserName);
                    objHttpCookie.Values["MatrimonialID"] = Crypto.EnCrypto(objUser.MatrimonialID);
                    objHttpCookie.Values["UserType"] = Crypto.EnCrypto(objUser.Membership.ToString());
                    Response.Cookies.Add(objHttpCookie);
                    //Setting Form Authentication
                    FormsAuthentication.RedirectFromLoginPage("Members", false);
                    //---------------------------------------------------------------------------------------------------------------
                    break;
                default:
                    //This Will Never Happen
                    ErrorLog.WriteLog("Guest_Home.IB_LogIn_Click -- > objUser.Membership > 6");
                    Response.Redirect("Login.aspx");
                    break;
                //---------------------------------------------------------------------------------------------------------------
            }
            //---------------------------------------------------------------------------------------------------------------
        }
        else
        {
            //---------------------------------------------------------------------------------------------------------------
            Response.Redirect("Login.aspx");
            //---------------------------------------------------------------------------------------------------------------
        }
    }
    // Search Button Click
    protected void IB_search_Click(object sender, ImageClickEventArgs e)
    {
        //---------------------------------------------------------------------------------------------------------------
        Server.Transfer("~/Guest/Searchresults.aspx?g=" + RB_Male.Checked.ToString() + "&ai=" + TB_AgeMin.Text + "&ax=" + TB_AgeMax.Text + "&r=" + DDL_Religion.SelectedIndex.ToString() + "&c=" + HF_Caste.Value + "&ph=" + CB_Photo.Checked.ToString());
        //---------------------------------------------------------------------------------------------------------------
    }
}