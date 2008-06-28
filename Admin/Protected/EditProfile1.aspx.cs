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

public partial class Admin_Protected_EditProfile1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)

        {
            if (Request.QueryString["seqtkey"] != null)
            {
                try
                {
                    HF_MatID.Value = Session[Request.QueryString["seqtkey"]].ToString();
                    L_MATID.Text = Session[Request.QueryString["seqtkey"]].ToString();
                    HF_Seqt.Value = Request.QueryString["seqtkey"];
                    this.Title = "Editing Member Profile :" + L_MATID.Text + " Step1";

                    HL_Step_2.NavigateUrl = "~/Admin/Protected/EditProfile2.aspx?seqtkey=" + HF_Seqt.Value;
                    HL_Step_3.NavigateUrl = "~/Admin/Protected/EditProfile3.aspx?seqtkey=" + HF_Seqt.Value;
                    HL_Step_4.NavigateUrl = "~/Admin/Protected/EditProfile4.aspx?seqtkey=" + HF_Seqt.Value;

                    LoadStep1();

                }
                catch (Exception)
                {
                    Response.Redirect("~/Extras/ErrorReport.aspx?is=session");
                }
            }
            else
            {
                Response.Redirect("~/Extras/ErrorReport.aspx?id=406");
            }
        
        }

        else
        {
            string strApplicationID = MatrimonialMemberShip.GetApplicationID(HF_MatID.Value);
            sbyte sbyteFlag = 0;
            string boolChildrenLivingStatus;
            sbyte sbyteHoroMatch = 0;
            sbyte sbyteManglik = 0;
            string strTimeOfBirth = null;

            // Collecting BasicInformation

            if (RB_LivingWithMe.Checked)
            { boolChildrenLivingStatus = true.ToString(); }
            else if (RB_NotWithMe.Checked)
            { boolChildrenLivingStatus = false.ToString(); }
            else
            { boolChildrenLivingStatus = null; }

            // Updateing User BasicInformation

            sbyteFlag = MatrimonialProfileManager.UpdateUserBasicInformation(strApplicationID, boolChildrenLivingStatus, TB_Subcast.Text);

            // Collecting SocioReligiousAttributes

            if (RB_Horoscope_NO.Checked)
            { sbyteHoroMatch = 1; }
            else if (RB_Horoscope_Yes.Checked)
            { sbyteHoroMatch = 2; }
            else if (RB_Horoscope_NoMatters.Checked)
            { sbyteHoroMatch = 3; }
            else
            { sbyteHoroMatch = 0; }


            if (RB_Manglik_No.Checked)
            { sbyteManglik = 1; }
            else if (RB_Manglik_Yes.Checked)
            { sbyteManglik = 2; }
            else if (RB_Manglik_NA.Checked)
            { sbyteManglik = 3; }
            else if (RB_Manglik_DKnow.Checked)
            { sbyteManglik = 4; }
            else
            { sbyteManglik = 0; }


            if ((TB_Time_H.Text != null) && (TB_Time_M.Text != null))
            {
                strTimeOfBirth = TB_Time_H.Text + ":" + TB_Time_M.Text + " " + DDL_Time.SelectedValue;
            }

            // Updateing User Socio-Religious Attributes

            sbyteFlag += MatrimonialProfileManager.UpdateUserSocioReligiousAttributes(strApplicationID, (sbyte)DDL_Star.SelectedIndex,
                (sbyte)DDL_Moon.SelectedIndex, sbyteHoroMatch, TB_POB.Text, strTimeOfBirth, sbyteManglik);

            // Does the transation a sucess

            if (sbyteFlag == 2)// Success
            {
                Server.Transfer("~/Admin/Protected/EditProfile2.aspx?seqtkey=" + HF_Seqt.Value);
            }
            else// Some error Occured
            {
                Response.Redirect("~/Extras/ErrorReport.aspx");
            }
        }
    }

    private void LoadStep1()
    {
        // Loading controls


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                objConnection.Open();

                // Loading Star
                SqlCommand objCommand = new SqlCommand("SELECT * FROM IndexStar", objConnection);
                SqlDataReader objDataReader = objCommand.ExecuteReader();

                DDL_Star.DataSource = objDataReader;
                DDL_Star.DataTextField = "Item";
                DDL_Star.DataValueField = "Value";
                DDL_Star.DataBind();
                objDataReader.Close();

                // Loading MoonSign
                objCommand = new SqlCommand("SELECT * FROM IndexMoonSign", objConnection);
                objDataReader = objCommand.ExecuteReader();

                DDL_Moon.DataSource = objDataReader;
                DDL_Moon.DataTextField = "Item";
                DDL_Moon.DataValueField = "Value";
                DDL_Moon.DataBind();
                objDataReader.Close();

            }
            catch (Exception Ex)
            {

                ErrorLog.WriteErrorLog("Admin-Edit-Profile:LoadStep1", Ex);
                Response.Redirect("~/Extras/ErrorReport.aspx");
            }
            finally
            {
                objConnection.Close();
            }
        }

        // Getting applicationID from Cookie

        string strApplicationID = MatrimonialMemberShip.GetApplicationID(HF_MatID.Value);
        //If Cookie is working 
        if ((strApplicationID != null) && (strApplicationID != ""))
        {
            //Get Member Informations
            MatMember objMember = new MatMember(true, strApplicationID, false, true, true, false, false, false, false, false, false, false);

            //Populating Controls
            //Basic Informations
            L_Name.Text = objMember.Name;

            if (objMember.Gender)
            {
                L_Gender.Text = "Male";
            }
            else
            {
                L_Gender.Text = "Male";
            }

            L_Dob.Text = objMember.DOB.Day + "/" + objMember.DOB.Month + "/" + objMember.DOB.Year;

            //For Testing
            L_MaritalStatus.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.MaritalStatus, objMember.MaritialStatus);

            if (objMember.NoOfChildren == 0)
            {
                L_NoOfChildren.Text = "Nill";
                RB_NotWithMe.Enabled = false;
                RB_LivingWithMe.Enabled = false;
            }
            else
            {
                L_NoOfChildren.Text = objMember.NoOfChildren.ToString();

                if (objMember.ChildrenLivingWith)
                {
                    RB_LivingWithMe.Checked = true;
                }
                else
                {
                    RB_NotWithMe.Checked = true;
                }
            }



            if (objMember.PhysicalStatus)
            {
                L_PhysicalStatus.Text = "Normal";
            }
            else
            {
                L_PhysicalStatus.Text = "Disabled";
            }

            L_MotherTongue.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.MotherTongue, objMember.MotherTongue);

            L_Religion.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Religion, objMember.Religion);

            L_Cast.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Cast, objMember.Cast);

            TB_Subcast.Text = objMember.Subcast;

            L_ProfieCreated.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.ProfileCreatedBy, objMember.CreatedBy);

            //Socio Religious
            if (objMember.MoonSign != 0)
            {
                DDL_Star.SelectedIndex = objMember.Star;
                DDL_Star.Enabled = false;
            }

            if (objMember.MoonSign != 0)
            {
                DDL_Moon.SelectedIndex = objMember.MoonSign;
                DDL_Moon.Enabled = false;
            }


            switch (objMember.HoroMatch)
            {
                case 0:
                    break;
                case 1:
                    RB_Horoscope_NO.Checked = true;
                    break;
                case 2:
                    RB_Horoscope_Yes.Checked = true;
                    break;
                case 3:
                    RB_Horoscope_NoMatters.Checked = true;
                    break;
                default:
                    break;
            }

            switch (objMember.Manglik)
            {
                case 0:
                    break;
                case 1:
                    RB_Manglik_No.Checked = true;
                    break;
                case 2:
                    RB_Manglik_Yes.Checked = true;
                    break;
                case 3:
                    RB_Horoscope_NoMatters.Checked = true;
                    break;
                case 4:
                    RB_Manglik_NA.Checked = true;
                    break;
                default:
                    break;

            }

            TB_POB.Text = objMember.PlaceOfBirth;

            TB_Time_H.Text = objMember.TimeOfBirth.Hour.ToString();

            TB_Time_M.Text = objMember.TimeOfBirth.Minute.ToString();

            if (objMember.TimeOfBirth.Hour > 12)
            {
                DDL_Time.SelectedIndex = 1;
            }
            else { DDL_Time.SelectedIndex = 2; }

        }
        else
        {
            Response.Redirect("~/Extras/ErrorReport.aspx");

        }//applicationid=null

    }

   


}
