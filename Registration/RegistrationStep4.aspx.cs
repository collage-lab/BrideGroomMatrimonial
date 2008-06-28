/// registration step 4



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

public partial class RegistrationStep4 : System.Web.UI.Page
{

    string strApplicationID;

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

            /// Text Counter Initiallisation 

            txtCount.Text = TB_Expectations.MaxLength.ToString();

            TB_Expectations.Attributes.Add("onKeyUp", "javascript:document.getElementById('" + txtCount.ClientID + "').setAttribute('value', (" + TB_Expectations.MaxLength +
               " - parseInt(document.getElementById('" + TB_Expectations.ClientID + "').getAttribute('value').length)));");

            //load ddls
            //Getting Connection String

            //Connect To database
            LB_MaritalStatus.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.MaritalStatus);
            LB_MaritalStatus.DataTextField = "Item";
            LB_MaritalStatus.DataValueField = "Value";
            LB_MaritalStatus.DataBind();
            LB_MaritalStatus.Items.RemoveAt(0);

            LB_Complexion.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Complexion);
            LB_Complexion.DataTextField = "Item";
            LB_Complexion.DataValueField = "Value";
            LB_Complexion.DataBind();
            LB_Complexion.Items.RemoveAt(0);

            LB_MotherTongue.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.MotherTongue);
            LB_MotherTongue.DataTextField = "Item";
            LB_MotherTongue.DataValueField = "Value";
            LB_MotherTongue.DataBind();
            LB_MotherTongue.Items.RemoveAt(0);

            LB_Religion.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Religion);
            LB_Religion.DataTextField = "Item";
            LB_Religion.DataValueField = "Value";
            LB_Religion.DataBind();
            LB_Religion.Items.RemoveAt(0);

            LB_Caste.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Cast);
            LB_Caste.DataTextField = "Item";
            LB_Caste.DataValueField = "Value";
            LB_Caste.DataBind();
            LB_Caste.Items.RemoveAt(0);
            LB_Caste.Items.RemoveAt(0);
            LB_Caste.Items.Insert(0, "Any");

            LB_Education.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Education);
            LB_Education.DataTextField = "Item";
            LB_Education.DataValueField = "Value";
            LB_Education.DataBind();
            LB_Education.Items.RemoveAt(0);
            LB_Education.Items.Insert(0, "Any");


            LB_Edudetails.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.EduDetails);
            LB_Edudetails.DataTextField = "Item";
            LB_Edudetails.DataValueField = "Value";
            LB_Edudetails.DataBind();
            LB_Edudetails.Items.RemoveAt(0);
            LB_Edudetails.Items.Insert(0, "Any");

            LB_AnnulIncome.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.AnnualIncomeRange);
            LB_AnnulIncome.DataTextField = "Item";
            LB_AnnulIncome.DataValueField = "Value";
            LB_AnnulIncome.DataBind();
            LB_AnnulIncome.Items.RemoveAt(0);

            LB_Occupation.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Occupation);
            LB_Occupation.DataTextField = "Item";
            LB_Occupation.DataValueField = "Value";
            LB_Occupation.DataBind();
            LB_Occupation.Items.RemoveAt(0);
            LB_Occupation.Items.Insert(0, "Any");

            LB_Citizenship.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Country);
            LB_Citizenship.DataTextField = "Item";
            LB_Citizenship.DataValueField = "Value";
            LB_Citizenship.DataBind();
            LB_Citizenship.Items.RemoveAt(0);
            LB_Citizenship.Items.Insert(0, "Any");

            LB_CountryLiving.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Country);
            LB_CountryLiving.DataTextField = "Item";
            LB_CountryLiving.DataValueField = "Value";
            LB_CountryLiving.DataBind();
            LB_CountryLiving.Items.RemoveAt(0);
            LB_CountryLiving.Items.Insert(0, "Any");

            LB_Rasident_State.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.State);
            LB_Rasident_State.DataTextField = "Item";
            LB_Rasident_State.DataValueField = "Value";
            LB_Rasident_State.DataBind();
            LB_Rasident_State.Items.RemoveAt(0);
            LB_Rasident_State.Items.Insert(0, "Any");

            LB_Rasident_Status.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.ResidenceStatus);
            LB_Rasident_Status.DataTextField = "Item";
            LB_Rasident_Status.DataValueField = "Value";
            LB_Rasident_Status.DataBind();
            LB_Rasident_Status.Items.RemoveAt(0);
            LB_Rasident_Status.Items.Insert(0, "Any");

            DDL_ChDosham.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.HoroManglic);
            DDL_ChDosham.DataTextField = "Item";
            DDL_ChDosham.DataValueField = "Value";
            DDL_ChDosham.DataBind();
            DDL_ChDosham.Items.RemoveAt(5);


            DDL_EathingHabits.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Diet);
            DDL_EathingHabits.DataTextField = "Item";
            DDL_EathingHabits.DataValueField = "Value";
            DDL_EathingHabits.DataBind();

            Int16 Int16Counter;
            DDL_Height_min.Items.Insert(0, "-- Select --");
            DDL_Height_Max.Items.Insert(0, "-- Select --");
            for (Int16Counter = 90; Int16Counter <= 185; ++Int16Counter)
            {
                DDL_Height_min.Items.Insert(Int16Counter - 89, Int16Counter + " CM");
                DDL_Height_Max.Items.Insert(Int16Counter - 89, Int16Counter + 1 + " CM");
            }


            TB_NonIndianState.Attributes.Add("visible" ,"false");


        }
        else
        {


            HttpCookieCollection objHttpCookieCollection = Request.Cookies;
            HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatRegInfo");

            strApplicationID = Crypto.DeCrypto(objHttpCookie.Values["ApplicationID"]);

            // Inserting data into database
            if (strApplicationID != null)
            {
                sbyte sbyteFlag = 0;
                sbyte sbyteChildrenStatus;
                sbyte sbytePhysicalStatus;

                //-------------------------------------------------------------------------------------------------------------
                if (RB_ChildrenNO.Checked)
                { sbyteChildrenStatus = 1; }
                else if (RB_ChildrenYesLT.Checked)
                { sbyteChildrenStatus = 2; }
                else if (RB_ChildrenYesNLT.Checked)
                { sbyteChildrenStatus = 3; }
                else if (RB_ChildrenDM.Checked)
                { sbyteChildrenStatus = 4; }
                else
                { sbyteChildrenStatus = 0; }

                //-------------------------------------------------------------------------------------------------------------

                if (RB_phy_nor.Checked)
                { sbytePhysicalStatus = 1; }
                else if (RB_phy_Dis.Checked)
                { sbytePhysicalStatus = 2; }
                else if (RB_phy_DMater.Checked)
                { sbytePhysicalStatus = 3; }
                else
                { sbytePhysicalStatus = 0; }

                //-------------------------------------------------------------------------------------------------------------

                // Loading Values From LB

                string strMaritalStatusList = "";
                string Flag = "";
                // Marital Status
                foreach (ListItem objListItem in LB_MaritalStatus.Items)
                {
                    if (objListItem.Selected)
                    {
                        strMaritalStatusList += Flag + objListItem.Value;
                        Flag = "%";
                    }
                }
                //-------------------------------------------------------------------------------------------------------------
                // Complexion
                string strComplexionList = "";

                Flag = "";

                foreach (ListItem objListItem in LB_Complexion.Items)
                {
                    if (objListItem.Selected)
                    {
                        strComplexionList += Flag + objListItem.Value;
                        Flag = "%";
                    }
                }
                //-------------------------------------------------------------------------------------------------------------
                // Mother Tongue
                string strMotherTongueList = "";

                Flag = "";

                foreach (ListItem objListItem in LB_MotherTongue.Items)
                {
                    if (objListItem.Selected)
                    {
                        strMotherTongueList += Flag + objListItem.Value;
                        Flag = "%";
                    }
                }
                //-------------------------------------------------------------------------------------------------------------
                // Religion
                string strReligionList = "";
                if (CB_Religion_Any.Checked)
                {
                    strReligionList = "##";
                }
                else
                {
                    Flag = "";

                    foreach (ListItem objListItem in LB_Religion.Items)
                    {
                        if (objListItem.Selected)
                        {
                            strReligionList += Flag + objListItem.Value;
                            Flag = "%";
                        }
                    }
                }
                //-------------------------------------------------------------------------------------------------------------
                //Caste
                string strCasteList = "";
                if (CB_Caste_Any.Checked)
                {
                    strCasteList = "##";
                }
                else
                {
                    Flag = "";

                    foreach (ListItem objListItem in LB_Caste.Items)
                    {
                        if (objListItem.Selected)
                        {
                            strCasteList += Flag + objListItem.Value;
                            Flag = "%";
                        }
                    }
                }
                //-------------------------------------------------------------------------------------------------------------
                // Education
                string strEducationList = "";
                if (CB_Education_Any.Checked)
                {
                    strEducationList = "##";
                }
                else
                {
                    Flag = "";

                    foreach (ListItem objListItem in LB_Education.Items)
                    {
                        if (objListItem.Selected)
                        {
                            strEducationList += Flag + objListItem.Value;
                            Flag = "%";
                        }
                    }
                }
                //-------------------------------------------------------------------------------------------------------------
                // EduDetails
                string strEduDetailsList = "";
                if (CB_EduDet.Checked)
                {
                    strEduDetailsList = "##";
                }
                else
                {
                    Flag = "";

                    foreach (ListItem objListItem in LB_Edudetails.Items)
                    {
                        if (objListItem.Selected)
                        {
                            strEduDetailsList += Flag + objListItem.Value;
                            Flag = "%";
                        }
                    }
                }
                //-------------------------------------------------------------------------------------------------------------
                // Occupation
                string strOccupationList = "";
                if (CB_Occupation_any.Checked)
                {
                    strOccupationList = "##";
                }
                else
                {
                    Flag = "";

                    foreach (ListItem objListItem in LB_Occupation.Items)
                    {
                        if (objListItem.Selected)
                        {
                            strOccupationList += Flag + objListItem.Value;
                            Flag = "%";
                        }
                    }
                }
                //-------------------------------------------------------------------------------------------------------------
                // Citizenship
                string strCitizenshipList = "";
                if (CB_IndianX.Checked)
                {
                    strCitizenshipList = "##";
                }
                else
                {
                    Flag = "";

                    foreach (ListItem objListItem in LB_Citizenship.Items)
                    {
                        if (objListItem.Selected)
                        {
                            strCitizenshipList += Flag + objListItem.Value;
                            Flag = "%";
                        }
                    }
                }
                //-------------------------------------------------------------------------------------------------------------
                // Country Living in
                string strCountryLivinginList = "";
                if (CB_Indian.Checked)
                {
                    strCountryLivinginList = "##";
                }
                else
                {
                    Flag = "";

                    foreach (ListItem objListItem in LB_Citizenship.Items)
                    {
                        if (objListItem.Selected)
                        {
                            strCountryLivinginList += Flag + objListItem.Value;
                            Flag = "%";
                        }
                    }
                }
                //-------------------------------------------------------------------------------------------------------------
                // Country Living in
                string strStateList = "";
                if (!CB_StatesInIndia.Checked)
                {
                    strStateList = TB_NonIndianState.Text + "#";
                }
                else
                {
                    Flag = "";

                    foreach (ListItem objListItem in LB_Rasident_State.Items)
                    {
                        if (objListItem.Selected)
                        {
                            strStateList += Flag + objListItem.Value;
                            Flag = "%";
                        }
                    }
                }
                //-------------------------------------------------------------------------------------------------------------
                //Residential Status
                string strResidentStatus = "";
                Flag = "";
                foreach (ListItem objListItem in LB_Rasident_Status.Items)
                {
                    if (objListItem.Selected)
                    {
                        strResidentStatus += Flag + objListItem.Value;
                        Flag = "%";
                    }
                }
                //--------------------------------------------------------------------------------------------------------------
                sbyteFlag = MatrimonialProfileManager.InsertMyExpectation(strApplicationID, TB_Expectations.Text);
                //--------------------------------------------------------------------------------------------------------------
                sbyteFlag += MatrimonialProfileManager.InsertPartnerPreferance(strApplicationID, strMaritalStatusList, sbyte.Parse(TB_Age_min.Text),
                            sbyte.Parse(TB_Age_Max.Text), strComplexionList, sbyteChildrenStatus, (DDL_Height_min.SelectedIndex+89), (DDL_Height_Max.SelectedIndex+89),
                            sbytePhysicalStatus, strMotherTongueList, strReligionList, strCasteList, DDL_ChDosham.SelectedIndex, DDL_EathingHabits.SelectedIndex,
                            strEducationList, strEduDetailsList, LB_AnnulIncome.SelectedIndex, strOccupationList, strCitizenshipList, strCountryLivinginList,
                            strStateList, strResidentStatus);
                //--------------------------------------------------------------------------------------------------------------

                if (sbyteFlag == 2)
                {
                    MatrimonialMemberShip.UpdateIndex(strApplicationID);
                    Server.Transfer("RegistrationConfirm.aspx");
                }
                else
                {
                    Server.Transfer("../Extras/ErrorReport.aspx");
                }

            }
            else
            {

            }


        }

        
   }
   
    protected void IB_Submit_Click1(object sender, ImageClickEventArgs e)
      {
           
        
      }




    public int MaxLength
    {
        get { return TB_Expectations.MaxLength; }
        set { TB_Expectations.MaxLength = value; }
    }
}
