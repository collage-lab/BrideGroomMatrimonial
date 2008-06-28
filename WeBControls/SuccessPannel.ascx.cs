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

public partial class WeBControls_SuccessPannel : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string setMatrimonialID
    {
        set
        { L_MID.Text = value; }
    }
    public string setBride
    {
        set
        { L_Bride.Text = value; }
    }
    public string setGroom
    {
        set
        { L_Groom.Text = value; }
    }
    public string setDate
    {
        set
        { L_Mdate.Text = value; }
    }
    public string setImageURL
    {
        set
        {IMG_BnG.ImageUrl= value; }
    }
    public string setStory
    {
        set
        { L_SStory.Text = value; }
    }


    #region "Public Methode"

    // BinDing Controls
    public void Bind(string SucessStoryID)
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

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            try
            {
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("UserSucessStory_GetStory", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding Parameters
                objCommand.Parameters.Add(new SqlParameter("@SStoryID", SqlDbType.VarChar));
                objCommand.Parameters["@SStoryID"].Value = SucessStoryID;
                
                //Databse Operations
                objConnection.Open();
                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();
                //Getting Values
                L_MID.Text = objReader["MatrimonialID"].ToString();
                L_Bride.Text = objReader["Bride"].ToString();
                L_Groom.Text = objReader["Groom"].ToString();
                DateTime dateTemp = Convert.ToDateTime(objReader["WeddingDate"]);
                L_Mdate.Text = dateTemp.Day.ToString()+":"+dateTemp.Month.ToString()+":"+dateTemp.Year.ToString();
                L_SStory.Text = objReader["SucessStory"].ToString();
                IMG_BnG.ImageUrl = "~/Extras/imagecon.aspx?matid=" + SucessStoryID + "&id=6";
                HF_StoryID.Value = SucessStoryID;
                objReader.Dispose();
                this.Visible = true;
            }
            catch (Exception)
            {
                this.Visible = false;
            }
            finally
            {
                objConnection.Close();
            }

        }
    }

    public  bool DeleteMe()
    {
         return MatrimonialSuccessStoryManager.DeleteSStory( HF_StoryID.Value);

    }
    #endregion
}
