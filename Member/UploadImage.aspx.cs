using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.IO;
using System.Data.SqlClient;

public partial class UploadImage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //uploading  image Type
            switch (Request.QueryString["image"])
            {
                case "1":
                    Session.Add("ImageID", 1);
                    break;
                case "2":
                    Session.Add("ImageID", 2);
                    break;
                case "3":
                    Session.Add("ImageID", 3);
                    break;
                case "4":
                    Session.Add("ImageID", 4);
                    break;
                default:
                    Server.Transfer("../Extras/errorreport.aspx");
                    break;

            }
            //Addin Matrimonial ID To section
            Session.Add("MatID", Request.QueryString["matid"].ToString());
        }
        else
        {

            if (!File_Upload.HasFile)
            {

                this.RegisterClientScriptBlock("alertMsg", "<script>alert('please select one image file,If You are using a browser other than Internet Explorer please use IE.');</script>");
            }
            else
            {
                bool redirectFlag = false;
                switch (File_Upload.PostedFile.ContentType)
                {
                    case "image/gif":
                        redirectFlag = this.UpLoadImageFile();
                        break;
                    case "image/x-png":
                        redirectFlag = this.UpLoadImageFile();
                        break;
                    case "image/pjpeg":
                        redirectFlag = this.UpLoadImageFile();
                        break;
                    case "image/bmp":
                        redirectFlag = this.UpLoadImageFile();
                        break;
                    default:
                        this.RegisterClientScriptBlock("alertMsg", "<script>alert('file type error.');</script>");
                        break;
                }

                //redirect for croping

                switch (redirectFlag)
                {
                    case true:
                        Response.Redirect("CropImage.aspx", true);
                        break;
                    default:
                        Response.Redirect("~/Extras/ErrorReport.aspx");
                        break;
                }

            }


        }
    }

    private bool UpLoadImageFile()
    {

        /// striming image
        try
        {
            byte[] byteContent = File_Upload.FileBytes;
            //Insert Image into session

            Session.Add("ImageToCrop", EditImage.GetThumbNail(byteContent, 600, 600, true));
            byteContent = null;
            //retruning Values
            return true;
        }
        catch (Exception)
        {
            return false;
        }

    }

}