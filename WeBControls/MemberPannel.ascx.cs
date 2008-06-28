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

public partial class WeBControls_MemberPannel : System.Web.UI.UserControl
{
    string strTemp;
    bool IsBookMark;
    bool IsRemove;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    #region"Public Properties"

    public void Bind(string MatrimonialID,bool ISBookMark,bool ISRemove)
    {

        this.IsBookMark = ISBookMark;
        this.IsRemove = ISRemove;

        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : Member_GetInfo 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    LastLogIN
                    Country -  City
                    Name
                    DOB
                    Religion - Cast
                    MaritalStatus
                    PhotoPassword
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {

            try
            {

                //
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("Member_GetInfo", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding Parameters
                objCommand.Parameters.Add(new SqlParameter("@MatrimonialID", SqlDbType.VarChar));
                objCommand.Parameters["@MatrimonialID"].Value = MatrimonialID;

                //Databse Operations
                objConnection.Open();
                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();
                //Getting Values
                L_Location.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Country, Convert.ToInt16(objReader["Country"])) + " - " + objReader["City"].ToString();
                L_Religion.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Religion, Convert.ToSByte(objReader["Religion"])) + " - " + ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Cast, Convert.ToSByte(objReader["Cast"]));
                L_MatID.Text = MatrimonialID;
                L_MS.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.MaritalStatus, Convert.ToSByte(objReader["MaritalStatus"]));

                L_Age.Text = AgeCalculator(Convert.ToDateTime(objReader["DOB"])).ToString();
                DateTime dateTemp = Convert.ToDateTime(objReader["LastLogIN"]);
                L_LastLogIn.Text = dateTemp.Day.ToString() + "-" + dateTemp.Month.ToString() + "-" + dateTemp.Year.ToString();

                HL_ViewProfile.NavigateUrl = "~/myprofile/" + MatrimonialID + ".aspx";
                //Paid User Can View Name Also
                try
                {
                    HttpCookieCollection objHttpCookieCollection = Request.Cookies;
                    HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");
                    if (Crypto.DeCrypto(objHttpCookie.Values["UserType"]) == "PaidMember")
                    {
                        L_L_Name.Visible = true;
                        L_Name.Visible = true;
                        L_Name.Text = objReader["Name"].ToString();
                    }
                }
                catch (Exception) { }
                //Is the image protected
                try
                {   //No
                    if ((objReader["PhotoPassword"].ToString() =="")||(objReader["PhotoPassword"].ToString() == null))
                    {
                        IMG_Main.ImageUrl = "~/Extras/imagecon.aspx?matid=" + MatrimonialID + "&id=1";
                    }
                    else//Yes
                    {
                        IMG_Main.ImageUrl = "~/Resources/photoLocked.gif";

                    }
                }
                catch (Exception)
                {   
                    //No
                    IMG_Main.ImageUrl = "~/Extras/imagecon.aspx?matid=" + MatrimonialID + "&id=1";
                }

                objReader.Close();
                objReader.Dispose();
            }
            catch (Exception)
            {
                this.Visible = false;
            }
            finally
            {
                //objConnection.Close;
            }

        }

    }


    public bool Bind(string MatrimonialID)
    {

        this.IsBookMark = false;
        this.IsRemove = false;
        bool boolFlag = false;

        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : Member_GetInfo 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Type: SELECT 
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
        Parameters :
         * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                    LastLogIN
                    Country -  City
                    Name
                    DOB
                    Religion - Cast
                    MaritalStatus
                    PhotoPassword
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {

            try
            {

                //
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("Member_GetInfo", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding Parameters
                objCommand.Parameters.Add(new SqlParameter("@MatrimonialID", SqlDbType.VarChar));
                objCommand.Parameters["@MatrimonialID"].Value = MatrimonialID;

                //Databse Operations
                objConnection.Open();
                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();
                //Getting Values
                L_Location.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Country, Convert.ToInt16(objReader["Country"])) + " - " + objReader["City"].ToString();
                L_Religion.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Religion, Convert.ToSByte(objReader["Religion"])) + " - " + ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Cast, Convert.ToSByte(objReader["Cast"]));
                L_MatID.Text = MatrimonialID;
                L_MS.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.MaritalStatus, Convert.ToSByte(objReader["MaritalStatus"]));

                L_Age.Text = AgeCalculator(Convert.ToDateTime(objReader["DOB"])).ToString();
                DateTime dateTemp = Convert.ToDateTime(objReader["LastLogIN"]);
                L_LastLogIn.Text = dateTemp.Day.ToString() + "-" + dateTemp.Month.ToString() + "-" + dateTemp.Year.ToString();

                HL_ViewProfile.NavigateUrl = "~/Member/PrintProfile.aspx?id=" + Server.UrlEncode(MatrimonialID);
                try
                {
                    HttpCookieCollection objHttpCookieCollection = Request.Cookies;
                    HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");
                    if (Crypto.DeCrypto(objHttpCookie.Values["UserType"]) == "PaidMember")
                    {
                        L_L_Name.Visible = true;
                        L_Name.Visible = true;
                        L_Name.Text = objReader["Name"].ToString();
                    }
                }
                catch (Exception) { }
                try
                {
                    if (objReader["PhotoPassword"].ToString() == "")
                    {
                        IMG_Main.ImageUrl = "~/Extras/imagecon.aspx?matid=" + MatrimonialID + "&id=1";
                    }
                    else
                    {
                        IMG_Main.ImageUrl = "~/Resources/photoLocked.gif";

                    }
                }
                catch (Exception)
                {
                    IMG_Main.ImageUrl = "~/Extras/imagecon.aspx?matid=" + MatrimonialID + "&id=1";
                }
                IMG_Main.ImageUrl = "~/Extras/imagecon.aspx?matid=" + MatrimonialID + "&id=1";
                objReader.Close();

                boolFlag = true;
            }
            catch (Exception)
            {
                this.Visible = false;
                boolFlag = false;

            }
            finally
            {
                objConnection.Close();
            }

        }
        return boolFlag;

    }

    public bool DeleteMe()
    {

        return MatrimonialMemberShip.DeleteAccount(MatrimonialMemberShip.GetApplicationID(L_MatID.Text), L_MatID.Text);
    }


    #endregion

    private int AgeCalculator(DateTime DOB)
    {
        int intAge = DateTime.Today.Year - DOB.Year;

        if (DOB.Month < DateTime.Today.Month)
        {
            --intAge;
        }
        else if (DOB.Month == DateTime.Today.Month)
        {
            if (DOB.Day < DateTime.Today.Day)
            {
                --intAge;
            }
        }

        return intAge;
    
    }


    protected string IFrame()
    {
        if (IsBookMark)
        {
            if (IsRemove)
            {
                return "<<iframe  frameborder=\"no\" marginheight=\"0\" marginwidth=\"0\" scrolling=\"no\" unselectable=\"off\" id=\"N1\" style=\"width: 110px; height: 17px\" src=\"../Extras/frame.aspx?id=" + strTemp + "&typ=2\" ></iframe>";
            }
            else
            {
                return "<<iframe  frameborder=\"no\" marginheight=\"0\" marginwidth=\"0\" scrolling=\"no\" unselectable=\"off\" id=\"N1\" style=\"width: 110px; height: 17px\" src=\"../Extras/frame.aspx?id=" + strTemp + "\" ></iframe>";
            }
        }
        else
        {
            return "";
        }
    }
}
