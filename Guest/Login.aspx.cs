//------------------------------------------------------------------------------------------------------------------------
//                                                  Matrimonial Sign Up
//------------------------------------------------------------------------------------------------------------------------
// Operations 
//---------------------------------
// Vrification Of UserName 
// Redirect To registration Page
//---------------------------------
// User Roles
//------------
// Guest
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

public partial class Guest_Login : System.Web.UI.Page
{
    //------------------------------------------------------------------------------------------------------------------------
    private string strURL = null;
    //------------------------------------------------------------------------------------------------------------------------
    protected void Page_Load(object sender, EventArgs e)
    {
        //------------------------------------------------------------------------------------------------------------------------
        if (!IsPostBack)
        {
            //-------------------------------------------------------------------------------
            // Check whether bounsed form from Admin
            //-------------------------------------------------------------------------------
            strURL = FormsAuthentication.GetRedirectUrl("", false).ToLower();
            if (strURL.IndexOf("admin") > 0)
            {
                //user is accesing protected page
                Response.Redirect("../Extras/ErrorReport.aspx?id=403");
            }   //if
            //-------------------------------------------------------------------------------
            // Adding meta Discription
            HtmlMeta objMeta = new HtmlMeta();
            objMeta.Name = "Description";
            objMeta.Content = WebConfig.GetValues("MetaDiscription");
            this.Header.Controls.Add(objMeta);
            //-------------------------------------------------------------------------------
            // Adding meta KeyWords
            objMeta = new HtmlMeta();
            objMeta.Name = "keywords";
            objMeta.Content = WebConfig.GetValues("MetaKeword");
            this.Header.Controls.Add(objMeta);
            //-------------------------------------------------------------------------------
        }
        else
        {
            //-------------------------------------------------------------------------------
            strURL = FormsAuthentication.GetRedirectUrl("", false);
            //---------------------------------------------------------------------------------------------------------------------------------------------------
            SimpleUser objUser = MatrimonialMemberShip.Authentication(TB_ID.Text, FormsAuthentication.HashPasswordForStoringInConfigFile(TB_Password.Text, "MD5"));
            //---------------------------------------------------------------------------------------------------------------------------------------------------
            // user authentication
            if (objUser.AuthenticationStatus == true)
            {
                //Create new cokkie for storing user informations
                HttpCookie objHttpCookie;
                //Redirection is Depending on the user
                switch (objUser.Membership)
                {
                    //-------------------------------------------------------------------------------
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
                    //-------------------------------------------------------------------------------
                    case SimpleUser.UserType.RegistrationStep2://-->>Registration Step3
                        FormsAuthentication.SetAuthCookie("Registar", false);
                        //Adding Information Into Cookie
                        objHttpCookie = new HttpCookie("MatRegInfo");
                        objHttpCookie.Values["ApplicationID"] = Crypto.EnCrypto(objUser.ApplicationID);
                        Response.Cookies.Add(objHttpCookie);
                        //Transfering control to step 3
                        Server.Transfer("~/Registration/RegistrationStep3.aspx");
                        break;
                    //-------------------------------------------------------------------------------
                    case SimpleUser.UserType.RegistrationStep3://-->>Registration Step4
                        FormsAuthentication.SetAuthCookie("Registar", false);
                        //Adding Information Into Cookie
                        objHttpCookie = new HttpCookie("MatRegInfo");
                        objHttpCookie.Values["ApplicationID"] = Crypto.EnCrypto(objUser.ApplicationID);
                        Response.Cookies.Add(objHttpCookie);
                        //Transfering control to step 4
                        Server.Transfer("~/Registration/RegistrationStep4.aspx");
                        break;
                    //-------------------------------------------------------------------------------
                    case SimpleUser.UserType.FreeMember: // FreeMember
                        // setting Cookie
                        objHttpCookie = new HttpCookie("MatCookie5639sb");
                        objHttpCookie.Values["ApplicationID"] = Crypto.EnCrypto(objUser.ApplicationID);
                        objHttpCookie.Values["UserName"] = Crypto.EnCrypto(objUser.UserName);
                        objHttpCookie.Values["MatrimonialID"] = Crypto.EnCrypto(objUser.MatrimonialID);
                        objHttpCookie.Values["UserType"] = Crypto.EnCrypto(objUser.Membership.ToString());

                        // makking cookie Persistant
                        if (CB.Checked)
                        {
                            objHttpCookie.Expires = DateTime.MaxValue;
                        }
                        Response.Cookies.Add(objHttpCookie);

                        //Setting Form Authentication
                        FormsAuthentication.RedirectFromLoginPage("Members", CB.Checked);
                        break;
                    //-------------------------------------------------------------------------------
                    case SimpleUser.UserType.PaidMember:// Paid User
                        // setting Cookie
                        objHttpCookie = new HttpCookie("MatCookie5639sb");
                        objHttpCookie.Values["ApplicationID"] = Crypto.EnCrypto(objUser.ApplicationID);
                        objHttpCookie.Values["UserName"] = Crypto.EnCrypto(objUser.UserName);
                        objHttpCookie.Values["MatrimonialID"] = Crypto.EnCrypto(objUser.MatrimonialID);
                        objHttpCookie.Values["UserType"] = Crypto.EnCrypto(objUser.Membership.ToString());

                        // makking cookie Persistant
                        if (CB.Checked)
                        {
                            objHttpCookie.Expires = DateTime.MaxValue;
                        }
                        Response.Cookies.Add(objHttpCookie);

                        //Setting Form Authentication
                        FormsAuthentication.RedirectFromLoginPage("Members", CB.Checked);
                        break;
                    //-------------------------------------------------------------------------------
                    default:
                        L_WPassword.Visible = true;
                        break;
                    //-------------------------------------------------------------------------------
                }
            }
            else
            {
                // InValid user Name 
                //-------------------------------------------------------------------------------
                L_WPassword.Visible = true;
                //-------------------------------------------------------------------------------
            }
        }
    }
}
