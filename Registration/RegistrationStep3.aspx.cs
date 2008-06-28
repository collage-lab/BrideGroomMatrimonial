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

public partial class RegistrationStep3 : System.Web.UI.Page
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

            txtCount.Text = TB_AboutME.MaxLength.ToString();

            TB_AboutME.Attributes.Add("onKeyUp",
               "javascript:document.getElementById('" + txtCount.ClientID +
               "').setAttribute('value', (" + TB_AboutME.MaxLength +
               " - parseInt(document.getElementById('" + TB_AboutME.ClientID +
               "').getAttribute('value').length)));");

            //Loading DDLs

            //Getting Connection String

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


        }
        else        // Not postback
        {

            sbyte sbyteFlage = 0;
            //try
            //{
                HttpCookieCollection objHttpCookieCollection = Request.Cookies;
                HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatRegInfo");

                strApplicationID = Crypto.DeCrypto(objHttpCookie.Values["ApplicationID"]);
                if (strApplicationID != null)
                {

                    //About Me 
                    sbyteFlage = MatrimonialProfileManager.InsertAboutMe(strApplicationID, TB_AboutME.Text);
                    // Family Details
                    sbyteFlage += MatrimonialProfileManager.InsertFamilyInfo(strApplicationID, TB_FamilyDetails.Text, (sbyte)DDL_FamilyValues.SelectedIndex,
                            (sbyte)DDL_FamilyType.SelectedIndex, (sbyte)DDL_FamilyStatus.SelectedIndex, TB_familyOrigin.Text,
                            (sbyte)DDL_NoOfBrothers.SelectedIndex, (sbyte)DDL_NoOFSisters.SelectedIndex, (sbyte)DDL_NoOfBrothersMarried.SelectedIndex,
                            (sbyte)DDL_NoOFSistersMarried.SelectedIndex, TB_Father_Name.Text, TB_Mother_name.Text,
                            RB_FLIve.Checked, RB_MLive.Checked, TB_Father_Occ.Text, TB_Mother_Occ.Text);

                    //Hobbies And Interests
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
                        MatrimonialMemberShip.UpdateIndex(strApplicationID);
                        Server.Transfer("RegistrationStep4.aspx");
                    
                    }
                    else
                    {
                        Response.Redirect("../Extras/ErrorReport.aspx");
                    }

                }
                else
                { 
                Response.Redirect("../Extras/ErrorReport.aspx");
                }
            //}
            //catch (Exception)
            //{ }
        }
        

    }


    public int MaxLength
    {
        get { return TB_AboutME.MaxLength; }
        set { TB_AboutME.MaxLength = value; }
    }
}
