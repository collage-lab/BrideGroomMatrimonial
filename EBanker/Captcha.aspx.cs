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
using System.Drawing;
using System.Drawing.Text;
using System.Drawing.Imaging;

public partial class Extras_Captcha : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Bitmap objBMP = new System.Drawing.Bitmap(120, 40);
        Graphics objGraphics = System.Drawing.Graphics.FromImage(objBMP);
        objGraphics.Clear(Color.White);

        objGraphics.TextRenderingHint = TextRenderingHint.AntiAlias;

        //' Configure font to use for text

        Font objFont = new Font("Arial", 11, FontStyle.Bold);
        string CaptchaString = "";

        //creating random String

        CaptchaString = RandomString.Generate(8, 8);
        //This is to add the string to session cookie, to be compared later

        Session.Add("CaptchaString", CaptchaString);

        //' Write out the text

        objGraphics.DrawString(CaptchaString, objFont, Brushes.Purple, 20, 10);

        //' Set the content type and return the image

        Response.ContentType = "image/GIF";
        objBMP.Save(Response.OutputStream, ImageFormat.Gif);

        objFont.Dispose();
        objGraphics.Dispose();
        objBMP.Dispose();
    }
}
