using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;

using System.Data;
using System.Data.SqlClient;

public class MatrimonialMessanger
{

    public enum MailingType : int { Newstetter = 1, SupportMail = 2, NewProduct = 3, ToAll = 4, TOActiveMembers = 5, ToInActiveMembers = 6, TOPaidMembers = 7 }



    public static int[] GetMessageList(int Start, string MatrimonialID, bool ISSendItem)
    {

        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserMessages_MaiList
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    MessageID
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        int[] strAInt = new int[10];

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserMessages_MaiList", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding Parameters

                if (ISSendItem)
                {
                    objCommand.Parameters.Add(new SqlParameter("@Flage", SqlDbType.SmallInt));
                    objCommand.Parameters["@Flage"].Value = 1;
                }
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
                        strAInt[i] = Convert.ToInt32(objReader["MessageID"]);
                        objReader.Read();
                    }
                }
                catch (Exception)
                {
                    objConnection.Close();
                    return strAInt;
                }

                objConnection.Close();
                return strAInt;

            }
            catch (Exception)
            {
                objConnection.Close();
                return null;
            }

        }
    }

    public static int GetMessageCount(string MatrimonialID, bool ISSetItem)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserMessages_Count 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserMessages_Count", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;

                objCommand.Parameters.Add(new SqlParameter("@MatrimonialID", SqlDbType.VarChar));
                objCommand.Parameters["@MatrimonialID"].Value = MatrimonialID;

                if (ISSetItem)
                {
                    objCommand.Parameters.Add(new SqlParameter("@Flage", SqlDbType.SmallInt));
                    objCommand.Parameters["@Flage"].Value = 1;
                }

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

    public static bool[] GetMailListSettings(string MailAddress)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
            Procedure Name : MatrimonialMailList_GetSettings
             * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
            Type: SELECT 
             * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
            Parameters :
             * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                        @ApplicationID varchar(25)
             * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                        PromotionalMails
                        NewFeatures
                        PartnerMails
                        DailyMatch
             * * * * * * * * * * * * * * * * * * * * * * * * * * * */


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Inserting data into

                //Creating Command object
                SqlCommand objCommand = new SqlCommand("MatrimonialMailList_GetSettings", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@EmailAddress", SqlDbType.VarChar));
                objCommand.Parameters["@EmailAddress"].Value = MailAddress;

                objConnection.Open();
                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();

                bool[] boolSettingsArray = new bool[4];
                boolSettingsArray[0] = Convert.ToBoolean(objReader["PromotionalMails"]);
                boolSettingsArray[1] = Convert.ToBoolean(objReader["NewFeatures"]);
                boolSettingsArray[2] = Convert.ToBoolean(objReader["PartnerMails"]);
                boolSettingsArray[3] = Convert.ToBoolean(objReader["DailyMatch"]);

                objConnection.Close();

                return boolSettingsArray;
            }
            catch (Exception)
            {
                return null;
            }
        }

    }

    public static string[] GetMailingList(MailingType Type)
    {

        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : MatrimonialMailList_GetList
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                     @Flag tinyint
         * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
                     MailList 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        DataSet objDataSet = new DataSet();

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("MatrimonialMailList_GetList", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding Parameters

                objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.TinyInt));
                switch (Type)
                {
                    case MailingType.Newstetter:
                        objCommand.Parameters["@Flag"].Value = 1;
                        break;
                    case MailingType.NewProduct:
                        objCommand.Parameters["@Flag"].Value = 2;
                        break;
                    case MailingType.ToAll:
                        objCommand.Parameters["@Flag"].Value = 3;
                        break;
                    case MailingType.TOPaidMembers:
                        objCommand.Parameters["@Flag"].Value = 4;
                        break;
                    case MailingType.TOActiveMembers:
                        objCommand.Parameters["@Flag"].Value = 5;
                        break;
                    case MailingType.ToInActiveMembers:
                        objCommand.Parameters["@Flag"].Value = 6;
                        break;
                    default:
                        throw new Exception("Wrong Parameter");
                        break;
                }


                objConnection.Open();
                SqlDataAdapter objDataAdapter = new SqlDataAdapter(objCommand);

                objDataAdapter.Fill(objDataSet, "MailList");
                objDataAdapter.Dispose();
            }
            catch (Exception) { }
            finally
            {
                objConnection.Close();
            }

            if ((objDataSet.Tables["MailList"].Rows.Count != null) && (objDataSet.Tables["MailList"].Rows.Count > 0))
            {
                string[] strAList = new string[objDataSet.Tables["MailList"].Rows.Count];
                int intIncreminent = 0;
                if ((Type == MailingType.ToInActiveMembers) || (Type == MailingType.TOPaidMembers) || (Type == MailingType.TOActiveMembers))
                {
                    foreach (DataRow objDataRow in objDataSet.Tables["MailList"].Rows)
                    {
                        strAList[intIncreminent] = Crypto.DeCrypto(objDataRow["MailAddress"].ToString());
                        ++intIncreminent;
                    }
                }
                else
                {
                    foreach (DataRow objDataRow in objDataSet.Tables["MailList"].Rows)
                    {
                        strAList[intIncreminent] = objDataRow["MailAddress"].ToString();
                        ++intIncreminent;
                    }
                }
                return strAList;
            }
            else
            {
                return null;
            }
        }

    }

    public static MemberIntrest[] GetIntrest()
    {
        throw new Exception("No Implmentation");
        return null;
    }

    public static bool SetMailingSettings(string MailAddress, bool PromotionalMails, bool NewFeatures, bool PartnerMails, bool DailyMatch)
    {

        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : MatrimonialMailList_UpdateList
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: UPDATE  
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                        @EmailAddress
                        @PromotionalMails
		                @NewFeatures
		                @PartnerMails
		                @DailyMatch
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            //try
            //{
            //Inserting data into

            //Creating Command object
            SqlCommand objCommand = new SqlCommand("MatrimonialMailList_UpdateList", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@EmailAddress", SqlDbType.VarChar));
            objCommand.Parameters["@EmailAddress"].Value = MailAddress;

            objCommand.Parameters.Add(new SqlParameter("@PromotionalMails", SqlDbType.Bit));
            objCommand.Parameters["@PromotionalMails"].Value = PromotionalMails;

            objCommand.Parameters.Add(new SqlParameter("@NewFeatures", SqlDbType.Bit));
            objCommand.Parameters["@NewFeatures"].Value = NewFeatures;

            objCommand.Parameters.Add(new SqlParameter("@PartnerMails", SqlDbType.Bit));
            objCommand.Parameters["@PartnerMails"].Value = PartnerMails;

            objCommand.Parameters.Add(new SqlParameter("@DailyMatch", SqlDbType.Bit));
            objCommand.Parameters["@DailyMatch"].Value = DailyMatch;


            objConnection.Open();
            int intTemp = objCommand.ExecuteNonQuery();
            objConnection.Close();
            return true;
            //}
            //catch (Exception)
            //{
            //    objConnection.Close();
            //    return false;
            //}

        }

    }

    public static sbyte SetMailingSettings(string MailAddress)
    {

        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : MatrimonialMailList_UpdateList
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: UPDATE  
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                        @EmailAddress
                        @PromotionalMails
		                @NewFeatures
		                @PartnerMails
		                @DailyMatch
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            //try
            //{
            //Inserting data into

            //Creating Command object
            SqlCommand objCommand = new SqlCommand("MatrimonialMailList_UpdateList", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;
            //Adding new Parameters
            objCommand.Parameters.Add(new SqlParameter("@EmailAddress", SqlDbType.VarChar));
            objCommand.Parameters["@EmailAddress"].Value = MailAddress;


            objConnection.Open();
            int intTemp = objCommand.ExecuteNonQuery();
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
}
