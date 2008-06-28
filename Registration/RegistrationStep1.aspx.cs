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

public partial class RegistrationStep1 : System.Web.UI.Page
{

    string strApplicationID;
    

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            //Setting UserID 

            HF_UaerID.Value = Crypto.DeCrypto(Request.QueryString["key"]);

            if (HF_UaerID.Value == null)
            {
                Response.Redirect("../Extras/ErrorReport.aspx?id=WrongKey");
            }


            //Getting Connection String

            //Connect To database

            //load all the DDLs

            //Loading IndexMotherTongue

            DDL_MotherTongue.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.MotherTongue);
            DDL_MotherTongue.DataTextField = "Item";
            DDL_MotherTongue.DataValueField = "Value";
            DDL_MotherTongue.DataBind();

            // Loading Religion

            DDL_Religion.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Religion);
            DDL_Religion.DataTextField = "Item";
            DDL_Religion.DataValueField = "Value";
            DDL_Religion.DataBind();


            // Loading Cast
            DDL_Cast.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Cast);
            DDL_Cast.DataTextField = "Item";
            DDL_Cast.DataValueField = "Value";
            DDL_Cast.DataBind();


            // Loading Profile Created by
            DDL_ProfieCreated.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.ProfileCreatedBy);
            DDL_ProfieCreated.DataTextField = "Item";
            DDL_ProfieCreated.DataValueField = "Value";
            DDL_ProfieCreated.DataBind();


            // Loading Reference by

            DDL_Reference.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.ReferenceBy);
            DDL_Reference.DataTextField = "Item";
            DDL_Reference.DataValueField = "Value";
            DDL_Reference.DataBind();


            // Loading Star

            DDL_Star.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Star);
            DDL_Star.DataTextField = "Item";
            DDL_Star.DataValueField = "Value";
            DDL_Star.DataBind();


            // Loading MoonSign

            DDL_Moon.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.MoonSign);
            DDL_Moon.DataTextField = "Item";
            DDL_Moon.DataValueField = "Value";
            DDL_Moon.DataBind();

            DDL_SEqt.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Sequrity);
            DDL_SEqt.DataTextField = "SequrityQuestion";
            DDL_SEqt.DataValueField = "Value";
            DDL_SEqt.DataBind();


            int intThisYear = DateTime.Now.Year - 18 ;
            for (int i = 0; i <= 32; ++i)
            {

                DDL_dobYear.Items.Add((intThisYear - i).ToString());
            
            }



        }
        else
        {
            if (CB_Accept.Checked)
            {
                //save details into data base

                sbyte sbyteFlag = 0;

                //Inserting AccountInformations
                strApplicationID = MatrimonialMemberShip.InsertAccountInfo(HF_UaerID.Value,
                    FormsAuthentication.HashPasswordForStoringInConfigFile(TB_Password.Text, "MD5"),(sbyte)DDL_SEqt.SelectedIndex,TB_Answer.Text);
                //If Inserted 
                Response.Write(strApplicationID);
                if (strApplicationID != null)
                {

                    // Basic member Informations
                    DateTime dtDOB;
                    sbyte sbyteMaritalStatus = 0;
                    string strPhysicalStatus;
                    string strChildrenLivingStatus;


                    // Setting Date of birth
                    dtDOB = DateTime.Parse(DDL_dobMonth.SelectedIndex + " " + DDL_dobYear.SelectedIndex + "," + DDL_dobDay.SelectedIndex);


                    // Setting   MaritalStatus
                    if (RB_MS_UM.Checked)
                    {
                        sbyteMaritalStatus = 1;
                    }
                    else if (RB_MS_Div.Checked)
                    {
                        sbyteMaritalStatus = 2;
                    }
                    else if (RB_MS_Sep.Checked)
                    {
                        sbyteMaritalStatus = 3;
                    }
                    else if (RB_MS_WW.Checked)
                    {
                        sbyteMaritalStatus = 4;
                    }

                    //Setting NoOfChildren

                    if (RB_phy_nor.Checked)
                    {
                        strPhysicalStatus = true.ToString();
                    }
                    else if (RB_phy_Dis.Checked)
                    {
                        strPhysicalStatus = false.ToString();
                    }
                    else
                    {
                        strPhysicalStatus = null;
                    }

                    // setting Children Living With

                    if (RB_CH_LWM.Checked)
                    {
                        strChildrenLivingStatus = true.ToString();
                    }
                    else if (RB_CH_NWM.Checked)
                    {
                        strChildrenLivingStatus = false.ToString();
                    }
                    else
                    {
                        strChildrenLivingStatus = null;
                    }

                    //Inserting Basic Informations
                    sbyteFlag = MatrimonialProfileManager.InsertBasicInfo(strApplicationID,
                        TB_Name.Text, RB_Male.Checked, dtDOB,
                        (sbyte)DDL_MotherTongue.SelectedIndex,
                        (sbyte)DDL_ProfieCreated.SelectedIndex,
                        (sbyte)DDL_Cast.SelectedIndex, sbyteMaritalStatus,
                        (sbyte)DDL_Religion.SelectedIndex,
                        (sbyte)DDL_NoOfChildren.SelectedIndex,
                        strPhysicalStatus, strChildrenLivingStatus,
                        TB_SubCast.Text);

                    // SociaReligious member Informations

                    sbyte sbyteHoroscopeMatch = 0;
                    string strTimeOfBirth = null;
                    sbyte sbyteManglik = 0;

                    if (RB_Horoscope_NO.Checked)
                    {
                        sbyteHoroscopeMatch = 1;
                    }
                    else if (RB_Horoscope_Yes.Checked)
                    {
                        sbyteHoroscopeMatch = 2;
                    }
                    else if (RB_Horoscope_NoMatters.Checked)
                    {
                        sbyteHoroscopeMatch = 3;
                    }


                    if (RB_Manglik_No.Checked)
                    { sbyteManglik = 1; }
                    else if (RB_Manglik_Yes.Checked)
                    { sbyteManglik = 2; }
                    else if (RB_Manglik_DKnow.Checked)
                    { sbyteManglik = 3; }
                    else if (RB_Manglik_NA.Checked)
                    { sbyteManglik = 4; }

                    if ((TB_Time_H.Text != null) && (TB_Time_M.Text != null))
                    {
                        strTimeOfBirth = TB_Time_H.Text + ":" + TB_Time_M.Text + " " + DDL_Time.SelectedValue;
                    }

                    //Inserting SociaReligious Informations
                    sbyteFlag += MatrimonialProfileManager.InsertSocioReligiousInfo(strApplicationID, (sbyte)DDL_Star.SelectedIndex,
                        (sbyte)DDL_Moon.SelectedIndex, sbyteHoroscopeMatch, TB_POB.Text, strTimeOfBirth, sbyteManglik);

                    sbyteFlag += MatrimonialMessanger.SetMailingSettings(HF_UaerID.Value);
                }
                else
                {
                    Response.Redirect("../Extras/ErrorReport.aspx");
                }

                if (sbyteFlag == 3)
                {
                    MatrimonialMemberShip.UpdateIndex(strApplicationID);
                    HttpCookie objHttpCookie = new HttpCookie("MatRegInfo");
                    objHttpCookie.Values["ApplicationID"] = Crypto.EnCrypto(strApplicationID);
                    objHttpCookie.Expires = DateTime.MaxValue; //<<<<<<<<<<<<<< ForTesting >>>>>>>>>>>
                    Response.Cookies.Add(objHttpCookie);

                    Server.Transfer("RegistrationStep2.aspx");

                }
                else
                {
                    Response.Write(strApplicationID);
                    //Response.Redirect("../Extras/ErrorReport.aspx");<< ForTesting >>
                }

            }
            else
            {
                LabelDisplay.Visible = true;
                LabelDisplay.Text = "You Need to accept terms and conditions";
            }

        }
    }

}
