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
using System.Data.SqlClient;

public partial class Admin_Protected_UploadMemberInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] == "1")
            {
                CB_DEL.Visible = true;
                D_Delete.Visible = true;
                File_Image.Visible = false;
                B_Upload.Visible = false;
            }
            else
            {
                File_Image.Visible = true;
                B_Upload.Visible = true;
                CB_DEL.Visible = false;
                D_Delete.Visible = false;
            }
        }
    }
    protected void B_Search_Click(object sender, EventArgs e)
    {
        //Searching

        // Setting Alurt invisile MatID
        PN_ID_NotFound.Visible = false;
        L_Wron_Pass.Visible = false;

        // Is the Matrimonial ID valid
        string strUserName = MatrimonialMemberShip.GetUserName(TB_MatrimonialID.Text, true);
        if (strUserName != null)
        {
            //Is password Valid
            SimpleUser objUser = MatrimonialMemberShip.Authentication(strUserName, FormsAuthentication.HashPasswordForStoringInConfigFile(TB_Password.Text, "MD5"));
            // YES
            if (objUser.AuthenticationStatus == true)
            {
                // make alnum visible
                PN_ID_Album.Visible = true;
                //Make ControlsInvisible
                L_Password.Visible = false;
                TB_Password.Visible = false;
                B_Search.Visible = false;
                PN_ID_NotFound.Visible = false;
                RequiredFieldValidator2.Visible = false;
                TB_MatrimonialID.ReadOnly = true;


                //Does image is in Album
                if (MatrimonialAlbumManager.IsAlbumExists(objUser.ApplicationID))
                {

                    //Setting Photo

                    if (MatrimonialAlbumManager.IsImageExists(objUser.ApplicationID, MatrimonialAlbumManager.ImageType.Horoscope))
                    {
                        HL_Horo.ImageUrl = "~/Extras/imagecon.aspx?matid=" + TB_MatrimonialID.Text + "&id=5&type=124";
                       
                    }
                    else
                    {
                        HL_Horo.ImageUrl = "~/Resources/horonotFound.gif";
                    }
                            


                }


            }
            else// Password incorrect
            {
                L_Wron_Pass.Visible = true;
            }

        }
        else// Wrong User Name
        {
            PN_ID_NotFound.Visible = true;
        }
    }
    protected void B_Upload_Click(object sender, EventArgs e)
    {
        //Uploading
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
                    }
                    else
                    {
                        L_State.Text = "Error in Saving your file";
                    }
                    break;
                case ".GIF":
                    if (UpLoadImageFile(imageInfo))
                    {
                        L_State.Text = "Horoscope sucessfully inserted";
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


// Delete From DataBase
    protected void B_Delete_Click(object sender, EventArgs e)
    {
        if (CB_DEL.Checked)
        {
            if (MatrimonialAlbumManager.DeleteImage(MatrimonialMemberShip.GetApplicationID(TB_MatrimonialID.Text), MatrimonialAlbumManager.ImageType.Horoscope))
            {
                //Hide Controls
                L_State.Text = "Horoscope sucessfully Deleted";
                HL_Horo.ImageUrl = "~/Resources/horonotFound.gif";
                CB_DEL.Visible = false;
                D_Delete.Visible = false;
            }
            else
            {
                L_State.Text = "Error in Saving your file";
            }
        }
        else
        {
            CB_DEL.ForeColor= System.Drawing.Color.Red;
        }
    }



    private bool UpLoadImageFile(FileInfo info)
    {
        /*
        UserAlbum_UpdateHoroscope
        UserAlbum_InsertImage
            
            @ApplicationID varchar(15)
            @Horoscope image
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

            byteContent = EditImage.GetThumbNail(byteContent, 600, 600, true);


            byteContent = EditImage.SetWatermark(byteContent, WebConfig.GetValues("FName"), 50, true, 36);

            /// 
            /// DataBase operation starts
            /// 

            string strApplicationID = MatrimonialMemberShip.GetApplicationID(TB_MatrimonialID.Text);


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

                /// Execute Sql Query

                objConnection.Open();
                objCommand.ExecuteNonQuery();
                objConnection.Close();
            }
            return true;
        }
        catch (Exception Ex)
        {
            ErrorLog.WriteErrorLog("Admin_Protected_DeleteHoroscope", Ex);
            return false;
        }
    }

}
