using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;

using System.Data;
using System.Data.SqlClient;

public class MatrimonialAdministratorMembership
{
    public static sbyte CreatNewUser(string UserName, string UserID, string Password, string Email, bool IsAdmin)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : AdminAuthentication_CreatUser
         * * * * * * * * * * * * * * * * * * * * * * * * * 
        Type: INSERT  
         * * * * * * * * * * * * * * * * * * * * * * * * * 
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * 
                    @ApplicationID - Varchar
                    @UserID - Varchar
                    @PassWord - Varchar
                    @CreatedIn - SmallDateTime 
                    @Email - Varchar
                    @IsAdmin - Bit
         * * * * * * * * * * * * * * * * * * * * * * * * */



        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Inserting data into

                string ApplicationID = GenerateApplicationID();


                //Creating Command object
                SqlCommand objCommand = new SqlCommand("AdminAuthentication_CreatUser", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
                objCommand.Parameters.Add(new SqlParameter("@UserName", SqlDbType.VarChar));
                objCommand.Parameters.Add(new SqlParameter("@PassWord", SqlDbType.VarChar));
                objCommand.Parameters.Add(new SqlParameter("@CreatedIn", SqlDbType.SmallDateTime));
                objCommand.Parameters.Add(new SqlParameter("@UserID", SqlDbType.VarChar));
                objCommand.Parameters.Add(new SqlParameter("@Email", SqlDbType.VarChar));
                objCommand.Parameters.Add(new SqlParameter("@IsAdmin", SqlDbType.Bit));

                // Setting Valuse
                objCommand.Parameters["@ApplicationID"].Value = ApplicationID;
                objCommand.Parameters["@UserName"].Value = Crypto.EnCrypto(UserName);
                objCommand.Parameters["@PassWord"].Value = Crypto.EnCrypto(Password);
                objCommand.Parameters["@CreatedIn"].Value = DateTime.Now;
                objCommand.Parameters["@UserID"].Value = Crypto.EnCrypto(UserID.ToLower()); ;
                objCommand.Parameters["@Email"].Value = Crypto.EnCrypto(Email.ToLower());
                objCommand.Parameters["@IsAdmin"].Value = IsAdmin;

                // Executing Qurey
                objConnection.Open();
                int temp = objCommand.ExecuteNonQuery();
                objConnection.Close();
                return 1;
            }
            catch (System.Data.SqlClient.SqlException)
            {
                objConnection.Close();
                return 2;
            }
            catch (Exception Ex)
            {
                objConnection.Close();
                ErrorLog.WriteErrorLog("Admin-Protected-CreatNewUser", Ex);
                return 0;
            }

        }
    }

    public static bool DeleteAdminAccount(string UserID)
    {
        bool boolFlag = false;

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("AdminAuthentication_DropUser", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@UserID", SqlDbType.VarChar));

                // Setting Valuse
                objCommand.Parameters["@UserID"].Value = Crypto.EnCrypto(UserID);

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

    public static bool UpdateAdminAccountDetails(string UserID, string MailID, bool IsAdministrator)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
          PROCEDURE NAME : AdminAuthentication_ChangeAccount
         * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
          TYPE : UPDATE
         * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
          PARAMETERS:
         * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
                   		@UserID varchar(124) = NULL,
         * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
                        @EmailID varchar(80),
                        @IsAdmin bit
         * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {

            //try
            //{

            SqlCommand objCommand = new SqlCommand("AdminAuthentication_ChangeAccount", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@UserID", SqlDbType.VarChar));
            objCommand.Parameters["@UserID"].Value = Crypto.EnCrypto(UserID);

            objCommand.Parameters.Add(new SqlParameter("@IsAdmin", SqlDbType.Bit));
            objCommand.Parameters["@IsAdmin"].Value = IsAdministrator;

            objCommand.Parameters.Add(new SqlParameter("@EmailID", SqlDbType.VarChar));
            objCommand.Parameters["@EmailID"].Value = Crypto.EnCrypto(MailID);

            // Executing Qurey
            objConnection.Open();
            int temp = objCommand.ExecuteNonQuery();
            objConnection.Close();

            return true;
            //}
            //catch (Exception Ex)
            //{
            //    objConnection.Close();
            //    //ErrorLog.WriteErrorLog("RegistrationStep1", Ex);
            //    return false;
            //}
        }
    }

    /// <summary>
    /// Admin Protected
    /// </summary>
    /// <returns></returns>
    public static DataTable GetAccounts()
    {


        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : AdminAuthentication_GetAccount
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @UserID
                    @CreatedIn
                    @UserName
                    @IsAdmin
                    @LastLogIN
                    @MailID
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Inserting data into

                //Creating Command object
                SqlCommand objCommand = new SqlCommand("AdminAuthentication_GetAccount", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                SqlDataAdapter objAdapter = new SqlDataAdapter(objCommand);
                DataSet objDataSet = new DataSet();
                objConnection.Open();
                objAdapter.Fill(objDataSet, "Account");
                objConnection.Close();
                return objDataSet.Tables["Account"];
            }
            catch (Exception)
            {
                return null;
            }
        }

    }

    public static SimpleUser GetAdminAccountDetails(string UserID)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : AdminAuthentication_AccountInfo        
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @UserID varchar(25)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    MatrimonialID
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */
        SimpleUser objUser = new SimpleUser();

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Inserting data into

                //Creating Command object
                SqlCommand objCommand = new SqlCommand("AdminAuthentication_AccountInfo", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@UserID", SqlDbType.VarChar));
                objCommand.Parameters["@UserID"].Value = Crypto.EnCrypto(UserID);

                objConnection.Open();
                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();
                objUser.MatrimonialID = UserID;
                objUser.UserName = Crypto.DeCrypto(objReader["UserName"].ToString());
                objUser.EmailID = Crypto.DeCrypto(objReader["MailID"].ToString());
                if (Convert.ToBoolean(objReader["IsAdmin"]))
                {
                    objUser.TypeOfUser = 8;
                }
                else
                {
                    objUser.TypeOfUser = 7;
                }

                objConnection.Close();

                return objUser;
            }
            catch (Exception)
            {
                return null;
            }
        }
    }

    public static SimpleUser AdminAuthentication(string UserID, string Password)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * *
         *      Procedure Name : AdminAuthentication_UserLogIN
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
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        string UserName = Crypto.EnCrypto(UserID.ToLower());


        SimpleUser objUser = new SimpleUser();


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {

                //Creating Command object
                SqlCommand objCommand = new SqlCommand("AdminAuthentication_UserLogIN", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@UserID", SqlDbType.VarChar));
                objCommand.Parameters["@UserID"].Value = UserName;

                objCommand.Parameters.Add(new SqlParameter("@Password", SqlDbType.VarChar));
                objCommand.Parameters["@Password"].Value = Crypto.EnCrypto(Password);

                objConnection.Open();

                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();
                objUser.ApplicationID = objReader["ApplicationID"].ToString();
                if (Convert.ToBoolean(objReader["IsAdmin"]))
                {
                    //Admin
                    objUser.TypeOfUser = 8;
                }
                else// Power user
                {
                    objUser.TypeOfUser = 7;
                }
                objUser.UserName = objReader["UserName"].ToString();
                objUser.MatrimonialID = UserID.ToUpper();
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

    public static bool ChangeAdminPassword(string oldPassword, string newPassword, string ApplicationID)
    {

        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
         Procedure Name : AdminAuthentication_ChangePassword
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
            try
            {
                //Inserting data into

                //Creating Command object
                SqlCommand objCommand = new SqlCommand("AdminAuthentication_ChangePassword", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@ApplicationID", SqlDbType.VarChar));
                objCommand.Parameters.Add(new SqlParameter("@NewPassword", SqlDbType.VarChar));
                objCommand.Parameters.Add(new SqlParameter("@OldPassword", SqlDbType.VarChar));

                objCommand.Parameters["@ApplicationID"].Value = ApplicationID;
                objCommand.Parameters["@NewPassword"].Value = Crypto.EnCrypto(newPassword);
                objCommand.Parameters["@OldPassword"].Value = Crypto.EnCrypto(oldPassword);

                objConnection.Open();
                int intTemp = objCommand.ExecuteNonQuery();
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
}
