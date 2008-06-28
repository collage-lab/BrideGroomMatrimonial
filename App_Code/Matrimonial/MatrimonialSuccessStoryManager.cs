using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
///////////////////////////////////
using System.Data;
using System.Data.SqlClient;


public class MatrimonialSuccessStoryManager
{
    public static string[] GetSuccessStoryList(int Start)
    { //<<<<<<< ForTesting >>>>>>>> Include message also

        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserSuccessStory_GetList
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    SStoryID
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        string[] strATemp = new string[10];

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserSuccessStory_GetList", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding Parameters


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
                        strATemp[i] = objReader["SStoryID"].ToString();
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

    public static string GetSuccessID(string MatrimonialID)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserSucessStory_GetStory
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @MatrimonailID varchar(15)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    SStoryID
                    @Flag = 2
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        string strTemp = null;

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserSucessStory_GetStory", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding Parameters
                objCommand.Parameters.Add(new SqlParameter("@MatrimonialID", SqlDbType.VarChar));
                objCommand.Parameters["@MatrimonialID"].Value = MatrimonialID;
                objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.SmallInt));
                objCommand.Parameters["@Flag"].Value = 2;

                objConnection.Open();
                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();

                strTemp = objReader["SStoryID"].ToString();
                objReader.Close();
            }
            catch (Exception) { }
            finally
            {
                objConnection.Close();
            }
        }
        return strTemp;

    }

    public static string GetSStoryID(string ID, bool ISMatrimonialID)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserSucessStory_GetStory
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @MatrimonailID varchar(15)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    SStoryID
                    MatrimonialID
                    Bride
                    Groom
                    WeddingDate
                    SucessStory
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */
        string strTemp = null;
        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserSucessStory_GetStory", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding Parameters
                if (ISMatrimonialID)
                {
                    objCommand.Parameters.Add(new SqlParameter("@MatrimonialID", SqlDbType.VarChar));
                    objCommand.Parameters["@MatrimonialID"].Value = ID;
                    objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.SmallInt));
                    objCommand.Parameters["@Flag"].Value = 1;
                }
                else // No SSID
                {
                    objCommand.Parameters.Add(new SqlParameter("@SStoryID", SqlDbType.VarChar));
                    objCommand.Parameters["@SStoryID"].Value = ID;
                }
                //Databse Operations
                objConnection.Open();
                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();
                //Getting Values
                strTemp = objReader["SStoryID"].ToString();
                objReader.Dispose();
            }
            catch (Exception) { }
            finally
            {
                objConnection.Close();
            }
            return strTemp;
        }
    }

    public static int GetSStoryCount()
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserSuccessStory_StoryCount 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserSuccessStory_StoryCount", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;

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

    public static DataTable GetSStory(string ID, bool ISMatrimonialID)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserSucessStory_GetStory
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @MatrimonailID varchar(15)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    SStoryID
                    MatrimonialID
                    Bride
                    Groom
                    WeddingDate
                    SucessStory
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        DataSet datasetTemp = new DataSet();

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserSucessStory_GetStory", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding Parameters
                if (ISMatrimonialID)
                {
                    objCommand.Parameters.Add(new SqlParameter("@MatrimonialID", SqlDbType.VarChar));
                    objCommand.Parameters["@MatrimonialID"].Value = ID;
                    objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.SmallInt));
                    objCommand.Parameters["@Flag"].Value = 1;
                }
                else // No SSID
                {
                    objCommand.Parameters.Add(new SqlParameter("@SStoryID", SqlDbType.VarChar));
                    objCommand.Parameters["@SStoryID"].Value = ID;
                }

                SqlDataAdapter objAdapter = new SqlDataAdapter(objCommand);
                objConnection.Open();
                objAdapter.Fill(datasetTemp, "SuccessStory");
                objConnection.Close();

                return datasetTemp.Tables["SuccessStory"];

            }
            catch (Exception)
            {
                objConnection.Close();
                return null;
            }

        }
    }

    public static bool AddSuccessStory(string SSID,string SStory, string MatrimonialID,string Bride,string Groom,DateTime WeddingDate,byte[] Image)
    {

            /*
                UserSuccessStory_InsertStory
                            
                    @SStoryID varchar(15) = NULL,
                    @MatrimonialID varchar(10) = NULL,
                    @Bride varchar(50) = NULL,
                    @Groom varchar(50) = NULL,
                    @WeddingDate smalldatetime = NULL,
                    @Photo image = NULL
                 */


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                SqlCommand objCommand = new SqlCommand("UserSuccessStory_InsertStory", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;

                /// Inserting parameters


                objCommand.Parameters.Add(new SqlParameter("@SStoryID", SqlDbType.VarChar));
                objCommand.Parameters["@SStoryID"].Value = SSID;


                objCommand.Parameters.Add(new SqlParameter("@SucessStory", SqlDbType.VarChar));
                objCommand.Parameters["@SucessStory"].Value = SStory;

                objCommand.Parameters.Add(new SqlParameter("@MatrimonialID", SqlDbType.VarChar));
                objCommand.Parameters["@MatrimonialID"].Value = MatrimonialID;


                objCommand.Parameters.Add(new SqlParameter("@Bride", SqlDbType.VarChar));
                objCommand.Parameters["@Bride"].Value = Bride;


                objCommand.Parameters.Add(new SqlParameter("@Groom", SqlDbType.VarChar));
                objCommand.Parameters["@Groom"].Value = Groom;

                objCommand.Parameters.Add(new SqlParameter("@WeddingDate", SqlDbType.SmallDateTime));
                objCommand.Parameters["@WeddingDate"].Value = WeddingDate;


                objCommand.Parameters.Add(new SqlParameter("@Photo", SqlDbType.Image));
                objCommand.Parameters["@Photo"].Value = Image;

                /// Execute Sql Query

                objConnection.Open();
                objCommand.ExecuteNonQuery();
                objConnection.Close();

                return true;
            }
            catch (Exception Ex)
            {
                ErrorLog.WriteErrorLog("MatrimonialSuccessStoryManager.AddSuccessStory", Ex);
                return false;
            }
        }
    }

    public static DataTable AbuseSStoryList()
    {
        {
            /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
            Procedure Name : AbuseSuccessStorys_GetReport
             * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
            Type: SELECT 
             * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
            Parameters :
             * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                        SStoryID
             * * * * * * * * * * * * * * * * * * * * * * * * * * * */

            DataSet datasetTemp = new DataSet();

            using (SqlConnection objConnection = DBConnection.GetSqlConnection())
            {
                try
                {
                    //Creating Command object
                    SqlCommand objCommand = new SqlCommand("AbuseSuccessStorys_GetReport", objConnection);
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

    public static bool DeleteSStory(string SSID)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : UserSuccessStory_DropStory
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    @MatrimonailID varchar(15)
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    SStoryID
                    MatrimonialID
                    Bride
                    Groom
                    WeddingDate
                    SucessStory
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */
        bool boolFlag = false;
        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserSuccessStory_DropStory", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding Parameters
                objCommand.Parameters.Add(new SqlParameter("@SStoryID", SqlDbType.VarChar));
                objCommand.Parameters["@SStoryID"].Value = SSID;

                //Databse Operations
                objConnection.Open();
                int intTemp = objCommand.ExecuteNonQuery();
                //Getting Values
                boolFlag = true;
            }
            catch (Exception)
            {
                boolFlag = false;
            }
            finally
            {
                objConnection.Close();
            }
            return boolFlag;
        }
    }
}
