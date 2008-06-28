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

public partial class Admin_Protected_edit_plan_go : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            TB_NoOfContacts.Text = Request.UserHostAddress.ToString();

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

            if (Request.QueryString["id"] != null)
            {


                using (SqlConnection objConnection = DBConnection.GetSqlConnection())
                {
                    try
                    {
                        //Inserting data into

                        //Creating Command object
                        SqlCommand objCommand = new SqlCommand("MatrimonialMembershipPlan_GetPlan", objConnection);
                        objCommand.CommandType = CommandType.StoredProcedure;

                        switch (Request.QueryString["id"])
                        {
                            case "1":
                                objCommand.Parameters.Add(new SqlParameter("@PlanID", SqlDbType.SmallInt));
                                objCommand.Parameters["@PlanID"].Value = 1;
                                HF_Type.Value = "1";
                                break;
                            case "2":
                                objCommand.Parameters.Add(new SqlParameter("@PlanID", SqlDbType.SmallInt));
                                objCommand.Parameters["@PlanID"].Value = 2;
                                HF_Type.Value = "2";
                                break;
                            case "3":
                                objCommand.Parameters.Add(new SqlParameter("@PlanID", SqlDbType.SmallInt));
                                objCommand.Parameters["@PlanID"].Value = 3;
                                HF_Type.Value = "3";
                                break;
                            default:
                                Response.Redirect("../Extras/ErrorReport.aspx?id=404");
                                break;
                        }

                        objConnection.Open();
                        SqlDataReader objReader = objCommand.ExecuteReader();
                        objReader.Read();

                        TB_PlneName.Text = objReader["PlanName"].ToString();
                        TB_PlaneDuration.Text = objReader["PlanDuration"].ToString();
                        TB_PlaneAmount.Text = objReader["PlanAmount"].ToString();
                        TB_NoOfContacts.Text = objReader["Count"].ToString();
                        objReader.Close();
                        objConnection.Dispose();

                    }
                    catch (Exception)
                    {
                    }
                    finally
                    {
                        objConnection.Close();

                    }
                }
            }
            else
            {
                Response.Redirect("../Extras/ErrorReport.aspx?id=404");
            }
        }
        else //Save Setting Into database
        {
                      
            /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
            Procedure Name : MatrimonialMembershipPlan_Fill 
             * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
            Type: SELECT 
             * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
            Parameters :
             * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                        	@PlanID smallint , 
	                        @PlanAmount smallint,
	                        @PlanDuration smallint,
	                        @PlanName  Varchar(50)
             * * * * * * * * * * * * * * * * * * * * * * * * * * * */

                using (SqlConnection objConnection = DBConnection.GetSqlConnection())
                {
                    try
                    {
                        //Inserting data into

                        //Creating Command object
                        SqlCommand objCommand = new SqlCommand("MatrimonialMembershipPlan_Fill", objConnection);
                        objCommand.CommandType = CommandType.StoredProcedure;

                        objConnection.Open();

                        objCommand.Parameters.Add(new SqlParameter("@PlanID", SqlDbType.SmallInt));
                        objCommand.Parameters["@PlanID"].Value = short.Parse( HF_Type.Value);

                        objCommand.Parameters.Add(new SqlParameter("@PlanAmount", SqlDbType.SmallInt));
                        objCommand.Parameters["@PlanAmount"].Value = short.Parse( TB_PlaneAmount.Text);

                        objCommand.Parameters.Add(new SqlParameter("@PlanDuration", SqlDbType.SmallInt));
                        objCommand.Parameters["@PlanDuration"].Value = short.Parse( TB_PlaneDuration.Text);

                        objCommand.Parameters.Add(new SqlParameter("@PlanName", SqlDbType.VarChar));
                        objCommand.Parameters["@PlanName"].Value = TB_PlneName.Text;

                        int intTemp = objCommand.ExecuteNonQuery();
                       objConnection.Close();
                       L_Display.Visible = true;

                   }
                   catch (Exception)
                   {
                       objConnection.Close();
                       Response.Redirect("~/Extras/ErrorReport.aspx");
                   }//Try

                }//using
        }// Ispostback
    }// Page_Load
}// Class