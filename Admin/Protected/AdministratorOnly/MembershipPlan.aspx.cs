using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Data.SqlClient;

public partial class Admin_Protected_MembershipPlan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Load Controsls

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

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Inserting data into

                //Creating Command object
                SqlCommand objCommand = new SqlCommand("MatrimonialMembershipPlan_GetPlan", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;

                objConnection.Open();
                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();
                L_Plan1Name.Text = objReader["PlanName"].ToString();
                L_Plan1Duration.Text = objReader["PlanDuration"].ToString();
                L_Plan1Amount.Text = objReader["PlanAmount"].ToString();

                objReader.Read();
                L_Plane2Name.Text = objReader["PlanName"].ToString();
                L_Plan2Duration.Text = objReader["PlanDuration"].ToString();
                L_Plan2Amount.Text = objReader["PlanAmount"].ToString();

                objReader.Read();
                L_Plane3Name.Text = objReader["PlanName"].ToString();
                Label11.Text = objReader["PlanDuration"].ToString();
                L_Plan3Amount.Text = objReader["PlanAmount"].ToString();
                objReader.Close();
                objConnection.Dispose();
            }
            catch (Exception)
            {
                L_Plan1Amount.Text = "Error";
            }
            finally
            { 
                objConnection.Close();
            
            }
        }
    }
}
