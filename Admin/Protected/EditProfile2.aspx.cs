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

public partial class Admin_Protected_EditProfile2 : System.Web.UI.Page
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

                    this.Title = "Editing Member Profile :" + HF_MatID.Value + " Step2";
                    HL_Step_1.NavigateUrl = "~/Admin/Protected/EditProfile1.aspx?seqtkey=" + HF_Seqt.Value;
                    HL_Step_3.NavigateUrl = "~/Admin/Protected/EditProfile3.aspx?seqtkey=" + HF_Seqt.Value;
                    HL_Step_4.NavigateUrl = "~/Admin/Protected/EditProfile4.aspx?seqtkey=" + HF_Seqt.Value;

                    LoadStep2();
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


    protected void IB_Submit_Step2_Click(object sender, ImageClickEventArgs e)
    {
        sbyte sbyteFlag = 0;
        string strApplicationID = MatrimonialMemberShip.GetApplicationID(HF_MatID.Value);

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


            //Inserting Physical Attributes
            sbyteFlag += MatrimonialProfileManager.UpdatePhysicalInfo(strApplicationID,
                           (short)DDL_Weight.SelectedIndex, (sbyte)DDL_BGroup.SelectedIndex, sbyteBodyType,
                           (sbyte)DDL_Diet.SelectedIndex, sbyteSmoke, sbyteDrink);



            //Setting Contact Details 
            sbyteFlag += MatrimonialProfileManager.UpdateContactInfo(strApplicationID, TB_Address.Text, (short)DDL_Country.SelectedIndex,
                            (sbyte)DDL_State.SelectedIndex, TB_City.Text, TB_Phone_NO.Text, TB_Phone_STD.Text, TB_Phone_ISD.Text,
                            TB_Phone_Mobile.Text, (sbyte)DDL_ResidenceIn.SelectedIndex, (sbyte)DDL_ResidentialStatus.SelectedIndex,
                            TB_RCity.Text);

        }

        if (sbyteFlag == 3)// Every module is updated correctly
        {
            Server.Transfer("~/Admin/Protected/EditProfile.aspx?id=3&seqtkey=" + HF_Seqt.Value);
        }
        else// Some have some error
        {
            Server.Transfer("~/Extras/ErrorReport.aspx");
        }

    }


    private void LoadStep2()
    {

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            objConnection.Open();
            try
            {
                SqlCommand objCommand = new SqlCommand("SELECT * FROM IndexEducation", objConnection);
                SqlDataReader objDataReader = objCommand.ExecuteReader();

                DDL_Education.DataSource = objDataReader;
                DDL_Education.DataTextField = "Item";
                DDL_Education.DataValueField = "Value";
                DDL_Education.DataBind();
                objDataReader.Close();

                objCommand = new SqlCommand("SELECT * FROM IndexEduDetails", objConnection);
                objDataReader = objCommand.ExecuteReader();

                DDL_EduDetails.DataSource = objDataReader;
                DDL_EduDetails.DataTextField = "Item";
                DDL_EduDetails.DataValueField = "Value";
                DDL_EduDetails.DataBind();
                objDataReader.Close();

                objCommand = new SqlCommand("SELECT * FROM IndexAnnualIncomeRange", objConnection);
                objDataReader = objCommand.ExecuteReader();

                DDL_AnnualIncome.DataSource = objDataReader;
                DDL_AnnualIncome.DataTextField = "Item";
                DDL_AnnualIncome.DataValueField = "Value";
                DDL_AnnualIncome.DataBind();
                objDataReader.Close();

                objCommand = new SqlCommand("SELECT * FROM IndexCurrency", objConnection);
                objDataReader = objCommand.ExecuteReader();

                DDL_Currency.DataSource = objDataReader;
                DDL_Currency.DataTextField = "Item";
                DDL_Currency.DataValueField = "Value";
                DDL_Currency.DataBind();
                objDataReader.Close();

                objCommand = new SqlCommand("SELECT * FROM IndexOccupation", objConnection);
                objDataReader = objCommand.ExecuteReader();

                DDL_Occupation.DataSource = objDataReader;
                DDL_Occupation.DataTextField = "Item";
                DDL_Occupation.DataValueField = "Value";
                DDL_Occupation.DataBind();
                objDataReader.Close();

                objCommand = new SqlCommand("SELECT * FROM IndexEmployedIn", objConnection);
                objDataReader = objCommand.ExecuteReader();

                DDL_EmpIn.DataSource = objDataReader;
                DDL_EmpIn.DataTextField = "Item";
                DDL_EmpIn.DataValueField = "Value";
                DDL_EmpIn.DataBind();
                objDataReader.Close();

                objCommand = new SqlCommand("SELECT * FROM IndexBloodGroup", objConnection);
                objDataReader = objCommand.ExecuteReader();

                DDL_BGroup.DataSource = objDataReader;
                DDL_BGroup.DataTextField = "Item";
                DDL_BGroup.DataValueField = "Value";
                DDL_BGroup.DataBind();
                objDataReader.Close();


                objCommand = new SqlCommand("SELECT * FROM IndexDiet", objConnection);
                objDataReader = objCommand.ExecuteReader();

                DDL_Diet.DataSource = objDataReader;
                DDL_Diet.DataTextField = "Item";
                DDL_Diet.DataValueField = "Value";
                DDL_Diet.DataBind();
                objDataReader.Close();

                objCommand = new SqlCommand("SELECT * FROM IndexCountry", objConnection);
                objDataReader = objCommand.ExecuteReader();

                DDL_Country.DataSource = objDataReader;
                DDL_Country.DataTextField = "Item";
                DDL_Country.DataValueField = "Value";
                DDL_Country.DataBind();
                objDataReader.Close();

                objDataReader = objCommand.ExecuteReader();

                DDL_ResidenceIn.DataSource = objDataReader;
                DDL_ResidenceIn.DataTextField = "Item";
                DDL_ResidenceIn.DataValueField = "Value";
                DDL_ResidenceIn.DataBind();
                objDataReader.Close();

                objCommand = new SqlCommand("SELECT * FROM IndexState", objConnection);
                objDataReader = objCommand.ExecuteReader();

                DDL_State.DataSource = objDataReader;
                DDL_State.DataTextField = "Item";
                DDL_State.DataValueField = "Value";
                DDL_State.DataBind();
                objDataReader.Close();

                objCommand = new SqlCommand("SELECT * FROM IndexResidenceStatus", objConnection);
                objDataReader = objCommand.ExecuteReader();

                DDL_ResidentialStatus.DataSource = objDataReader;
                DDL_ResidentialStatus.DataTextField = "Item";
                DDL_ResidentialStatus.DataValueField = "Value";
                DDL_ResidentialStatus.DataBind();
                objDataReader.Close();

                short shortCounter;
                DDL_Weight.Items.Insert(0, "-- Select --");
                for (shortCounter = 40; shortCounter <= 140; ++shortCounter)
                {
                    DDL_Weight.Items.Insert(shortCounter - 39, shortCounter + " KG");
                }

                objConnection.Close();
            }
            catch (Exception Ex)
            {
                ErrorLog.WriteErrorLog("Admin-EditProfile:S2-LD", Ex);
                objConnection.Close();
                Server.Transfer("../Extras/ErrorReport.aspx");
            }
        }//using 



        string strApplicationID = MatrimonialMemberShip.GetApplicationID(HF_MatID.Value);
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

            //Contact Details


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

        }
    }



}
