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
/// Summary description for InternalMessage
/// </summary>
public class InternalMessage
{
    public enum IntrestType : sbyte { Type1 = 1, Type2 = 2, Type3 = 3, Type4 = 4, Type5 = 5 };

    public enum IntrestStatus : sbyte { Pending = 1, Accepted = 2, Declined = 3 };

    public enum MailType { Inbox, OutBox }

    public InternalMessage()
    {
        //
        // TODO: Add constructor logic here
        //
    }



    #region "completed"

    public static int ExpressIntrest(string From, string ToMatID, IntrestType Type)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserIntrests_ExpressIntrest
         * * * * * * * * * * * * * * * * * * * * * * * * * 
        Type: INSERT  
         * * * * * * * * * * * * * * * * * * * * * * * * * 
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * 
		                @IntrestFrom varchar(25),
		                @IntrestTo varchar(25),
		                @IntrestsCode smallint,
         *              @date
         * * * * * * * * * * * * * * * * * * * * * * * * */

        int intTemp = 0;

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Inserting data into

                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserIntrests_ExpressIntrest", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@IntrestFrom", SqlDbType.VarChar));
                objCommand.Parameters.Add(new SqlParameter("@IntrestTo", SqlDbType.VarChar));
                objCommand.Parameters.Add(new SqlParameter("@date", SqlDbType.SmallDateTime));
                objCommand.Parameters.Add(new SqlParameter("@IntrestsCode", SqlDbType.SmallInt));

                // Setting Valuse
                objCommand.Parameters["@IntrestFrom"].Value = From;
                objCommand.Parameters["@IntrestTo"].Value = ToMatID;
                objCommand.Parameters["@date"].Value = DateTime.Today;
                objCommand.Parameters["@IntrestsCode"].Value = (sbyte)Type;

                // Executing Qurey
                objConnection.Open();
                intTemp = objCommand.ExecuteNonQuery();
                intTemp = 1;
            }
            catch (System.Data.SqlClient.SqlException)
            {
                intTemp = 2;
            }
            catch (Exception Ex)
            {
                //ErrorLog.WriteErrorLog("RegistrationStep1", Ex, Server.MapPath("''\\Logs\\ErrorLog.txt"));
                intTemp = 0;
            }
            finally
            {
                objConnection.Close();
            }
            return intTemp;
        }

    }

    public static bool SendMessage(string From, string To, string Message)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserMessages_SendMessage
         * * * * * * * * * * * * * * * * * * * * * * * * * 
        Type: INSERT  
         * * * * * * * * * * * * * * * * * * * * * * * * * 
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * 
		            @MessageFrom varchar(15),
		            @MessageTo varchar(15),
		            @Message varchar(200),
		            @DateSend smalldatetime 
         * * * * * * * * * * * * * * * * * * * * * * * * */

        bool boolTemp = false;

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Inserting data into

                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserMessages_SendMessage", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@MessageFrom", SqlDbType.VarChar));
                objCommand.Parameters.Add(new SqlParameter("@MessageTo", SqlDbType.VarChar));
                objCommand.Parameters.Add(new SqlParameter("@DateSend", SqlDbType.SmallDateTime));
                objCommand.Parameters.Add(new SqlParameter("@Message", SqlDbType.VarChar));

                // Setting Valuse
                objCommand.Parameters["@MessageFrom"].Value = From;
                objCommand.Parameters["@MessageTo"].Value = To;
                objCommand.Parameters["@DateSend"].Value = DateTime.Today;
                objCommand.Parameters["@Message"].Value = Message;

                // Executing Qurey
                objConnection.Open();
                int Temp = objCommand.ExecuteNonQuery();
                boolTemp = true;
            }
            catch (Exception Ex)
            {
                //ErrorLog.WriteErrorLog("RegistrationStep1", Ex, Server.MapPath("''\\Logs\\ErrorLog.txt"));
                boolTemp = false;
            }
            finally
            {
                objConnection.Close();
            }
            return boolTemp;
        }
    }

    public static bool SendPhotoRequest(string From, string To, bool IsHoro)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserPasswordHoroRequest_SendRequest
         * * * * * * * * * * * * * * * * * * * * * * * * * 
        Type: INSERT  
         * * * * * * * * * * * * * * * * * * * * * * * * * 
        Parameters :
		            @RequestFrom varchar(15),
		            @RequestTo varchar(15),
		            @IsPhoto bit = 0 
         * * * * * * * * * * * * * * * * * * * * * * * * */

        bool boolTemp = false;

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Inserting data into

                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserPhotoHoroPasswordRequest_SendRequest", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@RequestFrom", SqlDbType.VarChar));
                objCommand.Parameters.Add(new SqlParameter("@RequestTo", SqlDbType.VarChar));
                objCommand.Parameters.Add(new SqlParameter("@IsPhoto", SqlDbType.Bit));

                // Setting Valuse
                objCommand.Parameters["@RequestFrom"].Value = From;
                objCommand.Parameters["@RequestTo"].Value = To;
                objCommand.Parameters["@IsPhoto"].Value = IsHoro;

                // Executing Qurey
                objConnection.Open();
                int Temp = objCommand.ExecuteNonQuery();
                boolTemp = true;
            }
            catch (Exception Ex)
            {
                ErrorLog.WriteErrorLog("SendPhotoRequest", Ex);
                boolTemp = false;
            }
            finally
            {
                objConnection.Close();
            }
            return boolTemp;
        }
    }

    public static void GrandPhotoRequest(string ToID, string FromID, bool IsPhoto)
    {   /* * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name :UserPhotoHoroPasswordGrand_GrandPassword
         * * * * * * * * * * * * * * * * * * * * * * * * * 
        Type: INSERT  
         * * * * * * * * * * * * * * * * * * * * * * * * * 
        Parameters :
		            @GrandedBy varchar(15),
		            @GrandedTo varchar(15),
		            @IsPhoto bit 
         * * * * * * * * * * * * * * * * * * * * * * * * */

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Inserting data into

                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserPhotoHoroPasswordGrand_GrandPassword", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@GrandedBy", SqlDbType.VarChar));
                objCommand.Parameters.Add(new SqlParameter("@GrandedTo", SqlDbType.VarChar));
                objCommand.Parameters.Add(new SqlParameter("@IsPhoto", SqlDbType.Bit));

                // Setting Valuse
                objCommand.Parameters["@GrandedBy"].Value = FromID;
                objCommand.Parameters["@GrandedTo"].Value = ToID;
                objCommand.Parameters["@IsPhoto"].Value = IsPhoto;

                // Executing Qurey
                objConnection.Open();
                int Temp = objCommand.ExecuteNonQuery();
            }
            catch (Exception Ex)
            {
                ErrorLog.WriteErrorLog("GrandPhotoRequest", Ex);
            }
            finally
            {
                objConnection.Close();
            }
        }
    }

    public static void DeletePasswordRequest(string FromID, string ToID, bool IsPhoto)
    {   /* * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name :UserPhotoHoroPasswordRequest_DropRequest
         * * * * * * * * * * * * * * * * * * * * * * * * * 
        Type: INSERT  
         * * * * * * * * * * * * * * * * * * * * * * * * * 
        Parameters :
		            @FromID varchar(15),
		            @ToID varchar(15),
		            @IsPhoto bit 
         * * * * * * * * * * * * * * * * * * * * * * * * */

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Inserting data into

                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserPhotoHoroPasswordRequest_DropRequest", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@ToID", SqlDbType.VarChar));
                objCommand.Parameters.Add(new SqlParameter("@FromID", SqlDbType.VarChar));
                objCommand.Parameters.Add(new SqlParameter("@IsPhoto", SqlDbType.Bit));

                // Setting Valuse
                objCommand.Parameters["@ToID"].Value = FromID;
                objCommand.Parameters["@FromID"].Value = ToID;
                objCommand.Parameters["@IsPhoto"].Value = IsPhoto;

                // Executing Qurey
                objConnection.Open();
                int Temp = objCommand.ExecuteNonQuery();
            }
            catch (Exception Ex)
            {
                ErrorLog.WriteErrorLog("GrandPhotoRequest", Ex);
            }
            finally
            {
                objConnection.Close();
            }
        }
    }

    public static int GetPhotoHoroPasswordCount(string MatrimonialID, bool ISRequest)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserPhotoHoroPassword_GetCount 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */
        int strInt = 0;
        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserPhotoHoroPassword_GetCount", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;

                objCommand.Parameters.Add(new SqlParameter("@ID", SqlDbType.VarChar));
                objCommand.Parameters["@ID"].Value = MatrimonialID;

                if (!ISRequest)
                {
                    objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.SmallInt));
                    objCommand.Parameters["@Flag"].Value = 1;
                }

                objConnection.Open();
                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();
                strInt = objReader.GetInt32(0);
                objReader.Close();
                objConnection.Close();
            }
            catch (Exception Ex)
            {
                ErrorLog.WriteErrorLog("InternalMessage-", Ex);

                strInt = 0;
            }
            finally
            { 
                objConnection.Close();
            }
            return strInt;
        }
    }

    public static string[,] GetPasswordList(string ID,int Start, bool ISRequest)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
           Procedure Name : UserPhotoHoroPassword_GetList
            * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
           Type: SELECT 
            * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
           Parameters :
            * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                       ID
            * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                       IsPhoto
            * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                       Password
                       GrandFrom
            * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                       RequestFrom
            * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        string[,] strAPasswod = new string[10, 3];

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserPhotoHoroPassword_GetList", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding Parameters

                objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.SmallInt));
                if (!ISRequest)
                {
                    objCommand.Parameters["@Flag"].Value = 1;
                }
                objCommand.Parameters.Add(new SqlParameter("@ID", SqlDbType.VarChar));
                objCommand.Parameters["@ID"].Value = ID;


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
                        if (!ISRequest)
                        {
                            strAPasswod[i, 0] = objReader["GrandFrom"].ToString();
                            strAPasswod[i, 1] = Convert.ToBoolean(objReader["IsPhoto"]).ToString();
                            strAPasswod[i, 2] = objReader["Password"].ToString();
                        }
                        else
                        {
                            strAPasswod[i, 0] = objReader["RequestFrom"].ToString();
                            strAPasswod[i, 1] = Convert.ToBoolean(objReader["IsPhoto"]).ToString();
                        }
                        objReader.Read();
                    }
                }
                catch (Exception)
                { }

                objConnection.Close();
                return strAPasswod;

            }
            catch (Exception Ex)
            {
                ErrorLog.WriteErrorLog("InternalMessage GetPasswordList", Ex);
                objConnection.Close();
                return null;
            }

        }
    }

    public static MemberIntrest[] GetIntrestList(string MatrimonialID, bool IsInbox, int Start, MemberIntrest.TypeOfIntrest Type)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
           Procedure Name : UserIntrests_Fill
            * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
           Type: SELECT 
            * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
           Parameters :
            * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
		            @@MatrimonialID varchar(25)
		            @Flag smallint
                    @Status  
            * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    IntrestsCode  
                    Date
            * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        MemberIntrest[] objAIntrest = new MemberIntrest[10];


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
            //Creating Command object
            SqlCommand objCommand = new SqlCommand("UserIntrests_Fill", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            //Adding Parameters
            objCommand.Parameters.Add(new SqlParameter("@MatrimonialID", SqlDbType.VarChar));
            objCommand.Parameters["@MatrimonialID"].Value = MatrimonialID;
            //Intrest In or Out
            objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.SmallInt));
            if (IsInbox)
            {
                objCommand.Parameters["@Flag"].Value = 0;
            }
            else
            {
                objCommand.Parameters["@Flag"].Value = 1;
            }
             //pending ? Approved ? Declined ?
            objCommand.Parameters.Add(new SqlParameter("@Status", SqlDbType.SmallInt));
            switch (Type)
            {
                case MemberIntrest.TypeOfIntrest.Pending:
                    objCommand.Parameters["@Status"].Value = 1;
                    break;
                case MemberIntrest.TypeOfIntrest.Approved:
                    objCommand.Parameters["@Status"].Value = 2;
                    break;
                case MemberIntrest.TypeOfIntrest.Declined:
                    objCommand.Parameters["@Status"].Value = 3;
                    break;
            }
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
                    objAIntrest[i] = new MemberIntrest();
                    objAIntrest[i].IntrestFrom = objReader["ID"].ToString();
                    objAIntrest[i].SendingDate = Convert.ToDateTime(objReader["Date"]);
                    objAIntrest[i].IntrestType = Convert.ToSByte(objReader["IntrestsCode"]);
                    objAIntrest[i].IntrestStatus = Convert.ToSByte(objReader["Status"]);
                    objAIntrest[i].IsInBox = IsInbox;

                    objReader.Read();
                }
            }
            catch (Exception)
            { objAIntrest[i] = null; }

            objConnection.Close();
            return objAIntrest;
            }
            catch (Exception Ex)
            {
                ErrorLog.WriteErrorLog("Test", Ex);
                objConnection.Close();
                return null;
            }

        }
    }

    public static int GetIntrestCount(string MatrimonialID, IntrestStatus intrestStatus, MailType mailType)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserIntrests_Count 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */
        int strInt = 0;
        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserIntrests_Count", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;

                objCommand.Parameters.Add(new SqlParameter("@MatrimonialID", SqlDbType.VarChar));
                objCommand.Parameters["@MatrimonialID"].Value = MatrimonialID;

                if (mailType == MailType.OutBox)
                {
                    objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.SmallInt));
                    objCommand.Parameters["@Flag"].Value = 1;
                }
                objCommand.Parameters.Add(new SqlParameter("@Status", SqlDbType.SmallInt));
                switch (intrestStatus)
                {
                    case IntrestStatus.Pending:
                        objCommand.Parameters["@Status"].Value = 1;
                        break;
                    case IntrestStatus.Accepted:
                        objCommand.Parameters["@Status"].Value = 2;
                        break;
                    case IntrestStatus.Declined:
                        objCommand.Parameters["@Status"].Value = 3;
                        break;
                }

                objConnection.Open();
                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();
                strInt = objReader.GetInt32(0);
                objReader.Close();
            }
            catch (Exception Ex)
            {
                ErrorLog.WriteErrorLog("InternalMessage- GetIntrestCount", Ex);
                strInt = 0;
            }
            finally
            {
                objConnection.Close();
            }
            return strInt;
        }
    }

    public static void IntrestApprovel(string MatrimonialID, string FromID, IntrestStatus Status)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserIntrests_ApproveIntrest
         * * * * * * * * * * * * * * * * * * * * * * * * * 
        Type: INSERT  
         * * * * * * * * * * * * * * * * * * * * * * * * * 
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * 
                        @IntrestFrom varchar(25),
                        @IntrestTo varchar(25),
                        @Status smallint,
         * * * * * * * * * * * * * * * * * * * * * * * * */

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Inserting data into
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserIntrests_ApproveIntrest", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@IntrestFrom", SqlDbType.VarChar));
                objCommand.Parameters.Add(new SqlParameter("@IntrestTo", SqlDbType.VarChar));
                objCommand.Parameters.Add(new SqlParameter("@Status", SqlDbType.SmallInt));
                // Setting Valuse
                objCommand.Parameters["@IntrestFrom"].Value = FromID;
                objCommand.Parameters["@IntrestTo"].Value = MatrimonialID;
                //objCommand.Parameters["@Status"].Value = 2;

                switch (Status)
                {
                    case IntrestStatus.Pending:
                        objCommand.Parameters["@Status"].Value = 1;
                        break;
                    case IntrestStatus.Accepted:
                        objCommand.Parameters["@Status"].Value = 2;
                        break;
                    case IntrestStatus.Declined:
                        objCommand.Parameters["@Status"].Value = 3;
                        break;
                }

                // Executing Qurey
                objConnection.Open();
                int intTemp = objCommand.ExecuteNonQuery();
            }
            catch (Exception Ex)
            {
                ErrorLog.WriteErrorLog("InternalMessage.IntrestApprovel", Ex);
            }
            finally
            {
                objConnection.Close();
            }
        }
    }


   #endregion





}

