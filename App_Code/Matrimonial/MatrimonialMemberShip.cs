using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data.SqlClient;
using System.Data;

public class MatrimonialMemberShip
{
    public static bool DeleteAccount(string ApplicationID, string MatrimonialID)
    {
        bool boolFlag = false;

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("Matrimonial_AccountDrop", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
                objCommand.Parameters.Add(new SqlParameter("@MatrimonialID", SqlDbType.VarChar));

                // Setting Valuse
                objCommand.Parameters["@ApplicationID"].Value = ApplicationID;
                objCommand.Parameters["@MatrimonialID"].Value = MatrimonialID;

                // Executing Qurey
                objConnection.Open();
                int temp = objCommand.ExecuteNonQuery();
                objConnection.Close();
                boolFlag = true;

            }
            catch (Exception)
            {
                return false;

            }
            return boolFlag;
        }

    }

    private static string GenerateMatID()
    {
        try
        {


            using (SqlConnection objSqlConnection = DBConnection.GetSqlConnection())
            {
                objSqlConnection.Open();
                SqlCommand objSqlCommand = new SqlCommand("UserAuthentication_MaxMatrimonialID", objSqlConnection);
                objSqlCommand.CommandType = CommandType.StoredProcedure;

                SqlDataReader objDataReader = objSqlCommand.ExecuteReader();
                objDataReader.Read();

                string strTemp = null;
                strTemp = objDataReader.GetString(0);
                if (strTemp != null)
                {
                    strTemp = strTemp.Substring(3);
                    short shortTemp = short.Parse(strTemp);
                    return "BnG" + (shortTemp + 1);
                }
                else
                {
                    return "BnG11100";
                }
            }
        }
        catch (Exception)
        {
            return "BnG11100";
        }
    }

    private static string GenerateApplicationID()
    {
        string strRandom = RandomString.GenerateStirng(23, true);
        if (!ApplicationIDExist(strRandom))
        {
            return strRandom;
        }
        else
        {
            return GenerateApplicationID();
        }

    }

    private static bool ApplicationIDExist(string ApplicationID)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserAuthentication_ApplicationIDExist
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @ApplicationID varchar(25) = NULL,
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Inserting data into

                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserAuthentication_ApplicationIDExist", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
                objCommand.Parameters["@ApplicationID"].Value = ApplicationID;

                objConnection.Open();
                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();
                string strTemp = objReader["ApplicationID"].ToString();
                objReader.Close();
                objConnection.Close();
                return true;
            }
            catch (Exception)
            {
                objConnection.Close();
                return false;
            }

        }
    }

    public static bool UpdateIndex(string ApplicationID)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name :  UserAuthentication_UpdateIndex
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: UPDATE 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  */
        bool boolFlag = false;
        using (SqlConnection objSqlConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                objSqlConnection.Open();
                SqlCommand objSqlCommand = new SqlCommand("UserAuthentication_UpdateIndex", objSqlConnection);
                objSqlCommand.CommandType = CommandType.StoredProcedure;

                objSqlCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
                objSqlCommand.Parameters["@ApplicationID"].Value = ApplicationID;

                int temp = objSqlCommand.ExecuteNonQuery();
                boolFlag = true;
            }
            catch (Exception) { boolFlag = false; }
            finally { objSqlConnection.Close(); }

        }
        return boolFlag;

    }

    public static string GetMatrimonialID(string ApplicationID)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserAuthentication_GetMatrimonailID
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @ApplicationID varchar(25)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    MatrimonialID
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Inserting data into

                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserAuthentication_GetMatrimonailID", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
                objCommand.Parameters["@ApplicationID"].Value = ApplicationID;

                objConnection.Open();
                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();
                string strTemp = objReader["MatrimonialID"].ToString();
                objConnection.Close();

                return strTemp;
            }
            catch (Exception)
            {
                return null;
            }
        }
    }

    public static string GetApplicationID(string MatrimonailID)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserAuthentication_GetApplicationID
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @MatrimonailID varchar(15)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    ApplicationID
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserAuthentication_GetApplicationID", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@MatrimonialID", SqlDbType.VarChar));
                objCommand.Parameters["@MatrimonialID"].Value = MatrimonailID;

                objConnection.Open();
                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();
                string strTemp = objReader["ApplicationID"].ToString();
                objConnection.Close();

                return strTemp;
            }
            catch (Exception)
            {
                return null;
            }
        }
    }

    public static string GetApplicationID(string UserID, bool ISUserID, bool IsEnCrypted)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
         Procedure Name : UserAuthentication_GetApplicationID_UID
          * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
         Type: SELECT 
          * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
         Parameters :
          * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                     @UserID varchar(124)
          * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                     ApplicationID
          * * * * * * * * * * * * * * * * * * * * * * * * * * * */
        if (!IsEnCrypted)
        {
            UserID = Crypto.EnCrypto(UserID);
        }

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserAuthentication_GetApplicationID_UID", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@UserID", SqlDbType.VarChar));
                objCommand.Parameters["@UserID"].Value = UserID;

                objConnection.Open();
                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();
                string strTemp = objReader["ApplicationID"].ToString();
                objConnection.Close();

                return strTemp;
            }
            catch (Exception)
            {
                return null;
            }
        }
    }

    public static string InsertAccountInfo(string UserID, string Password, sbyte SequrityQuestion, string Answer)
    {

        /* * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserAuthentication_CreatUser
         * * * * * * * * * * * * * * * * * * * * * * * * * 
        Type: INSERT  
         * * * * * * * * * * * * * * * * * * * * * * * * * 
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * 
                    @ApplicationID - Varchar
                    @UserID - Varchar
                    @PassWord - Varchar
                    @SequrityQuestion - smallint
                    @Answer- Varchar
                    @MatrimonialID - Varchar
         * * * * * * * * * * * * * * * * * * * * * * * * */

        string ApplicationID = GenerateApplicationID();

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            //try
            //{
            //Inserting data into

            //Creating Command object
            SqlCommand objCommand = new SqlCommand("UserAuthentication_CreatUser", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
            objCommand.Parameters.Add(new SqlParameter("@UserID", SqlDbType.VarChar));
            objCommand.Parameters.Add(new SqlParameter("@PassWord", SqlDbType.VarChar));
            objCommand.Parameters.Add(new SqlParameter("@EmailID", SqlDbType.VarChar));
            objCommand.Parameters.Add(new SqlParameter("@MatrimonialID", SqlDbType.VarChar));
            objCommand.Parameters.Add(new SqlParameter("@SequrityQuestion", SqlDbType.SmallInt));
            objCommand.Parameters.Add(new SqlParameter("@SeqtAnser", SqlDbType.VarChar));

            // Setting Valuse
            objCommand.Parameters["@ApplicationID"].Value = ApplicationID;
            objCommand.Parameters["@UserID"].Value = Crypto.EnCrypto(UserID.ToLower());
            objCommand.Parameters["@PassWord"].Value = Password;
            objCommand.Parameters["@EmailID"].Value = UserID.ToLower();
            objCommand.Parameters["@MatrimonialID"].Value = GenerateMatID();
            objCommand.Parameters["@SequrityQuestion"].Value = SequrityQuestion;
            objCommand.Parameters["@SeqtAnser"].Value = Answer;

            // Executing Qurey
            objConnection.Open();
            int temp = objCommand.ExecuteNonQuery();

            //}
            //catch (Exception Ex)
            //{
            //    //ErrorLog.WriteErrorLog("RegistrationStep1", Ex, Server.MapPath("''\\Logs\\ErrorLog.txt"));
            //    ApplicationID= null;
            //}
            //finally
            //{
            objConnection.Close();
            return ApplicationID;
            //}

        }

    }

    // Used when user needs to cange the password
    public static sbyte SetPassword(string ApplicationID, string newPassword, string oldPassword)
    {

        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserAuthentication_ChangePassword
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: UPDATE  
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                         @ApplicationID - varchar(25)
                         @NewPassword - varchar(124)
                         @OldPassword - varchar(124)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            //try
            //{
            //Inserting data into

            //Creating Command object
            SqlCommand objCommand = new SqlCommand("UserAuthentication_ChangePassword", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
            objCommand.Parameters.Add(new SqlParameter("@NewPassword", SqlDbType.VarChar));
            objCommand.Parameters.Add(new SqlParameter("@OldPassword", SqlDbType.VarChar));

            objCommand.Parameters["@ApplicationID"].Value = ApplicationID;
            objCommand.Parameters["@NewPassword"].Value = newPassword;
            objCommand.Parameters["@OldPassword"].Value = oldPassword;

            objConnection.Open();
            int intTemp = objCommand.ExecuteNonQuery();
            objConnection.Close();
            return (sbyte)intTemp;
            //}
            //catch (Exception)
            //{
            //    objConnection.Close();
            //    return 0;
            //}

        }

    }

    // Used When user forgets the password
    public static void SetPassword(string ApplicationID, string ResetPassword)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserAuthentication_ChangePassword
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: UPDATE  
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                         @ApplicationID - varchar(25)
                         @NewPassword - varchar(124)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            //try
            //{
            //Inserting data into

            //Creating Command object
            SqlCommand objCommand = new SqlCommand("UserAuthentication_ChangePassword", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
            objCommand.Parameters.Add(new SqlParameter("@NewPassword", SqlDbType.VarChar));
            objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.SmallInt));

            objCommand.Parameters["@ApplicationID"].Value = ApplicationID;
            objCommand.Parameters["@NewPassword"].Value = ResetPassword;
            objCommand.Parameters["@Flag"].Value = 1;

            objConnection.Open();
            int intTemp = objCommand.ExecuteNonQuery();
            objConnection.Close();

            //}
            //catch (Exception)
            //{
            //    objConnection.Close();
            //    return 0;
            //}

        }
    }

    public static void RenewPaidMembership(string MatrimonialID, int PlanID)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : PaidMemberDetails_RenewMember
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: UPDATE  
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                         @ApplicationID - varchar(25)
                         @PlanID smallint
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            //try
            //{
            //Inserting data into

            //Creating Command object
            SqlCommand objCommand = new SqlCommand("PaidMemberDetails_RenewMember", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@MatrimonialID", SqlDbType.VarChar));
            objCommand.Parameters.Add(new SqlParameter("@PlanID", SqlDbType.SmallInt));

            objCommand.Parameters["@MatrimonialID"].Value = MatrimonialID;
            objCommand.Parameters["@PlanID"].Value = PlanID;

            objConnection.Open();
            int intTemp = objCommand.ExecuteNonQuery();
            objConnection.Close();

            //}
            //catch (Exception)
            //{
            //    objConnection.Close();
            //    return 0;
            //}

        }
    }

    public static string GetDateOfLastLogin(string ApplicationID)
    {
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
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserAuthentication_GetLastLogin", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
                objCommand.Parameters["@ApplicationID"].Value = ApplicationID;

                objConnection.Open();
                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();
                string strTemp = objReader["LastLogIN"].ToString();
                objConnection.Close();

                return strTemp;
            }
            catch (Exception)
            {
                objConnection.Close();
                return null;
            }
        }

    }

    public static int GetMemberShipType(string MatrimonialID)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : PaidMemberDetails_GetDetails
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @@MatrimonialID varchar(15)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */
        int intTemp = 0;
        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("PaidMemberDetails_GetDetails", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding Parameters
                objCommand.Parameters.Add(new SqlParameter("@MatrimonialID", SqlDbType.VarChar));
                objCommand.Parameters["@MatrimonialID"].Value = MatrimonialID;
                //Databse Operations
                objConnection.Open();
                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();
                //Getting Values
                intTemp = Convert.ToInt32(objReader["PlanID"]);
                objReader.Dispose();
            }
            catch (Exception) { }
            finally
            {
                objConnection.Close();
            }
            return intTemp;
        }
    }

    public static string GetUserName(string UniqueID, bool ISMatrimonialID)
    {

        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserAuthentication_GetUserName
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @MatrimonailID varchar(15)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    UserID
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserAuthentication_GetUserName", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@MatrimonialID", SqlDbType.VarChar));
                objCommand.Parameters["@MatrimonialID"].Value = UniqueID;

                objConnection.Open();
                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();
                string strTemp = objReader["UserID"].ToString();
                objConnection.Close();

                return Crypto.DeCrypto(strTemp);
            }
            catch (Exception)
            {
                return null;
            }
        }

    }

    public static void ActivateMember(string ID, bool ISMatID)
    {
        if (ISMatID)
        {
            ID = MatrimonialMemberShip.GetUserName(ID, true);
        }
        SimpleUser temp = MatrimonialMemberShip.Authentication(ID, "Test");
    }

    public static SimpleUser Authentication(string UserName, string Password)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * *
         *      Procedure Name : UserAuthentication_UserLogIN
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
         *      Type:   SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
         *      Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *
         *              @UserID - varchar(124)
         *              @Password - varchar(124)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *
         *      Values :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *
         *              ApplicationID
         *              Membership
         *              MatrimonialID
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        UserName = Crypto.EnCrypto(UserName.ToLower());

        SimpleUser objUser = new SimpleUser();


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Inserting data into

                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserAuthentication_UserLogIN", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@UserID", SqlDbType.VarChar));
                objCommand.Parameters["@UserID"].Value = UserName;

                objCommand.Parameters.Add(new SqlParameter("@Password", SqlDbType.VarChar));
                objCommand.Parameters["@Password"].Value = Password;

                objConnection.Open();
                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();
                objUser.ApplicationID = objReader["ApplicationID"].ToString();
                objUser.TypeOfUser = Convert.ToSByte(objReader["Membership"]);
                objUser.MatrimonialID = objReader["MatrimonialID"].ToString();
                objUser.UserName = Crypto.DeCrypto(UserName);
                objUser.AuthenticationStatus = true;
                objReader.Dispose();
            }
            catch (InvalidOperationException)
            {
                objUser.ApplicationID = null;
                objUser.TypeOfUser = 0;
                objUser.MatrimonialID = null;
                objUser.UserName = null;
                objUser.AuthenticationStatus = false;
            }
            catch (Exception Ex)
            {
                objUser.ApplicationID = null;
                objUser.TypeOfUser = 0;
                objUser.MatrimonialID = null;
                objUser.UserName = null;
                objUser.AuthenticationStatus = false;
                ErrorLog.WriteErrorLog("UserAuthentication()", Ex);
            }
            finally
            {
                objConnection.Close();
            }

        }
        return objUser;

    }

    public static bool CheckSequrityQuestion(string UserID, string Answer)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * *
         *      Procedure Name : UserAuthentication_CheckQuestion
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
         *      Type:   SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
         *      Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *
         *              @UserID - varchar(124)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */


        bool boolReturn = false;

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserAuthentication_CheckQuestion", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@UserID", SqlDbType.VarChar));
                objCommand.Parameters["@UserID"].Value = Crypto.EnCrypto(UserID.ToLower());

                objCommand.Parameters.Add(new SqlParameter("@Answer", SqlDbType.VarChar));
                objCommand.Parameters["@Answer"].Value = Answer.ToLower();

                objConnection.Open();

                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();
                boolReturn = Convert.ToBoolean(objReader["Status"]);
            }
            catch (Exception EX)
            {
                ErrorLog.WriteErrorLog("MatrimonialMemberShip.CheckSequrityQuestion", EX);
            }
        }
        return boolReturn;
    }

    public static bool CheckUserNameExsists(string UserID)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * *
         *      Procedure Name : UserAuthentication_CheckUserExsists
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
         *      Type:   SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
         *      Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *
         *              @UserID - varchar(124)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */


        bool boolReturn = false;

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserAuthentication_CheckUserExsists", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@UserID", SqlDbType.VarChar));
                objCommand.Parameters["@UserID"].Value = Crypto.EnCrypto(UserID.ToLower());

                objConnection.Open();

                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();
                boolReturn = Convert.ToBoolean(objReader["Status"]);
            }
            catch (Exception EX)
            {
                ErrorLog.WriteErrorLog("MatrimonialMemberShip.CheckUserNameExsists", EX);
            }
        }
        return boolReturn;
    }

    public static string GetSequrityQuestion(string UserID)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * *
         *      Procedure Name : UserAuthentication_GetSequrityQuestion
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
         *      Type:   SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
         *      Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *
         *              @UserID - varchar(124)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */


        string strReturn = null;

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserAuthentication_GetSequrityQuestion", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@UserID", SqlDbType.VarChar));
                objCommand.Parameters["@UserID"].Value = Crypto.EnCrypto(UserID.ToLower());

                objConnection.Open();

                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();
                strReturn = objReader["SequrityQuestion"].ToString();
            }
            catch (Exception EX)
            {
                ErrorLog.WriteErrorLog("MatrimonialMemberShip.GetSequrityQuestion", EX);
            }
        }
        return strReturn;
    }

    public static bool IsPasswordTrue(string ApplicationID, string Password)
    {

        /* * * * * * * * * * * * * * * * * * * * * * * * * * * *
        *      Procedure Name : UserAuthentication_IsPasswordTrue
        * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        *      Type:   SELECT 
        * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
        *      Parameters :
        * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
        *              @ApplicationID - varchar(25)
        *              @Password - varchar(124)
        * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
        *      Values :
        * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
        *              MatrimonialID
        * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        bool boolFlag;


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Inserting data into

                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserAuthentication_IsPasswordTrue", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
                objCommand.Parameters["@ApplicationID"].Value = ApplicationID;

                objCommand.Parameters.Add(new SqlParameter("@Password", SqlDbType.VarChar));
                objCommand.Parameters["@Password"].Value = Password;

                objConnection.Open();
                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();
                Password = objReader["MatrimonialID"].ToString();
                boolFlag = true;
                objReader.Dispose();
            }
            catch (Exception)
            {
                boolFlag = false;
            }
            finally
            {

                objConnection.Close();
            }

        }
        return boolFlag;

    }

    public MatrimonialMemberShip()
    {

    }

 
}
