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
/// Summary description for SearchEngine
/// </summary>
public class SearchEngine
{
	public SearchEngine()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public enum SearchType : short {Simple=1,EducationalSearch = 2 , OccupationSearch = 3,IDSearch = 4,AdvansedSearch = 5,KeyWordSearch = 6, CitySearch = 7 }


    public static string[] Search(SearchType Type, bool Gender, sbyte AgeMin, sbyte AgeMax, short Religion, bool NeedPhoto, short Caste, short Criteria, int Start)
    {

      //ErrorLog.WriteLog(Type.ToString() + "  " + Gender.ToString() + "  " + AgeMin.ToString() + "  " + AgeMax.ToString() + "  " + Religion.ToString() + "  " + NeedPhoto.ToString() + "  " + Caste.ToString() + "  " + Criteria.ToString() + "  " + Start.ToString());



        /* * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : Search_Simple
         * * * * * * * * * * * * * * * * * * * * * * * * * 
                       : Search_Educational
         * * * * * * * * * * * * * * * * * * * * * * * * * 
                       : Search_Occupational
         * * * * * * * * * * * * * * * * * * * * * * * * * 
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * 
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * 
	                @Religion smallint
	                @Caste smallint
	                @Gender  bit
	                @isPhoto bit
	                @AgeMin int 
	                @AgeMax int 
         * * * * * * * * * * * * * * * * * * * * * * * * * 
                    @Education Smallint 
         * * * * * * * * * * * * * * * * * * * * * * * * * 
                    @Occupation Smallint 
         * * * * * * * * * * * * * * * * * * * * * * * * */

        string[] strATemp = null;


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                SqlCommand objCommand = null;

                switch (Type)
                {
                    case SearchType.Simple:
                        objCommand = new SqlCommand("Search_Simple", objConnection);
                        objCommand.CommandType = CommandType.StoredProcedure;
                        break;
                    case SearchType.EducationalSearch:
                        objCommand = new SqlCommand("Search_Educational", objConnection);
                        objCommand.CommandType = CommandType.StoredProcedure;
                        objCommand.Parameters.Add(new SqlParameter("@Education", SqlDbType.SmallInt));
                        objCommand.Parameters["@Education"].Value = Criteria;
                        break;
                    case SearchType.OccupationSearch:
                        objCommand = new SqlCommand("Search_Occupational", objConnection);
                        objCommand.CommandType = CommandType.StoredProcedure;
                        objCommand.Parameters.Add(new SqlParameter("@Occupation", SqlDbType.SmallInt));
                        objCommand.Parameters["@Occupation"].Value = Criteria;
                        break;
                }

                objCommand.Parameters.Add(new SqlParameter("@AgeMin", SqlDbType.SmallInt));
                objCommand.Parameters["@AgeMin"].Value = AgeMin;

                objCommand.Parameters.Add(new SqlParameter("@AgeMax", SqlDbType.SmallInt));
                objCommand.Parameters["@AgeMax"].Value = AgeMax;

                objCommand.Parameters.Add(new SqlParameter("@Gender", SqlDbType.Bit));
                objCommand.Parameters["@Gender"].Value = Gender;

                objCommand.Parameters.Add(new SqlParameter("@isPhoto", SqlDbType.Bit));
                objCommand.Parameters["@isPhoto"].Value = NeedPhoto;

                objCommand.Parameters.Add(new SqlParameter("@Religion", SqlDbType.SmallInt));
                objCommand.Parameters["@Religion"].Value = Religion;

                objCommand.Parameters.Add(new SqlParameter("@Caste", SqlDbType.SmallInt));
                objCommand.Parameters["@Caste"].Value = Caste;

                SqlDataAdapter objAdapter = new SqlDataAdapter(objCommand);

                DataSet objDataSet = new DataSet();
                objConnection.Open();
                objAdapter.Fill(objDataSet, "Search");
                if (objDataSet.Tables["Search"].Rows.Count != 0)
                {
                        strATemp = new string[15];
                        strATemp[0] = objDataSet.Tables["Search"].Rows.Count.ToString();
                        if (objDataSet.Tables["Search"].Rows.Count > 14)
                        {
                            for (int i = 0; i <= 13; ++i)
                            {
                                strATemp[i + 1] = ((objDataSet.Tables["Search"].Rows[Start + i])[0]).ToString();
                            }
                        }
                        else
                        {
                            for (int i = 0; i < objDataSet.Tables["Search"].Rows.Count ; ++i)
                            {
                                strATemp[i + 1] = ((objDataSet.Tables["Search"].Rows[Start + i])[0]).ToString();
                            }

                        }
                }
                else
                {   //No result
                    strATemp = new string[1];
                    strATemp[0] = "0";
                }

                //Adding Parameters
            }
            catch (Exception Ex)
            {
                ErrorLog.WriteErrorLog("Search.Search", Ex);
                ErrorLog.WriteLog("Search Type : " + Type.ToString());
                strATemp = new string[1];
                strATemp[0] = "0";
            }
            finally
            {
                objConnection.Close();
            }
        }
        return strATemp;
    }

    public static string[] KeyWordSearch(string SearchWord, bool Gender, int Start)
    {
        /* * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : Search_KeyWord
         * * * * * * * * * * * * * * * * * * * * * * * * * 
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * 
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * 
                    @SearchWord Varchar(200)
                    @Gender  bit
         * * * * * * * * * * * * * * * * * * * * * * * * * 
                    MatrimonialID
         * * * * * * * * * * * * * * * * * * * * * * * * */

        string[] strATemp = null;


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                SqlCommand objCommand = new SqlCommand("Search_KeyWord", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;


                objCommand.Parameters.Add(new SqlParameter("@Gender", SqlDbType.Bit));
                objCommand.Parameters["@Gender"].Value = Gender;

                objCommand.Parameters.Add(new SqlParameter("@SearchWord", SqlDbType.VarChar));
                objCommand.Parameters["@SearchWord"].Value = SearchWord;

                SqlDataAdapter objAdapter = new SqlDataAdapter(objCommand);

                DataSet objDataSet = new DataSet();
                objConnection.Open();
                objAdapter.Fill(objDataSet, "Search");
                if (objDataSet.Tables["Search"].Rows.Count != 0)
                {
                    strATemp = new string[15];
                    strATemp[0] = objDataSet.Tables["Search"].Rows.Count.ToString();
                    if (objDataSet.Tables["Search"].Rows.Count > 14)
                    {
                        for (int i = 0; i <= 13; ++i)
                        {
                            strATemp[i + 1] = ((objDataSet.Tables["Search"].Rows[Start + i])[0]).ToString();
                        }
                    }
                    else
                    {
                        for (int i = 0; i < objDataSet.Tables["Search"].Rows.Count; ++i)
                        {
                            strATemp[i + 1] = ((objDataSet.Tables["Search"].Rows[Start + i])[0]).ToString();
                        }

                    }
                }
                else
                {   //No result
                    strATemp = new string[1];
                    strATemp[0] = "0";
                }

                //Adding Parameters
            }
            catch (Exception Ex)
            {
                ErrorLog.WriteErrorLog("Search.Search", Ex);
                strATemp = new string[1];
                strATemp[0] = "0";
            }
            finally
            {
                objConnection.Close();
            }
        }
        return strATemp;

    }

    public static string[] AdvancedSearch(string SQL ,int Start)
    {

        string[] strATemp = null;

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                SqlCommand objCommand = new SqlCommand(SQL, objConnection);
                objCommand.CommandType = CommandType.Text;

                objConnection.Open();
                SqlDataAdapter objAdapter = new SqlDataAdapter(objCommand);

                DataSet objDataSet = new DataSet();

                objAdapter.Fill(objDataSet, "Search");
                if (objDataSet.Tables["Search"].Rows.Count != 0)
                {
                    strATemp = new string[15];
                    strATemp[0] = objDataSet.Tables["Search"].Rows.Count.ToString();
                    if (objDataSet.Tables["Search"].Rows.Count > 14)
                    {
                        for (int i = 0; i <= 13; ++i)
                        {
                            strATemp[i + 1] = ((objDataSet.Tables["Search"].Rows[Start + i])[0]).ToString();
                        }
                    }
                    else
                    {
                        for (int i = 0; i < objDataSet.Tables["Search"].Rows.Count; ++i)
                        {
                            strATemp[i + 1] = ((objDataSet.Tables["Search"].Rows[Start + i])[0]).ToString();
                        }
                    }
                }
                else
                {   //No result
                    strATemp = new string[1];
                    strATemp[0] = "0";
                }

                //Adding Parameters
            }
            catch (Exception Ex)
            {
                ErrorLog.WriteErrorLog("Search.AdvansedSearch", Ex);
                ErrorLog.WriteLog("SQL :" + SQL);
                strATemp = new string[1];
                strATemp[0] = "0";
            }
            finally
            {
                objConnection.Close();
            }
        }
        return strATemp;
    }

  


}
