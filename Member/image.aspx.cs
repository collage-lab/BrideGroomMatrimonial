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

public partial class Registration_image : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Response.BinaryWrite((byte[])Session["ImageToCrop"]);
        }
        catch(Exception)
        {
            try
            {
                System.Drawing.Image ImgError = System.Drawing.Image.FromFile(Server.MapPath("../Resources/nophotoUploded.gif"));
                MemoryStream NewImageStream = new MemoryStream();
                ImgError.Save(NewImageStream, System.Drawing.Imaging.ImageFormat.Jpeg);
                ImgError.Dispose();

                //returning the Croped image as byte stream 
                Response.BinaryWrite(NewImageStream.GetBuffer());
            }
            catch (Exception Ex)
            {
                ErrorLog.WriteErrorLog("Member  Image", Ex);
            }
        }
    }
}
