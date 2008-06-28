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

public partial class DeleteAccount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {


            // Adding meta Discription
            HtmlMeta objMeta = new HtmlMeta();
            objMeta.Name = "Description";
            objMeta.Content = WebConfig.GetValues("MetaDiscription");
            this.Header.Controls.Add(objMeta);

            // Adding meta KeyWords
            objMeta = new HtmlMeta();
            objMeta.Name = "keywords";
            objMeta.Content = WebConfig.GetValues("MetaKeword");
            this.Header.Controls.Add(objMeta);

           L_SiteName.Text = L_SiteName2.Text = L_SiteName3.Text = WebConfig.GetValues("FName");
           try
           {
               HttpCookieCollection objHttpCookieCollection = Request.Cookies;
               HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");
               L_MatID.Text = Crypto.DeCrypto(objHttpCookie.Values[2]);
           }
           catch (Exception)
           { 
           
           }


        }
        else
        {

            Page.Validate();
            if (IsValid)
            {
                if (CB_Del_acc.Checked)
                {
                    // retriving Application String
                    HttpCookieCollection objHttpCookieCollection = Request.Cookies;
                    HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");
                    string strApplicationID = Crypto.DeCrypto(objHttpCookie.Values["ApplicationID"]);

                    //Checking Password
                    if (MatrimonialMemberShip.IsPasswordTrue(strApplicationID,
                        FormsAuthentication.HashPasswordForStoringInConfigFile(TB_Password_OLd.Text,"MD5")))// checkPassword(.text)
                    {
                        //Delete Accounts
                        if (MatrimonialMemberShip.DeleteAccount(strApplicationID, L_MatID.Text))
                        {
                            //Clearing User Info From Clie
                            //Redirect to Homepage
                            Response.Redirect("logout.aspx?id=del");
                        }
                        else
                        {
                            //Show Server not responding
                            Server.Transfer("../Extras/ErrorReprot.aspx");
                        }
                    }
                    else
                    {
                        //Display Wrong Password
                        L_WrongPassword.Visible = true;
                        L_Check.Visible = false;
                    }
                }
                else
                {
                    // User is supposed to check the box
                    L_Check.Visible = true;
                    L_WrongPassword.Visible = false;
                }//else

            }// if is valid

            CB_Del_acc.Checked = false;

        }//else

   }// methode

}//class
