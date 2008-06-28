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

using System.Data.SqlClient;
using System.IO;

public partial class Member_Horoscop : System.Web.UI.Page
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


            HttpCookieCollection objHttpCookieCollection = Request.Cookies;
            HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");

            if (Crypto.DeCrypto(objHttpCookie.Values["UserType"]) == "PaidMember")
            {
                RB_H_yes.Enabled = true;
                TB_Password.TextMode = TextBoxMode.Password;
                TB_Password.Text = "";
                TB_Password_C.TextMode = TextBoxMode.Password;
                TB_Password_C.Text = "";
            }

            if (MatrimonialAlbumManager.IsImageExists(Crypto.DeCrypto(objHttpCookie.Values["ApplicationID"]), MatrimonialAlbumManager.ImageType.Horoscope))
            {
                HL_Delete.Visible = true;

            }


        }
        else//postback
        {
            ///
            ///upload image 
            /// 

            FileInfo imageInfo = new FileInfo(File_Image.Value.Trim());

            if (!imageInfo.Exists)
                RegisterClientScriptBlock("alertMsg", "<script>alert('please select one image file.');</script>");
            else
            {
                switch (imageInfo.Extension.ToUpper())
                {
                    case ".JPG":
                       if (UpLoadImageFile(imageInfo)) 
                        {
                            L_State.Text = "Horoscope sucessfully inserted";
                            HL_Delete.Visible = true;
                        }
                        else 
                        {
                            L_State.Text = "Error in Saving your file";
                            HL_Delete.Visible = true;
                        }
                        break;
                    case ".GIF":
                        if (UpLoadImageFile(imageInfo))
                        {
                            L_State.Text = "Horoscope sucessfully inserted";
                            HL_Delete.Visible = true;
                        }
                        else
                        {
                            L_State.Text = "Error in Saving your file";
                        }
                        break;
                    case ".BMP":
                        if (UpLoadImageFile(imageInfo))
                        {
                            L_State.Text = "Horoscope sucessfully inserted";
                            HL_Delete.Visible = true;
                        }
                        else
                        {
                            L_State.Text = "Error in Saving your file";
                        }
                        break;
                    default:
                       RegisterClientScriptBlock("alertMsg", "<script>alert('Use either images suchus bmp,jpg,gif');</script>");
                        break;
                }
            }
        }
    }


    private bool UpLoadImageFile(FileInfo info)
    {
        /*
        UserAlbum_UpdateHoroscope
        UserAlbum_InsertImage
            
            @ApplicationID varchar(15)
            @Horoscope image
            @HoroPassword Varchar(25)
         */


        try
        {
            /// 
            /// striming image
            /// 
            byte[] byteContent = new byte[info.Length];
            FileStream objFileStream = info.OpenRead();
            objFileStream.Read(byteContent, 0, byteContent.Length);
            objFileStream.Close();

            /// 
            /// Processing image 
            /// 

            byteContent = EditImage.GetThumbNail(byteContent,600, 600, true);



            byteContent = EditImage.SetWatermark(byteContent, WebConfig.GetValues("FName"), 50, true, 36);

            /// 
            /// DataBase operation starts
            /// 

            HttpCookieCollection objHttpCookieCollection = Request.Cookies;
            HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");

            string strApplicationID = Crypto.DeCrypto(objHttpCookie.Values["ApplicationID"]);


            
            using (SqlConnection objConnection = DBConnection.GetSqlConnection())
            {
                SqlCommand objCommand = new SqlCommand("UserAlbum_InsertImage", objConnection);

                if (MatrimonialAlbumManager.IsAlbumExists(strApplicationID))
                {
                    objCommand = new SqlCommand("UserAlbum_UpdateHoroscope", objConnection);
                }

                objCommand.CommandType = CommandType.StoredProcedure;
                /// Inserting parameters

                objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
                objCommand.Parameters["@ApplicationID"].Value = strApplicationID;

                objCommand.Parameters.Add(new SqlParameter("@Horoscope", SqlDbType.Image));
                objCommand.Parameters["@Horoscope"].Value = byteContent;

                if (!RB_H_No.Checked)
                {
                    objCommand.Parameters.Add(new SqlParameter("@HoroPassword", SqlDbType.VarChar));
                    objCommand.Parameters["@HoroPassword"].Value = TB_Password.Text;
                }
                /// Execute Sql Query

                objConnection.Open();
                objCommand.ExecuteNonQuery();
                objConnection.Close();
            }
            return true;
        }
        catch (Exception ex)
        {
            // ErrorLog
            return false;
        }
    }

}