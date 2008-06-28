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

public partial class Registration_RegistrationConfirm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
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
                    L_Plan2Name.Text = objReader["PlanName"].ToString();
                    L_Plan2Duration.Text = objReader["PlanDuration"].ToString();
                    L_Plan2Amount.Text = objReader["PlanAmount"].ToString();

                    objReader.Read();
                    L_Plan3Name.Text = objReader["PlanName"].ToString();
                    L_Plan3Duration.Text = objReader["PlanDuration"].ToString();
                    L_Plan3Amount.Text = objReader["PlanAmount"].ToString();
                    objReader.Close();
                    objConnection.Close();
                }
                catch (Exception)
                {
                    objConnection.Close();
                    Response.Redirect("~/Extras/ErrorReport.aspx");
                }
            }
        }
    }
    protected void IMG_Profile_Click(object sender, ImageClickEventArgs e)
    {
        FormsAuthentication.SignOut();
        Response.Redirect("~/Member/Profile.aspx");
    }
    protected void IMB_UpGrade_Click(object sender, ImageClickEventArgs e)
    {
        FormsAuthentication.SignOut();
        Response.Redirect("~/Payment/Order.aspx");
    }
}
