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

public partial class Member_MyAlbum : System.Web.UI.Page
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

            // Load Control Details onload = "window.resizeTo(615,388);window.history.forward(1);"


            HttpCookieCollection objHttpCookieCollection = Request.Cookies;
            HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");

            string strApplicationID = Crypto.DeCrypto(objHttpCookie.Values["ApplicationID"]);
            if (MatrimonialAlbumManager.IsAlbumExists(strApplicationID))
            {
                string strMatID = Crypto.DeCrypto(objHttpCookie.Values["MatrimonialID"]);

                //Setting Photo

                HL_UP_1.Attributes.Add("onclick", "window.open('UploadImage.aspx?matid=" + strMatID + "&image=1','Upload','scrollbars=no,width=600,height=285')");
                HL_Photo_1.NavigateUrl = "#";

                if (MatrimonialAlbumManager.IsImageExists(strApplicationID, MatrimonialAlbumManager.ImageType.Photo))
                {
                    HL_Photo_1.ImageUrl = "~/Extras/imagecon.aspx?matid=" + strMatID + "&id=1";
                    HL_UP_1.ImageUrl = "~/Resources/ChangePhoto.gif";
                    HL_Del_1.Visible = true;

                }


                // setting Album images

                string strUserType = Crypto.DeCrypto(objHttpCookie.Values["UserType"]);
                //<<<ForTesting>>>>
                if (strUserType == "PaidMember")
                {
                    HL_UP_2.Attributes.Add("onclick", "window.open('UploadImage.aspx?matid=" + strMatID + "&image=2','Upload','scrollbars=no,width=600,height=285')");
                    HL_UP_3.Attributes.Add("onclick", "window.open('UploadImage.aspx?matid=" + strMatID + "&image=3','Upload','scrollbars=no,width=600,height=285')");
                    HL_UP_4.Attributes.Add("onclick", "window.open('UploadImage.aspx?matid=" + strMatID + "&image=4','Upload','scrollbars=no,width=600,height=285')");

                    HL_UP_2.Visible = true;
                    HL_UP_3.Visible = true;
                    HL_UP_4.Visible = true;

                    //setting image 

                    if (MatrimonialAlbumManager.IsImageExists(strApplicationID, MatrimonialAlbumManager.ImageType.Album1))
                    {
                        HL_Album_1.ImageUrl = "~/Extras/imagecon.aspx?matid=" + strMatID + "&id=2&type=124";
                        HL_Album_1.Attributes.Add("onclick", "window.open('../Extras/ViewLargeImage.aspx?matid=" + strMatID + "&image=2','LargerImage','scrollbars=no,width=600,height=285')");
                        HL_Album_1.ToolTip = "Click Here to View Larger Image";
                        HL_Del_2.Visible = true;
                        HL_Album_1.NavigateUrl = "#";
                        HL_UP_2.ImageUrl = "~/Resources/ChangePhoto.gif";
                    }
                    else
                    {
                        HL_Album_1.ImageUrl = "~/Resources/nophoto.gif";
                    }

                    if (MatrimonialAlbumManager.IsImageExists(strApplicationID, MatrimonialAlbumManager.ImageType.Album2))
                    {
                        HL_Album_2.ImageUrl = "~/Extras/imagecon.aspx?matid=" + strMatID + "&id=3&type=124";
                        HL_Album_2.Attributes.Add("onclick", "window.open('../Extras/ViewLargeImage.aspx?matid=" + strMatID + "&image=3','LargerImage','scrollbars=no,width=600,height=285')");
                        HL_Album_2.ToolTip = "Click Here to View Larger Image";
                        HL_Del_3.Visible = true;
                        HL_Album_2.NavigateUrl = "#";
                        HL_UP_3.ImageUrl = "~/Resources/ChangePhoto.gif";
                    }
                    else
                    {
                        HL_Album_2.ImageUrl = "~/Resources/nophoto.gif";
                    }
                    if (MatrimonialAlbumManager.IsImageExists(strApplicationID, MatrimonialAlbumManager.ImageType.Album3))
                    {
                        HL_Album_3.ImageUrl = "~/Extras/imagecon.aspx?matid=" + strMatID + "&id=4&type=124";
                        HL_Album_3.Attributes.Add("onclick", "window.open('../Extras/ViewLargeImage.aspx?matid=" + strMatID + "&image=4','LargerImage','scrollbars=no,width=600,height=285')");
                        HL_Album_3.ToolTip = "Click Here to View Larger Image";
                        HL_Del_4.Visible = true;
                        HL_Album_3.NavigateUrl = "#";
                        HL_UP_4.ImageUrl = "~/Resources/ChangePhoto.gif";
                    }
                    else
                    {
                        HL_Album_3.ImageUrl = "~/Resources/nophoto.gif";
                    }


                }

            }

        }   //if
    }
}
