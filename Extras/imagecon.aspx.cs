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

public partial class Member_imagecon : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if ((Request.QueryString["matid"] == null) || (Request.QueryString["id"] == null))
        {
            Server.Transfer("../extras/ErrorReport.aspx");
        }
        else
        {

            string strApplicationID;


            //get image
            byte[] byteImageArray = null;

            switch (Request.QueryString["id"])
            {
                case "1":// member photo
                    strApplicationID = MatrimonialMemberShip.GetApplicationID(Request.QueryString["matid"]);
                    if (strApplicationID != null)
                    {
                        byteImageArray = MatrimonialAlbumManager.GetImage(strApplicationID, MatrimonialAlbumManager.ImageType.Photo);
                    }
                    break;
                case "2"://Album1
                    strApplicationID = MatrimonialMemberShip.GetApplicationID(Request.QueryString["matid"]);
                    if (strApplicationID != null)
                    {
                        byteImageArray = MatrimonialAlbumManager.GetImage(strApplicationID, MatrimonialAlbumManager.ImageType.Album1);

                    } break;
                case "3"://Album2
                    strApplicationID = MatrimonialMemberShip.GetApplicationID(Request.QueryString["matid"]);
                    if (strApplicationID != null)
                    {
                        byteImageArray = MatrimonialAlbumManager.GetImage(strApplicationID, MatrimonialAlbumManager.ImageType.Album2);
                    }
                    break;
                case "4"://Album3
                    strApplicationID = MatrimonialMemberShip.GetApplicationID(Request.QueryString["matid"]);
                    if (strApplicationID != null)
                    {
                        byteImageArray = MatrimonialAlbumManager.GetImage(strApplicationID, MatrimonialAlbumManager.ImageType.Album3);
                    } break;
                case "5"://Horoscope
                    strApplicationID = MatrimonialMemberShip.GetApplicationID(Request.QueryString["matid"]);
                    if (strApplicationID != null)
                    {

                        byteImageArray = MatrimonialAlbumManager.GetImage(strApplicationID, MatrimonialAlbumManager.ImageType.Horoscope);
                    }
                    break;
                case "6"://SucessStory
                    byteImageArray = MatrimonialAlbumManager.GetImage(Request.QueryString["matid"], MatrimonialAlbumManager.ImageType.SucessStory);
                    break;
                default:
                    byteImageArray = null;
                    return;
            }

            // if image present

            if (byteImageArray != null)
            {

                //resize image if needed

                switch(Request.QueryString["type"])
                {
                    case "124":
                    byteImageArray = EditImage.GetThumbNail(byteImageArray, 124, 124, false);
                    break;
                case "98":
                    byteImageArray = EditImage.GetThumbNail(byteImageArray, 98, 98, false);
                    break;
                case "75":
                    byteImageArray = EditImage.GetThumbNail(byteImageArray, 75, 75, false);
                    break;
                }
                //displaying image
                Response.ContentType = "text/HTML";
                Response.BinaryWrite(byteImageArray);
            }
            else
            {
                DisplayError();
            }


        }
    }

    private void DisplayError()
    {
        System.Drawing.Image ImgError = System.Drawing.Image.FromFile(Server.MapPath("../Resources/nophoto.gif"));
        MemoryStream NewImageStream = new MemoryStream();
        ImgError.Save(NewImageStream, System.Drawing.Imaging.ImageFormat.Jpeg);
        ImgError.Dispose();

        //returning the Croped image as byte stream 
        Response.BinaryWrite(NewImageStream.GetBuffer());   
    }
}
