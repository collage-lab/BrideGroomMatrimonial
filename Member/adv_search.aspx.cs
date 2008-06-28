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

public partial class adv_search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //-------------------------------------------------------------------------------------------------------------------
            // Adding meta Discription
            HtmlMeta objMeta = new HtmlMeta();
            objMeta.Name = "Description";
            objMeta.Content = WebConfig.GetValues("MetaDiscription");
            this.Header.Controls.Add(objMeta);
            //-------------------------------------------------------------------------------------------------------------------
            // Adding meta KeyWords
            objMeta = new HtmlMeta();
            objMeta.Name = "keywords";
            objMeta.Content = WebConfig.GetValues("MetaKeword");
            this.Header.Controls.Add(objMeta);
            //-------------------------------------------------------------------------------------------------------------------
            //Connect To database
            //Laod Religion
            //-------------------------------------------------------------------------------------------------------------------
            LB_Religion.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Religion); ;
            LB_Religion.DataTextField = "Item";
            LB_Religion.DataValueField = "Value";
            LB_Religion.DataBind();
            LB_Religion.Items.RemoveAt(0);
            //Laod Caste
            //-------------------------------------------------------------------------------------------------------------------
            LB_Caste.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Cast); ;
            LB_Caste.DataTextField = "Item";
            LB_Caste.DataValueField = "Value";
            LB_Caste.DataBind();
            LB_Caste.Items.RemoveAt(0);
            //Load Education
            //-------------------------------------------------------------------------------------------------------------------
            LB_Education.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Education); ;
            LB_Education.DataTextField = "Item";
            LB_Education.DataValueField = "Value";
            LB_Education.DataBind();
            LB_Education.Items.RemoveAt(0);
            //Load Occupation
            //-------------------------------------------------------------------------------------------------------------------
            LB_Occupation.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Occupation); ;
            LB_Occupation.DataTextField = "Item";
            LB_Occupation.DataValueField = "Value";
            LB_Occupation.DataBind();
            LB_Occupation.Items.RemoveAt(0);
            //Load Country
            //-------------------------------------------------------------------------------------------------------------------
            LB_Country.DataSource = ControlDataLoader.DataForLoadingControls(ControlDataLoader.ControlType.Country); ;
            LB_Country.DataTextField = "Item";
            LB_Country.DataValueField = "Value";
            LB_Country.DataBind();
            LB_Country.Items.RemoveAt(0);
            //-------------------------------------------------------------------------------------------------------------------
            Int16 Int16Counter;
            DDL_Height_Min.Items.Insert(0, "-- Select --");
            DDL_Height_Max.Items.Insert(0, "-- Select --");
            for (Int16Counter = 90; Int16Counter <= 185; ++Int16Counter)
            {
                DDL_Height_Min.Items.Insert(Int16Counter - 89, Int16Counter + " CM");
                DDL_Height_Max.Items.Insert(Int16Counter - 89, Int16Counter + 1 + " CM");
            }
            //-------------------------------------------------------------------------------------------------------------------
        }
        else
        {
            //Adding Select 
            //-------------------------------------------------------------------------------------------------------------------
            string strSQL =  "SELECT MatrimonialMemberShip.MatrimonialID ";
            //-------------------------------------------------------------------------------------------------------------------
            // Adding Innerjoining statment depending on Photo
            //-------------------------------------------------------------------------------------------------------------------
            if (CB_needPhoto.Checked)
            {
                strSQL += "   FROM  UserAuthentication INNER JOIN "
                             + " UserBasicInformation ON MatrimonialMemberShip.ApplicationID = UserBasicInformation.ApplicationID INNER JOIN"
                             + " UserContactInformations ON MatrimonialMemberShip.ApplicationID = UserContactInformations.ApplicationID INNER JOIN"
                             + " UserEducationAndOccupation ON MatrimonialMemberShip.ApplicationID = UserEducationAndOccupation.ApplicationID INNER JOIN"
                             + " UserPhysicalAttributes ON MatrimonialMemberShip.ApplicationID = UserPhysicalAttributes.ApplicationID INNER JOIN"
                             + " UserAlbum ON MatrimonialMemberShip.ApplicationID = UserAlbum.ApplicationID";
            }
            else//-------------------------------------------------------------------------------------------------------------------
            {
                strSQL += "    FROM  UserAuthentication INNER JOIN"
                               + " UserBasicInformation ON MatrimonialMemberShip.ApplicationID = UserBasicInformation.ApplicationID INNER JOIN"
                               + " UserContactInformations ON MatrimonialMemberShip.ApplicationID = UserContactInformations.ApplicationID INNER JOIN"
                               + " UserEducationAndOccupation ON MatrimonialMemberShip.ApplicationID = UserEducationAndOccupation.ApplicationID INNER JOIN"
                               + " UserPhysicalAttributes ON MatrimonialMemberShip.ApplicationID = UserPhysicalAttributes.ApplicationID";
            }
            //-------------------------------------------------------------------------------------------------------------------
            // Adding Filter
            //-------------------------------------------------------------------------------------------------------------------
            string SQLWHERE = " WHERE (";
            //-------------------------------------------------------------------------------------------------------------------
            SQLWHERE += " ( ";
            //-------------------------------------------------------------------------------------------------------------------
            // Basic Deteils
            //-------------------------------------------------------------------------------------------------------------------
            SQLWHERE += " (( MatrimonialMemberShip.Membership = 5)OR(MatrimonialMemberShip.Membership = 6 ))  AND (MatrimonialMemberShip.Hidden IS NULL) ";
            //-------------------------------------------------------------------------------------------------------------------
            if (RB_Looking_male.Checked)
            {
                SQLWHERE += " AND ( UserBasicInformation.Gender = 1) ";
            }
            else
            {
                SQLWHERE += " AND ( UserBasicInformation.Gender = 0) ";
            }
            //-------------------------------------------------------------------------------------------------------------------
            SQLWHERE += " AND (DATEDIFF(year,UserBasicInformation.DOB, getdate()) BETWEEN " + TB_Age_Min.Text + " AND " + TB_Age_Max.Text + ") ";

            //-------------------------------------------------------------------------------------------------------------------
            SQLWHERE += " )"
                        + " AND";
            //-------------------------------------------------------------------------------------------------------------------

            // NonBasic Details
            SQLWHERE += " ( ";
            //-------------------------------------------------------------------------------------------------------------------
            //Height
            //-------------------------------------------------------------------------------------------------------------------
            string strOptionalAnd = " ";
            if (DDL_Height_Max.SelectedIndex > 0)
            {
                SQLWHERE += "( UserPhysicalAttributes.Height BETWEEN " + (DDL_Height_Min.SelectedIndex + 90).ToString() + " AND " + (DDL_Height_Max.SelectedIndex + 90).ToString() + " )";
                strOptionalAnd = " AND "; //Setting Flag
            }
            //-------------------------------------------------------------------------------------------------------------------
            //          Maritals Status
            //-------------------------------------------------------------------------------------------------------------------
            if ((CB_MaritalStatus_UM.Checked) || (CB_MaritalStatus_Div.Checked) || (CB_MaritalStatus_WW.Checked) || (CB_MaritalStatus_Sep.Checked))
            {
                //Setting Flag
                string strOptionalOr = " ";
                SQLWHERE += strOptionalAnd + " ( ";
                if (CB_MaritalStatus_UM.Checked)
                {
                    SQLWHERE += " UserBasicInformation.MaritalStatus = 1 ";
                    strOptionalOr = " OR ";//Setting Flag
                }
                if (CB_MaritalStatus_WW.Checked)
                {
                    SQLWHERE += strOptionalOr + " UserBasicInformation.MaritalStatus = 2 ";
                    strOptionalOr = " OR ";//Setting Flag
                }
                if (CB_MaritalStatus_Div.Checked)
                {
                    SQLWHERE += strOptionalOr + " UserBasicInformation.MaritalStatus = 3 ";
                    strOptionalOr = " OR ";//Setting Flag
                }
                if (CB_MaritalStatus_Sep.Checked)
                {
                    SQLWHERE += strOptionalOr + " UserBasicInformation.MaritalStatus = 4 ";
                }
                SQLWHERE += " ) ";
                strOptionalAnd = " AND ";
            } //End OF MaritalStatus
            //-------------------------------------------------------------------------------------------------------------------
            //          SubCast
            //-------------------------------------------------------------------------------------------------------------------
            if (TB_Subcast.Text == null)
            {
                SQLWHERE += " AND ( FREETEXT(UserBasicInformation.SubCast,'" + TB_Subcast.Text + "' )";
                strOptionalAnd = " AND "; //Setting Flag
            }
            //-------------------------------------------------------------------------------------------------------------------
            //Adding Religion
            //-------------------------------------------------------------------------------------------------------------------
            if (!CB_Religion_Any.Checked)
            {
                SQLWHERE += strOptionalAnd;
                SQLWHERE += " ( ";
                string strOptionalOr = " ";
                foreach (ListItem listItem in LB_Religion.Items)
                {
                    if (listItem.Selected)
                    {
                        strOptionalAnd = " AND ";
                        SQLWHERE += strOptionalOr + " UserBasicInformation.Religion = " + listItem.Value;
                        strOptionalOr = " OR ";
                    }
                }
                SQLWHERE += " ) ";
            }
            //-------------------------------------------------------------------------------------------------------------------
            //   Caste
            //-------------------------------------------------------------------------------------------------------------------
            if (!CB_Caste_Any.Checked)
            {
                SQLWHERE += strOptionalAnd;
                SQLWHERE += " ( ";
                string strOptionalOr = " ";
                foreach (ListItem listItem in LB_Caste.Items)
                {
                    if (listItem.Selected)
                    {
                        strOptionalAnd = " AND ";
                        SQLWHERE += strOptionalOr + " UserBasicInformation.Cast = " + listItem.Value;
                        strOptionalOr = " OR ";
                    }
                }
                SQLWHERE += " ) ";
            }

            //-------------------------------------------------------------------------------------------------------------------
            //      Education
            //-------------------------------------------------------------------------------------------------------------------

            if (!CB_Education_Any.Checked)
            {
                SQLWHERE += strOptionalAnd;
                SQLWHERE += " ( ";
                string strOptionalOr = " ";
                foreach (ListItem listItem in LB_Education.Items)
                {
                    if (listItem.Selected)
                    {
                        strOptionalAnd = " AND ";
                        SQLWHERE += strOptionalOr + " UserEducationAndOccupation.Education = " + listItem.Value;
                        strOptionalOr = " OR ";
                    }
                }
                SQLWHERE += " ) ";
            }
            //-------------------------------------------------------------------------------------------------------------------
            //  Occupation
            //-------------------------------------------------------------------------------------------------------------------
            if (!CB_Occupation_any.Checked)
            {
                SQLWHERE += strOptionalAnd;
                SQLWHERE += " ( ";
                string strOptionalOr = " ";
                foreach (ListItem listItem in LB_Occupation.Items)
                {
                    if (listItem.Selected)
                    {
                        strOptionalAnd = " AND ";
                        SQLWHERE += strOptionalOr + "  UserEducationAndOccupation.Occupation = " + listItem.Value;
                        strOptionalOr = " OR ";
                    }
                }
                SQLWHERE += " ) ";
            }
            //-------------------------------------------------------------------------------------------------------------------
            //      Country
            //-------------------------------------------------------------------------------------------------------------------
            if (!CB_Country_Any.Checked)
            {
                SQLWHERE += strOptionalAnd;
                SQLWHERE += " ( ";
                string strOptionalOr = " ";
                foreach (ListItem listItem in LB_Country.Items)
                {
                    if (listItem.Selected)
                    {
                        strOptionalAnd = " AND ";
                        SQLWHERE += strOptionalOr + "  UserContactInformations.Country = " + listItem.Value;
                        strOptionalOr = " OR ";

                    }
                }
                SQLWHERE += " ) ";
            }
            //-------------------------------------------------------------------------------------------------------------------
            //      Closing Query
            //-------------------------------------------------------------------------------------------------------------------
            SQLWHERE += " ) ) ";
            strSQL += SQLWHERE;
            //-------------------------------------------------------------------------------------------------------------------
            string strRandom  = RandomString.Generate(5, 7);
            Session.Add(strRandom, strSQL);
            //-------------------------------------------------------------------------------------------------------------------
            //Server.Transfer("" + strRandom);
            Response.Redirect("SearchResult.aspx?typ=5&str=" + strRandom);
            //-------------------------------------------------------------------------------------------------------------------
        }
    }

}
