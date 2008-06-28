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

using System.Collections.Generic;
using System.Text;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.ComponentModel;



public partial class CropImage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void IB_Crop_Click(object sender, ImageClickEventArgs e)
    {

        try
        {
              
            ///GetImage
            byte[] byteArray = (byte[])Session["ImageToCrop"];

            // Removing image from session
            Session.Remove("ImageToCrop");

            /// Get Application String

            HttpCookieCollection objHttpCookieCollection = Request.Cookies;
            HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatRegInfo");
            string strApplicationID = Crypto.DeCrypto(objHttpCookie.Values["ApplicationID"]);
        
            
            /// crop image
            byteArray = EditImage.CropImageFile(byteArray, Convert.ToInt32(HiddenW.Value), Convert.ToInt32(HiddenH.Value), Convert.ToInt32(HiddenX.Value), Convert.ToInt32(HiddenY.Value));

            /// make thumbnail
            byteArray = EditImage.GetThumbNail(byteArray, 128, 128, false);

            /// water mark image


            byteArray = EditImage.SetWatermark(byteArray, WebConfig.GetValues("FName"), 80, true,16);

            /// upload into database
            if (MatrimonialAlbumManager.InsertPhoto(strApplicationID, byteArray,MatrimonialAlbumManager.ImageType.Photo))
            {
                Response.Redirect("../Extras/Sucess.aspx");

            }
            else
            {
                Response.Redirect("image.aspx?id=Error");
            }
        }
        catch (Exception)
        {
        }

    }





  
}
