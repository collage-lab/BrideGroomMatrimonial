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

public partial class WeBControls_AdminLeftPanel : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
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
                SqlDataReader objReader = objCommand.ExecuteReader();

                objReader.Read();
                L_TotalMember.Text = objReader["TOTAL"].ToString();
                L_MProfile.Text = objReader["MALE"].ToString();
                L_FProfile.Text = objReader["FEMALE"].ToString();
                L_InActiveMember.Text = objReader["INACTIVE"].ToString();
                L_ActiveMember.Text = objReader["ACTIVE"].ToString();
                L_PaidMembers.Text = objReader["PAIDMEMBERS"].ToString();
                L_MembersVisited.Text = objReader["LOGINCOUNT"].ToString();
                objReader.Close();
                objReader.Dispose();
            }
            catch (Exception Ex)
            {
                ErrorLog.WriteErrorLog("WeBControls_AdminLeftPanel", Ex);
            }
            finally
            {
                objConnection.Close();
            }
            
        }




    }

    //Properties of the web control 
    //Active members
    public string ActiveMember
    {
       set
        {
            L_ActiveMember.Text = value;
        }
    }
    //Total members
    public string TotalMembers
    {
        set
        {
            L_TotalMember.Text = value;
        }
    
    }
    //InActive members
    public string InActiveMembers
    {
        set
        {

            L_InActiveMember.Text = value;
        }
    
    }
    //paid members
    public string PaidMembers
    {
        set {
            L_PaidMembers.Text = value;
        }
    }
    // FeMail Profile 
    public string FemaleProfiel
    {
        set
        {
            L_FProfile.Text = value;
        }
    }
       //male Profiles

    public string MaleProfile
    {
        set
        {
            L_MProfile.Text = value;
        }
    }
    //Clicks
    public string Clicks
    { 
        set{L_Clicks.Text = value;}
    }

    // Members visited
    public string MembersVisited
    {
        set{ L_MembersVisited.Text = value; }
    }


}
