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

public partial class Guest_simplesearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {


            // Adding meta Discription
            HtmlMeta objMeta = new HtmlMeta();
            objMeta.Name = "Description";
            objMeta.Content = WebConfig.GetValues("MetaDiscription");
            this.Header.Controls.Add(objMeta);

            // Adding meta KeyWords
            objMeta = new HtmlMeta();
            objMeta.Name = "keywords";
            objMeta.Content = WebConfig.GetValues("MetaKeword");
            this.Header.Controls.Add(objMeta);

            //Getting Connection String

            //Connect To database
            using (SqlConnection objConnection = DBConnection.GetSqlConnection())
            {
                try
                {
                    objConnection.Open();

                    SqlCommand objCommand = new SqlCommand("SELECT * FROM IndexReligion", objConnection);
                    SqlDataReader objDataReader = objCommand.ExecuteReader();

                    DDL_Religion.DataSource = objDataReader;
                    DDL_Religion.DataTextField = "Item";
                    DDL_Religion.DataValueField = "Value";
                    DDL_Religion.DataBind();
                    objDataReader.Close();
                }
                catch (Exception)
                { objConnection.Close(); }
            }
            DDL_Religion.Attributes.Add("onchange", "return caste_disable(document." + this.Form.ClientID + "." + DDL_Religion.ClientID + ",document." + this.Form.ClientID + "." + HF_Cast.ClientID + ",document." + this.Form.ClientID + "." + S_Caste.ClientID + ")");
            S_Caste.Attributes.Add("onchange", "loadHF(document." + this.Form.ClientID + "." + S_Caste.ClientID + ",document." + this.Form.ClientID + "." + HF_Cast.ClientID + ")");
        }
        else
        {
            //Search

            Page.Validate();

            if (IsValid)
            {
                // << ForTesting>>
                // Server.Transfer("~/Guest/Searchresults.aspx?g=" + RB_Male.Checked.ToString() + "&ai=" + TB_AgeMin.Text + "&ax=" + TB_AgeMax.Text + "&r=" + DDL_Religion.SelectedIndex.ToString() + "&c=" + HF_Cast.Value + "&ph=" + CB_needPhoto.Checked.ToString());

                Response.Redirect("~/Guest/Searchresults.aspx?g=" + RB_Male.Checked.ToString() + "&ai=" + TB_AgeMin.Text + "&ax=" + TB_AgeMax.Text + "&r=" + DDL_Religion.SelectedIndex.ToString() + "&c=" + HF_Cast.Value + "&ph=" + CB_needPhoto.Checked.ToString());
            }
        }
 
    }
}
