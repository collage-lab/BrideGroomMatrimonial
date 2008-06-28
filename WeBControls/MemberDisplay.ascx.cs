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

public partial class WeBControls_MemberDisplay : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    bool IsBookMark;
    bool IsRemove;
    string  strTemp;


    #region"Public Properties"

    public void Bind(string MatrimonialID, bool ISBookMark, bool ISRemove)
    {

        this.IsBookMark = ISBookMark;
        this.IsRemove = ISRemove;
        this.strTemp = MatrimonialID;

        /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
        Procedure Name : SmallMember_GetInfo 
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
                    PhotoStatus
                    Star
                    Height
         * * * * * * * * * * * * * * * * * * * * * * * * * * * */

        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {

            try
            {

                //
                //Creating Command object
                SqlCommand objCommand = new SqlCommand("SmallMember_GetInfo", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding Parameters
                objCommand.Parameters.Add(new SqlParameter("@MatrimonialID", SqlDbType.VarChar));
                objCommand.Parameters["@MatrimonialID"].Value = MatrimonialID;

                //Databse Operations
                objConnection.Open();
                SqlDataReader objReader = objCommand.ExecuteReader();
                objReader.Read();
                //Getting Values
                HF_ViewPF.Text = MatrimonialID.ToUpper();

                L_Display.Text = "<b>Age: </b>" + AgeCalculator(Convert.ToDateTime(objReader["DOB"])).ToString() + "-<b>" + ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.MaritalStatus, Convert.ToSByte(objReader["MaritalStatus"])) + "</b>" +
                      "<br/><b> Height: </b>" + Convert.ToInt32(objReader["Height"]).ToString() +
                      "Cm<br/><b> Religion: </b>" + ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Religion, Convert.ToSByte(objReader["Religion"])) + " - " + ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Cast, Convert.ToSByte(objReader["Cast"])) +
                      "<br/><b> Star: </b>" + ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Star, Convert.ToSByte(objReader["Star"])) +
                      "<br/><b> Location: </b>" + ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Country, Convert.ToInt16(objReader["Country"])) + "-" + objReader["City"].ToString() +
                      "<br/><b> Education: </b>" + ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Education, Convert.ToSByte(objReader["Education"])) +
                      "<br/><b> Occupation: </b>" + ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Occupation, Convert.ToSByte(objReader["Occupation"]));



                DateTime dateTemp = Convert.ToDateTime(objReader["LastLogIN"]);
                L_LastLogin.Text = dateTemp.Day.ToString() + "-" + dateTemp.Month.ToString() + "-" + dateTemp.Year.ToString();

                HF_ViewPF.NavigateUrl = "~/myprofile/" + MatrimonialID + ".aspx";

                //Paid User Can View Name Also
                try
                {
                    HttpCookieCollection objHttpCookieCollection = Request.Cookies;
                    HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");
                    if (Crypto.DeCrypto(objHttpCookie.Values["UserType"]) == "PaidMember")
                    {
                        L_Name.Visible = true;
                        L_Name.Text = "<b>Name :</b>" + objReader["Name"].ToString();
                    }
                }
                catch (Exception) { }

                try
                {
                    switch (Convert.ToInt32(objReader["PhotoState"]))
                    {
                        case 1:
                            IMG_Main.ImageUrl = "~/Extras/imagecon.aspx?matid=" + MatrimonialID + "&id=1";
                            break;
                        case 3:
                            IMG_Main.ImageUrl = "~/Resources/photoLocked.gif";
                            break;
                    }
                }
                catch (Exception)
                {
                    IMG_Main.ImageUrl = "~/Extras/imagecon.aspx?matid=" + MatrimonialID + "&id=1";
                }
                objReader.Close();
                objReader.Dispose();
                this.Visible = true;
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

    //public bool Bind(string MatrimonialID)
    //{

    //    this.IsBookMark = false;
    //    this.IsRemove = false;
    //    bool boolFlag = false;

    //    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
    //    Procedure Name : Member_GetInfo 
    //     * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
    //    Type: SELECT 
    //     * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
    //    Parameters :
    //     * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
    //                LastLogIN
    //                Country -  City
    //                Name
    //                DOB
    //                Religion - Cast
    //                MaritalStatus
    //                PhotoPassword
    //     * * * * * * * * * * * * * * * * * * * * * * * * * * * */

    //    using (SqlConnection objConnection = DBConnection.GetSqlConnection())
    //    {

    //        //try
    //        //{

    //        //
    //        //Creating Command object
    //        SqlCommand objCommand = new SqlCommand("Member_GetInfo", objConnection);
    //        objCommand.CommandType = CommandType.StoredProcedure;
    //        //Adding Parameters
    //        objCommand.Parameters.Add(new SqlParameter("@MatrimonialID", SqlDbType.VarChar));
    //        objCommand.Parameters["@MatrimonialID"].Value = MatrimonialID;

    //        //Databse Operations
    //        objConnection.Open();
    //        SqlDataReader objReader = objCommand.ExecuteReader();
    //        objReader.Read();
    //        //Getting Values
    //        L_Location.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Country, Convert.ToInt16(objReader["Country"])) + " <br/> " + objReader["City"].ToString();
    //        L_Religion.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Religion, Convert.ToSByte(objReader["Religion"])) + " - " + ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.Cast, Convert.ToSByte(objReader["Cast"]));
    //        L_MatID.Text = MatrimonialID;
    //        L_MS.Text = ControlDataLoader.GetIndexValue(ControlDataLoader.ControlType.MaritalStatus, Convert.ToSByte(objReader["MaritalStatus"]));

    //        L_Age.Text = "AGE : " + AgeCalculator(Convert.ToDateTime(objReader["DOB"])).ToString();
    //        //DateTime dateTemp = Convert.ToDateTime(objReader["LastLogIN"]);
    //        //L_LastLogIn.Text = dateTemp.Day.ToString() + "-" + dateTemp.Month.ToString() + "-" + dateTemp.Year.ToString();

    //        HF_ViewPF.NavigateUrl = "~/Member/PrintProfile.aspx?matid=" + Server.UrlEncode(Crypto.EnCrypto(MatrimonialID));

    //        try
    //        {
    //            if (objReader["PhotoPassword"].ToString() == "")
    //            {
    //                IMG_Main.ImageUrl = "~/Extras/imagecon.aspx?matid=" + MatrimonialID + "&id=1";
    //            }
    //            else
    //            {
    //                IMG_Main.ImageUrl = "~/Resources/photoLocked.gif";

    //            }
    //        }
    //        catch (Exception)
    //        {
    //            IMG_Main.ImageUrl = "~/Extras/imagecon.aspx?matid=" + MatrimonialID + "&id=1";
    //        }
    //        IMG_Main.ImageUrl = "~/Extras/imagecon.aspx?matid=" + MatrimonialID + "&id=1";
    //        objReader.Close();

    //        boolFlag = true;
    //        //}
    //        //catch (Exception)
    //        //{
    //        //    this.Visible = false;
    //        //    boolFlag = false;

    //        //}
    //        //finally
    //        //{
    //        //    objConnection.Close();
    //        //}

    //    }
    //    return boolFlag;

    //}

    public bool DeleteMe()
    {

        return MatrimonialMemberShip.DeleteAccount(MatrimonialMemberShip.GetApplicationID(HF_ViewPF.Text), HF_ViewPF.Text);
    }


    #endregion







    #region "Private Methodes"

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
                return "<br/><iframe  frameborder=\"no\" marginheight=\"0\" marginwidth=\"0\" scrolling=\"no\" unselectable=\"off\" id=\"N1\" style=\"width: 110px; height: 17px\" src=\"../Extras/frame.aspx?id=" + strTemp + "&typ=2\" ></iframe>";
            }
            else
            {
                return "<br/><iframe  frameborder=\"no\" marginheight=\"0\" marginwidth=\"0\" scrolling=\"no\" unselectable=\"off\" id=\"N1\" style=\"width: 110px; height: 17px\" src=\"../Extras/frame.aspx?id=" + strTemp + "\" ></iframe>";
            }
        }
        else
        {
            return "";
        }
    }

    #endregion
}
