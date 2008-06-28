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

public partial class Member_MyMatches : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {

            HttpCookieCollection objHttpCookieCollection = Request.Cookies;
            HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");
            //---------------------------------------------------------------------------------------------------
            string strApplicationID = Crypto.DeCrypto(objHttpCookie.Values["ApplicationID"]);
            //---------------------------------------------------------------------------------------------------
            MatMember objMember = new MatMember(true, strApplicationID, false, true, false, false, false, false, false, false, false, true);
            //---------------------------------------------------------------------------------------------------


            //Adding Select 
            //-------------------------------------------------------------------------------------------------------------------
            string strSQL =  "SELECT MatrimonialMemberShip.MatrimonialID ";
            //-------------------------------------------------------------------------------------------------------------------
            // Adding Innerjoining statment depending on Photo
            //-------------------------------------------------------------------------------------------------------------------

                strSQL += "    FROM  UserAuthentication INNER JOIN"
                               + " UserBasicInformation ON MatrimonialMemberShip.ApplicationID = UserBasicInformation.ApplicationID INNER JOIN"
                               + " UserContactInformations ON MatrimonialMemberShip.ApplicationID = UserContactInformations.ApplicationID INNER JOIN"
                               + " UserEducationAndOccupation ON MatrimonialMemberShip.ApplicationID = UserEducationAndOccupation.ApplicationID INNER JOIN"
                               + " UserPhysicalAttributes ON MatrimonialMemberShip.ApplicationID = UserPhysicalAttributes.ApplicationID";
           
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
            if (!objMember.Gender)
            {
                SQLWHERE += " AND ( UserBasicInformation.Gender = 1) ";
            }
            else
            {
                SQLWHERE += " AND ( UserBasicInformation.Gender = 0) ";
            }
            //-------------------------------------------------------------------------------------------------------------------
            SQLWHERE += " AND (DATEDIFF(year,UserBasicInformation.DOB, getdate()) BETWEEN " + objMember.PP_AgeMin.ToString() + " AND " + objMember.PP_AgeMax.ToString()+ ") ";

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
            if (objMember.PP_HeightMax>0)
            {
                SQLWHERE += "( UserPhysicalAttributes.Height BETWEEN " + objMember.PP_HeightMin.ToString() + " AND " + objMember.PP_HeightMax.ToString() + " )";
                strOptionalAnd = " AND "; //Setting Flag
            }
            //-------------------------------------------------------------------------------------------------------------------
            //          Maritals Status
            //-------------------------------------------------------------------------------------------------------------------
            if (objMember.PP_LookingFor.Length>0)
            {
                //Setting Flag
                string strOptionalOr = " ";
                SQLWHERE += strOptionalAnd + " ( ";
                if (objMember.PP_LookingFor.IndexOf("1")>=0)
                {
                    SQLWHERE += " UserBasicInformation.MaritalStatus = 1 ";
                    strOptionalOr = " OR ";//Setting Flag
                }
                if (objMember.PP_LookingFor.IndexOf("2") >= 0)
                {
                    SQLWHERE += strOptionalOr + " UserBasicInformation.MaritalStatus = 2 ";
                    strOptionalOr = " OR ";//Setting Flag
                }
                if (objMember.PP_LookingFor.IndexOf("3") >= 0)
                {
                    SQLWHERE += strOptionalOr + " UserBasicInformation.MaritalStatus = 3 ";
                    strOptionalOr = " OR ";//Setting Flag
                }
                if (objMember.PP_LookingFor.IndexOf("4") >= 0)
                {
                    SQLWHERE += strOptionalOr + " UserBasicInformation.MaritalStatus = 4 ";
                }
                SQLWHERE += " ) ";
                strOptionalAnd = " AND ";
            } //End OF MaritalStatus

            //-------------------------------------------------------------------------------------------------------------------
            //Adding Religion
            //-------------------------------------------------------------------------------------------------------------------
            string[] strArray = null;
            if (objMember.PP_Religion!="##")
            {
                strArray = objMember.PP_Religion.Split('%');
                SQLWHERE += strOptionalAnd;
                SQLWHERE += " ( ";
                string strOptionalOr = " ";
                foreach (string strValue in strArray)
                {
                        strOptionalAnd = " AND ";
                        SQLWHERE += strOptionalOr + " UserBasicInformation.Religion = " + strValue;
                        strOptionalOr = " OR ";
                }
                SQLWHERE += " ) ";
            }
            //-------------------------------------------------------------------------------------------------------------------
            //   Caste
            //-------------------------------------------------------------------------------------------------------------------
            
            if (objMember.PP_Caste !="##")
            {
                strArray = objMember.PP_Caste.Split('%'); 
                SQLWHERE += strOptionalAnd;
                SQLWHERE += " ( ";
                string strOptionalOr = " ";
                foreach (string strValue in strArray)
                {
                        strOptionalAnd = " AND ";
                        SQLWHERE += strOptionalOr + " UserBasicInformation.Cast = " + strValue;
                        strOptionalOr = " OR ";
                }
                SQLWHERE += " ) ";
            }

            //-------------------------------------------------------------------------------------------------------------------
            //      Education
            //-------------------------------------------------------------------------------------------------------------------

            if (objMember.PP_Education != "##")
            {
                strArray = objMember.PP_Education.Split('%'); 
                SQLWHERE += strOptionalAnd;
                SQLWHERE += " ( ";
                string strOptionalOr = " ";
                foreach (string strValue in strArray)
                {
                        strOptionalAnd = " AND ";
                        SQLWHERE += strOptionalOr + " UserEducationAndOccupation.Education = " +  strValue;
                        strOptionalOr = " OR ";
                }
                SQLWHERE += " ) ";
            }
            //-------------------------------------------------------------------------------------------------------------------
            //  Occupation
            //-------------------------------------------------------------------------------------------------------------------
            if (objMember.PP_Occupation != "##")
            {
                strArray = objMember.PP_Occupation.Split('%'); 
                SQLWHERE += strOptionalAnd;
                SQLWHERE += " ( ";
                string strOptionalOr = " ";
                foreach (string strValue in strArray)
                {
                        strOptionalAnd = " AND ";
                        SQLWHERE += strOptionalOr + "  UserEducationAndOccupation.Occupation = " +  strValue;
                        strOptionalOr = " OR ";
                }
                SQLWHERE += " ) ";
            }
            //-------------------------------------------------------------------------------------------------------------------
            //      Country
            //-------------------------------------------------------------------------------------------------------------------
            if (objMember.PP_LivingIn != "##")
            {
                strArray = objMember.PP_LivingIn.Split('%'); 
                SQLWHERE += strOptionalAnd;
                SQLWHERE += " ( ";
                string strOptionalOr = " ";
                foreach (string strValue in strArray)
                {
                        strOptionalAnd = " AND ";
                        SQLWHERE += strOptionalOr + "  UserContactInformations.Country = " +  strValue;
                        strOptionalOr = " OR ";

                }
                SQLWHERE += " ) ";
            }
            //-------------------------------------------------------------------------------------------------------------------
            //      Closing Query
            //-------------------------------------------------------------------------------------------------------------------
            SQLWHERE += " ) ) ";
            strSQL += SQLWHERE;
            //-------------------------------------------------------------------------------------------------------------------
            string strRandom = RandomString.Generate(5, 7);
            Session.Add(strRandom, strSQL);
            ErrorLog.WriteLog(strSQL);
            //-------------------------------------------------------------------------------------------------------------------
            //Server.Transfer("" + strRandom);
            Response.Redirect("SearchResult.aspx?typ=5&str=" + strRandom);
            //-------------------------------------------------------------------------------------------------------------------
        }
    }
}
