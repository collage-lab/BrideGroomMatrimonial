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

public partial class Member_EditProfile_S1 : System.Web.UI.Page
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

                    ErrorLog.WriteErrorLog("RegistrationStep 1", Ex);
                    Response.Redirect("../Extras/ErrorReport.aspx");
                }
                finally
                {
                    objConnection.Close();
                }
            }

            // Getting applicationID from Cookie
            HttpCookieCollection objHttpCookieCollection = Request.Cookies;
            HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");

            string strApplicationID = Crypto.DeCrypto(objHttpCookie.Values["ApplicationID"]);
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
                    L_Gender.Text = "Female";
                }

                L_Dob.Text= objMember.DOB.Day +"/"+objMember.DOB.Month+"/"+objMember.DOB.Year;
                
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
                Response.Redirect("../Extras/ErrorReport.aspx?id=cookie");

            }//applicationid=null




        }   //if
        else
        {
            string strApplicationID = null;

            try
            {
                HttpCookieCollection objHttpCookieCollection = Request.Cookies;
                HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");

                strApplicationID = Crypto.DeCrypto(objHttpCookie.Values["ApplicationID"]);
            }
            catch (Exception)
            {  
                Server.Transfer("../Extras/ErrorReport.aspx?id=Cookie");
            }
            sbyte sbyteFlag = 0;
            string boolChildrenLivingStatus ;
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
            
            sbyteFlag = MatrimonialProfileManager.UpdateUserBasicInformation(strApplicationID ,boolChildrenLivingStatus, TB_Subcast.Text);

            // Collecting SocioReligiousAttributes

            if (RB_Horoscope_NO.Checked)
            {   sbyteHoroMatch = 1; }
            else if (RB_Horoscope_Yes.Checked)
            {   sbyteHoroMatch = 2; }
            else if (RB_Horoscope_NoMatters.Checked)
            {   sbyteHoroMatch = 3; }
            else
            {   sbyteHoroMatch = 0;}


            if (RB_Manglik_No.Checked)
            { sbyteManglik = 1; }
            else if (RB_Manglik_Yes.Checked)
            { sbyteManglik = 2; }
            else if (RB_Manglik_NA.Checked)
            { sbyteManglik = 3; }
            else if (RB_Manglik_DKnow.Checked)
            { sbyteManglik = 4; }
            else
            { sbyteManglik = 0;}

            
            if ((TB_Time_H.Text != null) && (TB_Time_M.Text != null))
            {
                 strTimeOfBirth = TB_Time_H.Text + ":" + TB_Time_M.Text + " " + DDL_Time.SelectedValue;
             }

             // Updateing User Socio-Religious Attributes

            sbyteFlag += MatrimonialProfileManager.UpdateUserSocioReligiousAttributes(strApplicationID ,(sbyte)DDL_Star.SelectedIndex,
                (sbyte)DDL_Moon.SelectedIndex, sbyteHoroMatch, TB_POB.Text, strTimeOfBirth, sbyteManglik);
            
            // Does the transation a sucess

            if (sbyteFlag == 2)// Sucess
            {
                Response.Redirect("EditProfile-S2.aspx");
            }
            else// Some error Occured
            {
                Response.Redirect("../Extras/ErrorReport.aspx");
            }
        }//postbak

    }
}
