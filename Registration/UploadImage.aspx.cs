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
            L_PhotoMailID.Text = WebConfig.GetValues(WebConfig.ConfigurationItem.emailPhoto);
        }
        else
        {
            //uploading  image 

            FileInfo imageInfo = new FileInfo(File_Image.Value.Trim());

            if (!imageInfo.Exists)
                this.RegisterClientScriptBlock("alertMsg", "<script>alert('please select one image file.');</script>");
            else
            {
                bool redirectFlag = false;
                switch (imageInfo.Extension.ToUpper())
                {
                    case ".JPG":
                        redirectFlag = this.UpLoadImageFile(imageInfo); 
                        break;
                    case ".GIF": 
                        redirectFlag = this.UpLoadImageFile(imageInfo);
                        break;
                    case ".BMP":
                        redirectFlag = this.UpLoadImageFile(imageInfo);
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
                        Response.Redirect("../Extras/ErrorReport.aspx");
                        break;
                }

            }

        
        }
    }

    private bool UpLoadImageFile(FileInfo info)
    {
     
        /// striming image
        try
        {
            byte[] byteContent = new byte[info.Length];
            FileStream objFileStream = info.OpenRead();
            objFileStream.Read(byteContent, 0, byteContent.Length);
            objFileStream.Close();

            //Insert Image into session
            Session.Add("ImageToCrop", byteContent);
            //retruning Values
            return true;
        }
        catch (Exception)
        {
            return false;
        }

    }

}