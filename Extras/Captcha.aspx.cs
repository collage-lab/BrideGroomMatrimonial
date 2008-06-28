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

using System.IO;

public partial class Extras_Captcha : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //System.Drawing.Image ImgError = System.Drawing.Image.FromFile(Server.MapPath("../Resources/nophoto.gif"));
        //MemoryStream NewImageStream = new MemoryStream();
        //ImgError.Save(NewImageStream, System.Drawing.Imaging.ImageFormat.Jpeg);
        //ImgError.Dispose();

        Bitmap objBMP = (Bitmap)Bitmap.FromFile(Server.MapPath("../Resources/captcha_Bac.jpg"));
            //new System.Drawing.Bitmap(120, 40);
        Graphics objGraphics = System.Drawing.Graphics.FromImage(objBMP);

        //objGraphics.Clear(Color.White);

        objGraphics.TextRenderingHint = TextRenderingHint.AntiAlias;

        //' Configure font to use for text

        Font objFont;

        switch (new Random().Next(1, 5))
        {
            case 1:
                objFont = new Font("Arial", 20, FontStyle.Bold);
                break;
            case 2:
                objFont = new Font("Arial", 20, FontStyle.Regular);
                break;
            case 3:
                objFont = new Font("Arial", 20, FontStyle.Bold);
                break;
            case 4:
                objFont = new Font("Arial", 20, FontStyle.Italic);
                break;
            case 5:
                objFont = new Font("Arial", 20, FontStyle.Strikeout);
                break;
            default:
                objFont = new Font("Arial", 20, FontStyle.Italic);
                break;

        }

        string CaptchaString = "";

        //creating random String

        CaptchaString = RandomString.Generate(8, 8);
        //This is to add the string to session cookie, to be compared later

        Session.Add("CaptchaString", CaptchaString);

        //' Write out the text

        switch (new Random().Next(1, 10))
        {
            case 1:
                objGraphics.DrawString(CaptchaString, objFont, Brushes.Purple, 8, 10);
                break;
            case 2:
                objGraphics.DrawString(CaptchaString, objFont, Brushes.SeaGreen, 8, 10);
                break;
            case 3:
                objGraphics.DrawString(CaptchaString, objFont, Brushes.Black, 8, 10);
                break;
            case 4:
                objGraphics.DrawString(CaptchaString, objFont, Brushes.Brown, 8, 10);
                break;
            case 5:
                objGraphics.DrawString(CaptchaString, objFont, Brushes.Coral, 8, 10);
                break;
            case 6:
                objGraphics.DrawString(CaptchaString, objFont, Brushes.Tomato, 8, 10);
                break;
            case 7:
                objGraphics.DrawString(CaptchaString, objFont, Brushes.DimGray, 8, 10);
                break;
            case 8:
                objGraphics.DrawString(CaptchaString, objFont, Brushes.Navy, 8, 10);
                break;
            case 9:
                objGraphics.DrawString(CaptchaString, objFont, Brushes.OrangeRed, 8, 10);
                break;
            case 10:
                objGraphics.DrawString(CaptchaString, objFont, Brushes.Violet, 8, 10);
                break;
            default:
                objGraphics.DrawString(CaptchaString, objFont, Brushes.Violet, 8, 10);
                break;
        }


        //' Set the content type and return the image

        Response.ContentType = "image/GIF";
        objBMP.Save(Response.OutputStream, ImageFormat.Gif);

        objFont.Dispose();
        objGraphics.Dispose();
        objBMP.Dispose();
    }
}
