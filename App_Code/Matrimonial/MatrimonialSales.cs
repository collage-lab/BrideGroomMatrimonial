using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
//--------------------------------//
using System.Data;
using System.Data.SqlClient;
public class MatrimonialSales
{

    public enum DetailsType
    {
        TotalUser,
        PaidMember,
        Sales
    };


    public static DataTable GetInvoice(string MatrimonialID)
    {

        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
         Procedure Name : Matrimonial_SailesDetails
          * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
         Type: SELECT 
          * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
         Parameters :
          * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                      @MatrimonialID Varchar
                      @Flag Bit
          * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        DataSet objDataSet = new DataSet();

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("Matrimonial_SailesDetails", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding Parameters

                objCommand.Parameters.Add(new SqlParameter("@MatrimonialID", SqlDbType.VarChar));
                objCommand.Parameters["@MatrimonialID"].Value = MatrimonialID;

                objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.Bit));
                objCommand.Parameters["@Flag"].Value = false;


                objConnection.Open();
                SqlDataAdapter objDataAdapter = new SqlDataAdapter(objCommand);

                objDataAdapter.Fill(objDataSet, "Invoice");
                objDataAdapter.Dispose();
            }
            catch (Exception) { }
            finally
            {
                objConnection.Close();
            }

            return objDataSet.Tables["Invoice"];
        }
    }

    public static DataTable GetSalesReport()
    {

        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
         Procedure Name : Matrimonial_SailesDetails
          * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
         Type: SELECT 
          * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
         Parameters :
          * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                     Amount
                     DateOfParches
                     Gender
                     Name
                     Address
                     MatrimonialID
          * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        DataSet objDataSet = new DataSet();

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("Matrimonial_SailesDetails", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding Parameters

                objConnection.Open();
                SqlDataAdapter objDataAdapter = new SqlDataAdapter(objCommand);

                objDataAdapter.Fill(objDataSet, "SailesDetails");
                objDataAdapter.Dispose();
            }
            catch (Exception) { }
            finally
            {
                objConnection.Close();
            }

            return objDataSet.Tables["SailesDetails"];
        }
    }

    public static DataTable GetMatrimonialUserStatis()
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : Matrimonial_Statics 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        RESULT :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    TOTAL
                    MALE
                    FEMALE
                    INACTIVE
                    ACTIVE
                    PAIDMEMBERS 
                    LOGINCOUNT 
                    FEMALE
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {

                SqlCommand objCommand = new SqlCommand("Matrimonial_Statics", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;

                objConnection.Open();
                DataSet objDataSet = new DataSet();
                new SqlDataAdapter(objCommand).Fill(objDataSet, "UserStatis");
                return objDataSet.Tables["UserStatis"];
            }
            catch (Exception EX)
            {
                ErrorLog.WriteErrorLog("MatrimonialSales.GetMatrimonialUserStatis", EX);
                return null;
            }

        }
    }

    public static DataTable GetUserStatis(DetailsType Type)
    {

        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
         Procedure Name : Matrimonials_MemberStatis
          * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
         Type: SELECT 
          * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
         RESULT :
          * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                     @Flag Tyniint
          * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {

                SqlCommand objCommand = new SqlCommand("Matrimonials_MemberStatis", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                switch (Type)
                {
                    case DetailsType.PaidMember:
                        objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.TinyInt));
                        objCommand.Parameters["@Flag"].Value = 1;
                        break;
                    case DetailsType.Sales:
                        objCommand.Parameters.Add(new SqlParameter("@Flag", SqlDbType.TinyInt));
                        objCommand.Parameters["@Flag"].Value = 2;
                        break;
                }
                objConnection.Open();
                DataSet objDataSet = new DataSet();
                new SqlDataAdapter(objCommand).Fill(objDataSet, "UserStatis");
                return objDataSet.Tables["UserStatis"];
            }
            catch (Exception EX)
            {
                ErrorLog.WriteErrorLog("MatrimonialSales.GetMatrimonialUserStatis", EX);
                return null;
            }

        }

    }
}
