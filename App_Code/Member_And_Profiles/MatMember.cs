using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Data.SqlClient;

/// <summary>
/// Summary description for MatMember
/// </summary>
public class MatMember
{

    #region "Private Variables"

    //Application Details
    private string strApplicationID;
    //User Details
    private string strUserID;
    private string strMatID;

    // Primary Informations
    private string strIDCreatedOn;
    private string strLastLogInDate;
    private short shortClicks;


    //Basic Informations
    private string strName;
    private sbyte sbyteAge;
    private bool boolGender;
    private DateTime dateDOB;
    private sbyte sbyteMotherTongue;
    private sbyte sbyteMaritialStatus;
    private sbyte sbyteNoOfChildren;
    private bool boolChildrenLivingWith;
    private sbyte sbyteReligion;
    private bool boolPhysicalStatus;
    private short shortCaste;
    private string strSubcast;
    private sbyte sbyteCreatedBy;

    //Socio-Religious Informations
    
    private sbyte sbyteStar;
    private sbyte sbyteMoonSign;
    private sbyte sbyteHoroMatch;
    private string strPlaceOfBirth;
    private DateTime dateTimeOfBirth;
    private sbyte sbyteManglik;

    // Educational and Occupational Informations

    private sbyte sbyteEducation ; 
    private sbyte sbyteEduDetails ;
    private sbyte sbyteAnualIncome;
    private sbyte sbyteIncomeIn ;
    private sbyte sbyteOccupation;
    private sbyte sbyteEmployedIn;

    //Physicl Informations 

    private short shortHeight ;
    private short shortWeight ;
    private sbyte sbyteBloodGroup;
    private sbyte sbyteBodyType ;
    private sbyte sbyteSmoke;
    private sbyte sbyteDrink;
    private sbyte sbyteComplexion;


    // Contacts

    private string strAddress;
    private short shortCountry ;
    private sbyte sbyteState ;
    private string strCity;
    private int intPhoneNo;
    private short shortAreaCode;
    private short shortISDCode;
    private long longMobile ;
    private short shortResidence;
    private sbyte sbyteResidenceType;
    private string strResidenceCity;
    private sbyte sbyteDiet;


    //Hobbies n Intrest

    private string strHobbiesList;
    private string strOtherHobbies;
    private string strIntrestList;
    private string strOtherIntrests;
    private string strLanguage;


    //About Yourself & MyExpectations

    private string strAboutMe;
    private string strMyExpectations;

    //Family details

    private sbyte sbyteNoOfBrothers;
    private sbyte sbyteNoOfSisters;
    private sbyte sbyteBrothersMarried;
    private sbyte sbyteSistersMarried;
    private string strFathersName;
    private string strMothersName;
    private bool boolFatherAlive;
    private bool boolMotherAlive;
    private string strFatherOccupation;
    private string strMotherOccupation;
    private string strFamilyDetails;
    private sbyte sbyteFamilyValues;
    private sbyte sbyteFamilyType;
    private sbyte sbyteFamilyStatus;
    private string strFamilyOrigin;

   // Partner Preferance
    private string str_PP_LookingFor;
    private string str_PP_Complexion;
    private string str_PP_MotherTongue;
    private string str_PP_Religion;
    private string str_PP_Cast;
    private string str_PP_Education;
    private string str_PP_EducationDetails;
    private string str_PP_Occupation;
    private string str_PP_Citizenship;
    private string str_PP_LivingIn;
    private string str_PP_ResidingState;
    private string str_PP_ResStatus;
    private sbyte sbyte_PP_AnnualIncome;
    private sbyte sbyte_PP_AgeMin;
    private sbyte sbyte_PP_AgeMax;
    private sbyte sbyte_PP_HaveChildren;
    private short short_PP_HeightMin;
    private short short_PP_HeightMax;
    private sbyte sbyte_PP_PhysicalStatus;
    private sbyte sbyte_PP_Manglik;
    private sbyte sbyte_PP_Dite;
    #endregion

    #region "Constroctor"

    public MatMember(bool ISAllicationID, string ApplicationID, bool PrimaryInfo,bool BasicInfo, bool SocioReligiousInfo, bool EducationAndOccupation,
        bool PhysicalAttributes,bool ContactDetails,bool AboutYourSelf,bool FamilyDetails,
        bool HobbiesAndInterests ,bool Preference)
	{
        strApplicationID = ApplicationID;
        
        strMatID = MatrimonialMemberShip.GetMatrimonialID(ApplicationID);
        if (PrimaryInfo)
        {
            loadPrimaryInfo();
        }
        if (BasicInfo)
        {
            loadBasicInfo();
        }
        if (SocioReligiousInfo)
        {
            loadSocioReligiousInfo();
        }
        if (EducationAndOccupation)
        {
            loadEduNOcc();
        }
        if (PhysicalAttributes)
        {
            loadPhysicalInfo();
        }
        if (ContactDetails)
        {
            loadContactDetails();
        }
        if (AboutYourSelf || Preference )
        {
            loadAboutYourSelf();
        }
        if (FamilyDetails)
        {
            loadFamilyDetails();
        }
        if (HobbiesAndInterests)
        {
            loadHobbiesAndInterests();
        }
        if (Preference)
        {
            loadPreference();
        }
    }



    public MatMember(string MatrimonialID,bool PrimaryInfo, bool BasicInfo, bool SocioReligiousInfo, bool EducationAndOccupation,
    bool PhysicalAttributes, bool ContactDetails, bool AboutYourSelf, bool FamilyDetails,
    bool HobbiesAndInterests, bool Preference)
    {
        this.strApplicationID = MatrimonialMemberShip.GetApplicationID(MatrimonialID);
        this.strMatID = MatrimonialID;
        if (PrimaryInfo)
        {
            loadPrimaryInfo();
        }
        if (BasicInfo)
        {
            loadBasicInfo();
        }
        if (SocioReligiousInfo)
        {
            loadSocioReligiousInfo();
        }
        if (EducationAndOccupation)
        {
            loadEduNOcc();
        }
        if (PhysicalAttributes)
        {
            loadPhysicalInfo();
        }
        if (ContactDetails)
        {
            loadContactDetails();
        }
        if  (AboutYourSelf || Preference )
        {
            loadAboutYourSelf();
        }
        if (FamilyDetails)
        {
            loadFamilyDetails();
        }
        if (HobbiesAndInterests)
        {
            loadHobbiesAndInterests();
        }
        if (Preference)
        {
            loadPreference();
        }
    }



    #endregion

    #region" Private Methodes"

    private void loadBasicInfo()
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserBasicInformation_GetInformation
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @ApplicationID varchar(25)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    Name - varchar(50) 
                    Gender - bit 
                    DOB - smalldatetime 
                    MotherTongue - smallint 
                    MaritalStatus - smallint 
                    NoOfChildren - smallint - NULL
                    PhysicalStatus - bit
                    ChildrenLivingWith - bit - NULL
                    Religion - smallint 
                    Cast - smallint
                    SubCast - varchar(50) - NULL
                    CreatedBy - smallint 

         * * * * * * * * * * * * * * * * * * * * * * * * * * * */
        
        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            //try
            //{
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserBasicInformation_GetInformation", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
                objCommand.Parameters["@ApplicationID"].Value = strApplicationID;
                
                //Reader starts readiong
                objConnection.Open();
                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();
                strName = objReader["Name"].ToString();
                boolGender = Convert.ToBoolean(objReader["Gender"]);
                dateDOB = Convert.ToDateTime( objReader["DOB"]);
                sbyteMotherTongue = Convert.ToSByte( objReader["MotherTongue"]);
                sbyteMaritialStatus = Convert.ToSByte(objReader["MaritalStatus"]);
                try
                {
                    sbyteNoOfChildren = Convert.ToSByte(objReader["NoOfChildren"]);
                }
                catch (InvalidCastException){ }
                boolPhysicalStatus = Convert.ToBoolean(objReader["PhysicalStatus"]);
                try
                {
                    boolChildrenLivingWith = Convert.ToBoolean(objReader["ChildrenLivingWith"]);
                }
                catch (InvalidCastException){ }
                sbyteReligion = Convert.ToSByte(objReader["Religion"]);
                shortCaste = Convert.ToInt16(objReader["Cast"]);
                try
                {
                    strSubcast = objReader["SubCast"].ToString();
                }
                catch (InvalidCastException){ }
                sbyteCreatedBy = Convert.ToSByte(objReader["CreatedBy"]);

                //}
                //catch (Exception)
                //{
                //}
                //finally
                //{
                //    objReader.Close();
                //    objConnection.Close();
                //}
        }
    }

    private void loadSocioReligiousInfo()
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserSocioReligionAttributes_GetInformation
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @ApplicationID varchar(25)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    Star - smallint
	                MoonSign - smallint
	                HoroscopeMatch - smallint
	                PlaceOfBirth - varchar(64)
	                TimeOfBirth - datetime
	                Manglik - smallint
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */
        
        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            //try
            //{
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserSocioReligionAttributes_GetInformation", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
                objCommand.Parameters["@ApplicationID"].Value = ApplicationID;
                
                //Reader starts readiong
                objConnection.Open();
                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();

                try {
                    sbyteStar = Convert.ToSByte(objReader["Star"]); 
                }
                catch (InvalidCastException) { }
                try {
                    sbyteMoonSign = Convert.ToSByte(objReader["MoonSign"]);
                }
                catch (InvalidCastException) { }
                try {
                    sbyteHoroMatch = Convert.ToSByte(objReader["HoroscopeMatch"]);
                }
                catch (InvalidCastException) { }

               try{
                   strPlaceOfBirth = objReader["PlaceOfBirth"].ToString();
                }
                catch (InvalidCastException){ }

                try {
                    dateTimeOfBirth = Convert.ToDateTime(objReader["TimeOfBirth"]);
                }
                catch (InvalidCastException) { }

                try {
                    sbyteManglik = Convert.ToSByte(objReader["Manglik"]); 
                }
                catch (InvalidCastException) { }



                //}
                //catch (Exception)
                //{
                //}
                //finally
                //{
                //    objReader.Close();
                //    objConnection.Close();
                //}
        }
     }

    private void loadEduNOcc()
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserEducationAndOccupation_GetInformation
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @ApplicationID varchar(25)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
	                Education - smallint 
	                EduDetails - smallint 
	                AnualIncome - smallint - NULL
	                IncomeIn - smallint - NULL
	                Occupation - smallint
	                EmployedIn - smallint
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */
        
        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            //try
            //{
            //Creating Command object
            SqlCommand objCommand = new SqlCommand("UserEducationAndOccupation_GetInformation", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;

            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
            objCommand.Parameters["@ApplicationID"].Value = ApplicationID;

            //Reader starts readiong
            objConnection.Open();
            SqlDataReader objReader = objCommand.ExecuteReader();
            objReader.Read();

            sbyteEducation = Convert.ToSByte(objReader["Education"]);
            sbyteEduDetails = Convert.ToSByte(objReader["EduDetails"]);

            try
            {
                sbyteAnualIncome = Convert.ToSByte(objReader["AnualIncome"]);
            }
            catch (InvalidCastException) { }

            try
            {
                sbyteIncomeIn = Convert.ToSByte(objReader["IncomeIn"]);
            }
            catch (InvalidCastException) { }
            sbyteOccupation = Convert.ToSByte(objReader["Occupation"]);
            sbyteEmployedIn= Convert.ToSByte(objReader["EmployedIn"]);
            

            //}
            //catch (Exception)
            //{
            //}
            //finally
            //{
            //    objReader.Close();
            //    objConnection.Close();
            //}
        }
    }

    private void loadPhysicalInfo()
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserPhysicalAttributes_GetInformation
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @ApplicationID varchar(25)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                	Height - smallint
                    Weight - smallint,
                    BloodGroup - smallint
                    BodyType - smallint- NULL,
                    Smoke - smallint - NULL,
                    Drink - smallint - NULL,
                    Complexion - smallint
                    Diet - smallint
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */
        
        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            //try
            //{
            //Creating Command object
            SqlCommand objCommand = new SqlCommand("UserPhysicalAttributes_GetInformation", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;

            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
            objCommand.Parameters["@ApplicationID"].Value = ApplicationID;

            //Reader starts readiong
            objConnection.Open();
            SqlDataReader objReader = objCommand.ExecuteReader();
            objReader.Read();

            shortHeight = Convert.ToInt16(objReader["Height"]);
            shortWeight = Convert.ToInt16(objReader["Weight"]);

            try
            {
                sbyteBloodGroup = Convert.ToSByte(objReader["BloodGroup"]);
            }
            catch (InvalidCastException) { }

            try
            {
                sbyteBodyType = Convert.ToSByte(objReader["BodyType"]);
            }
            catch (InvalidCastException) { }
            try
            {
                sbyteSmoke = Convert.ToSByte(objReader["Smoke"]);
            }
            catch (InvalidCastException) { }
            try
            {
                sbyteDrink = Convert.ToSByte(objReader["Drink"]);
            }
            catch (InvalidCastException) { } 
            try
            {
                sbyteDiet = Convert.ToSByte(objReader["Diet"]);
            }
            catch (InvalidCastException) { }
            sbyteComplexion = Convert.ToSByte(objReader["Complexion"]);

            //}
            //catch (Exception)
            //{
            //}
            //finally
            //{
            //    objReader.Close();
            //    objConnection.Close();
            //}
        }
    }

    private void loadContactDetails()
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserContactInformations_GetInformation
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @ApplicationID varchar(25)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
	                Address - varchar
	                Country - smallint
	                State - smallint
	                City - varchar
	                PhoneNo - int- NULL
	                AreaCode - smallint- NULL
	                ISDCode - smallint- NULL
	                Mobile - int- NULL
	                Residence - smallint- NULL
	                ResidenceType - smallint- NULL
	                ResidenceCity - varchar - NULL,

         * * * * * * * * * * * * * * * * * * * * * * * * * * * */
        
        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            //try
            //{
            //Creating Command object
            SqlCommand objCommand = new SqlCommand("UserContactInformations_GetInformation", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;

            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
            objCommand.Parameters["@ApplicationID"].Value = ApplicationID;

            //Reader starts readiong
            objConnection.Open();
            SqlDataReader objReader = objCommand.ExecuteReader();
            objReader.Read();

            strAddress = Convert.ToString(objReader["Address"]);
            shortCountry = Convert.ToInt16(objReader["Country"]);
            sbyteState = Convert.ToSByte(objReader["State"]);
            strCity = Convert.ToString(objReader["City"]);

            try
            {
                intPhoneNo = Convert.ToInt32(objReader["PhoneNo"]);
            }
            catch (InvalidCastException) { }

            try
            {
                shortAreaCode = Convert.ToInt16(objReader["AreaCode"]);
            }
            catch (InvalidCastException) { }
            try
            {
                shortISDCode = Convert.ToInt16(objReader["ISDCode"]);
            }
            catch (InvalidCastException) { }
            try
            {
                longMobile = Convert.ToInt64(objReader["Mobile"]);
            }
            catch (InvalidCastException) { }
            try
            {
                shortResidence = Convert.ToInt16(objReader["Residence"]);
            }
            catch (InvalidCastException) { } 
            try
            {
                sbyteResidenceType = Convert.ToSByte(objReader["ResidenceType"]);
            }
            catch (InvalidCastException) { }
            try
            {
                strResidenceCity = objReader["ResidenceCity"].ToString();
            }
            catch (InvalidCastException) { }

            //}
            //catch (Exception)
            //{
            //}
            //finally
            //{
            //    objReader.Close();
            //    objConnection.Close();
            //}
        }
    }

    private void loadAboutYourSelf()
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserAboutAndExpectation_GetAboutME
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @ApplicationID varchar(25)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
	                Address - AboutMe
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */
        
        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            //try
            //{
            //Creating Command object
            SqlCommand objCommand = new SqlCommand("UserAboutAndExpectation_GetAboutME", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;

            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
            objCommand.Parameters["@ApplicationID"].Value = ApplicationID;

            //Reader starts readiong
            objConnection.Open();
            SqlDataReader objReader = objCommand.ExecuteReader();
            objReader.Read();

            strAboutMe = Convert.ToString(objReader["AboutMe"]);

            strMyExpectations = Convert.ToString(objReader["MyExpectations"]);

            //}
            //catch (Exception)
            //{
            //}
            //finally
            //{
            //    objReader.Close();
            //    objConnection.Close();
            //}
        }
     }

    private void loadFamilyDetails()
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserFamilyDetails_GetInformation
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @ApplicationID varchar(25)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    NoOfBrothers - smallint
                    NoOfSisters - smallint
                    BrothersMarried - smallint
                    SistersMarried - smallint
                    FathersName - varchar
                    MothersName - varchar
                    FatherAlive - bit
                    MotherAlive - bit 
                    FatherOccupation - varchar - NULL,
                    MotherOccupation - varchar - NULL,
         	        FamilyDetails - varchar - NULL,
                    FamilyValues - smallint - NULL,
                    FamilyType - smallint - NULL,
                    FamilyStatus - smallint -NULL,
                    FamilyOrigin - varchar - NULL,
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */
        
        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            //try
            //{
            //Creating Command object
            SqlCommand objCommand = new SqlCommand("UserFamilyDetails_GetInformation", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;

            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
            objCommand.Parameters["@ApplicationID"].Value = ApplicationID;

            //Reader starts readiong
            objConnection.Open();
            SqlDataReader objReader = objCommand.ExecuteReader();
            objReader.Read();

            strFathersName = Convert.ToString(objReader["FathersName"]);
            strMothersName = Convert.ToString(objReader["MothersName"]);
            sbyteNoOfSisters = Convert.ToSByte(objReader["NoOfSisters"]);
            sbyteSistersMarried = Convert.ToSByte(objReader["SistersMarried"]);
            sbyteNoOfBrothers = Convert.ToSByte(objReader["NoOfBrothers"]);
            sbyteBrothersMarried = Convert.ToSByte(objReader["BrothersMarried"]);
            boolFatherAlive = Convert.ToBoolean(objReader["FatherAlive"]);
            boolMotherAlive = Convert.ToBoolean(objReader["MotherAlive"]);

            // Optional Components

            try
            {
                strFatherOccupation = Convert.ToString(objReader["FatherOccupation"]);
            }
            catch (InvalidCastException) { }
            try
            {
                strMotherOccupation = Convert.ToString(objReader["MotherOccupation"]);
            }
            catch (InvalidCastException) { }
            try
            {
                strFamilyDetails = Convert.ToString(objReader["FamilyDetails"]);
            }
            catch (InvalidCastException) { }
            try
            {
                strFamilyOrigin = Convert.ToString(objReader["FamilyOrigin"]);
            }
            catch (InvalidCastException) { }
            try
            {
                sbyteFamilyValues = Convert.ToSByte(objReader["FamilyValues"]);
            }
            catch (InvalidCastException) { }
            try
            {
                sbyteFamilyType = Convert.ToSByte(objReader["FamilyType"]);
            }
            catch (InvalidCastException) { }
            try
            {
                sbyteFamilyStatus = Convert.ToSByte(objReader["FamilyStatus"]);
            }
            catch (InvalidCastException) { }


            //}
            //catch (Exception)
            //{
            //}
            //finally
            //{
            //    objReader.Close();
            //    objConnection.Close();
            //}
        }
    }

    private void loadHobbiesAndInterests()
    {
        /// Getting Details of LastLogindate CreatedOn and Clicks


        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserHobiesAndIntrests_GetInformation
        * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
        * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
        * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                   @ApplicationID varchar(25)
        * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                   [Hobies]
			      ,[OtherHobies]
			      ,[Interests]
			      ,[OtherInterests
        * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {

            //try
            //{
            //Creating Command object
            SqlCommand objCommand = new SqlCommand("UserHobiesAndIntrests_GetInformation", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
            objCommand.Parameters["@ApplicationID"].Value = strApplicationID;

            objConnection.Open();
            SqlDataReader objReader = objCommand.ExecuteReader();
            objReader.Read();
            strHobbiesList = objReader["Hobies"].ToString();
            strOtherHobbies = objReader["OtherHobies"].ToString();
            strIntrestList = objReader["Interests"].ToString();
            strOtherIntrests = objReader["OtherInterests"].ToString();

            //}
            //catch (Exception Ex)
            //{
            //    ErrorLog.WriteErrorLog("MatMember-loadPrimaryInfo", Ex);
            //}
            //finally
            //{
            //     objConnection.close
            //}

        }

    }

    private void loadPrimaryInfo()
    {

            /// Getting Details of LastLogindate CreatedOn and Clicks


            /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
            Procedure Name : UserAuthentication_GetLastLogin
            * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
            Type: SELECT 
            * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
            Parameters :
            * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                       @ApplicationID varchar(25)
            * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                       LastLogIN
                       CreatedIN
                       Clicks
            * * * * * * * * * * * * * * * * * * * * * * * * * * * */
        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {


            //try
            //{
            //Creating Command object
            SqlCommand objCommand = new SqlCommand("UserAuthentication_GetLastLogin", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
            objCommand.Parameters["@ApplicationID"].Value = strApplicationID;

            objConnection.Open();
            SqlDataReader objReader = objCommand.ExecuteReader();
            objReader.Read();
            DateTime DateTemp_Login = Convert.ToDateTime(objReader["LastLogIN"]);
            DateTime DateTemp_Created = Convert.ToDateTime(objReader["CreatedIN"]);
            shortClicks = Convert.ToInt16(objReader["Clicks"]);
            objConnection.Close();

            strLastLogInDate = DateTemp_Login.Day + " - " + DateTemp_Login.Month + " - " + DateTemp_Login.Year;
            strIDCreatedOn = DateTemp_Created.Day + " - " + DateTemp_Created.Month + " - " + DateTemp_Created.Year;

            //}
            //catch (Exception Ex)
            //{
            //    ErrorLog.WriteErrorLog("MatMember-loadPrimaryInfo", Ex);
            //}
        }

    }

    private void loadPreference()
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserPartnerPreference_GetData
        * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
        * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
        * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                   @ApplicationID varchar(25)
        * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                  [LookingFor]
                  [AgeMin]
                  [AgeMax]
                  [Complexion]
                  [HaveChildren]
                  [HeightMin]
                  [HeightMax]
                  [PhysicalStatus]
                  [MotherTongue]
                  [Religion]
                  [Cast]
                  [Manglik]
                  [Dite]
                  [Education]
                  [EducationDetails]
                  [AnnualIncome]
                  [Occupation]
                  [Citizenship]
                  [LivingIn]
                  [ResidingState]
                  [ResStatus]
                * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {

            //try
            //{
            //Creating Command object
            SqlCommand objCommand = new SqlCommand("UserPartnerPreference_GetData", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
            objCommand.Parameters["@ApplicationID"].Value = strApplicationID;
            //------------------------------------------------------------------------------------------------
            objConnection.Open();
            SqlDataReader objReader = objCommand.ExecuteReader();
            objReader.Read();
            //------------------------------------------------------------------------------------------------
            str_PP_LookingFor = objReader["LookingFor"].ToString();
            str_PP_Complexion = objReader["Complexion"].ToString();
            str_PP_MotherTongue = objReader["MotherTongue"].ToString();
            str_PP_Religion = objReader["Religion"].ToString();
            str_PP_Cast = objReader["Cast"].ToString();
            str_PP_Education = objReader["Education"].ToString();
            str_PP_EducationDetails = objReader["EducationDetails"].ToString();
            str_PP_Occupation = objReader["Occupation"].ToString();
            str_PP_Citizenship = objReader["Citizenship"].ToString();
            str_PP_LivingIn = objReader["LivingIn"].ToString();
            str_PP_ResidingState = objReader["ResidingState"].ToString();
            str_PP_ResStatus = objReader["ResStatus"].ToString();
            //------------------------------------------------------------------------------------------------
            try
            {
            sbyte_PP_AgeMin = Convert.ToSByte(objReader["AgeMin"]);
            }
            catch (InvalidCastException) { }
            try
            {
            sbyte_PP_AgeMax = Convert.ToSByte(objReader["AgeMax"]);
            }
            catch (InvalidCastException) { }
            try
            {
            sbyte_PP_HaveChildren = Convert.ToSByte(objReader["HaveChildren"]);
            }
            catch (InvalidCastException) { }
            try
            {
            short_PP_HeightMin = Convert.ToInt16(objReader["HeightMin"]);
            }
            catch (InvalidCastException) { }
            try
            {
            short_PP_HeightMax = Convert.ToInt16(objReader["HeightMax"]);
            }
            catch (InvalidCastException) { }
            try
            {
            sbyte_PP_PhysicalStatus = Convert.ToSByte(objReader["PhysicalStatus"]);
            }
            catch (InvalidCastException) { }
            try
            {
            sbyte_PP_AnnualIncome = Convert.ToSByte(objReader["Manglik"]);
            }
            catch (InvalidCastException) { }
            try
            {
            sbyte_PP_Manglik = Convert.ToSByte(objReader["Dite"]);
            }
            catch (InvalidCastException) { }
            try
            {
            sbyte_PP_Dite = Convert.ToSByte(objReader["AnnualIncome"]);
            }
            catch (InvalidCastException) { }
            //------------------------------------------------------------------------------------------------
            //}
            //catch (Exception Ex)
            //{
            //    ErrorLog.WriteErrorLog("MatMember-loadPrimaryInfo", Ex);
            //}
            //finally
            //{
            //      objConnection.Close();
            //}
        }

    }

    #endregion

    #region "Public Properties"

    public string ApplicationID
    {
        get { return strApplicationID; }
    }
    public string MatrimonialID
    {
        get { return strMatID; }
    }


    public string IDCreatedOn
    {
        set { strIDCreatedOn = value; }
        get { return strIDCreatedOn; }
    }
    public string LastLogInDate
    {
        set { strLastLogInDate = value; }
        get { return strLastLogInDate; }
    }
    public short Clicks
    {
        set { shortClicks = value; }
        get { return shortClicks; }
    }








    public string Name
    {
        get { return strName; }
    }
    public sbyte Age 
    {
        get { return sbyteAge; } 
    }
    public bool Gender
    {
        get{ return   boolGender; }
    }
    public DateTime DOB
    {
        get{ return dateDOB ; }
    }
    public sbyte MotherTongue
    {
        get{ return  sbyteMotherTongue; }
    }
    public sbyte MaritialStatus
    {
        get{ return  sbyteMaritialStatus; }
    }
    public sbyte NoOfChildren
    {
        get{ return  sbyteNoOfChildren; }
    }
    public bool ChildrenLivingWith
    {
        get{ return  boolChildrenLivingWith; }
    }
    public sbyte Religion
    {
        get{ return  sbyteReligion; }
    }
    public bool  PhysicalStatus
    {
        get{ return  boolPhysicalStatus; }
    }
    public short Cast
    {
        get{ return  shortCaste; }
    }
    public string Subcast
    {
        get{ return  strSubcast; }
    }
    public sbyte CreatedBy 
    { 
        get { return sbyteCreatedBy; } 
    }

    // Scocio Religious

    public sbyte Star
    {
        get { return sbyteStar; }
    }
    public sbyte MoonSign
    {
        get { return sbyteMoonSign; }
    }
    public sbyte HoroMatch
    {
        get { return sbyteHoroMatch; }
    }
    public string PlaceOfBirth
    {
        get { return strPlaceOfBirth; }
    }
    public DateTime TimeOfBirth
    {
        get { return dateTimeOfBirth; }
    }
    public sbyte Manglik
    {
        get { return sbyteManglik; }
    }

    //Education n OCC

    public sbyte Education
    {
        get { return sbyteEducation; }
    }
    public sbyte EduDetails
    {
        get { return sbyteEduDetails; }
    }
    public sbyte AnualIncome
    {
        get { return sbyteAnualIncome; }
    }
    public sbyte IncomeIn
    {
        get { return sbyteIncomeIn; }
    }
    public sbyte Occupation
    {
        get { return sbyteOccupation; }
    }
    public sbyte EmployedIn
    {
        get { return sbyteEmployedIn; }
    }

    //Physicl Informations  

    public short Height
    {
        get { return shortHeight; }
    }
    public short Weight
    {
        get { return shortWeight; }
    }
    public sbyte BloodGroup
    {
        get { return sbyteBloodGroup; }
    }
    public sbyte BodyType
    {
        get { return sbyteBodyType; }
    }
    public sbyte Smoke
    {
        get { return sbyteSmoke; }
    }
    public sbyte Drink
    {
        get { return sbyteDrink; }
    }
    public sbyte Complexion
    {
        get { return sbyteComplexion; }
    }
    public sbyte Diet
    {
        get { return sbyteDiet; }
    }

    // Contacts

    public string Address
    {
        get { return strAddress; }
    }
    public short Country
    {
        get { return shortCountry; }
    }
    public sbyte State
    {
        get { return sbyteState; }
    }
    public string City
    {
        get { return strCity; }
    }
    public int PhoneNo
    {
        get { return intPhoneNo; }
    }
    public short AreaCode
    {
        get { return shortAreaCode; }
    }
    public short ISDCode
    {
        get { return shortISDCode; }
    }
    public long MobileNO
    {
        get { return longMobile; }
    }
    public short Residence
    {
        get { return shortResidence; }
    }
    public sbyte ResidenceType
    {
        get { return sbyteResidenceType; }
    }
    public string ResidenceCity
    {
        get { return strResidenceCity; }
    }

    // AboutMe n MyExpectations

    public string AboutMe
    {
        get { return strAboutMe; }
    }
    public string MyExpectations
    {
        get { return strMyExpectations; }
    }

    // Family Details

    public sbyte NoOfBrothers
    {
        get { return sbyteNoOfBrothers; }
    }
    public sbyte NoOfSisters
    {
        get { return sbyteNoOfSisters; }
    }
    public sbyte BrothersMarried
    {
        get { return sbyteBrothersMarried; }
    }
    public sbyte FamilyValues
    {
        get { return sbyteFamilyValues; }
    }
    public sbyte FamilyType
    {
        get { return sbyteFamilyType; }
    }
    public sbyte FamilyStatus
    {
        get { return sbyteFamilyStatus; }
    }
    public sbyte SistersMarried
    {
        get { return sbyteSistersMarried; }
    }
    public string FathersName
    {
        get { return strFathersName; }
    }
    public string MothersName
    {
        get { return strMothersName; }
    }
    public string FatherOccupation
    {
        get { return strFatherOccupation; }
    }
    public string MotherOccupation
    {
        get { return strMotherOccupation; }
    }
    public string FamilyDetails
    {
        get { return strFamilyDetails; }
    }
    public string FamilyOrigin
    {
        get { return strFamilyOrigin; }
    }
    public bool FatherAlive
    {
        get { return boolFatherAlive; }
    }
    public bool MotherAlive
    {
        get { return boolMotherAlive; }
    }

    //Hobbies n Intrest

    public string HobbiesList 
    {
        get { return strHobbiesList; } 
    }
    public string OtherHobbies 
    {
        get { return strOtherHobbies; } 
    }
    public string IntrestList 
    {
        get { return strIntrestList; } 
    }
    public string OtherIntrests 
    {
        get { return strOtherIntrests; }
    }
    public string Language 
    {
        get { return strLanguage; }
    }


    // Partner Preferance
    public string PP_LookingFor
    {
        get { return str_PP_LookingFor; } 
    }
    public string PP_Complexion
    { 
        get { return str_PP_Complexion; }
    }
    public string PP_MotherTongue 
    { 
        get { return str_PP_MotherTongue; } 
    }
    public string PP_Religion 
    {
        get { return str_PP_Religion; } 
    }
    public string PP_Caste 
    {
        get { return str_PP_Cast; } 
    }
    public string PP_Education 
    { 
        get { return str_PP_Education; }
    }
    public string PP_EducationDetails
    {
        get { return str_PP_EducationDetails; } 
    }
    public string PP_Occupation 
    {
        get { return str_PP_Occupation; } 
    }
    public string PP_Citizenship
    { 
        get { return str_PP_Citizenship; } 
    }
    public string PP_LivingIn 
    { 
        get { return str_PP_LivingIn; } 
    }
    public string PP_ResidingState 
    {
        get { return str_PP_ResidingState; }
    }
    public string PP_ResStatus 
    {
        get { return str_PP_ResStatus; 
        }
    }
    public sbyte PP_AnnualIncome 
    {
        get { return sbyte_PP_AnnualIncome; }
    }
    public sbyte PP_AgeMin 
    {
        get 
        { 
            return sbyte_PP_AgeMin; 
        }
    }
    public sbyte PP_AgeMax
    {
        get
        { 
            return sbyte_PP_AgeMax;
        } 
    }
    public sbyte PP_HaveChildren 
    {
        get 
        {
            return sbyte_PP_HaveChildren;
        } 
    }
    public short PP_HeightMin 
    { 
        get
        {
            return short_PP_HeightMin;
        } 
    }
    public short PP_HeightMax
    {
        get 
        {
            return short_PP_HeightMax;
        } 
    }
    public sbyte PP_PhysicalStatus
    {
        get 
        {
            return sbyte_PP_PhysicalStatus; 
        } 
    }
    public sbyte PP_Manglik 
    {
        get 
        { 
            return sbyte_PP_Manglik; 
        } 
    }
    public sbyte PP_Dite
    { 
        get 
        {
            return sbyte_PP_Dite;
        } 
    }








    #endregion

}
