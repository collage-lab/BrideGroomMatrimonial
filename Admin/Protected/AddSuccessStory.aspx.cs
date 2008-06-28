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

public partial class Admin_Protected_AddSuccessStory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtCount.Text = TB_SucessStory.MaxLength.ToString();

            TB_SucessStory.Attributes.Add("onKeyUp",
               "javascript:document.getElementById('" + txtCount.ClientID +
               "').setAttribute('value', (" + TB_SucessStory.MaxLength +
               " - parseInt(document.getElementById('" + TB_SucessStory.ClientID +
               "').getAttribute('value').length)));");
            L_Alart.Visible = false;
        }
        else
        {
            L_Alart.Visible = false;
        }

        
    }


    protected void B_AddSucessStorry_Click(object sender, EventArgs e)
    {
        ///
        ///upload image 
        /// 


        FileInfo imageInfo = new FileInfo(File_Image.Value.Trim());

        if (!imageInfo.Exists)
            this.RegisterClientScriptBlock("alertMsg", "<script>alert('please select one image file.');</script>");
        else
        {
            switch (imageInfo.Extension.ToUpper())
            {
                case ".JPG":
                    if (this.UpLoadImageFile(imageInfo))
                    {
                        L_Alart.Visible = true;
                        PN_ID_Album.Visible = false;
                        TB_Password.Visible = false;
                        TB_MatID.Enabled = false;
                        TB_MatID.ReadOnly = false;
                    }
                    else
                    {
                        L_Alart.Visible = true;
                        L_Alart.Text = "Error In Adding Sucess Storry";
                    }
                    break;
                case ".GIF":
                    if (this.UpLoadImageFile(imageInfo))
                    {
                        L_Alart.Visible = true;
                        PN_ID_Album.Visible = false;
                        TB_Password.Visible = false;
                        TB_MatID.Enabled = false;
                        TB_MatID.ReadOnly = false;
                    }
                    else
                    {
                        L_Alart.Visible = true;
                    }
                    break;
                case ".BMP":
                    if (this.UpLoadImageFile(imageInfo))
                    {
                        L_Alart.Visible = true;
                        PN_ID_Album.Visible = false;
                        TB_Password.Visible = false;
                        TB_MatID.Enabled = false;
                        TB_MatID.ReadOnly = false;
                    }
                    else
                    {
                        L_Alart.Visible = true;
                        L_Alart.Text = "Error In Adding Sucess Storry";
                    }
                    break;
                case ".PNG":
                    if (this.UpLoadImageFile(imageInfo))
                    {
                        L_Alart.Visible = true;
                        PN_ID_Album.Visible = false;
                        TB_Password.Visible = false;
                        TB_MatID.Enabled = false;
                        TB_MatID.ReadOnly = false;
                    }
                    else
                    {
                        L_Alart.Visible = true;
                        L_Alart.Text = "Error In Adding Sucess Storry";
                    }
                    break;
                default:
                    this.RegisterClientScriptBlock("alertMsg", "<script>alert('Use either images suchus bmp,jpg,gif');</script>");
                    break;
            }
        }
    }

    protected void B_LogIN_Click(object sender, EventArgs e)
    {
        if(MatrimonialMemberShip.Authentication(MatrimonialMemberShip.GetUserName(TB_MatID.Text, true), FormsAuthentication.HashPasswordForStoringInConfigFile(TB_Password.Text, "MD5")).AuthenticationStatus)
        {
            PN_ID_Album.Visible = true;
            PN_ID_NotFound.Visible = false;
            B_LogIN.Visible = false;
            TB_Password.Visible = false;
            TB_MatID.ReadOnly = true;
            TB_MatID.BorderStyle = BorderStyle.None;
            TB_MatID.BorderWidth = 0;
            TB_MatID.Font.Bold = true;
            L_Password.Visible = false;
        }
        else
        {
            PN_ID_Album.Visible = false;
            PN_ID_NotFound.Visible = true;
            B_LogIN.Visible = true;
            TB_Password.Visible = true;
            L_Password.Visible = true;

        }
    }


    #region "Private Methodes"

    private bool UpLoadImageFile(FileInfo info)
    {
        /*
        UserSuccessStory_InsertStory
            
            @SStoryID varchar(15) = NULL,
            @MatrimonialID varchar(10) = NULL,
            @Bride varchar(50) = NULL,
            @Groom varchar(50) = NULL,
            @WeddingDate smalldatetime = NULL,
            @Photo image = NULL
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

            byteContent = EditImage.GetThumbNail(byteContent, 124, 90, true);



            byteContent = EditImage.SetWatermark(byteContent, WebConfig.GetValues("FName"), 50, true,36);

            /// 
            /// DataBase operation starts
            /// 



            using (SqlConnection objConnection = DBConnection.GetSqlConnection())
            {

                SqlCommand objCommand = new SqlCommand("UserSuccessStory_InsertStory", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;

                /// Inserting parameters

                string strTemp = getSucessID();

                objCommand.Parameters.Add(new SqlParameter("@SStoryID", SqlDbType.VarChar));
                objCommand.Parameters["@SStoryID"].Value = strTemp;


                objCommand.Parameters.Add(new SqlParameter("@SucessStory", SqlDbType.VarChar));
                objCommand.Parameters["@SucessStory"].Value = TB_SucessStory.Text;

                objCommand.Parameters.Add(new SqlParameter("@MatrimonialID", SqlDbType.VarChar));
                objCommand.Parameters["@MatrimonialID"].Value = TB_MatID.Text;


                objCommand.Parameters.Add(new SqlParameter("@Bride", SqlDbType.VarChar));
                objCommand.Parameters["@Bride"].Value = TB_Bride.Text;


                objCommand.Parameters.Add(new SqlParameter("@Groom", SqlDbType.VarChar));
                objCommand.Parameters["@Groom"].Value = TB_Groom.Text;

                /// <<<<<<<<<<<< ForTesting >>>>>>>>>>>>
                objCommand.Parameters.Add(new SqlParameter("@WeddingDate", SqlDbType.SmallDateTime));
                objCommand.Parameters["@WeddingDate"].Value = DateTime.Parse(TB_Date.Text);


                objCommand.Parameters.Add(new SqlParameter("@Photo", SqlDbType.Image));
                objCommand.Parameters["@Photo"].Value = byteContent;

                /// Execute Sql Query

                objConnection.Open();
                objCommand.ExecuteNonQuery();
                objConnection.Close();

                //Setting SuccessPannel
                PN_Success.Visible = true;
                SuccessPannel1.Bind(strTemp);
            }
            return true;

        }
        catch (Exception)
        {
            // ErrorLog
            return false;
        }
    }

    public int MaxLength
    {
        get { return TB_SucessStory.MaxLength; }
        set { TB_SucessStory.MaxLength = value; }
    }

    protected string getSucessID()
    {
        //<<<<<<<<<For Testing >>>>>>>>
        Random objRandom = new Random();
        return RandomString.GenerateStirng(3, false) + objRandom.Next(1000, 9999);
    }

    #endregion


}
