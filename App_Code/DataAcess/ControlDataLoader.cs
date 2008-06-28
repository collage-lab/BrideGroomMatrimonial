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
/// Summary description for ControlDataLoader
/// </summary>
public class ControlDataLoader
{
	public ControlDataLoader()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public enum ControlType
    {
        AnnualIncomeRange,
        BloodGroup,
        Cast,
        Complexion,
        Country,
        Currency,
        Diet,
        Education,
        EduDetails,
        EmployedIn,
        FamilyStatus,
        Familytype,
        FamilyValue,
        HoroManglic,
        Hobbies,
        Interests,
        MaritalStatus,
        MoonSign,
        MotherTongue,
        Occupation,
        ProfileCreatedBy,
        ReferenceBy,
        Religion,
        ResidenceStatus,
        SmokeNDrink,
        Star,
        State,
        Sequrity
    };


    //--------Public Functions-------------

    public static DataSet DataForLoadingControls(ControlDataLoader.ControlType NameOfTable)
    {
        string strCacheString = "";
        switch (NameOfTable)
        {
            case ControlDataLoader.ControlType.AnnualIncomeRange:
                strCacheString = "AnnualIncomeRange";
                break;
            case ControlDataLoader.ControlType.BloodGroup:
                strCacheString = "BloodGroup";
                break;
            case ControlDataLoader.ControlType.Cast:
                strCacheString = "Cast";
                break;
            case ControlDataLoader.ControlType.Complexion:
                strCacheString = "Complexion";
                break;
            case ControlDataLoader.ControlType.Country:
                strCacheString = "Country";
                break;
            case ControlDataLoader.ControlType.Currency:
                strCacheString = "Currency";
                break;
            case ControlDataLoader.ControlType.Diet:
                strCacheString = "Diet";
                break;
            case ControlDataLoader.ControlType.Education:
                strCacheString = "Education";
                break;
            case ControlDataLoader.ControlType.EduDetails:
                strCacheString = "EduDetails";
                break;
            case ControlDataLoader.ControlType.EmployedIn:
                strCacheString = "EmployedIn";
                break;
            case ControlDataLoader.ControlType.FamilyStatus:
                strCacheString = "FamilyStatus";
                break;
            case ControlDataLoader.ControlType.Familytype:
                strCacheString = "Familytype";
                break;
            case ControlDataLoader.ControlType.FamilyValue:
                strCacheString = "FamilyValue";
                break;
            case ControlDataLoader.ControlType.HoroManglic:
                strCacheString = "HoroManglic";
                break;
            case ControlDataLoader.ControlType.Hobbies:
                strCacheString = "Hobbies";
                break;
            case ControlDataLoader.ControlType.Interests:
                strCacheString = "Interests";
                break;
            case ControlDataLoader.ControlType.Star:
                strCacheString = "Star";
                break;
            case ControlDataLoader.ControlType.MaritalStatus:
                strCacheString = "MaritalStatus";
                break;
            case ControlDataLoader.ControlType.MoonSign:
                strCacheString = "MoonSign";
                break;
            case ControlDataLoader.ControlType.MotherTongue:
                strCacheString = "MotherTongue";
                break;
            case ControlDataLoader.ControlType.Occupation:
                strCacheString = "Occupation";
                break;
            case ControlDataLoader.ControlType.ProfileCreatedBy:
                strCacheString = "ProfileCreatedBy";
                break;
            case ControlDataLoader.ControlType.ReferenceBy:
                strCacheString = "ReferenceBy";
                break;
            case ControlDataLoader.ControlType.Religion:
                strCacheString = "Religion";
                break;
            case ControlDataLoader.ControlType.ResidenceStatus:
                strCacheString = "ResidenceStatus";
                break;
            case ControlDataLoader.ControlType.SmokeNDrink:
                strCacheString = "SmokeNDrink";
                break;
            case ControlDataLoader.ControlType.State:
                strCacheString = "State";
                break;
            case ControlDataLoader.ControlType.Sequrity:
                strCacheString = "Sequrity";
                break;
        }

        DataSet objReturnDataset = new DataSet();

        if (HttpContext.Current.Cache[strCacheString] == null)
        {
            objReturnDataset = LoadingFirst(strCacheString);
        }
        else
        {
            objReturnDataset = (DataSet)HttpContext.Current.Cache[strCacheString];
        }

        return objReturnDataset;

    }

    public static string GetIndexValue(ControlDataLoader.ControlType NameOfTable, int Index)
    {
        string strCacheString = "";
        switch (NameOfTable)
        {
            case ControlDataLoader.ControlType.AnnualIncomeRange:
                strCacheString = "AnnualIncomeRange";
                break;
            case ControlDataLoader.ControlType.BloodGroup:
                strCacheString = "BloodGroup";
                break;
            case ControlDataLoader.ControlType.Cast:
                strCacheString = "Cast";
                break;
            case ControlDataLoader.ControlType.Complexion:
                strCacheString = "Complexion";
                break;
            case ControlDataLoader.ControlType.Country:
                strCacheString = "Country";
                break;
            case ControlDataLoader.ControlType.Currency:
                strCacheString = "Currency";
                break;
            case ControlDataLoader.ControlType.Diet:
                strCacheString = "Diet";
                break;
            case ControlDataLoader.ControlType.Education:
                strCacheString = "Education";
                break;
            case ControlDataLoader.ControlType.EduDetails:
                strCacheString = "EduDetails";
                break;
            case ControlDataLoader.ControlType.EmployedIn:
                strCacheString = "EmployedIn";
                break;
            case ControlDataLoader.ControlType.FamilyStatus:
                strCacheString = "FamilyStatus";
                break;
            case ControlDataLoader.ControlType.Familytype:
                strCacheString = "Familytype";
                break;
            case ControlDataLoader.ControlType.FamilyValue:
                strCacheString = "FamilyValue";
                break;
            case ControlDataLoader.ControlType.HoroManglic:
                strCacheString = "HoroManglic";
                break;
            case ControlDataLoader.ControlType.Hobbies:
                strCacheString = "Hobbies";
                break;
            case ControlDataLoader.ControlType.Interests:
                strCacheString = "Interests";
                break;
            case ControlDataLoader.ControlType.Star:
                strCacheString = "Star";
                break;
            case ControlDataLoader.ControlType.MaritalStatus:
                strCacheString = "MaritalStatus";
                break;
            case ControlDataLoader.ControlType.MoonSign:
                strCacheString = "MoonSign";
                break;
            case ControlDataLoader.ControlType.MotherTongue:
                strCacheString = "MotherTongue";
                break;
            case ControlDataLoader.ControlType.Occupation:
                strCacheString = "Occupation";
                break;
            case ControlDataLoader.ControlType.ProfileCreatedBy:
                strCacheString = "ProfileCreatedBy";
                break;
            case ControlDataLoader.ControlType.ReferenceBy:
                strCacheString = "ReferenceBy";
                break;
            case ControlDataLoader.ControlType.Religion:
                strCacheString = "Religion";
                break;
            case ControlDataLoader.ControlType.ResidenceStatus:
                strCacheString = "ResidenceStatus";
                break;
            case ControlDataLoader.ControlType.SmokeNDrink:
                strCacheString = "SmokeNDrink";
                break;
            case ControlDataLoader.ControlType.State:
                strCacheString = "State";
                break;
            case ControlDataLoader.ControlType.Sequrity:
                strCacheString = "Sequrity";
                break;
        }
        string strRetrunString = null;
        // is it in cacahe?
        try
        {
            if (HttpContext.Current.Cache[strCacheString] != null)
            {
                strRetrunString = ((DataSet)HttpContext.Current.Cache[strCacheString]).Tables["IndexTable"].Rows[Index]["Item"].ToString();
            }
            else
            {
                strRetrunString = (LoadingFirst(strCacheString)).Tables["IndexTable"].Rows[Index]["Item"].ToString();
            }
        }
        catch (Exception Ex)
        {
            ErrorLog.WriteErrorLog("ControlDataLoader.GetIndexValue(" + strCacheString + "," + Index.ToString() + ")", Ex);
            strRetrunString = "-";
        }
        return strRetrunString;
    }


    //--------Private Functions ------------

    private static DataSet LoadingFirst(string ChacheID)
    {
        string strSQL = "SELECT * FROM Index" + ChacheID;

        //New Dataset
        DataSet objDataSet = new DataSet();
        //Start DB opperation
        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand(strSQL, objConnection);
                objCommand.CommandType = CommandType.Text;

                objConnection.Open();
                new SqlDataAdapter(objCommand).Fill(objDataSet, "IndexTable");
                // Adding into cache
                HttpContext.Current.Cache[ChacheID] = objDataSet;

            }
            catch (Exception EX)
            {
                ErrorLog.WriteErrorLog("ControlDataLoader.LoadingFirst", EX);
                ErrorLog.WriteLog("MatrimonialSales.LoadingFirst SQL = " + strSQL);
            }
            finally
            {
                objConnection.Close();
            }
        }

        return objDataSet;

    }

}
