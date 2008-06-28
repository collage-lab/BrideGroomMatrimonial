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

public partial class Member_DeletefromAlbum : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.Header.Title = "Delete Image From Album";
            
            L_PhotoMailID.Text = WebConfig.GetValues("emailPhoto");
            if (Request.QueryString["image"]!= "")
            {
                switch(Request.QueryString["image"])
                {
                    case "1":
                        L_PhotoID.Text = "Main Photo";
                        break;
                    case "2":
                        L_PhotoID.Text = "Album - 1";
                        break;

                    case "3":
                        L_PhotoID.Text = "Album - 2";
                        break;
                    case "4":
                        L_PhotoID.Text = "Album - 3";
                        break;
                    case "5":
                        L_PhotoID.Text = "Horescope";
                        break;
                    default:
                        Server.Transfer("../Extras/errorreport.aspx");
                        break;
                }
            }
            else
            { Server.Transfer("../Extras/errorreport.aspx"); }
        }
        else
        {
            if (CB_Delete.Checked)
            {
                //delete from data base
                bool boolFlag = false;

                HttpCookieCollection objHttpCookieCollection = Request.Cookies;
                HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");

                string strApplicationID = Crypto.DeCrypto(objHttpCookie.Values["ApplicationID"]);

                switch (L_PhotoID.Text)
                {
                    case "Main Photo":
                        boolFlag = MatrimonialAlbumManager.DeleteImage(strApplicationID, MatrimonialAlbumManager.ImageType.Photo);
                        break;
                    case "Album - 1":
                        boolFlag = MatrimonialAlbumManager.DeleteImage(strApplicationID, MatrimonialAlbumManager.ImageType.Album1);
                        break;

                    case "Album - 2":
                        boolFlag = MatrimonialAlbumManager.DeleteImage(strApplicationID, MatrimonialAlbumManager.ImageType.Album2);
                        break;
                    case "Album - 3":
                        boolFlag = MatrimonialAlbumManager.DeleteImage(strApplicationID, MatrimonialAlbumManager.ImageType.Album3);
                        break;
                    case "Horescope":
                        boolFlag = MatrimonialAlbumManager.DeleteImage(strApplicationID, MatrimonialAlbumManager.ImageType.Horoscope);
                        break;
                    default:
                        Server.Transfer("../Extras/errorreport.aspx");
                        break;
                }
                if (boolFlag)
                { Server.Transfer("../extras/Sucess.aspx"); }
                else
                { }
   
            }
            else
            {
                L_Warning.Visible = true;
            }
        
        }
    }
}
