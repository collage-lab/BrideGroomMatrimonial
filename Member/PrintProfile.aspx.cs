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

public partial class Member_PrintProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

           bool boolItsMe = false;// Used To Check Am i viewing my profile

            // Which Profile Should Be displaed

            // Is By URl
            string strMatID = Request.QueryString["id"];
            if (strMatID == null)
            {
                try
                {
                    //Information Form Cookie
                    HttpCookieCollection objHttpCookieCollection = Request.Cookies;
                    HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");
                    strMatID = Crypto.DeCrypto(objHttpCookie.Values["MatrimonialID"]);

                    // User is watching his own profile
                    boolItsMe = true;
                }
                catch (Exception)//Oops Some Error
                {
                    Server.Transfer("../Extras/ErrorReports.aspx?id=Cookie");
                }

            }
            string strAppID = MatrimonialMemberShip.GetApplicationID(strMatID);

            if (strAppID != null)
            {
                //<< Desabled some features ForTesting>>>>>
                MatMember objMember = new MatMember(strMatID, true, true, true, true, true, true, true, true, true, true);

                // Is Photo Protected?
                if (MatrimonialAlbumManager.IsImageProtected(objMember.ApplicationID, MatrimonialAlbumManager.ImageType.Photo))
                {
                    if (boolItsMe)
                    {
                        HL_Photo.ImageUrl = "../Extras/imagecon.aspx?matid=" + strMatID + "&id=1";
                    }
                    else
                    {
                        HL_Photo.ImageUrl = "../Resources/photoprocess.jpg";
                    }
                }
                else
                {
                    HL_Photo.ImageUrl = "../Extras/imagecon.aspx?matid=" + strMatID + "&id=1";
                }

                // Setting Infromations

                // Primari Informations

                L_MID.Text = objMember.MatrimonialID.ToUpper();
                if (objMember.Gender)
                {
                    L_Sex.Text = "Male";
                }
                else
                {
                    L_Sex.Text = "Female";
                }

                L_MS.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.MaritalStatus, objMember.MaritialStatus);
                L_Created_by.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.ProfileCreatedBy, objMember.CreatedBy);
                L_Location.Text = objMember.ResidenceCity;
                L_LogIn_last.Text = objMember.LastLogInDate;

                // Dont Display Name for Non Paid Members
                if (!boolItsMe)
                {
                    try
                    {
                        //Information Form Cookie
                        HttpCookieCollection objHttpCookieCollection = Request.Cookies;
                        HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");
                        if (Crypto.DeCrypto(objHttpCookie.Values["UserType"]) == "PaidMember")
                        {
                            L_Name.Text = objMember.Name;
                            L_Name.Visible = true;
                            L_L_Name.Visible = true;
                            L_MemberName.Visible = true;
                            L_MemberName.Text = objMember.Name;

                            // Setting Contact Detaisl Visible 
                            Table_Contact.Visible = true;
                            L_Address.Text = objMember.Address;
                            L_Phone.Text = objMember.ISDCode.ToString() + "-" + objMember.AreaCode.ToString() + "-" + objMember.PhoneNo.ToString();
                            L_Cell.Text = objMember.MobileNO.ToString();
                        }
                    }
                    catch (Exception) { }
                }
                else
                {
                    // Setting Name Visble
                    L_Name.Text = objMember.Name;
                    L_Name.Visible = true;
                    L_L_Name.Visible = true;
                    L_MemberName.Visible = true;
                    L_MemberName.Text = objMember.Name;

                    // Setting Contact Detaisl Visible 
                    Table_Contact.Visible = true;
                    L_Address.Text = objMember.Address;
                    L_Phone.Text = objMember.ISDCode.ToString() + "-" + objMember.AreaCode.ToString() + "-" + objMember.PhoneNo.ToString();
                    L_Cell.Text = objMember.MobileNO.ToString();


                }

                //Fill Contact Details

                //Primary Informations

                L_Age.Text = AgeCalculator(objMember.DOB).ToString();
                L_Height.Text = objMember.Height.ToString() + " Cm";
                L_Weight.Text = objMember.Weight.ToString() + " Kg";
                L_BodyType.Text = "ForTexting";// ControlDataLoader.GetIndexValue("ForTexting");
                L_Complexion.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Complexion, objMember.Complexion);
                L_BloodGroup.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.BloodGroup, objMember.BloodGroup);
                L_MTongue.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.MotherTongue, objMember.MotherTongue);

                if (objMember.PhysicalStatus)
                {
                    L_PhyStatus.Text = "Normal";
                }
                else
                {
                    L_PhyStatus.Text = "Disabled";
                }

                //SocioReligious

                L_Religion.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Religion, objMember.Religion);
                L_Cast.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Cast, objMember.Cast);
                L_Subcast.Text = objMember.Subcast;
                L_Star.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Star, objMember.Star);
                L_MoonSign.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.MoonSign, objMember.MoonSign);
                L_HoroScope.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.HoroManglic, objMember.HoroMatch);
                L_CHova.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.HoroManglic, objMember.Manglik);
                L_SHab.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.SmokeNDrink, objMember.Smoke);
                L_DHa.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.SmokeNDrink, objMember.Drink);
                L_EHab.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Diet, objMember.Diet);

                //Locations

                L_Citizen.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Country, objMember.Country);
                L_CountryLiving.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Country, objMember.Residence);
                L_RState.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.State, objMember.State);
                L_City.Text = objMember.City;
                L_RCity.Text = objMember.ResidenceCity;
                L_RSTatus.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.ResidenceStatus, objMember.ResidenceType);

                //Education 

                L_Edu.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Education, objMember.Education);
                L_Edu_De.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.EduDetails, objMember.EduDetails);
                L_Empl.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.EmployedIn, objMember.EmployedIn);
                L_Occ.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Occupation, objMember.Occupation);
                L_AnIC.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.AnnualIncomeRange, objMember.AnualIncome);
                L_AnuIn.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Currency, objMember.IncomeIn);

                //Family Details

                L_FDetails.Text = objMember.FamilyDetails;
                L_Father.Text = objMember.FathersName;
                if (!objMember.FatherAlive)
                {
                    L_FIsLive.Text = "Not Alive";
                }

                L_FOcc.Text = objMember.FatherOccupation;

                L_Mother.Text = objMember.MothersName;
                if (!objMember.MotherAlive)
                {
                    L_MIsLive.Text = "Not Alive";

                }
                L_MOcc.Text = objMember.MotherOccupation;
                L_Brother.Text = objMember.NoOfBrothers.ToString();
                L_BMarried.Text = objMember.BrothersMarried.ToString();
                L_Sister.Text = objMember.NoOfSisters.ToString();
                L_SMarried.Text = objMember.SistersMarried.ToString();

                L_FamilyOrigin.Text = objMember.FamilyOrigin;
                L_FamilyStatus.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.FamilyStatus, objMember.FamilyStatus);
                L_FamilyType.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Familytype, objMember.FamilyType);
                L_FamilyValues.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.FamilyValue, objMember.FamilyValues);

                //About Me

                L_AboutMe.Text = objMember.AboutMe;

                //My Expe

                L_MyExp.Text = objMember.MyExpectations;


                // Hobbiesa and Intrests
                //---------------------------------------------------------------------------------------------------
                string[] strARRAY = objMember.HobbiesList.Split('%');
                int i;
                string FlagX = "";
                if (strARRAY[0].Length != 0)
                {
                    foreach (string index in strARRAY)
                    {
                        i = int.Parse(index);
                        L_Hobbies.Text += FlagX + ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Hobbies, i);
                        FlagX = ", ";
                    }
                }
                L_Hobbies.Text += FlagX + objMember.OtherHobbies;
                //---------------------------------------------------------------------------------------------------
                strARRAY = objMember.IntrestList.Split('%');

                if (strARRAY[0].Length != 0)
                {
                    FlagX = "";
                    foreach (string index in strARRAY)
                    {
                        i = int.Parse(index);
                        L_Intrests.Text += FlagX + ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Interests, i);
                        FlagX = ", ";
                    }
                }
                L_Intrests.Text += FlagX + objMember.OtherIntrests;
                //---------------------------------------------------------------------------------------------------

                strARRAY = objMember.PP_LookingFor.Split('%');
                if (strARRAY[0].Length != 0)
                {
                    FlagX = "";
                    foreach (string index in strARRAY)
                    {
                        i = int.Parse(index);
                        L_PP_LookingFor.Text += FlagX + ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.MaritalStatus, i);
                        FlagX = ", ";
                    }
                }
                //---------------------------------------------------------------------------------------------------
                L_PP_Age_min.Text = objMember.PP_AgeMin.ToString();
                L_PP_Age_max.Text = objMember.PP_AgeMax.ToString();
                //---------------------------------------------------------------------------------------------------
                strARRAY = objMember.PP_Complexion.Split('%');
                if (strARRAY[0].Length != 0)
                {
                    FlagX = "";
                    foreach (string index in strARRAY)
                    {
                        i = int.Parse(index);
                        L_PP_Complexion.Text += FlagX + ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Complexion, i);
                        FlagX = ", ";
                    }
                }
                //---------------------------------------------------------------------------------------------------
                switch (objMember.PP_HaveChildren)
                {
                    case 1:
                        L_PP_Have_Children.Text = "Doesn't matter";
                        break;
                    case 2: L_PP_Have_Children.Text = "NO";

                        break;
                    case 3: L_PP_Have_Children.Text = "Yes.Living Together";

                        break;
                    case 4: L_PP_Have_Children.Text = "Yes.Not Living Together";

                        break;
                }
                //---------------------------------------------------------------------------------------------------
                L_PP_Height_Min.Text = objMember.PP_HeightMin.ToString();
                L_PP_Height_MAx.Text = objMember.PP_HeightMax.ToString();
                //---------------------------------------------------------------------------------------------------
                switch (objMember.PP_PhysicalStatus)
                {
                    case 1: L_PP_PhysicalStatus.Text = "Normal";
                        break;
                    case 2: L_PP_PhysicalStatus.Text = "Disabled";
                        break;
                    case 3: L_PP_PhysicalStatus.Text = "Doesn't matter";
                        break;
                }
                //---------------------------------------------------------------------------------------------------
                strARRAY = objMember.PP_MotherTongue.Split('%');

                if (strARRAY[0].Length != 0)
                {
                    FlagX = "";
                    foreach (string index in strARRAY)
                    {
                        i = int.Parse(index);
                        L_PP_MotherTongue.Text += FlagX + ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.MotherTongue, i);
                        FlagX = ", ";
                    }
                }
                //---------------------------------------------------------------------------------------------------
                if (objMember.PP_Religion.IndexOf("##") >= 0)
                {
                    L_PP_Religion.Text = "Any";
                }
                else
                {
                    strARRAY = objMember.PP_Religion.Split('%');
                    if (strARRAY[0].Length != 0)
                    {
                        FlagX = "";
                        foreach (string index in strARRAY)
                        {
                            i = int.Parse(index);
                            L_PP_Religion.Text += FlagX + ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Religion, i);
                            FlagX = ", ";
                        }
                    }
                    else
                    {
                        L_PP_Religion.Text = "Any";
                    }
                }
                //---------------------------------------------------------------------------------------------------
                if (objMember.PP_Caste.IndexOf("##") >= 0)
                {
                    L_PP_Caste_Division.Text = "Any";
                }
                else
                {

                    strARRAY = objMember.PP_Caste.Split('%');
                    if (strARRAY[0].Length != 0)
                    {
                        FlagX = "";
                        foreach (string index in strARRAY)
                        {
                            i = int.Parse(index);
                            L_PP_Caste_Division.Text += FlagX + ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Cast, i);
                            FlagX = ", ";
                        }
                    }
                    else
                    {
                        L_PP_Caste_Division.Text = "Any";
                    }
                }
                //---------------------------------------------------------------------------------------------------
                if (objMember.PP_Manglik != 0)
                {
                    L_PP_ChovvaDosham.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.HoroManglic, objMember.PP_Manglik);
                }
                else
                {
                    L_PP_ChovvaDosham.Text = " - ";
                }
                if (objMember.Diet != 0)
                {
                    L_PP_EatingHabits.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Diet, objMember.Diet);
                }
                else
                {
                    L_PP_EatingHabits.Text = " - ";
                }
                //---------------------------------------------------------------------------------------------------
                if (objMember.PP_Education.IndexOf("##") >= 0)
                {
                    L_PP_Education.Text = "Any";
                }
                else
                {
                    strARRAY = objMember.PP_Education.Split('%');
                    if (strARRAY[0].Length != 0)
                    {
                        FlagX = "";
                        foreach (string index in strARRAY)
                        {
                            i = int.Parse(index);
                            L_PP_Education.Text += FlagX + ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Education, i);
                            FlagX = ", ";
                        }
                    }
                    else
                    {
                        L_PP_Education.Text = "Any";
                    }
                }
                //---------------------------------------------------------------------------------------------------
                if (objMember.PP_EducationDetails.IndexOf("##") >= 0)
                {
                    L_PP_EduDetails.Text = "Any";
                }
                else
                {

                    strARRAY = objMember.PP_EducationDetails.Split('%');
                    if (strARRAY[0].Length != 0)
                    {
                        FlagX = "";
                        foreach (string index in strARRAY)
                        {
                            i = int.Parse(index);
                            L_PP_EduDetails.Text += FlagX + ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.EduDetails, i);
                            FlagX = ", ";
                        }
                    }
                    else
                    {
                        L_PP_EduDetails.Text = "Any";
                    }
                }
                //---------------------------------------------------------------------------------------------------
                if (objMember.PP_AnnualIncome != 0)
                {
                    L_PP_Annualincome.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.AnnualIncomeRange, objMember.PP_AnnualIncome);
                }
                else
                {
                    L_PP_Annualincome.Text = " - ";
                }
                //---------------------------------------------------------------------------------------------------
                if (objMember.PP_Occupation.IndexOf("##") >= 0)
                {
                    L_PP_Occupation.Text = "Any";
                }
                else
                {

                    strARRAY = objMember.PP_Occupation.Split('%');
                    if (strARRAY[0].Length != 0)
                    {
                        foreach (string index in strARRAY)
                        {
                            FlagX = "";
                            i = int.Parse(index);
                            L_PP_Occupation.Text += FlagX + ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Occupation, i);
                            FlagX = ", ";
                        }
                    }
                    else
                    {
                        L_PP_Occupation.Text = "Any";
                    }
                }
                //---------------------------------------------------------------------------------------------------
                if (objMember.PP_Citizenship.IndexOf("##") >= 0)
                {
                    L_PP_Citizenship.Text = "Any";
                }
                else
                {

                    strARRAY = objMember.PP_Citizenship.Split('%');
                    if (strARRAY[0].Length != 0)
                    {
                        FlagX = "";
                        foreach (string index in strARRAY)
                        {
                            i = int.Parse(index);
                            L_PP_Citizenship.Text += FlagX + ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Country, i);
                            FlagX = ", ";
                        }
                    }
                    else
                    {
                        L_PP_Citizenship.Text = "Any";
                    }
                }
                //---------------------------------------------------------------------------------------------------
                if (objMember.PP_LivingIn.IndexOf("##") >= 0)
                {
                    L_PP_LivingIN.Text = "Any";
                }
                else
                {

                    strARRAY = objMember.PP_LivingIn.Split('%');
                    if (strARRAY[0].Length != 0)
                    {
                        FlagX = "";
                        foreach (string index in strARRAY)
                        {
                            i = int.Parse(index);
                            L_PP_LivingIN.Text += FlagX + ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Country, i);
                            FlagX = ", ";
                        }
                    }
                    else
                    {
                        L_PP_LivingIN.Text = "Any";
                    }
                }
                //---------------------------------------------------------------------------------------------------
                if (objMember.PP_ResidingState.IndexOf("##") >= 0)
                {
                    L_PP_ResidingState.Text = "Any";
                }
                else
                {
                    if (objMember.PP_ResidingState.ToLower().IndexOf("any") >= 0)
                    {
                        L_PP_ResidingState.Text = "Any";
                    }
                    else
                    {
                        strARRAY = objMember.PP_ResidingState.Split('%');
                        if (strARRAY[0].Length != 0)
                        {
                            FlagX = "";
                            foreach (string index in strARRAY)
                            {
                                i = int.Parse(index);
                                L_PP_ResidingState.Text += FlagX + ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.State, i);
                                FlagX = "";
                            }
                        }
                        else
                        {
                            L_PP_ResidingState.Text = "Any";
                        }
                    }
                }
                //---------------------------------------------------------------------------------------------------
                if (objMember.PP_ResStatus.ToLower().IndexOf("any") >= 0)
                {
                    L_PP_ResidentStatus.Text = "Any";
                }
                else
                {
                    strARRAY = objMember.PP_ResStatus.Split('%');
                    if (strARRAY[0].Length != 0)
                    {
                        FlagX = "";
                        foreach (string index in strARRAY)
                        {
                            i = int.Parse(index);
                            L_PP_ResidentStatus.Text += FlagX + ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.ResidenceStatus, i);
                            FlagX = ", ";
                        }
                    }
                }

                ////---------------------------------------------------------------------------------------------------




            }   //if
            else// Matrimonial ID Does not Exists
            {
                Server.Transfer("../Extras/ErrorReport.aspx?id=pnf");
            }
        }
    }
    private int AgeCalculator(DateTime DOB)
    {
        int intAge = DateTime.Today.Year - DOB.Year;

        if (DOB.Month < DateTime.Today.Month)
        {
            --intAge;
        }
        else if (DOB.Month == DateTime.Today.Month)
        {
            if (DOB.Day < DateTime.Today.Day)
            {
                --intAge;
            }
        }
        return intAge;
    }
}
