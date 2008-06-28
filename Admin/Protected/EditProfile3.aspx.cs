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

public partial class Admin_Protected_EditProfile3 : System.Web.UI.Page
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

                    this.Title = "Editing Member Profile :" + HF_MatID.Value + " Step 3";
                    HL_Step_2.NavigateUrl = "~/Admin/Protected/EditProfile2.aspx?seqtkey=" + HF_Seqt.Value;
                    HL_Step_1.NavigateUrl = "~/Admin/Protected/EditProfile1.aspx?seqtkey=" + HF_Seqt.Value;
                    HL_Step_4.NavigateUrl = "~/Admin/Protected/EditProfile4.aspx?seqtkey=" + HF_Seqt.Value;

                    LoadStep3();
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
    }

    protected void IB_Submit_Step3_Click(object sender, ImageClickEventArgs e)
    {

        sbyte sbyteBrotherToMarry;
        sbyte sbyteSisterToMarry;
        string strApplicationID = MatrimonialMemberShip.GetApplicationID(HF_MatID.Value);
        sbyte sbyteFlage = 0;
        try
        {

        if (strApplicationID != null)
        {

            //Updating About Me
            sbyteFlage = MatrimonialProfileManager.UpdateAboutMe(strApplicationID, TB_AboutME.Text);

            // Setting data for Family Informations

            if (DDL_NoOfBrothersMarried.SelectedIndex != 0)
            { sbyteBrotherToMarry = (sbyte)DDL_NoOfBrothersMarried.SelectedIndex; }
            else { sbyteBrotherToMarry = sbyte.Parse(L_BMarried.Text); }


            if (DDL_NoOFSistersMarried.SelectedIndex != 0)
            { sbyteSisterToMarry = (sbyte)DDL_NoOFSistersMarried.SelectedIndex; }
            else { sbyteSisterToMarry = sbyte.Parse(L_SMarried.Text); }

            //Updating Family Informations

            sbyteFlage += MatrimonialProfileManager.UpdateFamilyInfo(strApplicationID, TB_FamilyDetails.Text, (sbyte)DDL_FamilyValues.SelectedIndex,
                    (sbyte)DDL_FamilyType.SelectedIndex, (sbyte)DDL_FamilyStatus.SelectedIndex, TB_familyOrigin.Text,
                    sbyteBrotherToMarry, sbyteSisterToMarry, RB_Father_Alive.Checked, RB_Mother_Alive.Checked,
                    TB_Father_Occ.Text, TB_Mother_Occ.Text);

            string strHobbiesList = "";
            string Flag = "";
            foreach (ListItem objListItem in LB_Hobbies.Items)
            {
                if (objListItem.Selected)
                {
                    strHobbiesList += Flag + objListItem.Value;
                    Flag = "%";
                }
            }
            Flag = "";
            //Intrests
            string strInterestList = "";
            foreach (ListItem objListItem in LB_Interests.Items)
            {
                if (objListItem.Selected)
                {
                    strInterestList += Flag + objListItem.Value;
                    Flag = "%";
                }
            }
            //Inserting Into Database
            sbyteFlage += MatrimonialProfileManager.InsertHobiesNInterests(strApplicationID, strHobbiesList, TB_OtherHobbies.Text, strInterestList, TB_OtherInterests.Text);


            if (sbyteFlage == 3)
            {
                Server.Transfer("~/Admin/Protected/EditProfile.aspx?id=4&seqtkey=" + HF_Seqt.Value);
            }
            else
            {
                Response.Redirect("~/Extras/ErrorReport.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Extras/ErrorReport.aspx");
        }
    }
    catch (Exception)
    { }

    }
    
    private void LoadStep3()
    {
        txtCount.Text = TB_AboutME.MaxLength.ToString();

        TB_AboutME.Attributes.Add("onKeyUp",
           "javascript:document.getElementById('" + txtCount.ClientID +
           "').setAttribute('value', (" + TB_AboutME.MaxLength +
           " - parseInt(document.getElementById('" + TB_AboutME.ClientID +
           "').getAttribute('value').length)));");





        DDL_FamilyStatus.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.FamilyStatus);
        DDL_FamilyStatus.DataTextField = "Item";
        DDL_FamilyStatus.DataValueField = "Value";
        DDL_FamilyStatus.DataBind();

        DDL_FamilyType.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Familytype);
        DDL_FamilyType.DataTextField = "Item";
        DDL_FamilyType.DataValueField = "Value";
        DDL_FamilyType.DataBind();

        DDL_FamilyValues.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.FamilyValue);
        DDL_FamilyValues.DataTextField = "Item";
        DDL_FamilyValues.DataValueField = "Value";
        DDL_FamilyValues.DataBind();

        LB_Hobbies.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Hobbies);
        LB_Hobbies.DataTextField = "Item";
        LB_Hobbies.DataValueField = "Value";
        LB_Hobbies.DataBind();
        LB_Hobbies.Items.RemoveAt(0);

        LB_Interests.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Interests);
        LB_Interests.DataTextField = "Item";
        LB_Interests.DataValueField = "Value";
        LB_Interests.DataBind();
        LB_Interests.Items.RemoveAt(0);


        //Loading Member Informations
        string strApplicationID = MatrimonialMemberShip.GetApplicationID(HF_MatID.Value);
        MatMember objMember = new MatMember(true, strApplicationID, false, false, false, false, false, false, true, true, true, false);

        TB_AboutME.Text = objMember.AboutMe;
        TB_FamilyDetails.Text = objMember.FamilyDetails;
        TB_familyOrigin.Text = objMember.FamilyOrigin;
        TB_Father_Occ.Text = objMember.FatherOccupation;
        TB_Mother_Occ.Text = objMember.MotherOccupation;

        L_FatherName.Text = objMember.FathersName;
        L_MotherName.Text = objMember.MothersName;
        L_NoOfBrother.Text = objMember.NoOfBrothers.ToString();

        DDL_FamilyStatus.SelectedIndex = objMember.FamilyStatus;
        DDL_FamilyType.SelectedIndex = objMember.FamilyType;
        DDL_FamilyValues.SelectedIndex = objMember.FamilyValues;

        if (objMember.FatherAlive)
        {
            RB_Father_Alive.Checked = true;
        }
        else
        {
            RB_Father_NAlive.Checked = true;
        }

        if (objMember.MotherAlive)
        {
            RB_Mother_Alive.Checked = true;
        }
        else
        {
            RB_Mother_NAlive.Checked = true;
        }

        if (objMember.NoOfBrothers != 6)
        {
            if (objMember.NoOfBrothers == objMember.BrothersMarried)
            {
                L_BMarried.Visible = true;
                L_BMarried.Text = objMember.NoOfBrothers.ToString();
                L_NoOfBrother.Text = objMember.NoOfBrothers.ToString();
                DDL_NoOfBrothersMarried.Visible = false;
            }
            else
            {
                L_NoOfBrother.Text = objMember.NoOfBrothers.ToString();
                DDL_NoOfBrothersMarried.SelectedIndex = objMember.BrothersMarried;

            }
        }
        else
        {
            L_NoOfBrother.Text = "Nill";
            L_BMarried.Visible = true;
            DDL_NoOfBrothersMarried.Visible = false;
            L_BMarried.Text = "Not Applicable";
        }



        if (objMember.NoOfSisters != 6)
        {
            if (objMember.NoOfSisters == objMember.SistersMarried)
            {
                L_SMarried.Visible = true;
                L_SMarried.Text = objMember.NoOfSisters.ToString();
                L_NoOfSister.Text = objMember.NoOfSisters.ToString();
                DDL_NoOFSistersMarried.Visible = false;
            }
            else
            {
                L_NoOfSister.Text = objMember.NoOfSisters.ToString();
                DDL_NoOFSistersMarried.SelectedIndex = objMember.SistersMarried;

            }
        }
        else
        {
            L_NoOfSister.Text = "Nill";
            L_SMarried.Visible = true;
            DDL_NoOFSistersMarried.Visible = false;
            L_SMarried.Text = "Not Applicable";
        }
        //---------------------------------------------------------------------------------------------------
        string[] strAHobbies = objMember.HobbiesList.Split('%');
        int i;
        if (strAHobbies[0].Length != 0)
        {
            foreach (string index in strAHobbies)
            {
                i = int.Parse(index);
                LB_Hobbies.Items[i-1].Selected = true;
            }
        }
        //---------------------------------------------------------------------------------------------------
        string[] strAIntrests = objMember.IntrestList.Split('%');
        if (strAIntrests[0].Length != 0)
        {
            foreach (string index in strAIntrests)
            {
                i = int.Parse(index);
                LB_Interests.Items[i-1].Selected = true;
            }
        }
        //---------------------------------------------------------------------------------------------------
        TB_OtherHobbies.Text = objMember.OtherHobbies;
        TB_OtherInterests.Text = objMember.OtherIntrests;
        //---------------------------------------------------------------------------------------------------


        objMember = null;

    }

  

}
