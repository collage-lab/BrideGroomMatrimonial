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

public partial class Member_Profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            // Check Application ID

            string strMatID = null;
            string strApplicationID = null;
            try
            {
                HttpCookieCollection objHttpCookieCollection = Request.Cookies;
                HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");

                strMatID = Crypto.DeCrypto(objHttpCookie.Values[2]);

                L_MID.Text = strMatID.ToUpper();
                strApplicationID = Crypto.DeCrypto(objHttpCookie.Values["ApplicationID"]);


                if (Crypto.DeCrypto(objHttpCookie.Values["UserType"]) == "PaidMember")
                {
                    L_Membership.Text = "Paid Member";
                    HL_Message_send.Enabled = true;
                    HL_Pass_Received.Enabled = true;
                }
                else
                {
                    L_Membership.Text = "Free Member";
                }
            }
            catch (NullReferenceException)
            {
                Response.Redirect("../Extras/ErrorReport.aspx?id=Cookie");

            }
            catch (Exception objEX)
            {
                ErrorLog.WriteErrorLog("Profile.aspx", objEX);
            }

            // Creating Profile Object

            UserProfile objProfile = new UserProfile(strMatID);


            // Loading userInformations

            L_Name.Text = objProfile.Name;
            this.Title = WebConfig.GetValues("fname") + " Profile No : " + strMatID + " - " + objProfile.Name;

            // Loading dates

            L_LogIn_Created.Text = objProfile.IDCreatedOn;

            L_LogIn_last.Text = objProfile.LastLogInDate;

            L_Clicks.Text = objProfile.Clicks.ToString();


            /// check image is present in data base

            if (objProfile.IsPhoto)
            {
                /// load image form data base
                Img_MyPhoto.ImageUrl = "../Extras/imagecon.aspx?matid=" + strMatID + "&id=1";
                /// set check list image -> yes

                IMG_Photo.ImageUrl = "../Resources/yes.gif";
                //is it password protected
                if (objProfile.IsPhotoProtected)
                {
                    IMG_PhotoPRotect.ImageUrl = "../Resources/yes.gif";
                }
                //Checks does horoscope uploaded
                if (objProfile.IsHoroscope)
                {
                    IMG_Horoscope.ImageUrl = "../Resources/yes.gif";

                    //is it password protected
                    if (objProfile.IsHoroScopeProtected)
                    {
                        IMG_Horo_Protexted.ImageUrl = "../Resources/yes.gif";
                    }
                }
            }
            // Resent Visitors
            string[] Visitors = MatrimonialProfileManager.GetVisitersList(strMatID);
            if (Visitors != null)
            {
                //seting visibility
                if (Visitors[0] != null)
                {
                    HyperLink1.Visible = true; ;
                    HyperLink1.NavigateUrl = "../MyProfile/" + Visitors[0] + ".aspx";
                    HyperLink1.Text = Visitors[0].ToUpper();
                }
                //seting visibility
                if (Visitors[1] != null)
                {
                    HyperLink2.Visible = true; ;
                    HyperLink2.NavigateUrl = "../MyProfile/" + Visitors[1] + ".aspx";
                    HyperLink2.Text = Visitors[2].ToUpper();
                }
                //seting visibility
                if (Visitors[2] != null)
                {
                    HyperLink3.Visible = true; ;
                    HyperLink3.NavigateUrl = "../MyProfile/" + Visitors[2] + ".aspx";
                    HyperLink3.Text = Visitors[2].ToUpper();
                }
                //seting visibility
                if (Visitors[3] != null)
                {
                    HyperLink4.Visible = true; ;
                    HyperLink4.NavigateUrl = "../MyProfile/" + Visitors[3] + ".aspx";
                    HyperLink4.Text = Visitors[3].ToUpper();
                }
                //seting visibility
                if (Visitors[4] != null)
                {
                    HyperLink5.Visible = true; ;
                    HyperLink5.NavigateUrl = "../MyProfile/" + Visitors[4] + ".aspx";
                    HyperLink5.Text = Visitors[4].ToUpper();
                }
                //seting visibility
                if (Visitors[5] != null)
                {
                    HyperLink6.Visible = true; ;
                    HyperLink6.NavigateUrl = "../MyProfile/" + Visitors[5] + ".aspx";
                    HyperLink6.Text = Visitors[5].ToUpper();
                }
                //seting visibility
                if (Visitors[6] != null)
                {
                    HyperLink7.Visible = true; ;
                    HyperLink7.NavigateUrl = "../MyProfile/" + Visitors[6] + ".aspx";
                    HyperLink7.Text = Visitors[6].ToUpper();
                }
            }
            /// Load Interest items 
            // Express Interest Received  
            L_Int_R_A.Text = objProfile.ReceivedInterestAccepted.ToString();
            L_Int_R_D.Text = objProfile.ReceivedInterestDeclined.ToString();
            L_Int_R_P.Text = objProfile.ReceivedInterestPending.ToString();

            // Express Interest Sent 

            L_Int_S_A.Text = objProfile.SendInterestAccepted.ToString();
            L_Int_S_D.Text = objProfile.SendInterestDeclined.ToString();
            L_Int_S_P.Text = objProfile.SendInterestPending.ToString();

            //Personalized Message

            L_Mes_Inbox.Text = objProfile.ReceivedMessage.ToString();
            L_Mes_OutBox.Text = objProfile.SendMessage.ToString();

            //Photo/Horoscope Password 

            L_PW_Req.Text = objProfile.ReceivedPassword.ToString();
            L_PW_Rec.Text = objProfile.RequestPassword.ToString();

            //Book marks

            L_BM_Links.Text = objProfile.NoOfLinks.ToString();


            /// Writing Meta Tags
            /// 
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
        }   //if
    }
}
