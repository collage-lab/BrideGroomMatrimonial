using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;

using System.Data;
using System.Data.SqlClient;

public class MatrimonialCoustomerSupportManager
{
    public static void AddNewFeedBack(string EmailID, string Name, string Message)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * 
         Procedure Name : MatrimonialFeedBack_AddFeedBack 
          * * * * * * * * * * * * * * * * * * * * * * * * * 
         Type: INSERT  
          * * * * * * * * * * * * * * * * * * * * * * * * * 
         Parameters :
          * * * * * * * * * * * * * * * * * * * * * * * * * 
                         @EmailID varchar(64),
                         @Name varchar(50),
                         @Message varchar(300)
          * * * * * * * * * * * * * * * * * * * * * * * * */

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Inserting data into
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("MatrimonialFeedBack_AddFeedBack", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@EmailID", SqlDbType.VarChar));
                objCommand.Parameters.Add(new SqlParameter("@Name", SqlDbType.VarChar));
                objCommand.Parameters.Add(new SqlParameter("@Message", SqlDbType.VarChar));
                // Setting Valuse
                objCommand.Parameters["@EmailID"].Value = EmailID;
                objCommand.Parameters["@Name"].Value = Name;
                objCommand.Parameters["@Message"].Value = Message;

                // Executing Qurey
                objConnection.Open();
                int intTemp = objCommand.ExecuteNonQuery();
            }
            catch (Exception Ex)
            {
                ErrorLog.WriteErrorLog("MatrimonialCoustomerSupportManager.AddNewFeedBack", Ex);
            }
            finally
            {
                objConnection.Close();
            }
        }
    }

    public static void SetFeedBackFilter(bool Filter, short LifeTime)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * 
         Procedure Name : MatrimonialFeedBackFilter_SetFilter 
          * * * * * * * * * * * * * * * * * * * * * * * * * 
         Type: INSERT  
          * * * * * * * * * * * * * * * * * * * * * * * * * 
         Parameters :
          * * * * * * * * * * * * * * * * * * * * * * * * * 
                         @FilterON bit
                         @LifeTime smallint 
          * * * * * * * * * * * * * * * * * * * * * * * * */

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Inserting data into
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("MatrimonialFeedBackFilter_SetFilter", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@FilterON", SqlDbType.Bit));
                objCommand.Parameters.Add(new SqlParameter("@LifeTime", SqlDbType.SmallInt));
                // Setting Valuse
                objCommand.Parameters["@FilterON"].Value = Filter;
                objCommand.Parameters["@LifeTime"].Value = LifeTime;

                // Executing Qurey
                objConnection.Open();
                int intTemp = objCommand.ExecuteNonQuery();
            }
            catch (Exception Ex)
            {
                ErrorLog.WriteErrorLog("MatrimonialCoustomerSupportManager.SetFeedBackFilter", Ex);
            }
            finally
            {
                objConnection.Close();
            }
        }
    }

    public static void ReportAbuse(string ID, string Message, bool IsProfile)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : Matrimonial_ReportAbuse
         * * * * * * * * * * * * * * * * * * * * * * * * * 
        Type: INSERT  
         * * * * * * * * * * * * * * * * * * * * * * * * * 
        Parameters :
                    @ID
                    @Flag
         * * * * * * * * * * * * * * * * * * * * * * * * */


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Inserting data into

                //Creating Command object
                SqlCommand objCommand = new SqlCommand("Matrimonial_ReportAbuse", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@ID", SqlDbType.VarChar));
                objCommand.Parameters["@ID"].Value = ID;

                objCommand.Parameters.Add(new SqlParameter("@Message", SqlDbType.VarChar));
                objCommand.Parameters["@Message"].Value = Message;

                if (IsProfile)
                {
                    objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.SmallInt));
                    objCommand.Parameters["@Flag"].Value = 1;
                }

                // Executing Qurey
                objConnection.Open();
                int Temp = objCommand.ExecuteNonQuery();
            }
            catch (Exception Ex)
            {
                ErrorLog.WriteErrorLog("AbuseProfileList", Ex);
            }
            finally
            {
                objConnection.Close();
            }
        }


    }

    public static DataTable ReadFeedBack()
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * 
         Procedure Name : MatrimonialFeedBack_ReadFeedBack
          * * * * * * * * * * * * * * * * * * * * * * * * * 
         Type: SELECT
          * * * * * * * * * * * * * * * * * * * * * * * * * 
         Parameters :
          * * * * * * * * * * * * * * * * * * * * * * * * * 
                         EmailID varchar(64),
                         Name varchar(50),
                         Message varchar(300),
                         Date
          * * * * * * * * * * * * * * * * * * * * * * * * */
        DataSet objDataSet = new DataSet();
        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Inserting data into
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("MatrimonialFeedBack_ReadFeedBack", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters

                // Executing Qurey
                objConnection.Open();
                SqlDataAdapter objAdapter = new SqlDataAdapter(objCommand);
                objAdapter.Fill(objDataSet, "FeedBack");
                objAdapter.Dispose();
            }
            catch (Exception Ex)
            {
                ErrorLog.WriteErrorLog("MatrimonialCoustomerSupportManager.ReadFeedBack", Ex);
            }
            finally
            {
                objConnection.Close();
            }
            return objDataSet.Tables["FeedBack"];
        }
    }

    public static short ReadFilter()
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * 
         Procedure Name : MatrimonialFeedBackFilter_GetFilter
          * * * * * * * * * * * * * * * * * * * * * * * * * 
         Type: SELECT
          * * * * * * * * * * * * * * * * * * * * * * * * * 
         Parameters :
          * * * * * * * * * * * * * * * * * * * * * * * * * 
                         Filter,
                         LifeTime
          * * * * * * * * * * * * * * * * * * * * * * * * */
        short shortTemp = 0;
        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Inserting data into
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("MatrimonialFeedBackFilter_GetFilter", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters

                // Executing Qurey
                objConnection.Open();
                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();
                if (Convert.ToBoolean(objReader["Filter"]))
                {
                    shortTemp = Convert.ToInt16(objReader["LifeTime"]);
                }

            }
            catch (Exception Ex)
            {
                ErrorLog.WriteErrorLog("MatrimonialCoustomerSupportManager.ReadFilter", Ex);
            }
            finally
            {
                objConnection.Close();
            }
            return shortTemp;
        }
    }
}
