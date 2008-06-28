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

public partial class RegistrationStep2 : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            HttpCookieCollection objHttpCookieCollection = Request.Cookies;
            HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatRegInfo");

            //Getting ApplicationID Value

            // <Meta tag>

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


            //Loading DDL

            //Getting Connection String

            //Connect To database

            DDL_Education.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Education);
            DDL_Education.DataTextField = "Item";
            DDL_Education.DataValueField = "Value";
            DDL_Education.DataBind();
            
            DDL_EduDetails.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.EduDetails);
            DDL_EduDetails.DataTextField = "Item";
            DDL_EduDetails.DataValueField = "Value";
            DDL_EduDetails.DataBind();

            DDL_AnnualIncome.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.AnnualIncomeRange);
            DDL_AnnualIncome.DataTextField = "Item";
            DDL_AnnualIncome.DataValueField = "Value";
            DDL_AnnualIncome.DataBind();

            DDL_Currency.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Currency);
            DDL_Currency.DataTextField = "Item";
            DDL_Currency.DataValueField = "Value";
            DDL_Currency.DataBind();

            DDL_Occupation.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Occupation);
            DDL_Occupation.DataTextField = "Item";
            DDL_Occupation.DataValueField = "Value";
            DDL_Occupation.DataBind();

            DDL_EmpIn.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.EmployedIn);
            DDL_EmpIn.DataTextField = "Item";
            DDL_EmpIn.DataValueField = "Value";
            DDL_EmpIn.DataBind();

            DDL_BGroup.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.BloodGroup);
            DDL_BGroup.DataTextField = "Item";
            DDL_BGroup.DataValueField = "Value";
            DDL_BGroup.DataBind();

            DDL_Complexion.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Complexion);
            DDL_Complexion.DataTextField = "Item";
            DDL_Complexion.DataValueField = "Value";
            DDL_Complexion.DataBind();

            DDL_Diet.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Diet);
            DDL_Diet.DataTextField = "Item";
            DDL_Diet.DataValueField = "Value";
            DDL_Diet.DataBind();

            DDL_Country.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Country);   
            DDL_Country.DataTextField = "Item";
            DDL_Country.DataValueField = "Value";
            DDL_Country.DataBind();

            DDL_ResidenceIn.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Country);
            DDL_ResidenceIn.DataTextField = "Item";
            DDL_ResidenceIn.DataValueField = "Value";
            DDL_ResidenceIn.DataBind();

            DDL_State.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.State);
            DDL_State.DataTextField = "Item";
            DDL_State.DataValueField = "Value";
            DDL_State.DataBind();

            DDL_ResidentialStatus.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.ResidenceStatus);
            DDL_ResidentialStatus.DataTextField = "Item";
            DDL_ResidentialStatus.DataValueField = "Value";
            DDL_ResidentialStatus.DataBind();

            short shortCounter;
            DDL_Weight.Items.Insert(0, "-- Select --");
            for (shortCounter = 40; shortCounter <= 140; ++shortCounter)
            {
                DDL_Weight.Items.Insert(shortCounter - 39, shortCounter + " KG");
            }

            DDL_Height.Items.Insert(0, "-- Select --");
            for (shortCounter = 90; shortCounter <= 185; ++shortCounter)
            {
                DDL_Height.Items.Insert(shortCounter - 89, shortCounter + " CM");
            }

        }
        else
        {

            sbyte sbyteFlag = 0;
            string strApplicationID;
            //try
            //{
            HttpCookieCollection objHttpCookieCollection = Request.Cookies;
            HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatRegInfo");

            strApplicationID = Crypto.DeCrypto(objHttpCookie.Values[0]);

            if (strApplicationID != null)
            {
                //Inserting  Education and Occupation
                sbyteFlag = MatrimonialProfileManager.InsertEducationalInfo(strApplicationID, (sbyte)DDL_Education.SelectedIndex,
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


                //Inserting Physical Attributes
                sbyteFlag += MatrimonialProfileManager.InsertPhysicalInfo(strApplicationID, (short)(DDL_Height.SelectedIndex + 89),
                               (short)DDL_Weight.SelectedIndex, (sbyte)DDL_BGroup.SelectedIndex, sbyteBodyType,
                               (sbyte)DDL_Diet.SelectedIndex, sbyteSmoke, sbyteDrink, (sbyte)DDL_Complexion.SelectedIndex);




                //Setting Contact Details 
                sbyteFlag += MatrimonialProfileManager.InsertContactInfo(strApplicationID, TB_Address.Text, (short)DDL_Country.SelectedIndex,
                                (sbyte)DDL_State.SelectedIndex, TB_City.Text, TB_Phone_NO.Text, TB_Phone_STD.Text, TB_Phone_ISD.Text,
                                TB_Phone_Mobile.Text, (short)DDL_ResidenceIn.SelectedIndex, (sbyte)DDL_ResidentialStatus.SelectedIndex,
                                TB_RCity.Text);

            }

            if (sbyteFlag == 3)
            {
                MatrimonialMemberShip.UpdateIndex(strApplicationID);
                Server.Transfer("RegistrationStep3.aspx");
            }
            else
            {
                Response.Redirect("../Extras/ErrorReport.aspx");
            }


            //}
            //catch (Exception)
            //{
            //    Response.Redirect("../Extras/ErrorReport.aspx?id=Cookie");
            //}
        }
        
        
    }


}
