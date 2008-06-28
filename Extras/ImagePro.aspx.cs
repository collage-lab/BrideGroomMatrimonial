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

using System.IO;

public partial class Member_ImagePro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Request.QueryString["matid"] == null) || (Request.QueryString["id"] == null))
        {

        }
        else
        {
            HttpCookieCollection objHttpCookieCollection = Request.Cookies;
            HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");

            string strMatID = Crypto.DeCrypto(objHttpCookie.Values["MatrimonialID"]);



            //get image
            byte[] byteImageArray = null;

            switch (Request.QueryString["id"])
            {
                case "1":// member photo

                    if (strMatID != null)
                    {
                        byteImageArray = MatrimonialAlbumManager.GetProtectedImage(strMatID,Request.QueryString["matid"], MatrimonialAlbumManager.ImageType.Photo);
                    }
                    break;
                case "2"://Album1

                    if (strMatID != null)
                    {
                        byteImageArray = MatrimonialAlbumManager.GetProtectedImage(strMatID, Request.QueryString["matid"], MatrimonialAlbumManager.ImageType.Album1);

                    } break;
                case "3"://Album2

                    if (strMatID != null)
                    {
                        byteImageArray = MatrimonialAlbumManager.GetProtectedImage(strMatID, Request.QueryString["matid"], MatrimonialAlbumManager.ImageType.Album2);
                    }
                    break;
                case "4"://Album3

                    if (strMatID != null)
                    {
                        byteImageArray = MatrimonialAlbumManager.GetProtectedImage(strMatID, Request.QueryString["matid"], MatrimonialAlbumManager.ImageType.Album3);
                    } break;
                case "5"://Horoscope

                    if (strMatID != null)
                    {

                        byteImageArray = MatrimonialAlbumManager.GetProtectedImage(strMatID, Request.QueryString["matid"], MatrimonialAlbumManager.ImageType.Horoscope);
                    }
                    break;
                default:
                    byteImageArray = null;
                    return;
            }

            // if image present

            if (byteImageArray != null)
            {

                //resize image if needed

                if (Request.QueryString["type"] == "124")
                {
                    byteImageArray = EditImage.GetThumbNail(byteImageArray, 124, 124, false);
                }
                //displaying image
                Response.ContentType = "text/HTML";
                Response.BinaryWrite(byteImageArray);
            }
            else
            {
                DisplayError();
                //Write ErrorLog
                ErrorLog.WriteLog("ImagePro byteImageArray=Null");
            }


        }
    }

    private void DisplayError()
    {
        try
        {
            System.Drawing.Image ImgError = System.Drawing.Image.FromFile(Server.MapPath("../Resources/nophoto_2.gif"));
            MemoryStream NewImageStream = new MemoryStream();
            ImgError.Save(NewImageStream, System.Drawing.Imaging.ImageFormat.Jpeg);
            ImgError.Dispose();

            //returning the Croped image as byte stream 
            Response.BinaryWrite(NewImageStream.GetBuffer());
        }
        catch (Exception)
        { }
    }
}
