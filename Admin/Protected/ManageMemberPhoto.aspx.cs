//Master


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

public partial class Admin_Protected_AddPhotoNHoroscope : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if ((Request.QueryString["id"] == null) || (Request.QueryString["id"] == ""))
            {
                Response.Redirect("~/Extras/Errorreport.aspx?id=405");
            }
            else
            {
                HF_Type.Value = Request.QueryString["id"];
            }
        }
    }

    protected void B_Search_Click(object sender, EventArgs e)
    {
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
                    //Delete Or Uplaod

                    //Does image is in Album
                    if (MatrimonialAlbumManager.IsAlbumExists(objUser.ApplicationID))
                    {
                        bool boolUpload = false;

                        switch (HF_Type.Value)
                        {
                            case "1":
                                boolUpload = true;
                                HL_UP_1.Attributes.Add("onclick", "window.open('UploadImage.aspx?image=1&matid=" + TB_MatrimonialID.Text + "','Upload','scrollbars=no,width=600,height=285')");
                                HL_UP_1.Visible = true;
                                B_delete.Visible = false;
                                break;
                            case "2":
                                boolUpload = false;
                                HL_UP_1.Visible = false;
                                B_delete.Visible = true;
                                break;
                            case null:
                                Response.Redirect("~/Extras/Errorreport.aspx?id=405");
                                break;
                            default:
                                break;
                        }



                        //Setting Photo

                        if (MatrimonialAlbumManager.IsImageExists(objUser.ApplicationID, MatrimonialAlbumManager.ImageType.Photo))
                        {
                            HL_Photo_1.ImageUrl = "~/Extras/imagecon.aspx?matid=" + TB_MatrimonialID.Text + "&id=1";
                            if (boolUpload)
                            {
                                HL_UP_1.ImageUrl = "~/Resources/ChangePhoto.gif";
                            }
                            else
                            {
                                CB_P.Visible = true;
                            }
                        }

                        // setting Album images For Paid members

                        if (objUser.Membership == SimpleUser.UserType.PaidMember)
                        {
                            if (boolUpload)
                            {
                                HL_UP_2.Attributes.Add("onclick", "window.open('UploadImage.aspx?image=2&matid=" + TB_MatrimonialID.Text + "','Upload','scrollbars=no,width=600,height=285')");
                                HL_UP_3.Attributes.Add("onclick", "window.open('UploadImage.aspx?image=3&matid=" + TB_MatrimonialID.Text + "','Upload','scrollbars=no,width=600,height=285')");
                                HL_UP_4.Attributes.Add("onclick", "window.open('UploadImage.aspx?image=4&matid=" + TB_MatrimonialID.Text + "','Upload','scrollbars=no,width=600,height=285')");
                                HL_UP_1.Visible = true;
                                HL_UP_2.Visible = true;
                                HL_UP_3.Visible = true;
                                HL_UP_4.Visible = true;
                            }


                            //setting image 

                            if (MatrimonialAlbumManager.IsImageExists(objUser.ApplicationID, MatrimonialAlbumManager.ImageType.Album1))
                            {
                                HL_Album_1.ImageUrl = "~/Extras/imagecon.aspx?matid=" + TB_MatrimonialID.Text + "&id=2&type=124";
                                HL_Album_1.Attributes.Add("onclick", "window.open('../../Extras/ViewLargeImage.aspx?matid=" + TB_MatrimonialID.Text + "&image=2','LargerImage','scrollbars=no,width=600,height=285')");
                                HL_Album_1.ToolTip = "Click Here to View Larger Image";
                                HL_Album_1.NavigateUrl = "#";
                                if (!boolUpload)
                                {
                                    CB_ALB_1.Visible = true;
                                }
                                else
                                {
                                    HL_UP_2.ImageUrl = "~/Resources/ChangePhoto.gif";
                                }

                                //
                            }
                            else
                            {
                                HL_Album_1.ImageUrl = "~/Resources/nophoto.gif";
                            }

                            if (MatrimonialAlbumManager.IsImageExists(objUser.ApplicationID, MatrimonialAlbumManager.ImageType.Album2))
                            {
                                HL_Album_2.ImageUrl = "~/Extras/imagecon.aspx?matid=" + TB_MatrimonialID.Text + "&id=3&type=124";
                                HL_Album_2.Attributes.Add("onclick", "window.open('../../Extras/ViewLargeImage.aspx?matid=" + TB_MatrimonialID.Text + "&image=3','LargerImage','scrollbars=no,width=600,height=285')");
                                HL_Album_2.ToolTip = "Click Here to View Larger Image";
                                HL_Album_2.NavigateUrl = "#";
                                if (!boolUpload)
                                {
                                    CB_ALB_2.Visible = true;
                                }
                                else
                                {
                                    HL_UP_3.ImageUrl = "~/Resources/ChangePhoto.gif";
                                }

                            }
                            else
                            {
                                HL_Album_2.ImageUrl = "~/Resources/nophoto.gif";
                            }
                            if (MatrimonialAlbumManager.IsImageExists(objUser.ApplicationID, MatrimonialAlbumManager.ImageType.Album3))
                            {
                                HL_Album_3.ImageUrl = "~/Extras/imagecon.aspx?matid=" + TB_MatrimonialID.Text + "&id=4&type=124";
                                HL_Album_3.Attributes.Add("onclick", "window.open('../../Extras/ViewLargeImage.aspx?matid=" + TB_MatrimonialID.Text + "&image=4','LargerImage','scrollbars=no,width=600,height=285')");
                                HL_Album_3.ToolTip = "Click Here to View Larger Image";
                                HL_Album_3.NavigateUrl = "#";
                                if (!boolUpload)
                                {
                                    CB_ALB_3.Visible = true;
                                }
                                else
                                {
                                    HL_UP_4.ImageUrl = "~/Resources/ChangePhoto.gif";
                                }
                            }
                            else
                            {
                                HL_Album_3.ImageUrl = "~/Resources/nophoto.gif";
                            }

                            L_MatID.Text = TB_MatrimonialID.Text.ToUpper();
                            TB_MatrimonialID.Visible = false;

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
    protected void B_delete_Click(object sender, EventArgs e)
    {
        string strApplicationID = MatrimonialMemberShip.GetApplicationID(Request.QueryString["matid"]);
        if (CB_P.Checked || CB_ALB_1.Checked || CB_ALB_2.Checked || CB_ALB_2.Checked)
        {
            if (CB_P.Checked)
            { MatrimonialAlbumManager.DeleteImage(strApplicationID, MatrimonialAlbumManager.ImageType.Photo); }

            if (CB_ALB_1.Checked)
            { MatrimonialAlbumManager.DeleteImage(strApplicationID, MatrimonialAlbumManager.ImageType.Photo); }

            if (CB_ALB_2.Checked)
            { MatrimonialAlbumManager.DeleteImage(strApplicationID, MatrimonialAlbumManager.ImageType.Photo); }

            if (CB_ALB_3.Checked)
            { MatrimonialAlbumManager.DeleteImage(strApplicationID, MatrimonialAlbumManager.ImageType.Photo); }

           L_Alart.Text = " Image Deleted Successfully";
           L_Alart.Visible = true;
        }
        else
        {
            L_Alart.Text = "Please Check the photo you need to delete";
            L_Alart.Visible = true;
        }
    }
}

