using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
//------------------------------------------
using System.Data;
using System.Data.SqlClient;

public class MatrimonialProfileManager
{

    //-------------------------------------------------------------------------------------------------------------
    //------------------------------------------------UPDATING USER PROFILE INFOMATIONS----------------------------
    //-------------------------------------------------------------------------------------------------------------
    public static sbyte UpdateUserSocioReligiousAttributes(string ApplicationID, sbyte Star, sbyte MoonSign, sbyte HoroscopeMatch, string PlaceOfBirth, string TimeOfBirth, sbyte Manglik)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
          PROCEDURE NAME : UserSocioReligionAttributes_UpdateInfo
         * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
          TYPE : UPDATE
         * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
          PARAMETERS:
         * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
                    @ApplicationID - varchar(25)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
                    @Star - smallint = NULL,
                    @MoonSign - smallint = NULL,
                    @HoroscopeMatch - smallint = NULL,
                    @PlaceOfBirth - varchar(50) = NULL,
                    @TimeOfBirth - datetime = NULL,
                    @Manglik - smallint = NULL
         * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {

            //try
            //{

            SqlCommand objCommand = new SqlCommand("UserSocioReligionAttributes_UpdateInfo", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
            // Setting Valuse
            objCommand.Parameters["@ApplicationID"].Value = ApplicationID;

            //Adding new Parameters(NULL)
            if (Star != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@Star", SqlDbType.SmallInt));
                objCommand.Parameters["@Star"].Value = Star;
            }
            if (MoonSign != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@MoonSign", SqlDbType.SmallInt));
                objCommand.Parameters["@MoonSign"].Value = MoonSign;
            }
            if (HoroscopeMatch != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@HoroscopeMatch", SqlDbType.SmallInt));
                objCommand.Parameters["@HoroscopeMatch"].Value = HoroscopeMatch;
            }
            if (PlaceOfBirth != null)
            {
                objCommand.Parameters.Add(new SqlParameter("@PlaceOfBirth", SqlDbType.VarChar));
                objCommand.Parameters["@PlaceOfBirth"].Value = PlaceOfBirth;
            }
            if (TimeOfBirth != null)
            {
                objCommand.Parameters.Add(new SqlParameter("@TimeOfBirth", SqlDbType.SmallDateTime));
                objCommand.Parameters["@TimeOfBirth"].Value = DateTime.Parse(TimeOfBirth);
            }
            if (Manglik != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@Manglik", SqlDbType.SmallInt));
                objCommand.Parameters["@Manglik"].Value = Manglik;
            }


            // Executing Qurey
            objConnection.Open();
            int temp = objCommand.ExecuteNonQuery();
            objConnection.Close();

            return 1;
            //}
            //catch (Exception Ex)
            //{
            //    objConnection.Close();
            //    //ErrorLog.WriteErrorLog("RegistrationStep1", Ex, Server.MapPath("Logs\\ErrorLog.txt"));
            //    return 0;
            //}

        }

    }
    //-------------------------------------------------------------------------------------------------------------
    public static sbyte UpdateUserBasicInformation(string ApplicationID, string ChildrenLivingWith, string SubCast)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure name : UserBasicInformation_UpdateInfo
         * * * * * * * * * * * * * * * * * * * * * * * * *
        Type : UPDATE
         * * * * * * * * * * * * * * * * * * * * * * * * * 
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * 
                    @ApplicationID - Varchar(25) 
         * * * * * * * * *  * * * * * * * * * * * * * * *
                    @NoOfChildren - smallint = null,
                    @ChildrenLivingWith - bit = Null,
                    @SubCast - Varchar(50) = Null,
        * * * * * * * * *  * * * * * * * * * * * * * * */


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            //try 
            //{
            //Inserting data into


            //Creating Command object
            SqlCommand objCommand = new SqlCommand("UserBasicInformation_UpdateInfo", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));

            // Setting Valuse
            objCommand.Parameters["@ApplicationID"].Value = ApplicationID;


            if (ChildrenLivingWith != null)
            {
                objCommand.Parameters.Add(new SqlParameter("@ChildrenLivingWith", SqlDbType.Bit));
                objCommand.Parameters["@ChildrenLivingWith"].Value = bool.Parse(ChildrenLivingWith);
            }
            if (SubCast != null)
            {
                objCommand.Parameters.Add(new SqlParameter("@SubCast", SqlDbType.VarChar));
                objCommand.Parameters["@SubCast"].Value = SubCast;
            }



            // Executing Qurey
            objConnection.Open();
            int temp = objCommand.ExecuteNonQuery();
            objConnection.Close();
            return 1;
            //}
            //catch (Exception Ex)
            //{
            //    objConnection.Close();
            //    //ErrorLog.WriteErrorLog("RegistrationStep1", Ex, Server.MapPath("Logs\\ErrorLog.txt"));
            //    return 0;
            //}

        }

    }
    //-------------------------------------------------------------------------------------------------------------
    public static sbyte UpdatePhysicalInfo(string ApplicationID, short Weight, sbyte BloodGroup, sbyte BodyType, sbyte Diet, sbyte Smoke, sbyte Drink)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
       Procedure Name : UserPhysicalAttributes_UpdateInfo
        * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
       Type: UPDATE  
        * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
       Parameters :
        * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                   @ApplicationID - varchar(25)
                   @Weight - smallint
                   @BloodGroup - smallint
        * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                   @BodyType - smallint = NULL,
                   @Smoke - smallint = NULL,
                   @Drink - smallint = NULL,
                   @Diet - smallint = NULL,
        * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            //try
            //{
            //    //Inserting data into

            //Creating Command object
            SqlCommand objCommand = new SqlCommand("UserPhysicalAttributes_UpdateInfo", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
            objCommand.Parameters.Add(new SqlParameter("@Weight", SqlDbType.SmallInt));
            objCommand.Parameters.Add(new SqlParameter("@BloodGroup", SqlDbType.SmallInt));

            //Adding Values
            objCommand.Parameters["@ApplicationID"].Value = ApplicationID;
            objCommand.Parameters["@Weight"].Value = Weight + 40;
            objCommand.Parameters["@BloodGroup"].Value = BloodGroup;

            // Adding Optional Commponents

            if (Smoke != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@Smoke", SqlDbType.SmallInt));
                objCommand.Parameters["@Smoke"].Value = Smoke;
            }

            if (Drink != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@Drink", SqlDbType.SmallInt));
                objCommand.Parameters["@Drink"].Value = Drink;
            }
            if (BodyType != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@BodyType", SqlDbType.SmallInt));
                objCommand.Parameters["@BodyType"].Value = BodyType;
            }
            if (BodyType != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@Diet", SqlDbType.SmallInt));
                objCommand.Parameters["@Diet"].Value = Diet;
            }


            objConnection.Open();
            int temp = objCommand.ExecuteNonQuery();
            objConnection.Close();

            return 1;
            //}
            //catch (Exception)
            //{ 
            //    objConnection.Close();
            //    return 0;
            //}
        }

    }
    //-------------------------------------------------------------------------------------------------------------
    public static sbyte UpdateMyExpectation(string ApplicationID, string Expectation)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserAboutAndExpectation_UpdateExpectation
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: UPDATE  
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @ApplicationID - varchar(25),
                    @MyExpectations - NVARCHAR(1000) = NULL
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            //try
            //{
            //Inserting data into

            //Creating Command object
            SqlCommand objCommand = new SqlCommand("UserAboutAndExpectation_UpdateExpectation", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
            objCommand.Parameters.Add(new SqlParameter("@MyExpectations", SqlDbType.VarChar));

            objCommand.Parameters["@ApplicationID"].Value = ApplicationID;
            objCommand.Parameters["@MyExpectations"].Value = Expectation;

            objConnection.Open();
            int temp = objCommand.ExecuteNonQuery();
            objConnection.Close();
            return 1;
            //}
            //catch (Exception)
            //{
            //    objConnection.Close();
            //    return 0;
            //}
        }





    }
    //-------------------------------------------------------------------------------------------------------------
    public static void UpdateHobiesNInterests(string p)
    {
        //////////////////////////////////////////////////////////////////////////////////////////////
    }
    //-------------------------------------------------------------------------------------------------------------
    public static sbyte UpdateFamilyInfo(string ApplicationID, string FamilyDetails, sbyte FamilyValues,
           sbyte FamilyType, sbyte FamilyStatus, string FamilyOrigin, sbyte BrothersMarried, sbyte SistersMarried,
           bool FatherAlive, bool MotherAlive, string FatherOccupation, string MotherOccupation)
    {

        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserFamilyDetails_UpdateInfo
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: UPDATE  
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @ApplicationID - varchar(25)
                    @BrothersMarried - smallint 
                    @SistersMarried - smallint
                    @FatherAlive - bit
                    @MotherAlive - bit  
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *
                    @FamilyDetails - varchar(200) = NULL
                    @FamilyValues - smallint  = NULL
                    @FamilyType - smallint  = NULL
                    @FamilyStatus - smallint  = NULL
                    @FamilyOrigin - varchar(50) = NULL
                    @FatherOccupation - varchar(50) = NULL
                    @MotherOccupation - varchar(50) = NULL
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            //try
            //{
            //Inserting data into

            //Creating Command object
            SqlCommand objCommand = new SqlCommand("UserFamilyDetails_UpdateInfo", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
            objCommand.Parameters.Add(new SqlParameter("@BrothersMarried", SqlDbType.SmallInt));
            objCommand.Parameters.Add(new SqlParameter("@SistersMarried", SqlDbType.SmallInt));
            objCommand.Parameters.Add(new SqlParameter("@FatherAlive", SqlDbType.Bit));
            objCommand.Parameters.Add(new SqlParameter("@MotherAlive", SqlDbType.Bit));

            //Adding Values
            objCommand.Parameters["@ApplicationID"].Value = ApplicationID;
            objCommand.Parameters["@BrothersMarried"].Value = BrothersMarried;
            objCommand.Parameters["@SistersMarried"].Value = SistersMarried;
            objCommand.Parameters["@FatherAlive"].Value = FatherAlive;
            objCommand.Parameters["@MotherAlive"].Value = MotherAlive;

            if (FamilyDetails != null)
            {
                objCommand.Parameters.Add(new SqlParameter("@FamilyDetails", SqlDbType.VarChar));
                objCommand.Parameters["@FamilyDetails"].Value = FamilyDetails;
            }
            if (FamilyValues != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@FamilyValues", SqlDbType.SmallInt));
                objCommand.Parameters["@FamilyValues"].Value = FamilyValues;

            }
            if (FamilyType != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@FamilyType", SqlDbType.SmallInt));
                objCommand.Parameters["@FamilyType"].Value = FamilyType;

            }
            if (FamilyStatus != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@FamilyStatus", SqlDbType.SmallInt));
                objCommand.Parameters["@FamilyStatus"].Value = FamilyStatus;

            }

            if (FamilyOrigin != null)
            {
                objCommand.Parameters.Add(new SqlParameter("@FamilyOrigin", SqlDbType.VarChar));
                objCommand.Parameters["@FamilyOrigin"].Value = FamilyOrigin;
            }
            if (FatherOccupation != null)
            {
                objCommand.Parameters.Add(new SqlParameter("@FatherOccupation", SqlDbType.VarChar));
                objCommand.Parameters["@FatherOccupation"].Value = FatherOccupation;
            }
            if (MotherOccupation != null)
            {
                objCommand.Parameters.Add(new SqlParameter("@MotherOccupation", SqlDbType.VarChar));
                objCommand.Parameters["@MotherOccupation"].Value = MotherOccupation;
            }

            objConnection.Open();
            int temp = objCommand.ExecuteNonQuery();
            objConnection.Close();

            return 1;
            //}
            //catch (Exception)
            //{
            //    objConnection.Close();
            //    return 0;
            //}
        }

    }
    //-------------------------------------------------------------------------------------------------------------
    public static sbyte UpdateEducationalInfo(string ApplicationID, sbyte Education, sbyte EduDetails, sbyte AnualIncome, short IncomeIn, sbyte Occupation, sbyte EmployedIn)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserEducationAndOccupation_UpdateInfo
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: UPDATE  
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @ApplicationID - varchar(25)
                    @Education - smallint
                    @EduDetails - smallint
                    @Occupation - smallint 
                    @EmployedIn - smallint 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @AnualIncome - smallint = NULL
                    @IncomeIn - smallint = NULL
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            //try
            //{
            //Inserting data into

            //Creating Command object
            SqlCommand objCommand = new SqlCommand("UserEducationAndOccupation_UpdateInfo", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
            objCommand.Parameters.Add(new SqlParameter("@Education", SqlDbType.SmallInt));
            objCommand.Parameters.Add(new SqlParameter("@EduDetails", SqlDbType.SmallInt));
            objCommand.Parameters.Add(new SqlParameter("@Occupation", SqlDbType.SmallInt));
            objCommand.Parameters.Add(new SqlParameter("@EmployedIn", SqlDbType.SmallInt));

            //Adding Values
            objCommand.Parameters["@ApplicationID"].Value = ApplicationID;
            objCommand.Parameters["@Education"].Value = Education;
            objCommand.Parameters["@EduDetails"].Value = EduDetails;
            objCommand.Parameters["@Occupation"].Value = Occupation;
            objCommand.Parameters["@EmployedIn"].Value = EmployedIn;

            if (AnualIncome != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@AnualIncome", SqlDbType.SmallInt));
                objCommand.Parameters["@AnualIncome"].Value = AnualIncome;
            }
            if (IncomeIn != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@IncomeIn", SqlDbType.SmallInt));
                objCommand.Parameters["@IncomeIn"].Value = IncomeIn;
            }

            objConnection.Open();
            int temp = objCommand.ExecuteNonQuery();
            objConnection.Close();

            return 1;
            //}
            //catch (Exception)
            //{ 
            //    objConnection.Close();
            //    return 0;
            //}
        }


    }
    //-------------------------------------------------------------------------------------------------------------
    public static sbyte UpdateContactInfo(string ApplicationID, string Address, short Country, sbyte State, string City,
           string PhoneNo, string AreaCode, string ISDCode, string MobileNo, sbyte Residence,
           sbyte ResidenceType, string ResidenceCity)
    {


        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserContactInformations_UpdateInfo
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: UPDATE  
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @ApplicationID - varchar(25)
                    @Address - varchar(350)
                    @Country - smallint
                    @State - smallint
                    @City - varchar(50)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @ResidenceCity - varchar
                    @@PhoneNo  - int = NULL,
                    @AreaCode - smallint = NULL,
                    @ISDCode smallint = NULL,
                    @Mobile - Bigint = NULL,
                    @Residence - smallint = NULL,
                    @ResidenceType - smallint = NULL,
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            //try
            //{
            //Inserting data into

            //Creating Command object
            SqlCommand objCommand = new SqlCommand("UserContactInformations_UpdateInfo", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
            objCommand.Parameters.Add(new SqlParameter("@Address", SqlDbType.VarChar));
            objCommand.Parameters.Add(new SqlParameter("@Country", SqlDbType.SmallInt));
            objCommand.Parameters.Add(new SqlParameter("@State", SqlDbType.SmallInt));
            objCommand.Parameters.Add(new SqlParameter("@City", SqlDbType.VarChar));

            //Adding Values
            objCommand.Parameters["@ApplicationID"].Value = ApplicationID;
            objCommand.Parameters["@Address"].Value = Address;
            objCommand.Parameters["@Country"].Value = Country;
            objCommand.Parameters["@State"].Value = State;
            objCommand.Parameters["@City"].Value = City;

            if (ResidenceCity != null)
            {
                objCommand.Parameters.Add(new SqlParameter("@ResidenceCity", SqlDbType.VarChar));
                objCommand.Parameters["@ResidenceCity"].Value = ResidenceCity;
            }
            if (MobileNo != null)
            {
                objCommand.Parameters.Add(new SqlParameter("@Mobile", SqlDbType.BigInt));
                objCommand.Parameters["@Mobile"].Value = long.Parse(MobileNo);
            }
            if (Residence != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@Residence", SqlDbType.SmallInt));
                objCommand.Parameters["@Residence"].Value = Residence;
            }
            if (ResidenceType != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@ResidenceType", SqlDbType.SmallInt));
                objCommand.Parameters["@ResidenceType"].Value = ResidenceType;
            }
            if (PhoneNo != null)
            {
                objCommand.Parameters.Add(new SqlParameter("@PhoneNo", SqlDbType.Int));
                objCommand.Parameters["@PhoneNo"].Value = int.Parse(PhoneNo);
            }
            if (AreaCode != null)
            {
                objCommand.Parameters.Add(new SqlParameter("@AreaCode", SqlDbType.SmallInt));
                objCommand.Parameters["@AreaCode"].Value = short.Parse(AreaCode);
            }
            if (ISDCode != null)
            {
                objCommand.Parameters.Add(new SqlParameter("@ISDCode", SqlDbType.SmallInt));
                objCommand.Parameters["@ISDCode"].Value = short.Parse(ISDCode);
            }

            objConnection.Open();
            int temp = objCommand.ExecuteNonQuery();
            objConnection.Close();

            return 1;
            //    }
            //    catch (Exception)
            //    {
            //        objConnection.Close();
            //        return 0;
            //    }
            //}

        }
    }
    //-------------------------------------------------------------------------------------------------------------
    public static sbyte UpdateAboutMe(string ApplicationID, string AboutMe)
    {

        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserAboutAndExpectation_UpdateAboutMe
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: UPDATE  
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @ApplicationID varchar(25) = NULL,
                    @AboutMe varchar(1000) = NULL
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            //try
            //{
            //Inserting data into

            //Creating Command object
            SqlCommand objCommand = new SqlCommand("UserAboutAndExpectation_UpdateAboutMe", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
            objCommand.Parameters.Add(new SqlParameter("@AboutMe", SqlDbType.VarChar));

            //Adding Values
            objCommand.Parameters["@ApplicationID"].Value = ApplicationID;
            objCommand.Parameters["@AboutMe"].Value = AboutMe;

            objConnection.Open();
            int temp = objCommand.ExecuteNonQuery();
            objConnection.Close();

            return 1;
            //}
            //catch (Exception)
            //{
            //    objConnection.Close();
            //    return 0;
            //}
        }
    }
    //-------------------------------------------------------------------------------------------------------------
    public static void UpdateVisiters(string MatrimonialID, string Visitor)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name :  UserVisiters_AddList
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: INSERT/UPDATE 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
	            @MartimonialID varchar(15),
	            @visitor varchar(15)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  */
        bool boolFlag = false;
        using (SqlConnection objSqlConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                objSqlConnection.Open();
                SqlCommand objSqlCommand = new SqlCommand("UserVisiters_AddList", objSqlConnection);
                objSqlCommand.CommandType = CommandType.StoredProcedure;

                objSqlCommand.Parameters.Add(new SqlParameter("@MartimonialID", SqlDbType.VarChar));
                objSqlCommand.Parameters["@MartimonialID"].Value = MatrimonialID;
                objSqlCommand.Parameters.Add(new SqlParameter("@visitor", SqlDbType.VarChar));
                objSqlCommand.Parameters["@visitor"].Value = Visitor;

                int temp = objSqlCommand.ExecuteNonQuery();
            }
            catch (Exception) { }
            finally { objSqlConnection.Close(); }

        }
    }

    
    //-------------------------------------------------------------------------------------------------------------
    //------------------------------------------------READING USER PROFILE INFOMATIONS----------------------------
    //-------------------------------------------------------------------------------------------------------------

    public static string[] GetVisitersList(string MatrimonialID)
    {

        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserVisiters_GetList
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :UserVisiters_AddList
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                   MatrimonialID
                   visitor1
                   visitor2
                   visitor3
                   visitor4
                   visitor5
                   visitor6
                   visitor7
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        string[] strATemp = new string[7];

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserVisiters_GetList", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding Parameters
                objCommand.Parameters.Add(new SqlParameter("@MartimonialID", SqlDbType.VarChar));
                objCommand.Parameters["@MartimonialID"].Value = MatrimonialID;

                objConnection.Open();
                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();
                strATemp[0] = objReader["visitor1"].ToString();
                strATemp[1] = objReader["visitor2"].ToString();
                strATemp[2] = objReader["visitor3"].ToString();
                strATemp[3] = objReader["visitor4"].ToString();
                strATemp[4] = objReader["visitor5"].ToString();
                strATemp[5] = objReader["visitor6"].ToString();
                strATemp[6] = objReader["visitor7"].ToString();
                objConnection.Close();
            }
            catch (Exception)
            {
                objConnection.Close();
            }
            return strATemp;
        }
    }
    //-------------------------------------------------------------------------------------------------------------
    public static string[] GetBookMarkList(int Start, string MatrimonialID)
    {

        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserBookMark_GetList
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                   Link
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        string[] strATemp = new string[10];

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserBookMark_GetList", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding Parameters
                objCommand.Parameters.Add(new SqlParameter("@MatrimonialID", SqlDbType.VarChar));
                objCommand.Parameters["@MatrimonialID"].Value = MatrimonialID;
                objConnection.Open();
                SqlDataReader objReader = objCommand.ExecuteReader();

                short i = 0;
                for (i = 0; i <= Start; i++)
                {
                    objReader.Read();
                }
                try
                {
                    for (i = 0; i <= 9; i++)
                    {
                        strATemp[i] = objReader["Link"].ToString();
                        objReader.Read();
                    }
                }
                catch (Exception)
                {
                    objConnection.Close();
                    return strATemp;
                }

                objConnection.Close();
                return strATemp;

            }
            catch (Exception)
            {
                objConnection.Close();
                return null;
            }

        }
    }
    //-------------------------------------------------------------------------------------------------------------
    public static void BookMark(string MatrimonialID, string LinkID, bool IsRemove)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
          Procedure Name :  UserBookMark_Mark
           * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
          Type: INSERT / DELETE
           * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
          Parameter :
           * * * * * * * * * * * * * * * * * * * * * * * * * * * *
                  @MatrimonialID varchar(15), 
                  @LinkID varchar(15) 
                  @Falg = 0
           * * * * * * * * * * * * * * * * * * * * * * * * * * * *  */

        using (SqlConnection objSqlConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Starts DB
                SqlCommand objSqlCommand = new SqlCommand("UserBookMark_Mark", objSqlConnection);
                objSqlCommand.CommandType = CommandType.StoredProcedure;

                objSqlCommand.Parameters.Add(new SqlParameter("@MatrimonialID", SqlDbType.VarChar));
                objSqlCommand.Parameters.Add(new SqlParameter("@LinkID", SqlDbType.VarChar));

                objSqlCommand.Parameters["@MatrimonialID"].Value = MatrimonialID ;
                objSqlCommand.Parameters["@LinkID"].Value = LinkID ;

                if (IsRemove)
                {
                    objSqlCommand.Parameters.Add(new SqlParameter("@Falg", SqlDbType.SmallInt));
                    objSqlCommand.Parameters["@Falg"].Value = 1;
                }
                objSqlConnection.Open();
                int temp = objSqlCommand.ExecuteNonQuery();
            }
            catch (Exception) { }
            finally { objSqlConnection.Close(); }

        }
    }
    //-------------------------------------------------------------------------------------------------------------
    public static int GetBookMarkCount(string MatrimonialID)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserBookMark_ListCount 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                        @MatrimonialID
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserBookMark_ListCount", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;

                objCommand.Parameters.Add(new SqlParameter("@MatrimonialID", SqlDbType.VarChar));
                objCommand.Parameters["@MatrimonialID"].Value = MatrimonialID;

                objConnection.Open();
                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();
                int strInt = objReader.GetInt32(0);
                objReader.Close();
                objConnection.Close();

                return strInt;
            }
            catch (Exception)
            {
                return 0;
            }
        }
    }
    //-------------------------------------------------------------------------------------------------------------
    //------------------------------------------------iNSERTING NEW USER PROFILE INFOMATIONS----------------------------
    //-------------------------------------------------------------------------------------------------------------


    public static sbyte InsertSocioReligiousInfo(string ApplicationID, sbyte Star, sbyte MoonSign, sbyte HoroscopeMatch, string PlaceOfBirth, string TimeOfBirth, sbyte Manglik)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
          PROCEDURE NAME : UserSocioReligionAttributes_InsertInfo
         * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
          TYPE : INSERT
         * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
          PARAMETERS:
         * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
                    @ApplicationID - varchar(25)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
                    @Star - smallint = NULL,
                    @MoonSign - smallint = NULL,
                    @HoroscopeMatch - smallint = NULL,
                    @PlaceOfBirth - varchar(50) = NULL,
                    @TimeOfBirth - datetime = NULL,
                    @Manglik - smallint = NULL
         * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {

            //try
            //{

            SqlCommand objCommand = new SqlCommand("UserSocioReligionAttributes_InsertInfo", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
            // Setting Valuse
            objCommand.Parameters["@ApplicationID"].Value = ApplicationID;

            //Adding new Parameters(NULL)
            if (Star != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@Star", SqlDbType.SmallInt));
                objCommand.Parameters["@Star"].Value = Star;
            }
            if (MoonSign != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@MoonSign", SqlDbType.SmallInt));
                objCommand.Parameters["@MoonSign"].Value = MoonSign;
            }
            if (HoroscopeMatch != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@HoroscopeMatch", SqlDbType.SmallInt));
                objCommand.Parameters["@HoroscopeMatch"].Value = HoroscopeMatch;
            }
            if (PlaceOfBirth != null)
            {
                objCommand.Parameters.Add(new SqlParameter("@PlaceOfBirth", SqlDbType.VarChar));
                objCommand.Parameters["@PlaceOfBirth"].Value = PlaceOfBirth;
            }
            if (TimeOfBirth != null)
            {
                objCommand.Parameters.Add(new SqlParameter("@TimeOfBirth", SqlDbType.SmallDateTime));
                objCommand.Parameters["@TimeOfBirth"].Value = DateTime.Parse(TimeOfBirth);
            }
            if (Manglik != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@Manglik", SqlDbType.SmallInt));
                objCommand.Parameters["@Manglik"].Value = Manglik;
            }


            // Executing Qurey
            objConnection.Open();
            int temp = objCommand.ExecuteNonQuery();
            objConnection.Close();

            return 1;
            //}
            //catch (Exception Ex)
            //{
            //    objConnection.Close();
            //    //ErrorLog.WriteErrorLog("RegistrationStep1", Ex, Server.MapPath("Logs\\ErrorLog.txt"));
            //    return 0;
            //}

        }

    }
    //-------------------------------------------------------------------------------------------------------------
    public static sbyte InsertPhysicalInfo(string ApplicationID, short Height, short Weight, sbyte BloodGroup, sbyte BodyType, sbyte Diet, sbyte Smoke, sbyte Drink, sbyte Complexion)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserPhysicalAttributes_InsertInfo
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: INSERT  
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @ApplicationID - varchar(25)
                    @Height - smallint
                    @Weight - smallint
                    @BloodGroup - smallint
                    @Complexion - smallint
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @BodyType - smallint = NULL,
                    @Smoke - smallint = NULL,
                    @Drink - smallint = NULL,
                    @Diet - smallint = NULL,
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //    //Inserting data into

                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserPhysicalAttributes_InsertInfo", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
                objCommand.Parameters.Add(new SqlParameter("@Height", SqlDbType.SmallInt));
                objCommand.Parameters.Add(new SqlParameter("@Weight", SqlDbType.SmallInt));
                objCommand.Parameters.Add(new SqlParameter("@BloodGroup", SqlDbType.SmallInt));
                objCommand.Parameters.Add(new SqlParameter("@Complexion", SqlDbType.SmallInt));

                //Adding Values
                objCommand.Parameters["@ApplicationID"].Value = ApplicationID;
                objCommand.Parameters["@Height"].Value = Height;
                objCommand.Parameters["@Weight"].Value = Weight + 40;
                objCommand.Parameters["@BloodGroup"].Value = BloodGroup;
                objCommand.Parameters["@Complexion"].Value = Complexion;

                // Adding Optional Commponents

                if (Smoke != 0)
                {
                    objCommand.Parameters.Add(new SqlParameter("@Smoke", SqlDbType.SmallInt));
                    objCommand.Parameters["@Smoke"].Value = Smoke;
                }

                if (Drink != 0)
                {
                    objCommand.Parameters.Add(new SqlParameter("@Drink", SqlDbType.SmallInt));
                    objCommand.Parameters["@Drink"].Value = Drink;
                }
                if (BodyType != 0)
                {
                    objCommand.Parameters.Add(new SqlParameter("@BodyType", SqlDbType.SmallInt));
                    objCommand.Parameters["@BodyType"].Value = BodyType;
                }
                if (BodyType != 0)
                {
                    objCommand.Parameters.Add(new SqlParameter("@Diet", SqlDbType.SmallInt));
                    objCommand.Parameters["@Diet"].Value = Diet;
                }


                objConnection.Open();
                int temp = objCommand.ExecuteNonQuery();
                objConnection.Close();

                return 1;
            }
            catch (Exception)
            {
                objConnection.Close();
                return 0;
            }
        }

    }
    //-------------------------------------------------------------------------------------------------------------
    public static sbyte InsertPartnerPreferance(string ApplicationID, string MaritalStatusList,
           sbyte AgeMin, sbyte AgeMax, string ComplexionList, sbyte ChildrenStatus, int HeightMin, int HeightMax,
           sbyte PhysicalStatus, string MotherTongueList, string ReligionList, string CasteList,
           int Manglik, int Dite, string EducationList, string EduDetailsList, int AnualIncome,
           string OccupationList, string CitizenshipList, string CountryLivinginList, string StateList,
           string ResidentStatus)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : [UserPartnerPreference_DataHandler] 
       * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: INSERT  
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    	@ApplicationID varchar(25)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                           @LookingFor varchar(10)= NULL
                           @AgeMin  smallint = NULL
                           @AgeMax  smallint = NULL
                           @Complexion varchar(30)= NULL
                           @HaveChildren  smallint = NULL
                           @HeightMin  smallint = NULL
                           @HeightMax  smallint = NULL
                           @PhysicalStatus  smallint = NULL
                           @MotherTongue varchar(150)= NULL
                           @Religion varchar(25)= NULL
                           @Caste varchar(650)= NULL
                           @Manglik  smallint = NULL
                           @Dite  smallint = NULL
                           @Education varchar(25)= NULL
                           @EducationDetails varchar(64)= NULL
                           @AnnualIncome  smallint = NULL
                           @Occupation varchar(280)= NULL
                           @Citizenship varchar(800)= NULL
                           @LivingIn varchar(800)= NULL
                           @ResidingState varchar(100)= NULL
                           @ResStatus varchar(20)= NULL
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            //try
            //{
            //Inserting data into

            //Creating Command object
            SqlCommand objCommand = new SqlCommand("UserPartnerPreference_DataHandler", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
            objCommand.Parameters["@ApplicationID"].Value = ApplicationID;


            if (MaritalStatusList != "")
            {
                objCommand.Parameters.Add(new SqlParameter("@LookingFor", SqlDbType.VarChar));
                objCommand.Parameters["@LookingFor"].Value = MaritalStatusList;
            }
            if (AgeMin != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@AgeMin", SqlDbType.SmallInt));
                objCommand.Parameters["@AgeMin"].Value = (sbyte)AgeMin;
            }
            if (AgeMax != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@AgeMax", SqlDbType.SmallInt));
                objCommand.Parameters["@AgeMax"].Value = (sbyte)AgeMax;
            }
            if (ComplexionList != "")
            {
                objCommand.Parameters.Add(new SqlParameter("@Complexion", SqlDbType.VarChar));
                objCommand.Parameters["@Complexion"].Value = ComplexionList;
            }
            if (ChildrenStatus != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@HaveChildren", SqlDbType.SmallInt));
                objCommand.Parameters["@HaveChildren"].Value = (sbyte)ChildrenStatus;
            }
            if (HeightMin != 89)
            {
                objCommand.Parameters.Add(new SqlParameter("@HeightMin", SqlDbType.SmallInt));
                objCommand.Parameters["@HeightMin"].Value = (short)HeightMin;
            }
            if (HeightMax != 89)
            {
                objCommand.Parameters.Add(new SqlParameter("@HeightMax", SqlDbType.SmallInt));
                objCommand.Parameters["@HeightMax"].Value = (short)HeightMax;
            }
            if (PhysicalStatus != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@PhysicalStatus", SqlDbType.SmallInt));
                objCommand.Parameters["@PhysicalStatus"].Value = (sbyte)PhysicalStatus;
            }
            if (MotherTongueList != "")
            {
                objCommand.Parameters.Add(new SqlParameter("@MotherTongue", SqlDbType.VarChar));
                objCommand.Parameters["@MotherTongue"].Value = MotherTongueList;
            }
            if (ReligionList != "")
            {
                objCommand.Parameters.Add(new SqlParameter("@Religion", SqlDbType.VarChar));
                objCommand.Parameters["@Religion"].Value = ReligionList;
            }
            if (CasteList != "")
            {
                objCommand.Parameters.Add(new SqlParameter("@Caste", SqlDbType.VarChar));
                objCommand.Parameters["@Caste"].Value = CasteList;
            }
            if (Manglik != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@Manglik", SqlDbType.SmallInt));
                objCommand.Parameters["@Manglik"].Value = (sbyte)Manglik;
            }
            if (Dite != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@Dite", SqlDbType.SmallInt));
                objCommand.Parameters["@Dite"].Value = (sbyte)Dite;
            }
            if (EducationList != "")
            {
                objCommand.Parameters.Add(new SqlParameter("@Education", SqlDbType.VarChar));
                objCommand.Parameters["@Education"].Value = EducationList;
            }
            if (EduDetailsList != "")
            {
                objCommand.Parameters.Add(new SqlParameter("@EducationDetails", SqlDbType.VarChar));
                objCommand.Parameters["@EducationDetails"].Value = EduDetailsList;
            }
            if (AnualIncome != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@AnnualIncome", SqlDbType.VarChar));
                objCommand.Parameters["@AnnualIncome"].Value = (sbyte)AnualIncome;
            }
            if (OccupationList != "")
            {
                objCommand.Parameters.Add(new SqlParameter("@Occupation", SqlDbType.VarChar));
                objCommand.Parameters["@Occupation"].Value = OccupationList;
            }
            if (CitizenshipList != "")
            {
                objCommand.Parameters.Add(new SqlParameter("@Citizenship", SqlDbType.VarChar));
                objCommand.Parameters["@Citizenship"].Value = CitizenshipList;
            }
            if (CountryLivinginList != "")
            {
                objCommand.Parameters.Add(new SqlParameter("@LivingIn", SqlDbType.VarChar));
                objCommand.Parameters["@LivingIn"].Value = CountryLivinginList;
            }
            if (StateList != "")
            {
                objCommand.Parameters.Add(new SqlParameter("@ResidingState", SqlDbType.VarChar));
                objCommand.Parameters["@ResidingState"].Value = StateList;
            }
            if (ResidentStatus != "")
            {
                objCommand.Parameters.Add(new SqlParameter("@ResStatus", SqlDbType.VarChar));
                objCommand.Parameters["@ResStatus"].Value = ResidentStatus;
            }



            objConnection.Open();
            int temp = objCommand.ExecuteNonQuery();
            objConnection.Close();
            return 1;
            //}
            //catch (Exception)
            //{
            //    objConnection.Close();
            //    return 0;
            //}

        }
    }
    //-------------------------------------------------------------------------------------------------------------
    public static void InsertPaidMember(string MatrimonialID, sbyte PlanID)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
       Procedure Name :  PaidMemberDetails_AddMember
        * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
       Type: INSERT/UPDATE 
        * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
               @MartimonialID varchar(15),
               @PlanID  smallint 
        * * * * * * * * * * * * * * * * * * * * * * * * * * * *  */
        bool boolFlag = false;
        using (SqlConnection objSqlConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                objSqlConnection.Open();
                SqlCommand objSqlCommand = new SqlCommand("PaidMemberDetails_AddMember", objSqlConnection);
                objSqlCommand.CommandType = CommandType.StoredProcedure;

                objSqlCommand.Parameters.Add(new SqlParameter("@MatrimonialID", SqlDbType.VarChar));
                objSqlCommand.Parameters["@MatrimonialID"].Value = MatrimonialID;
                objSqlCommand.Parameters.Add(new SqlParameter("@PlanID", SqlDbType.SmallInt));
                objSqlCommand.Parameters["@PlanID"].Value = PlanID;

                int temp = objSqlCommand.ExecuteNonQuery();
            }
            catch (Exception Ex) { ErrorLog.WriteErrorLog("InsertData-InsertPaidMember", Ex); }
            finally { objSqlConnection.Close(); }

        }

    }
    //-------------------------------------------------------------------------------------------------------------
    public static sbyte InsertMyExpectation(string ApplicationID, string Expectation)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserAboutAndExpectation_UpdateExpectation
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: INSERT  
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @ApplicationID - varchar(25),
                    @MyExpectations - NVARCHAR(1000) = NULL
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            //try
            //{
            //Inserting data into

            //Creating Command object
            SqlCommand objCommand = new SqlCommand("UserAboutAndExpectation_UpdateExpectation", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
            objCommand.Parameters.Add(new SqlParameter("@MyExpectations", SqlDbType.VarChar));

            objCommand.Parameters["@ApplicationID"].Value = ApplicationID;
            objCommand.Parameters["@MyExpectations"].Value = Expectation;

            objConnection.Open();
            int temp = objCommand.ExecuteNonQuery();
            objConnection.Close();
            return 1;
            //}
            //catch (Exception)
            //{
            //    objConnection.Close();
            //    return 0;
            //}
        }





    }
    //-------------------------------------------------------------------------------------------------------------
    public static sbyte InsertHobiesNInterests(string ApplicationID, string HobbiesList, string OtherHobbies, string InterestList, string OtherIntrests)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserHobiesAndIntrests_DataHandler
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: INSERT  
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @ApplicationID - varchar(25)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *
                    @HobbiesList - varchar(64)  = NULL
                    @OtherHobbies - varchar(64) = NULL
                    @IntrestList - varchar(64) = NULL
                    @OtherIntrests - varchar(64) = NULL
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */
        sbyte sbyteFlag = 1;
        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {

            try
            {

                SqlCommand objSqlCommand = new SqlCommand("UserHobiesAndIntrests_DataHandler", objConnection);
                objSqlCommand.CommandType = CommandType.StoredProcedure;

                objSqlCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
                objSqlCommand.Parameters["@ApplicationID"].Value = ApplicationID;

                if (HobbiesList != "")
                {
                    objSqlCommand.Parameters.Add(new SqlParameter("@HobbiesList", SqlDbType.VarChar));
                    objSqlCommand.Parameters["@HobbiesList"].Value = HobbiesList;
                }
                if (OtherHobbies != "")
                {
                    objSqlCommand.Parameters.Add(new SqlParameter("@OtherHobbies", SqlDbType.VarChar));
                    objSqlCommand.Parameters["@OtherHobbies"].Value = OtherHobbies;
                }
                if (InterestList != "")
                {
                    objSqlCommand.Parameters.Add(new SqlParameter("@IntrestList", SqlDbType.VarChar));
                    objSqlCommand.Parameters["@IntrestList"].Value = InterestList;
                }
                if (OtherIntrests != "")
                {
                    objSqlCommand.Parameters.Add(new SqlParameter("@OtherIntrests", SqlDbType.VarChar));
                    objSqlCommand.Parameters["@OtherIntrests"].Value = OtherIntrests;
                }

                objConnection.Open();
                int temp = objSqlCommand.ExecuteNonQuery();
            }
            catch (Exception Ex)
            {
                ErrorLog.WriteErrorLog("MatrimonialProfileManager.InsertHobiesNInterests", Ex);
                sbyteFlag = 0;
            }
            finally { objConnection.Close(); }

        }

        return sbyteFlag;
    }
    //-------------------------------------------------------------------------------------------------------------
    public static sbyte InsertFamilyInfo(string ApplicationID, string FamilyDetails, sbyte FamilyValues,
           sbyte FamilyType, sbyte FamilyStatus, string FamilyOrigin, sbyte NoOfBrothers, sbyte NoOfSisters,
           sbyte BrothersMarried, sbyte SistersMarried, string FathersName, string MothersName,
           bool FatherAlive, bool MotherAlive, string FatherOccupation, string MotherOccupation)
    {

        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserFamilyDetails_InsertInfo
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: INSERT  
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @ApplicationID - varchar(25)
                    @NoOfBrothers - smallint 
                    @NoOfSisters - smallint 
                    @BrothersMarried - smallint 
                    @SistersMarried - smallint
                    @FathersName - varchar(50) 
                    @MothersName - varchar(50) 
                    @FatherAlive - bit
                    @MotherAlive - bit  
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *
                    @FamilyDetails - varchar(200) = NULL
                    @FamilyValues - smallint  = NULL
                    @FamilyType - smallint  = NULL
                    @FamilyStatus - smallint  = NULL
                    @FamilyOrigin - varchar(50) = NULL
                    @FatherOccupation - varchar(50) = NULL
                    @MotherOccupation - varchar(50) = NULL
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            //try
            //{
            //Inserting data into

            //Creating Command object
            SqlCommand objCommand = new SqlCommand("UserFamilyDetails_InsertInfo", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
            objCommand.Parameters.Add(new SqlParameter("@NoOfBrothers", SqlDbType.SmallInt));
            objCommand.Parameters.Add(new SqlParameter("@NoOfSisters ", SqlDbType.SmallInt));
            objCommand.Parameters.Add(new SqlParameter("@BrothersMarried", SqlDbType.SmallInt));
            objCommand.Parameters.Add(new SqlParameter("@SistersMarried", SqlDbType.SmallInt));
            objCommand.Parameters.Add(new SqlParameter("@FathersName", SqlDbType.VarChar));
            objCommand.Parameters.Add(new SqlParameter("@MothersName", SqlDbType.VarChar));
            objCommand.Parameters.Add(new SqlParameter("@FatherAlive", SqlDbType.Bit));
            objCommand.Parameters.Add(new SqlParameter("@MotherAlive", SqlDbType.Bit));

            //Adding Values
            objCommand.Parameters["@ApplicationID"].Value = ApplicationID;
            objCommand.Parameters["@NoOfBrothers"].Value = NoOfBrothers;
            objCommand.Parameters["@NoOfSisters "].Value = NoOfSisters;
            objCommand.Parameters["@BrothersMarried"].Value = BrothersMarried;
            objCommand.Parameters["@SistersMarried"].Value = SistersMarried;
            objCommand.Parameters["@FathersName"].Value = FathersName;
            objCommand.Parameters["@MothersName"].Value = MothersName;
            objCommand.Parameters["@FatherAlive"].Value = FatherAlive;
            objCommand.Parameters["@MotherAlive"].Value = MotherAlive;

            if (FamilyDetails != null)
            {
                objCommand.Parameters.Add(new SqlParameter("@FamilyDetails", SqlDbType.VarChar));
                objCommand.Parameters["@FamilyDetails"].Value = FamilyDetails;
            }
            if (FamilyValues != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@FamilyValues", SqlDbType.SmallInt));
                objCommand.Parameters["@FamilyValues"].Value = FamilyValues;

            }
            if (FamilyType != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@FamilyType", SqlDbType.SmallInt));
                objCommand.Parameters["@FamilyType"].Value = FamilyType;

            }
            if (FamilyStatus != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@FamilyStatus", SqlDbType.SmallInt));
                objCommand.Parameters["@FamilyStatus"].Value = FamilyStatus;

            }

            if (FamilyOrigin != null)
            {
                objCommand.Parameters.Add(new SqlParameter("@FamilyOrigin", SqlDbType.VarChar));
                objCommand.Parameters["@FamilyOrigin"].Value = FamilyOrigin;
            }
            if (FatherOccupation != null)
            {
                objCommand.Parameters.Add(new SqlParameter("@FatherOccupation", SqlDbType.VarChar));
                objCommand.Parameters["@FatherOccupation"].Value = FatherOccupation;
            }
            if (MotherOccupation != null)
            {
                objCommand.Parameters.Add(new SqlParameter("@MotherOccupation", SqlDbType.VarChar));
                objCommand.Parameters["@MotherOccupation"].Value = MotherOccupation;
            }

            objConnection.Open();
            int temp = objCommand.ExecuteNonQuery();
            objConnection.Close();

            return 1;
            //}
            //catch (Exception)
            //{
            //    objConnection.Close();
            //    return 0;
            //}
        }

    }
    //-------------------------------------------------------------------------------------------------------------
    public static sbyte InsertEducationalInfo(string ApplicationID, sbyte Education, sbyte EduDetails, sbyte AnualIncome, short IncomeIn, sbyte Occupation, sbyte EmployedIn)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserEducationAndOccupation_InsertInfo
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: INSERT  
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @ApplicationID - varchar(25)
                    @Education - smallint
                    @EduDetails - smallint
                    @Occupation - smallint 
                    @EmployedIn - smallint 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @AnualIncome - smallint = NULL
                    @IncomeIn - smallint = NULL
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Inserting data into

                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserEducationAndOccupation_InsertInfo", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
                objCommand.Parameters.Add(new SqlParameter("@Education", SqlDbType.SmallInt));
                objCommand.Parameters.Add(new SqlParameter("@EduDetails", SqlDbType.SmallInt));
                objCommand.Parameters.Add(new SqlParameter("@Occupation", SqlDbType.SmallInt));
                objCommand.Parameters.Add(new SqlParameter("@EmployedIn", SqlDbType.SmallInt));

                //Adding Values
                objCommand.Parameters["@ApplicationID"].Value = ApplicationID;
                objCommand.Parameters["@Education"].Value = Education;
                objCommand.Parameters["@EduDetails"].Value = EduDetails;
                objCommand.Parameters["@Occupation"].Value = Occupation;
                objCommand.Parameters["@EmployedIn"].Value = EmployedIn;

                if (AnualIncome != 0)
                {
                    objCommand.Parameters.Add(new SqlParameter("@AnualIncome", SqlDbType.SmallInt));
                    objCommand.Parameters["@AnualIncome"].Value = AnualIncome;
                }
                if (IncomeIn != 0)
                {
                    objCommand.Parameters.Add(new SqlParameter("@IncomeIn", SqlDbType.SmallInt));
                    objCommand.Parameters["@IncomeIn"].Value = IncomeIn;
                }

                objConnection.Open();
                int temp = objCommand.ExecuteNonQuery();
                objConnection.Close();

                return 1;
            }
            catch (Exception)
            {
                objConnection.Close();
                return 0;
            }
        }


    }
    //-------------------------------------------------------------------------------------------------------------
    public static sbyte InsertContactInfo(string ApplicationID, string Address, short Country, sbyte State, string City, string PhoneNo, string AreaCode, string ISDCode, string Mobile, short Residence, sbyte ResidenceType, string ResidenceCity)
    {


        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserContactInformations_InsertInfo
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: INSERT  
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @ApplicationID - varchar(25)
                    @Address - varchar(350)
                    @Country - smallint
                    @State - smallint
                    @City - varchar(50)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @ResidenceCity - varchar
                    @@PhoneNo  - int = NULL,
                    @AreaCode - smallint = NULL,
                    @ISDCode smallint = NULL,
                    @Mobile - Bigint = NULL,
                    @Residence - smallint = NULL,
                    @ResidenceType - smallint = NULL,
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            //try
            //{
            //Inserting data into

            //Creating Command object
            SqlCommand objCommand = new SqlCommand("UserContactInformations_InsertInfo", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
            objCommand.Parameters.Add(new SqlParameter("@Address", SqlDbType.VarChar));
            objCommand.Parameters.Add(new SqlParameter("@Country", SqlDbType.SmallInt));
            objCommand.Parameters.Add(new SqlParameter("@State", SqlDbType.SmallInt));
            objCommand.Parameters.Add(new SqlParameter("@City", SqlDbType.VarChar));

            //Adding Values
            objCommand.Parameters["@ApplicationID"].Value = ApplicationID;
            objCommand.Parameters["@Address"].Value = Address;
            objCommand.Parameters["@Country"].Value = Country;
            objCommand.Parameters["@State"].Value = State;
            objCommand.Parameters["@City"].Value = City;

            if (ResidenceCity != null)
            {
                objCommand.Parameters.Add(new SqlParameter("@ResidenceCity", SqlDbType.VarChar));
                objCommand.Parameters["@ResidenceCity"].Value = ResidenceCity;
            }
            if (Mobile != null)
            {
                //objCommand.Parameters.Add(new SqlParameter("@Mobile", SqlDbType.BigInt));
                //objCommand.Parameters["@Mobile"].Value = long.Parse(Mobile);
            }
            if (Residence != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@Residence", SqlDbType.SmallInt));
                objCommand.Parameters["@Residence"].Value = Residence;
            }
            if (ResidenceType != 0)
            {
                objCommand.Parameters.Add(new SqlParameter("@ResidenceType", SqlDbType.SmallInt));
                objCommand.Parameters["@ResidenceType"].Value = ResidenceType;
            }
            if (PhoneNo != null)
            {
                objCommand.Parameters.Add(new SqlParameter("@PhoneNo", SqlDbType.Int));
                objCommand.Parameters["@PhoneNo"].Value = int.Parse(PhoneNo);
            }
            if (AreaCode != null)
            {
                objCommand.Parameters.Add(new SqlParameter("@AreaCode", SqlDbType.SmallInt));
                objCommand.Parameters["@AreaCode"].Value = short.Parse(AreaCode);
            }
            if (ISDCode != null)
            {
                objCommand.Parameters.Add(new SqlParameter("@ISDCode", SqlDbType.SmallInt));
                objCommand.Parameters["@ISDCode"].Value = short.Parse(ISDCode);
            }

            objConnection.Open();
            long temp = objCommand.ExecuteNonQuery();
            objConnection.Close();

            return 1;
            //    }
            //    catch (Exception)
            //    {
            //        objConnection.Close();
            //        return 0;
            //    }
            //}

        }
    }
    //-------------------------------------------------------------------------------------------------------------
    public static sbyte InsertBasicInfo(string ApplicationID, string Name, bool Gender, DateTime DOB, sbyte MotherTongue, sbyte CreatedBy, sbyte Cast, sbyte MaritalStatus, sbyte Religion, sbyte NoOfChildren, string PhysicalStatus, string ChildrenLivingWith, string SubCast)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure name : UserBasicInformation_InsertInfo
         * * * * * * * * * * * * * * * * * * * * * * * * *
        Type : INSERT
         * * * * * * * * * * * * * * * * * * * * * * * * * 
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * 
                    @ApplicationID - Varchar(25) 
                    @Name - Varchar(50)
                    @Gender - bit 
                    @DOB - SmallDateTime
                    @MotherTongue - smallint
                    @CreatedBy - smallint 
                    @Cast - smallint
                    @MaritalStatus - Smallint
                    @Religion - smallint 
         * * * * * * * * *  * * * * * * * * * * * * * * *
                    @NoOfChildren - smallint = null,
                    @PhysicalStatus bit - =Null,
                    @ChildrenLivingWith - bit = Null,
                    @SubCast - Varchar(50) = Null,
        * * * * * * * * *  * * * * * * * * * * * * * * */


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            //try 
            //{
            //Inserting data into


            //Creating Command object
            SqlCommand objCommand = new SqlCommand("UserBasicInformation_InsertInfo", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
            objCommand.Parameters.Add(new SqlParameter("@Name", SqlDbType.VarChar));
            objCommand.Parameters.Add(new SqlParameter("@Gender", SqlDbType.Bit));
            objCommand.Parameters.Add(new SqlParameter("@DOB", SqlDbType.SmallDateTime));
            objCommand.Parameters.Add(new SqlParameter("@MotherTongue", SqlDbType.SmallInt));
            objCommand.Parameters.Add(new SqlParameter("@CreatedBy", SqlDbType.SmallInt));
            objCommand.Parameters.Add(new SqlParameter("@Cast", SqlDbType.SmallInt));
            objCommand.Parameters.Add(new SqlParameter("@MaritalStatus", SqlDbType.SmallInt));
            objCommand.Parameters.Add(new SqlParameter("@Religion", SqlDbType.SmallInt));


            // Setting Valuse
            objCommand.Parameters["@ApplicationID"].Value = ApplicationID;
            objCommand.Parameters["@Name"].Value = Name;
            objCommand.Parameters["@Gender"].Value = Gender;
            objCommand.Parameters["@DOB"].Value = DOB;
            objCommand.Parameters["@MotherTongue"].Value = MotherTongue;
            objCommand.Parameters["@CreatedBy"].Value = CreatedBy;
            objCommand.Parameters["@Cast"].Value = Cast;
            objCommand.Parameters["@MaritalStatus"].Value = MaritalStatus;
            objCommand.Parameters["@Religion"].Value = Religion;


            if (NoOfChildren <= 6)
            {
                objCommand.Parameters.Add(new SqlParameter("@NoOfChildren", SqlDbType.SmallInt));
                objCommand.Parameters["@NoOfChildren"].Value = NoOfChildren;
            }
            if (PhysicalStatus != null)
            {
                objCommand.Parameters.Add(new SqlParameter("@PhysicalStatus", SqlDbType.SmallInt));
                objCommand.Parameters["@PhysicalStatus"].Value = bool.Parse(PhysicalStatus);
            }
            if (ChildrenLivingWith != null)
            {
                objCommand.Parameters.Add(new SqlParameter("@ChildrenLivingWith", SqlDbType.Bit));
                objCommand.Parameters["@ChildrenLivingWith"].Value = bool.Parse(ChildrenLivingWith);
            }
            if (SubCast != null)
            {
                objCommand.Parameters.Add(new SqlParameter("@SubCast", SqlDbType.VarChar));
                objCommand.Parameters["@SubCast"].Value = SubCast;
            }



            // Executing Qurey
            objConnection.Open();
            int temp = objCommand.ExecuteNonQuery();
            objConnection.Close();
            return 1;
            //}
            //catch (Exception Ex)
            //{
            //    objConnection.Close();
            //    //ErrorLog.WriteErrorLog("RegistrationStep1", Ex, Server.MapPath("Logs\\ErrorLog.txt"));
            //    return 0;
            //}

        }

    }
    //-------------------------------------------------------------------------------------------------------------
    public static sbyte InsertAboutMe(string ApplicationID, string AboutMe)
    {

        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserAboutAndExpectation_InsertAboutMe
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: INSERT  
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @ApplicationID varchar(25) = NULL,
                    @AboutMe varchar(1000) = NULL
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            //try
            //{
            //Inserting data into

            //Creating Command object
            SqlCommand objCommand = new SqlCommand("UserAboutAndExpectation_InsertAboutMe", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
            objCommand.Parameters.Add(new SqlParameter("@AboutMe", SqlDbType.VarChar));

            //Adding Values
            objCommand.Parameters["@ApplicationID"].Value = ApplicationID;
            objCommand.Parameters["@AboutMe"].Value = AboutMe;

            objConnection.Open();
            int temp = objCommand.ExecuteNonQuery();
            objConnection.Close();

            return 1;
            //}
            //catch (Exception)
            //{
            //    objConnection.Close();
            //    return 0;
            //}
        }
    }
    //-------------------------------------------------------------------------------------------------------------
    //-------------------------------------------------------------------------------------------------------------


    public static DataTable AbuseProfileLsit()
    {
        {
            /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
            Procedure Name : AbuseProfileList_GetReport
             * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
            Type: SELECT 
             * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
            Parameters :
             * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                        MatrimonialID
             * * * * * * * * * * * * * * * * * * * * * * * * * * * */

            DataSet datasetTemp = new DataSet();

            using (SqlConnection objConnection = DBConnection.GetSqlConnection())
            {
                try
                {
                    //Creating Command object
                    SqlCommand objCommand = new SqlCommand("AbuseProfileList_GetReport", objConnection);
                    objCommand.CommandType = CommandType.StoredProcedure;
                    //Adding Parameters

                    SqlDataAdapter objAdapter = new SqlDataAdapter(objCommand);
                    objConnection.Open();
                    objAdapter.Fill(datasetTemp, "AbuseList");
                    objConnection.Close();

                    return datasetTemp.Tables["AbuseList"];

                }
                catch (Exception)
                {
                    objConnection.Close();
                    return null;
                }

            }
        }
    }

    //public static void UpdateVisiters(string MatrimonialID, string Visitor)
    //{
    //    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
    //    Procedure Name :  UserVisiters_AddList
    //     * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
    //    Type: INSERT/UPDATE 
    //     * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
    //            @MartimonialID varchar(15),
    //            @visitor varchar(15)
    //     * * * * * * * * * * * * * * * * * * * * * * * * * * * *  */
    //    bool boolFlag = false;
    //    using (SqlConnection objSqlConnection = DBConnection.GetSqlConnection())
    //    {
    //        try
    //        {
    //            objSqlConnection.Open();
    //            SqlCommand objSqlCommand = new SqlCommand("UserVisiters_AddList", objSqlConnection);
    //            objSqlCommand.CommandType = CommandType.StoredProcedure;

    //            objSqlCommand.Parameters.Add(new SqlParameter("@MartimonialID", SqlDbType.VarChar));
    //            objSqlCommand.Parameters["@MartimonialID"].Value = MatrimonialID;
    //            objSqlCommand.Parameters.Add(new SqlParameter("@visitor", SqlDbType.VarChar));
    //            objSqlCommand.Parameters["@visitor"].Value = Visitor;

    //            int temp = objSqlCommand.ExecuteNonQuery();
    //        }
    //        catch (Exception) { }
    //        finally { objSqlConnection.Close(); }

    //    }
    //}
}
