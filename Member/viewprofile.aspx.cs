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

public partial class viewprofile : System.Web.UI.Page
{
    bool IsBookMark;
    string strMatID = null;
    bool isPaidMember;
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

            bool boolItsMe = false;// Used To Check Am i viewing my profile
            
            // Which Profile Should Be displaed

            // Is By URl
            strMatID = Request.QueryString["matid"];
            IsBookMark = true;
            if(strMatID==null)
            {
                try
                {
                    //Information Form Cookie
                    HttpCookieCollection objHttpCookieCollection = Request.Cookies;
                    HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");
                    strMatID = Crypto.DeCrypto(objHttpCookie.Values["MatrimonialID"]);

                    // User is watching his own profile
                    boolItsMe = true;
                    IsBookMark = false;
                }
                catch (Exception)//Oops Some Error
                {
                    Server.Transfer("../Extras/ErrorReports.aspx?id=Cookie");
                }

            }

            //Setting Title
            this.Title = WebConfig.GetValues("fname") + " Profile No : " + strMatID.ToUpper();


            string strAppID = MatrimonialMemberShip.GetApplicationID(strMatID);

            if (strAppID != null)
            {
                //<< Desabled some features ForTesting>>>>>
               MatMember objMember = new MatMember(strMatID,true, true, true, true, true, true, true, true, true, true);
                

               // Setting Infromations

               // Primari Informations

               L_MID.Text = objMember.MatrimonialID.ToUpper(); ;
               if (objMember.Gender)
               {
                   L_Sex.Text ="Male" ;
               }
               else
               {
                   L_Sex.Text = "Female";
               }

               L_MS.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.MaritalStatus, objMember.MaritialStatus);
               L_Created_by.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.ProfileCreatedBy ,objMember.CreatedBy);
               L_Location.Text = objMember.ResidenceCity;
               L_LogIn_last.Text = objMember.LastLogInDate;
                
               // Setting Printer
               HL_Print.NavigateUrl = "../Member/PrintProfile.aspx?id=" + strMatID;
               HL_Print.Attributes.Add("target", "_blank");


                // Dont Display Name for Non Paid Members
               if (!boolItsMe)
               {
                   //View Horoscope

                   try
                   {
                       //Information Form Cookie
                       HttpCookieCollection objHttpCookieCollection = Request.Cookies;
                       HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");
                       string strMyMatriMon = Crypto.DeCrypto(objHttpCookie.Values["MatrimonialID"]);

                       //Is it my profile
                       if (strMyMatriMon.ToLower() != strMatID.ToLower())
                       {
                           HL_Abuse.Enabled = true;
                           HL_Abuse.Attributes.Add("onclick", "displayDiv5();");
                           HL_Abuse.NavigateUrl = "#";

                           //Express intrests
                           HL_Exp_Int.Enabled = true;
                           HL_Exp_Int.Attributes.Add("onclick", "displayDiv1();");
                           HL_Exp_Int.NavigateUrl = "#";

                           // Is Photo Protected?
                           if (MatrimonialAlbumManager.IsImageProtected(objMember.ApplicationID, MatrimonialAlbumManager.ImageType.Photo))
                           {
                               HL_Photo.ImageUrl = "~/Resources/photoLocked.gif";
                               //Request Photo PAssword
                               HL_RequestPassword_P.Enabled = true;
                               HL_RequestPassword_P.Attributes.Add("onclick", "displayDiv3();");
                               HL_RequestPassword_P.NavigateUrl = "#";
                           }
                           else
                           {
                               LoadPhoto();
                           }

                           //Is Horoscope Protected
                           if (MatrimonialAlbumManager.IsImageProtected(strAppID, MatrimonialAlbumManager.ImageType.Horoscope))
                           {
                               HL_RequestPassword_H.Enabled = true;
                               HL_RequestPassword_H.Attributes.Add("onclick", "displayDiv4();");
                               HL_RequestPassword_H.NavigateUrl = "#";
                           }
                           else
                           {
                               LoadHoro();
                           }

                           //Adding Into Visitors group
                           MatrimonialProfileManager.UpdateVisiters(strMatID, strMyMatriMon);

                           //Does a paidmember
                           if (Crypto.DeCrypto(objHttpCookie.Values["UserType"]) == "PaidMember")
                           {
                               LoadPhoto();
                               isPaidMember = true;

                               L_Name.Text = objMember.Name;
                               L_Name.Visible = true;
                               L_L_Name.Visible = true;
                               L_MemberName.Visible = true;
                               L_MemberName.Text = objMember.Name;
                               Img_Name.Visible = true;

                               // Setting Contact Detaisl Visible 
                               PN_Contact.Visible = true;
                               L_Address.Text = objMember.Address;
                               L_Phone.Text = objMember.ISDCode.ToString() + "-" + objMember.AreaCode.ToString() + "-" + objMember.PhoneNo.ToString();
                               L_Cell.Text = objMember.MobileNO.ToString();

                               //Displaying Message Pannel
                               HL_SendMessage.Enabled = true;
                               HL_SendMessage.Attributes.Add("onclick", "displayDiv2();");
                               HL_SendMessage.NavigateUrl = "#";
                           }
                       }
                       else // Oops Its Me
                       {
                           boolItsMe = true;
                           IsBookMark = false;

                           L_Name.Text = objMember.Name;
                           L_Name.Visible = false;
                           L_L_Name.Visible = true;
                           L_MemberName.Visible = true;
                           L_MemberName.Text = objMember.Name;
                           Img_Name.Visible = true;
                           // Setting Image Visible
                           LoadPhoto();
                           //Setting Horosetting Visible
                           LoadHoro();

                           // Setting Name Visble
                           L_Name.Text = objMember.Name;
                           L_Name.Visible = true;
                           L_L_Name.Visible = true;
                           L_MemberName.Visible = true;
                           L_MemberName.Text = objMember.Name;

                           // Setting Contact Detaisl Visible 
                           PN_Contact.Visible = true;
                           L_Address.Text = objMember.Address;
                           L_Phone.Text = objMember.ISDCode.ToString() + "-" + objMember.AreaCode.ToString() + "-" + objMember.PhoneNo.ToString();
                           L_Cell.Text = objMember.MobileNO.ToString();


                       }
                   }
                   catch (Exception) { }
               }
               else //Its Me
               {
                   // Setting Image Visible
                   LoadPhoto();
                   //Setting Horosetting Visible
                   LoadHoro();

                   // Setting Name Visble
                   L_Name.Text = objMember.Name;
                   L_Name.Visible = true;
                   L_L_Name.Visible = true;
                   L_MemberName.Visible = true;
                   L_MemberName.Text = objMember.Name;

                   // Setting Contact Detaisl Visible 
                   PN_Contact.Visible = true;
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
               if (objMember.AnualIncome != 0)
               {
                   L_AnuIn.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Currency, objMember.IncomeIn);
               }
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
                       L_Hobbies.Text +=FlagX + ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Hobbies, i);
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
               if (objMember.PP_Manglik!=0)
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
                           L_PP_ResidentStatus.Text+= FlagX + ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.ResidenceStatus, i);
                           FlagX = ", ";
                       }
                   }
               }

               ////---------------------------------------------------------------------------------------------------





                
                
                
                
                //About Me

               L_AboutMe.Text = objMember.AboutMe;
               
                //My Expe
               L_MyExp.Text = objMember.MyExpectations;
                //L_MyExp.Text=objMember.m


            }   //if
            else// Matrimonial ID Does not Exists
            {
                Server.Transfer("../Extras/ErrorReport.aspx?id=pnf");
            }
        }
    }

    private void LoadPhoto()
    {
        string strApplicationID = MatrimonialMemberShip.GetApplicationID(strMatID);

        if (MatrimonialAlbumManager.IsAlbumExists(strApplicationID))
        {
            HL_Photo.ImageUrl = "~/Extras/imagecon.aspx?matid=" + strMatID + "&id=1";
            
            HL_Album.Visible = true;
            //Setting Opening Image
            if (MatrimonialAlbumManager.IsImageExists(strApplicationID, MatrimonialAlbumManager.ImageType.Album1))
            {
                HL_Album.Attributes.Add("onclick", "window.open('../Extras/ViewLargeImage.aspx?matid=" + strMatID + "&image=2','LargerImage','scrollbars=no,width=600,height=285')");
            }
            else if (MatrimonialAlbumManager.IsImageExists(strApplicationID, MatrimonialAlbumManager.ImageType.Album2))
            {
                HL_Album.Attributes.Add("onclick", "window.open('../Extras/ViewLargeImage.aspx?matid=" + strMatID + "&image=3','LargerImage','scrollbars=no,width=600,height=285')");
            }
            else if (MatrimonialAlbumManager.IsImageExists(strApplicationID, MatrimonialAlbumManager.ImageType.Album3))
            {
                HL_Album.Attributes.Add("onclick", "window.open('../Extras/ViewLargeImage.aspx?matid=" + strMatID + "&image=4','LargerImage','scrollbars=no,width=600,height=285')");
            }
            else if (MatrimonialAlbumManager.IsImageExists(strApplicationID, MatrimonialAlbumManager.ImageType.Photo))
            {
                HL_Album.Attributes.Add("onclick", "window.open('../Extras/ViewLargeImage.aspx?matid=" + strMatID + "&image=1','LargerImage','scrollbars=no,width=600,height=285')");
            }
            else
            {
                HL_Album.Visible = false;
            }
        }
        else
        {
            HL_Photo.ImageUrl = "~/Resources/nophoto.gif";
        }
    }

    private void LoadHoro()
    { 
    
            string strApplicationID = MatrimonialMemberShip.GetApplicationID(strMatID);

            if (MatrimonialAlbumManager.IsImageExists(strApplicationID,MatrimonialAlbumManager.ImageType.Horoscope))
            {  //If Horoscope Protected
                HL_HoroScope.Visible = true;
                HL_HoroScope.Attributes.Add("onclick", "window.open('../Extras/ViewLargeImage.aspx?matid=" + strMatID + "&image=5','LargerImage','scrollbars=no,width=600,height=285')");
            }
    
    }


    /// <summary>
    /// Sets the iframe AddBookmark button
    /// </summary>
    /// <returns>iframe tag</returns>
    #region "Frame"
    protected string IFrame()
    {
        if (IsBookMark)
        {
            return "<iframe frameborder=\"no\" marginheight=\"0\" marginwidth=\"0\" scrolling=\"no\" unselectable=\"off\" id=\"N1\" style=\"width: 110px; height: 17px\" src=\"../Extras/frame.aspx?id=" + strMatID + "\" ></iframe>";
        }
        else
        {
            return "";
        }
    }

    protected string IntrestFrame()
    {
        if (!IsBookMark)
        {
            return ""; // I am not Intreseted in my profile
        }
        else
        {
            return "<iframe style=\"height: 370px\" src=\"../Member/expressint.aspx?to=" + strMatID + "\" width=\"100%\" frameborder=\"no\" marginheight=\"0\" marginwidth=\"0\" scrolling=\"no\" unselectable=\"off\"></iframe>";
        }
    }

    protected string MessageFrame()
    {
        if (!IsBookMark)
        {
            return "";//I am I will Never send messeage to my mailbox
        }
        else
        {
            if (isPaidMember)//Yes Paid Members
            {
                return "<iframe style=\"height: 300px\" src=\"../Member/SendMessages.aspx?id=" + strMatID + "\" width=\"100%\" frameborder=\"no\" marginheight=\"0\" marginwidth=\"0\" scrolling=\"no\" unselectable=\"off\"></iframe>";
            }
            else
            {
                return "";//Non Paid members canot send message
            }
        }
    }    

    protected string PhotoFrame()
    {
        if (!IsBookMark)
        {
            return "";//I am I will Never ask my Photo password  
        }
        else
        {
            return "<iframe style=\"height: 140px\" src=\"../Member/PasswordRequest.aspx?typ=p&id=" + strMatID + "\" width=\"100%\" frameborder=\"no\" marginheight=\"0\" marginwidth=\"0\" scrolling=\"no\" unselectable=\"off\"></iframe>";
        
            
        }
    }

    protected string HoroFrame()
    {
        if (!IsBookMark)
        {
            return "";//I am I will Never ask my horopassword
        }
        else
        {
            return "<iframe style=\"height: 240px\" src=\"../Member/PasswordRequest.aspx?typ=h&id=" + strMatID + "\" width=\"100%\" frameborder=\"no\" marginheight=\"0\" marginwidth=\"0\" scrolling=\"no\" unselectable=\"off\"></iframe>";
        }
    }

    protected string AbuseFrame()
    {
        if (!IsBookMark)
        {
            return "";//I am I will Never report my profile abuse
        }
        else
        {
            return "<iframe style=\"height: 285px\" src=\"../Extras/ReportAbuse.aspx?typ=prf&id=" + strMatID + "\" width=\"100%\" frameborder=\"no\" marginheight=\"0\" marginwidth=\"0\" scrolling=\"no\" unselectable=\"off\"></iframe>";
        }
    }

    #endregion
    /// <summary>
    /// Methode used to calculate the age given the date of birth
    /// </summary>
    /// <param name="DOB">Date Of Birth</param>
    /// <returns>Age</returns>
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
