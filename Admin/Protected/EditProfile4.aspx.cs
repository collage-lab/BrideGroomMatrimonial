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

public partial class Admin_Protected_EditProfile4 : System.Web.UI.Page
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

                    this.Title = "Editing Member Profile :" + HF_MatID.Value + " Step 4";
                    HL_Step_1.NavigateUrl = "~/Admin/Protected/EditProfile1.aspx?seqtkey=" + HF_Seqt.Value;
                    HL_Step_2.NavigateUrl = "~/Admin/Protected/EditProfile2.aspx?seqtkey=" + HF_Seqt.Value;
                    HL_Step_3.NavigateUrl = "~/Admin/Protected/EditProfile3.aspx?seqtkey=" + HF_Seqt.Value;

                    LoadStep4();
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
            SaveData();
        }

    }

    private void SaveData()
    {
        string strApplicationID = MatrimonialMemberShip.GetApplicationID(HF_MatID.Value);;

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
                        sbyte.Parse(TB_Age_Max.Text), strComplexionList, sbyteChildrenStatus, (DDL_Height_min.SelectedIndex + 89), (DDL_Height_Max.SelectedIndex + 89),
                        sbytePhysicalStatus, strMotherTongueList, strReligionList, strCasteList, DDL_ChDosham.SelectedIndex, DDL_EathingHabits.SelectedIndex,
                        strEducationList, strEduDetailsList, LB_AnnulIncome.SelectedIndex, strOccupationList, strCitizenshipList, strCountryLivinginList,
                        strStateList, strResidentStatus);
            //--------------------------------------------------------------------------------------------------------------

            if (sbyteFlag == 2)
            {
                L_Success.Visible = false;
            }

        }
    }

    private void LoadStep4()
    {

        L_Success.Visible = true;

        txtCount.Text = TB_Expectations.MaxLength.ToString();

        /// Text Counter Initiallisation 

        TB_Expectations.Attributes.Add("onKeyUp",
           "javascript:document.getElementById('" + txtCount.ClientID +
           "').setAttribute('value', (" + TB_Expectations.MaxLength +
           " - parseInt(document.getElementById('" + TB_Expectations.ClientID +
           "').getAttribute('value').length)));");


        //load ddls
        //Getting Connection String

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

        LB_Education.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Education);
        LB_Education.DataTextField = "Item";
        LB_Education.DataValueField = "Value";
        LB_Education.DataBind();
        LB_Education.Items.RemoveAt(0);

        LB_Edudetails.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.EduDetails); ;
        LB_Edudetails.DataTextField = "Item";
        LB_Edudetails.DataValueField = "Value";
        LB_Edudetails.DataBind();
        LB_Edudetails.Items.RemoveAt(0);

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

        LB_Citizenship.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Country);
        LB_Citizenship.DataTextField = "Item";
        LB_Citizenship.DataValueField = "Value";
        LB_Citizenship.DataBind();
        LB_Citizenship.Items.RemoveAt(0);
        
        LB_CountryLiving.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Country);
        LB_CountryLiving.DataTextField = "Item";
        LB_CountryLiving.DataValueField = "Value";
        LB_CountryLiving.DataBind();
        LB_CountryLiving.Items.RemoveAt(0);

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
        

        // Loading Values From DataBase
        //---------------------------------------------------------------------------------------------------
        string strApplicationID = MatrimonialMemberShip.GetApplicationID(HF_MatID.Value);
        //---------------------------------------------------------------------------------------------------
        MatMember objMember = new MatMember(true, strApplicationID, false, false, false, false, false, false, false, false, false, true);
        //---------------------------------------------------------------------------------------------------
        int i;
        //---------------------------------------------------------------------------------------------------
        string[] strARRAY = objMember.PP_LookingFor.Split('%');
        if (strARRAY[0].Length != 0)
        {
            foreach (string index in strARRAY)
            {
                i = int.Parse(index);
                LB_MaritalStatus.Items[i - 1].Selected = true;
            }
        }
        //---------------------------------------------------------------------------------------------------
        TB_Age_min.Text = objMember.PP_AgeMin.ToString();
        TB_Age_Max.Text = objMember.PP_AgeMax.ToString();
        //---------------------------------------------------------------------------------------------------
        strARRAY = objMember.PP_Complexion.Split('%');
        if (strARRAY[0].Length != 0)
        {
            foreach (string index in strARRAY)
            {
                i = int.Parse(index);
                LB_Complexion.Items[i - 1].Selected = true;
            }
        }
        //---------------------------------------------------------------------------------------------------
        switch (objMember.PP_HaveChildren)
        {
            case 1: RB_ChildrenDM.Checked = true;
                break;
            case 2: RB_ChildrenNO.Checked = true;
                break;
            case 3: RB_ChildrenYesLT.Checked = true;
                break;
            case 4: RB_ChildrenYesNLT.Checked = true;
                break;
        }
        //---------------------------------------------------------------------------------------------------
        DDL_Height_min.SelectedIndex = objMember.PP_HeightMin;
        DDL_Height_Max.SelectedIndex = objMember.PP_HeightMax;
        //---------------------------------------------------------------------------------------------------
        switch (objMember.PP_PhysicalStatus)
        {
            case 1: RB_phy_nor.Checked = true;
                break;
            case 2: RB_phy_Dis.Checked = true;
                break;
            case 3: RB_phy_DMater.Checked = true;
                break;
        }
        //---------------------------------------------------------------------------------------------------
        strARRAY = objMember.PP_MotherTongue.Split('%');

        if (strARRAY[0].Length != 0)
        {
            foreach (string index in strARRAY)
            {
                i = int.Parse(index);
                LB_MotherTongue.Items[i - 1].Selected = true;
            }
        }
        //---------------------------------------------------------------------------------------------------
        TB_Expectations.Text = objMember.MyExpectations;
        //---------------------------------------------------------------------------------------------------
        if (objMember.PP_Religion.IndexOf("##") >= 0)
        {
            CB_Religion_Any.Checked = true;
        }
        else
        {
            CB_Caste_Any.Checked = false;
            strARRAY = objMember.PP_Religion.Split('%');
            if (strARRAY[0].Length != 0)
            {
                foreach (string index in strARRAY)
                {
                    i = int.Parse(index);
                    LB_Religion.Items[i - 1].Selected = true;
                }
                CB_Religion_Any.Checked = false;
            }
            else
            {
                CB_Religion_Any.Checked = true;
            }
        }
        //---------------------------------------------------------------------------------------------------
        if (objMember.PP_Caste.IndexOf("##") >= 0)
        {
            CB_Caste_Any.Checked = true;
        }
        else
        {

            strARRAY = objMember.PP_Caste.Split('%');
            if (strARRAY[0].Length != 0)
            {
                foreach (string index in strARRAY)
                {
                    i = int.Parse(index);
                    LB_Caste.Items[i - 1].Selected = true;
                }
                CB_Caste_Any.Checked = false;
            }
            else
            {
                CB_Caste_Any.Checked = true;
            }
        }
        //---------------------------------------------------------------------------------------------------
        DDL_ChDosham.SelectedIndex = objMember.PP_Manglik;
        DDL_EathingHabits.SelectedIndex = objMember.Diet;
        //---------------------------------------------------------------------------------------------------
        if (objMember.PP_Education.IndexOf("##") >= 0)
        {
            CB_Education_Any.Checked = true;
        }
        else
        {
            strARRAY = objMember.PP_Education.Split('%');
            if (strARRAY[0].Length != 0)
            {
                foreach (string index in strARRAY)
                {
                    i = int.Parse(index);
                    LB_Education.Items[i - 1].Selected = true;
                }
                CB_Education_Any.Checked = false;
            }
            else
            {
                CB_Education_Any.Checked = true;
            }
        }
        //---------------------------------------------------------------------------------------------------
        if (objMember.PP_EducationDetails.IndexOf("##") >= 0)
        {
            CB_EduDet.Checked = true;
        }
        else
        {

            strARRAY = objMember.PP_EducationDetails.Split('%');
            if (strARRAY[0].Length != 0)
            {
                foreach (string index in strARRAY)
                {
                    i = int.Parse(index);
                    LB_Edudetails.Items[i - 1].Selected = true;
                }
                CB_EduDet.Checked = false;
            }
            else
            {
                CB_EduDet.Checked = true;
            }
        }
        //---------------------------------------------------------------------------------------------------
        LB_AnnulIncome.SelectedIndex = objMember.PP_AnnualIncome;
        //---------------------------------------------------------------------------------------------------
        if (objMember.PP_Occupation.IndexOf("##") >= 0)
        {
            CB_Occupation_any.Checked = true;
        }
        else
        {

            strARRAY = objMember.PP_Occupation.Split('%');
            if (strARRAY[0].Length != 0)
            {
                foreach (string index in strARRAY)
                {
                    i = int.Parse(index);
                    LB_Occupation.Items[i - 1].Selected = true;
                }
                CB_Occupation_any.Checked = false;
            }
            else
            {
                CB_Occupation_any.Checked = true;
            }
        }
        //---------------------------------------------------------------------------------------------------
        if (objMember.PP_Citizenship.IndexOf("##") >= 0)
        {
            CB_IndianX.Checked = true;
        }
        else
        {

            strARRAY = objMember.PP_Citizenship.Split('%');
            if (strARRAY[0].Length != 0)
            {
                foreach (string index in strARRAY)
                {
                    i = int.Parse(index);
                    LB_Citizenship.Items[i - 1].Selected = true;
                }
                CB_IndianX.Checked = false;
            }
            else
            {
                CB_IndianX.Checked = true;
            }
        }
        //---------------------------------------------------------------------------------------------------
        if (objMember.PP_LivingIn.IndexOf("##") >= 0)
        {
            CB_Indian.Checked = true;
        }
        else
        {

            strARRAY = objMember.PP_LivingIn.Split('%');
            if (strARRAY[0].Length != 0)
            {
                foreach (string index in strARRAY)
                {
                    i = int.Parse(index);
                    LB_CountryLiving.Items[i - 1].Selected = true;
                }
                CB_Indian.Checked = false;
            }
            else
            {
                CB_Indian.Checked = true;
            }
        }
        //---------------------------------------------------------------------------------------------------
        if (objMember.PP_ResidingState.IndexOf("##") >= 0)
        {
            CB_StatesInIndia.Checked = false;
            TB_NonIndianState.Text = objMember.PP_ResidingState.Replace("##", "");
        }
        else
        {
            if (objMember.PP_ResidingState.ToLower().IndexOf("any") >= 0)
            {
                LB_Rasident_State.Items[0].Selected = true;
                CB_StatesInIndia.Checked = true;
            }
            else
            {
                strARRAY = objMember.PP_ResidingState.Split('%');
                if (strARRAY[0].Length != 0)
                {
                    foreach (string index in strARRAY)
                    {
                        i = int.Parse(index);
                        LB_Rasident_State.Items[i - 1].Selected = true;
                    }
                    CB_StatesInIndia.Checked = true;
                }
                else
                {
                    CB_StatesInIndia.Checked = false;
                }
            }
        }
        //---------------------------------------------------------------------------------------------------
        if (objMember.PP_ResidingState.ToLower().IndexOf("any") >= 0)
        {
            LB_Rasident_Status.Items[0].Selected = true;
        }
        else
        {
            strARRAY = objMember.PP_ResStatus.Split('%');
            if (strARRAY[0].Length != 0)
            {
                foreach (string index in strARRAY)
                {
                    i = int.Parse(index);
                    LB_Rasident_Status.Items[i - 1].Selected = true;
                }
            }
        }




    }
}
