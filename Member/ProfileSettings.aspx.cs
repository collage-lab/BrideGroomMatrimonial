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

public partial class Member_ProfileSettings : System.Web.UI.Page
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
            
            //Getting User information from cookie

            HttpCookieCollection objHttpCookieCollection = Request.Cookies;
            HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");

            // loading Mail settings from data base

            bool[] boolSelectionArray = MatrimonialMessanger.GetMailListSettings(Crypto.DeCrypto(objHttpCookie.Values["UserName"]));

            if (boolSelectionArray != null) // if no error
            {
                //Setting mail Settings
                CB_Special.Checked = boolSelectionArray[0];
                CB_newProduct.Checked = boolSelectionArray[1];
                CB_Partner.Checked = boolSelectionArray[2];
                CB_Daly.Checked = boolSelectionArray[3];

                // Loading paied users services

                string strApplicationID = Crypto.DeCrypto(objHttpCookie.Values["ApplicationID"]);
                
                if (MatrimonialAlbumManager.IsImageExists(strApplicationID, MatrimonialAlbumManager.ImageType.Horoscope))
                {
                    if (Crypto.DeCrypto(objHttpCookie.Values["UserType"]) == "PaidMember")
                    {
                        TB_Horo_Password.Text = "";
                        TB_Horoscope_Conform.Text = "";
                        TB_Photo_Password.Text = "";
                        TB_Photo_Conform.Text = "";
                        
                        //Load if image in album

                        if (true)//<<<<<<<<<<<<For Testing>>>>>>>>>>>>> get is there any images present in photo - album3
                        {
                            RB_P_Yes.Enabled = true;
                            TB_Photo_Conform.TextMode = TextBoxMode.Password;
                            TB_Photo_Password.TextMode = TextBoxMode.Password;
                            IMB_Photo_save.Visible = true;
                        }

                        // Load if horoscope exists

                        if (MatrimonialAlbumManager.IsImageExists(strApplicationID,MatrimonialAlbumManager.ImageType.Horoscope))
                        {
                            RB_H_yes.Enabled = true;
                            IMB_Horoscope_save.Visible = true;
                            TB_Horoscope_Conform.TextMode = TextBoxMode.Password;
                            TB_Horo_Password.TextMode = TextBoxMode.Password;
                        }
                    }

                }
            }//boolSelectionArray != null
            else // If Error
            {
                Response.Redirect("../Extras/ErrorReport.aspx");
                
            }
        }//ispostback
    }

    //Saving photo password

    protected void IMB_Photo_save_Click(object sender, ImageClickEventArgs e)
    {
        if (RB_P_Yes.Checked) //insert new password
        {
            //loading information from Cookie

            HttpCookieCollection objHttpCookieCollection = Request.Cookies;
            HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");
            if (MatrimonialAlbumManager.SetAlbumPassword(Crypto.DeCrypto(objHttpCookie.Values["ApplicationID"]), TB_Photo_Password.Text, MatrimonialAlbumManager.ImageType.Photo))
            {
                // If Sucess
                L_P_Updated.Visible = true;     
            }
            else // some error occured
            {
                L_P_Updated.Visible = true;
                L_P_Updated.Text = "Error in Updation, Sorry Plase try again";
            }
        }
        else if (RB_P_No.Checked) //remove Password
        {
            //loading information from Cookie

            HttpCookieCollection objHttpCookieCollection = Request.Cookies;
            HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");
            if(MatrimonialAlbumManager.RemoveAlbumPassword(Crypto.DeCrypto(objHttpCookie.Values["ApplicationID"]), MatrimonialAlbumManager.ImageType.Photo))
            {
                // If Sucess
                L_P_Updated.Visible = true;
            }
            else // some error occured
            {
                L_P_Updated.Visible = true;
                L_P_Updated.Text = "Error in Updation, Sorry Plase try again";
            }

        }
    }

// saving horoscope password


    protected void IMB_Horoscope_save_Click(object sender, ImageClickEventArgs e)
    {
        if (RB_H_yes.Checked)
        {
            //loading information from Cookie

            HttpCookieCollection objHttpCookieCollection = Request.Cookies;
            HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");
            if(MatrimonialAlbumManager.SetAlbumPassword(Crypto.DeCrypto(objHttpCookie.Values["ApplicationID"]), TB_Photo_Password.Text, MatrimonialAlbumManager.ImageType.Horoscope))
            {
                // If Sucess
                L_H_Updated.Visible = true;
            }
            else // some error occured
            {
                L_H_Updated.Visible = true;
                L_H_Updated.Text = "Error in Updation, Sorry Plase try again";
            }

        }
        else if(RB_H_No.Checked) //remove Password
        {
            HttpCookieCollection objHttpCookieCollection = Request.Cookies;
            HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");
            if(MatrimonialAlbumManager.RemoveAlbumPassword(Crypto.DeCrypto(objHttpCookie.Values["ApplicationID"]), MatrimonialAlbumManager.ImageType.Horoscope))
            {
                // If Sucess
                L_H_Updated.Visible = true;
            }
            else // some error occured
            {
                L_H_Updated.Visible = true;
                L_H_Updated.Text = "Error in Updation, Sorry Plase try again";
            }
        }
    }


    //saving Mail Settings

    protected void IMB_Mail_save_Click(object sender, ImageClickEventArgs e)
    {
        //loading information from Cookie
        HttpCookieCollection objHttpCookieCollection = Request.Cookies;
        HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");
        if (MatrimonialMessanger.SetMailingSettings(Crypto.DeCrypto(objHttpCookie.Values["UserName"]), CB_Special.Checked, CB_newProduct.Checked, CB_Partner.Checked, CB_Daly.Checked))
        {
            // If Sucess
            L_S_Updated.Visible = true;
        }
        else  // some error occured
        {
            L_S_Updated.Visible = true;
            L_S_Updated.Text = "Error in Updation, Sorry Plase try again";
        }
    }
}
