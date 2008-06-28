



using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
//------------------------------------
using System.Data.SqlClient;

public class MatMemberShipInformations
{
    //------------------------------------
    private string strPlan1Name;
    private string strPlan1Duration;
    private string strPlan1Amount;
    //------------------------------------
    private string strPlan2Name;
    private string strPlan2Duration;
    private string strPlan2Amount;
    //------------------------------------
    private string strPlan3Name;
    private string strPlan3Duration;
    private string strPlan3Amount;
    //------------------------------------

    public MatMemberShipInformations()
	{
        //----------------------------------------------------------------------------------------------
        //Loading Matrimonial Infromations from DataBase
        //----------------------------------------------------------------------------------------------
        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : MatrimonialMembershipPlan_GetPlan
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    [PlanName]
                    [PlanDuration]
                    [PlanAmount]
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */
        //----------------------------------------------------------------------------------------------
        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Inserting data into
                //----------------------------------------------------------------------------------------------
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("MatrimonialMembershipPlan_GetPlan", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //----------------------------------------------------------------------------------------------
                objConnection.Open();
                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();
                strPlan1Name = objReader["PlanName"].ToString();
                strPlan1Duration = objReader["PlanDuration"].ToString();
                strPlan1Amount = objReader["PlanAmount"].ToString();
                //----------------------------------------------------------------------------------------------
                objReader.Read();
                strPlan2Name = objReader["PlanName"].ToString();
                strPlan2Duration = objReader["PlanDuration"].ToString();
                strPlan2Amount = objReader["PlanAmount"].ToString();
                //----------------------------------------------------------------------------------------------
                objReader.Read();
                strPlan3Name = objReader["PlanName"].ToString();
                strPlan3Duration = objReader["PlanDuration"].ToString();
                strPlan3Amount = objReader["PlanAmount"].ToString();
                //----------------------------------------------------------------------------------------------
                objReader.Close();
                objConnection.Close();
                //----------------------------------------------------------------------------------------------
            }
            catch (Exception EX)
            {
                //----------------------------------------------------------------------------------------------
                objConnection.Close();
                ErrorLog.WriteErrorLog("MatMemberShipInformations", EX);
                //----------------------------------------------------------------------------------------------
            }
        }
	}
    //----------------------------------------------------------------------------------------------
    public string Plan1Name
    {
        get 
        { 
            return strPlan1Name;
        }
    }
    public string Plan1Duration
    { 
        get 
        { 
            return strPlan1Duration; 
        } }
    public string Plan1Amount 
    { 
        get 
        { 
            return strPlan1Amount;
        } }
    //----------------------------------------------------------------------------------------------
    public string Plan2Name
    {
        get
        { 
            return strPlan2Name;
        } 
    }
    public string Plan2Duration
    { 
        get
        { 
            return strPlan2Duration;
        } 
    }
    public string Plan2Amount
    { 
        get 
        {
            return strPlan2Amount;
        }
    }
    //----------------------------------------------------------------------------------------------
    public string Plan3Name
    {
        get 
        { 
            return strPlan3Name;
        } 
    }
    public string Plan3Duration 
    {
        get
        {
            return strPlan3Duration;
        } 
    }
    public string Plan3Amount 
    {
        get 
        { 
            return strPlan3Amount;
        } 
    }
    //----------------------------------------------------------------------------------------------
}
