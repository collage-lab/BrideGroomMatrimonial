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
//---------------------------------
using System.Collections.Generic;
using System.Text;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.ComponentModel;
//---------------------------------


public partial class CropImage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // testing redirected form uplaod and page is valid
        try
        {
            if (Session["ImageID"].ToString() == "Test")
            {
                
            }
        }
        catch
        {
            Server.Transfer("../Extras/ErrorReport.aspx");
        } 
    }
    protected void IB_Crop_Click(object sender, ImageClickEventArgs e)
    {


        try
        {

            MatrimonialAlbumManager.ImageType enuImageType = MatrimonialAlbumManager.ImageType.Photo;

            switch (Convert.ToSByte(Session["ImageID"]))
            {
                case 1:
                    enuImageType = MatrimonialAlbumManager.ImageType.Photo;
                    break;
                case 2:
                    enuImageType = MatrimonialAlbumManager.ImageType.Album1;
                    break;
                case 3:
                    enuImageType = MatrimonialAlbumManager.ImageType.Album2;
                    break;
                case 4:
                    enuImageType = MatrimonialAlbumManager.ImageType.Album3;
                    break;
                default:
                    Response.Redirect("image.aspx?id=Error");
                    break;
            }
              
            ///GetImage
            byte[] byteArray = (byte[])Session["ImageToCrop"];

            // Removing image from session
            Session.Remove("ImageToCrop");

            /// Get Application String

            HttpCookieCollection objHttpCookieCollection = Request.Cookies;
            HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");
            string strApplicationID = Crypto.DeCrypto(objHttpCookie.Values["ApplicationID"]);
        
            
            /// crop image
            byteArray = EditImage.CropImageFile(byteArray, Convert.ToInt32(HiddenW.Value), Convert.ToInt32(HiddenH.Value), Convert.ToInt32(HiddenX.Value), Convert.ToInt32(HiddenY.Value));

            /// make thumbnail
            if (enuImageType == MatrimonialAlbumManager.ImageType.Photo)
            {
                byteArray = EditImage.GetThumbNail(byteArray, 128, 128, false);
            }
            else
            {
                byteArray = EditImage.GetThumbNail(byteArray, 600, 600, true);
            }

            /// water mark image


            byteArray = EditImage.SetWatermark(byteArray, WebConfig.GetValues("FName"), 80, true,16);

            //Which image is to be uploaded ?




            /// Add new image(Insert) or change newimage (Update) ?


            switch (MatrimonialAlbumManager.IsAlbumExists(strApplicationID))
            { 
                case false:
                    // Insert Image into database

                    if (MatrimonialAlbumManager.InsertPhoto(strApplicationID, byteArray,enuImageType))
                    {
                        Response.Redirect("../Extras/Sucess.aspx");

                    }
                    else
                    {
                        Response.Redirect("image.aspx?id=Error");
                    }
                    break;

                case true: // Update Image
                    if (MatrimonialAlbumManager.InsertPhoto(strApplicationID, byteArray, enuImageType))
                    {
                        Response.Redirect("../Extras/Sucess.aspx");

                    }
                    else
                    {
                        Response.Redirect("image.aspx?id=Error");
                    }
                    break;
                default:
                    Response.Redirect("imaxge.aspx?id=Error");
                    break;              
            }


        }
        catch (Exception)
        {
        }

    }





  
}
