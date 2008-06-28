/// class used to resize ,crop,Wartermark image 
/// methodes
/// 
/// byte[] CropImageFile(byte[] ImageStream, int targetW, int targetH, int targetX, int targetY)
/// Image CropImageFile(Image ImageStream, int targetW, int targetH, int targetX, int targetY)     ----------- not ready
///
/// byte[]GetThumbNail(byte[] FullsizeImage, int NewWidth, int MaxHeight, bool OnlyResizeIfWider)
/// Image GetThumbNail(Image FullsizeImage, int NewWidth, int MaxHeight, bool OnlyResizeIfWider)
/// 
/// Image SetWatermark(Image OrginalImage, string WMText, int Opacity, Color WMColor, Font WMFont, int Position_X, int Position_Y, bool IsVertical)       
/// Image SetWatermark(Image OrginalImage, string WMText, int Opacity, bool IsVertical)
///

using System;
using System.Data;
using System.Configuration;
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

/// <summary>
/// Summary description for EditImage
/// </summary>
public class EditImage
{
    public enum ImageSize { Size124x124,Size600x600};
	public EditImage()
	{
		//
		// TODO: Add constructor logic here
		//
	}

        #region"CropImageFile"
        // methode used to crope image as Byte Streams
        public static byte[] CropImageFile(byte[] ImageStream, int targetW, int targetH, int targetX, int targetY)
        {
            System.Drawing.Image imgPhoto = System.Drawing.Image.FromStream(new MemoryStream(ImageStream));
            Bitmap bmPhoto = new Bitmap(targetW, targetH, PixelFormat.Format24bppRgb);
            bmPhoto.SetResolution(72, 72);
            Graphics grPhoto = Graphics.FromImage(bmPhoto);
            grPhoto.SmoothingMode = SmoothingMode.AntiAlias;
            grPhoto.InterpolationMode = InterpolationMode.HighQualityBicubic;
            grPhoto.PixelOffsetMode = PixelOffsetMode.HighQuality;
            grPhoto.DrawImage(imgPhoto, new Rectangle(0, 0, targetW, targetH), targetX, targetY, targetW, targetH, GraphicsUnit.Pixel);
            // Save out to memory and then to a file.  We dispose of all objects to make sure the files don't stay locked.
            MemoryStream NewImageStream = new MemoryStream();
            bmPhoto.Save(NewImageStream, System.Drawing.Imaging.ImageFormat.Jpeg);
            imgPhoto.Dispose();
            bmPhoto.Dispose();
            grPhoto.Dispose();
            //returning the Croped image as byte stream 
            return NewImageStream.GetBuffer();
        }
        
        
        // methode used to crope image as Image
        //public static Image CropImageFile(Image imgPhoto, int targetW, int targetH, int targetX, int targetY)
        //{
        //    Bitmap bmPhoto = new Bitmap(targetW, targetH, PixelFormat.Format24bppRgb);
        //    bmPhoto.SetResolution(72, 72);
        //    Graphics grPhoto = Graphics.FromImage(bmPhoto);
        //    grPhoto.SmoothingMode = SmoothingMode.AntiAlias;
        //    grPhoto.InterpolationMode = InterpolationMode.HighQualityBicubic;
        //    grPhoto.PixelOffsetMode = PixelOffsetMode.HighQuality;
        //    grPhoto.DrawImage(imgPhoto, new Rectangle(0, 0, targetW, targetH), targetX, targetY, targetW, targetH, GraphicsUnit.Pixel);
        //    // Save out to memory and then to a file.  We dispose of all objects to make sure the files don't stay locked.
        //    MemoryStream NewImageStream = new MemoryStream();
        //    bmPhoto.Save(NewImageStream, System.Drawing.Imaging.ImageFormat.Jpeg);
        //    //Image ReturnImage = Image.FromStream(new MemoryStream(NewImageStream));
        //  //  bmPhoto.sava(imgPhoto, System.Drawing.Imaging.ImageFormat.Jpeg);
        //    imgPhoto.Dispose();
        //    bmPhoto.Dispose();
        //    grPhoto.Dispose();
        //    //returning the Croped image as byte stream 
        //    //return ReturnImage;
        //}



        #endregion 


        #region "GetThumbNail"
        //byte stream
        public static byte[] GetThumbNail(byte[] ImageStream, int NewWidth, int MaxHeight, bool OnlyResizeIfWider)
        {
            
            System.Drawing.Image FullsizeImage = System.Drawing.Image.FromStream(new MemoryStream(ImageStream));

            // Prevent using images internal thumbnail
            FullsizeImage.RotateFlip(System.Drawing.RotateFlipType.Rotate180FlipNone);
            FullsizeImage.RotateFlip(System.Drawing.RotateFlipType.Rotate180FlipNone);

            if (OnlyResizeIfWider)
            {
                if (FullsizeImage.Width <= NewWidth)
                {
                    NewWidth = FullsizeImage.Width;
                }
            }

            int NewHeight = FullsizeImage.Height * NewWidth / FullsizeImage.Width;
            if (NewHeight > MaxHeight)
            {
                // Resize with height instead
                NewWidth = FullsizeImage.Width * MaxHeight / FullsizeImage.Height;
                NewHeight = MaxHeight;
            }

            System.Drawing.Image ThumbNail = FullsizeImage.GetThumbnailImage(NewWidth, NewHeight, null, IntPtr.Zero);
            MemoryStream NewImageStream = new MemoryStream();
            ThumbNail.Save(NewImageStream, System.Drawing.Imaging.ImageFormat.Jpeg);
            // Clear handle to original file so that we can overwrite it if necessary
            FullsizeImage.Dispose();
            ThumbNail.Dispose();
            return NewImageStream.GetBuffer();

        }
 
        //Image stream

        public static System.Drawing.Image  GetThumbNail(System.Drawing.Image  FullsizeImage, int NewWidth, int MaxHeight, bool OnlyResizeIfWider)
        {
            
            // Prevent using images internal thumbnail
            FullsizeImage.RotateFlip(System.Drawing.RotateFlipType.Rotate180FlipNone);
            FullsizeImage.RotateFlip(System.Drawing.RotateFlipType.Rotate180FlipNone);

            if (OnlyResizeIfWider)
            {
                if (FullsizeImage.Width <= NewWidth)
                {
                    NewWidth = FullsizeImage.Width;
                }
            }

            int NewHeight = FullsizeImage.Height * NewWidth / FullsizeImage.Width;
            if (NewHeight > MaxHeight)
            {
                // Resize with height instead
                NewWidth = FullsizeImage.Width * MaxHeight / FullsizeImage.Height;
                NewHeight = MaxHeight;
            }

            System.Drawing.Image ThumbNail = FullsizeImage.GetThumbnailImage(NewWidth, NewHeight, null, IntPtr.Zero);

            // Clear handle to original file so that we can overwrite it if necessary
            FullsizeImage.Dispose();
            return ThumbNail;

        }
 
        #endregion


        #region"Wartermarking"

        //default WaterMarker
        public static System.Drawing.Image  SetWatermark(System.Drawing.Image  OrginalImage, string WMText, int Opacity, bool IsVertical)
        {
            //members
            Color WMColor = Color.Lime;
            Font WMFont = new Font("Arial", 16);
            int Position_X = 10;
            int Position_Y = 10;




            // Determine the opacity of the watermark
            if (Opacity < 0 || Opacity > 255)
            {
                //Opacity=50%
                Opacity = 127;
            }
            else
            {
                double d;
                d = Opacity * 2.55;
                Opacity = (int)d;
            }


            // Get a graphics context
            Graphics g = Graphics.FromImage(OrginalImage);

            // Create a solid brush to write the watermark text on the image
            Brush myBrush = new SolidBrush(Color.FromArgb(Opacity, WMColor));

            // Calculate the size of the text
            SizeF sz = g.MeasureString(WMText, WMFont);

            // drawing position (X,Y)


            if (IsVertical)
            {
                Position_Y = (int)(OrginalImage.Height - sz.Width) / 2;
                StringFormat drawFormat = new StringFormat();
                drawFormat.FormatFlags = StringFormatFlags.DirectionVertical;
                g.DrawString(WMText, WMFont, myBrush, new Point(Position_X, Position_Y), drawFormat);
            }
            else
            {
                Position_X = (int)(OrginalImage.Width - sz.Width) / 2;
                g.DrawString(WMText, WMFont, myBrush, new Point(Position_X, Position_Y));
            }




            return OrginalImage;


        }

        public static System.Drawing.Image  SetWatermark(System.Drawing.Image  OrginalImage, string WMText, int Opacity, Color WMColor, Font WMFont, int Position_X, int Position_Y, bool IsVertical)
        {

            // Determine the opacity of the watermark
            if (Opacity < 0 || Opacity > 255)
            {
                //Opacity=50%
                Opacity = 127;
            }
            else
            {
                double d;
                d = Opacity * 2.55;
                Opacity = (int)d;
            }


            // Get a graphics context
            Graphics g = Graphics.FromImage(OrginalImage);

            // Create a solid brush to write the watermark text on the image
            Brush myBrush = new SolidBrush(Color.FromArgb(Opacity, WMColor));

            // Calculate the size of the text
            SizeF sz = g.MeasureString(WMText, WMFont);

            // drawing position (X,Y)
                       
            if (IsVertical)
            {
                StringFormat drawFormat = new StringFormat();
                drawFormat.FormatFlags = StringFormatFlags.DirectionVertical;
                g.DrawString(WMText, WMFont, myBrush, new Point(Position_X, Position_Y), drawFormat);
            }
            else
            {
                g.DrawString(WMText, WMFont, myBrush, new Point(Position_X, Position_Y));
            }
            //Return Image 
            return OrginalImage;
            
        }

        public static byte[] SetWatermark(byte[] ImageStream, string WMText, ushort Opacity, bool IsVertical,sbyte FontSize)
        {
            
            //members
            Color WMColor = Color.LightGreen;
            Font WMFont = new Font("Arial", FontSize);
            int Position_X = 10;
            int Position_Y = 10;


            // Determine the opacity of the watermark
            if (Opacity < 0 || Opacity >100)
            {
                //Opacity=50%
                Opacity = 127;
            }
            else
            {
                double d;
                d = Opacity * 2.55;
                Opacity = (ushort)d;
            }

            System.Drawing.Image OrginalImage = System.Drawing.Image.FromStream(new MemoryStream(ImageStream)); ;


            // Get a graphics context
            Graphics g = Graphics.FromImage(OrginalImage);

            // Create a solid brush to write the watermark text on the image
            Brush myBrush = new SolidBrush(Color.FromArgb(Opacity, WMColor));

            // Calculate the size of the text
            SizeF sz = g.MeasureString(WMText, WMFont);

            // drawing position (X,Y)


            if (IsVertical)
            {
                Position_Y = (int)(OrginalImage.Height - sz.Width) / 2;
                StringFormat drawFormat = new StringFormat();
                drawFormat.FormatFlags = StringFormatFlags.DirectionVertical;
                g.DrawString(WMText, WMFont, myBrush, new Point(Position_X, Position_Y), drawFormat);
            }
            else
            {
                Position_X = (int)(OrginalImage.Width - sz.Width) / 2;
                g.DrawString(WMText, WMFont, myBrush, new Point(Position_X, Position_Y));
            }


            MemoryStream NewImageStream = new MemoryStream();
            OrginalImage.Save(NewImageStream, System.Drawing.Imaging.ImageFormat.Jpeg);
            OrginalImage.Dispose();

            //returning the Croped image as byte stream 
            return NewImageStream.GetBuffer();
        }



        #endregion
    }
