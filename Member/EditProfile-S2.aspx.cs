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


public partial class Member_EditProfile_S2 : System.Web.UI.Page
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

            //Loading Controls

            // ----------------------------------------------------------------------------------------------
            DDL_Education.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Education);
            DDL_Education.DataTextField = "Item";
            DDL_Education.DataValueField = "Value";
            DDL_Education.DataBind();
            // ----------------------------------------------------------------------------------------------
            DDL_EduDetails.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.EduDetails);
            DDL_EduDetails.DataTextField = "Item";
            DDL_EduDetails.DataValueField = "Value";
            DDL_EduDetails.DataBind();
            // ----------------------------------------------------------------------------------------------
            DDL_AnnualIncome.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.AnnualIncomeRange);
            DDL_AnnualIncome.DataTextField = "Item";
            DDL_AnnualIncome.DataValueField = "Value";
            DDL_AnnualIncome.DataBind();
            // ----------------------------------------------------------------------------------------------
            DDL_Currency.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Currency);
            DDL_Currency.DataTextField = "Item";
            DDL_Currency.DataValueField = "Value";
            DDL_Currency.DataBind();
            // ----------------------------------------------------------------------------------------------
            DDL_Occupation.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Occupation);
            DDL_Occupation.DataTextField = "Item";
            DDL_Occupation.DataValueField = "Value";
            DDL_Occupation.DataBind();
            // ----------------------------------------------------------------------------------------------
            DDL_EmpIn.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.EmployedIn);
            DDL_EmpIn.DataTextField = "Item";
            DDL_EmpIn.DataValueField = "Value";
            DDL_EmpIn.DataBind();
            // ----------------------------------------------------------------------------------------------
            DDL_BGroup.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.BloodGroup);
            DDL_BGroup.DataTextField = "Item";
            DDL_BGroup.DataValueField = "Value";
            DDL_BGroup.DataBind();

            DDL_Diet.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Diet);
            DDL_Diet.DataTextField = "Item";
            DDL_Diet.DataValueField = "Value";
            DDL_Diet.DataBind();
            // ----------------------------------------------------------------------------------------------
            DDL_Country.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Country); ;
            DDL_Country.DataTextField = "Item";
            DDL_Country.DataValueField = "Value";
            DDL_Country.DataBind();
            // ----------------------------------------------------------------------------------------------
            DDL_ResidenceIn.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Country); ;
            DDL_ResidenceIn.DataTextField = "Item";
            DDL_ResidenceIn.DataValueField = "Value";
            DDL_ResidenceIn.DataBind();
            // ----------------------------------------------------------------------------------------------
            DDL_State.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.State); ;
            DDL_State.DataTextField = "Item";
            DDL_State.DataValueField = "Value";
            DDL_State.DataBind();
            // ----------------------------------------------------------------------------------------------
            DDL_ResidentialStatus.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.ResidenceStatus); ;
            DDL_ResidentialStatus.DataTextField = "Item";
            DDL_ResidentialStatus.DataValueField = "Value";
            DDL_ResidentialStatus.DataBind();
            // ----------------------------------------------------------------------------------------------
            short shortCounter;
            DDL_Weight.Items.Insert(0, "-- Select --");
            for (shortCounter = 40; shortCounter <= 140; ++shortCounter)
            {
                DDL_Weight.Items.Add(shortCounter + " KG");
            }


            // ----------------------------------------------------------------------------------------------
            // Lodig selections
            // ----------------------------------------------------------------------------------------------
            // Getting applicationID from Cookie
            HttpCookieCollection objHttpCookieCollection = Request.Cookies;
            HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");

            string strApplicationID = Crypto.DeCrypto(objHttpCookie.Values["ApplicationID"]);
            //If Cookie is working 
            if (strApplicationID != null)
            {
                //Get Member Informations
                MatMember objMember = new MatMember(true, strApplicationID, false, false, false, true, true, true, false, false, false, false);
                DDL_Education.SelectedIndex = objMember.Education;
                DDL_EduDetails.SelectedIndex = objMember.EduDetails;
                DDL_AnnualIncome.SelectedIndex = objMember.AnualIncome;
                DDL_Currency.SelectedIndex = objMember.IncomeIn;
                DDL_Occupation.SelectedIndex = objMember.Occupation;
                DDL_EmpIn.SelectedIndex = objMember.EmployedIn;
                // ----------------------------------------------------------------------------------------------
                L_Height.Text = objMember.Height.ToString() + " Cm"; ;
                DDL_Weight.SelectedIndex = objMember.Weight - 40;
                DDL_BGroup.SelectedIndex = objMember.BloodGroup;
                L_Complexion.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Complexion, objMember.Complexion);
                switch (objMember.BodyType)
                {
                    case 1:
                        RB_BType_Slim.Checked = true;
                        break;
                    case 2:
                        RB_BType_Avg.Checked = true;
                        break;
                    case 3:
                        RB_BType_Ath.Checked = true;
                        break;
                    case 4:
                        RB_BType_Heavy.Checked = true;
                        break;
                    default:
                        break;

                }
                // ----------------------------------------------------------------------------------------------
                DDL_Diet.SelectedIndex = objMember.Diet;

                switch (objMember.Smoke)
                {
                    case 1:
                        RB_Smoke_no.Checked = true;
                        break;
                    case 2:
                        RB_Smoke_Yes.Checked = true;
                        break;
                    case 3:
                        RB_Smoke_Occ.Checked = true;
                        break;
                    default:
                        break;
                }
                // ----------------------------------------------------------------------------------------------
                switch (objMember.Drink)
                {
                    case 1:
                        RB_Drink_No.Checked = true;
                        break;
                    case 2:
                        RB_Drink_Yes.Checked = true;
                        break;
                    case 3:
                        RB_Drink_Occ.Checked = true;
                        break;
                    default:
                        break;
                }
                // ----------------------------------------------------------------------------------------------
                //Contact Details
                // ----------------------------------------------------------------------------------------------
                TB_Address.Text = objMember.Address;

                DDL_Country.SelectedIndex = objMember.Country;

                DDL_State.SelectedIndex = objMember.State;

                TB_City.Text = objMember.City;

                DDL_ResidenceIn.SelectedIndex = objMember.Residence;

                DDL_ResidentialStatus.SelectedIndex = objMember.ResidenceType;

                TB_Phone_ISD.Text = "+" + objMember.ISDCode.ToString();
                TB_Phone_STD.Text = objMember.AreaCode.ToString();
                TB_Phone_NO.Text = objMember.PhoneNo.ToString();

                TB_Phone_Mobile.Text = objMember.MobileNO.ToString();

                TB_RCity.Text = objMember.ResidenceCity;

                objMember = null;
                // ----------------------------------------------------------------------------------------------
            }//If StrApplicationID != Null

        }   //if
        else
        {
            sbyte sbyteFlag = 0;
            string strApplicationID;
            try
            {
                HttpCookieCollection objHttpCookieCollection = Request.Cookies;
                HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");

                strApplicationID = Crypto.DeCrypto(objHttpCookie.Values["ApplicationID"]);
                if (strApplicationID != null)
                {
                    //Inserting  Education and Occupation
                    sbyteFlag = MatrimonialProfileManager.UpdateEducationalInfo(strApplicationID, (sbyte)DDL_Education.SelectedIndex,
                             (sbyte)DDL_EduDetails.SelectedIndex, (sbyte)DDL_AnnualIncome.SelectedIndex,
                             (short)DDL_Currency.SelectedIndex, (sbyte)DDL_Occupation.SelectedIndex,
                             (sbyte)DDL_EmpIn.SelectedIndex);

                    // setting Physical Attributes

                    sbyte sbyteBodyType = 0;
                    sbyte sbyteSmoke = 0;
                    sbyte sbyteDrink = 0;

                    if (RB_BType_Slim.Checked)
                    {
                        sbyteBodyType = 1;
                    }
                    else if (RB_BType_Avg.Checked)
                    {
                        sbyteBodyType = 2;
                    }
                    else if (RB_BType_Ath.Checked)
                    {
                        sbyteBodyType = 3;
                    }
                    else if (RB_BType_Heavy.Checked)
                    {
                        sbyteBodyType = 4;
                    }

                    //Smoking Habite
                    if (RB_Smoke_no.Checked)
                    {
                        sbyteSmoke = 1;
                    }
                    else if (RB_Smoke_Yes.Checked)
                    {
                        sbyteSmoke = 2;
                    }
                    else if (RB_Smoke_Occ.Checked)
                    {
                        sbyteSmoke = 3;
                    }

                    //Drinking Habit
                    if (RB_Drink_No.Checked)
                    {
                        sbyteDrink = 1;
                    }
                    else if (RB_Drink_Yes.Checked)
                    {
                        sbyteDrink = 2;
                    }
                    else if (RB_Drink_Occ.Checked)
                    {
                        sbyteDrink = 3;
                    }

                    // ----------------------------------------------------------------------------------------------
                    //Inserting Physical Attributes
                    sbyteFlag += MatrimonialProfileManager.UpdatePhysicalInfo(strApplicationID,
                                   (short)DDL_Weight.SelectedIndex, (sbyte)DDL_BGroup.SelectedIndex, sbyteBodyType,
                                   (sbyte)DDL_Diet.SelectedIndex, sbyteSmoke, sbyteDrink);
                    // ----------------------------------------------------------------------------------------------
                    //Setting Contact Details 
                    sbyteFlag += MatrimonialProfileManager.UpdateContactInfo(strApplicationID, TB_Address.Text, (short)DDL_Country.SelectedIndex,
                                    (sbyte)DDL_State.SelectedIndex, TB_City.Text, TB_Phone_NO.Text, TB_Phone_STD.Text, TB_Phone_ISD.Text,
                                    TB_Phone_Mobile.Text, (sbyte)DDL_ResidenceIn.SelectedIndex, (sbyte)DDL_ResidentialStatus.SelectedIndex,
                                    TB_RCity.Text);
                    // ----------------------------------------------------------------------------------------------
                }

                if (sbyteFlag == 3)// Every module is updated correctly
                {
                    Response.Redirect("EditProfile-S3.aspx");
                }
                else// Some have some error
                {
                    Server.Transfer("../Extras/ErrorReport.aspx");
                }


            }
            catch (Exception Ex)//Oops Some Error Happend
            {
                ErrorLog.WriteErrorLog("Member-EditProfile S2-PB", Ex);
                Server.Transfer("../Extras/ErrorReport.aspx?id=Cookie");
            }
        }//postbak
        
    }

}
