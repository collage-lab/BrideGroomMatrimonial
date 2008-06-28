using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Data.SqlClient;

/// <summary>
/// Summary description for MyProfile
/// </summary>
public class UserProfile
{

    public UserProfile(string MatrimonialID)
    {
        // Check List

        // MainPanel
        //strIDCreatedOn;
        //strLastLogInDate;
        //shortClicks;


        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {
            SqlCommand objCommand = null;
            SqlDataReader objReader = null;

            /// Getting Details of LastLogindate CreatedOn and Clicks


            /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
            Procedure Name : User_ProfileCount  
            * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
            Type: SELECT 
            * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
            Parameters :
            * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                       @MatrimonialID varchar(15)
            * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                       IntrestSenPending
                       IntrestSenAccepted
                       IntrestSenDeclined
                       IntrestResPending
                       IntrestResAccepted
                       IntrestResDeclined
                       MessageOutBox
                       MessageInBox
                       PhotoPasswordGrnCount 
                       PhotoPasswordReqCount
                       BookMarkCount
             		   LastLogIn
			           CreatedOn
			           Cliks
			           Name
            * * * * * * * * * * * * * * * * * * * * * * * * * * * */

            try
            {
                //Creating Command object
                objCommand = new SqlCommand("User_ProfileCount", objConnection);
                objCommand.CommandType = CommandType.StoredProcedure;
                //Adding new Parameters
                objCommand.Parameters.Add(new SqlParameter("@MatrimonialID", SqlDbType.VarChar));
                objCommand.Parameters["@MatrimonialID"].Value =MatrimonialID;

                objConnection.Open();
                objReader = objCommand.ExecuteReader();
                objReader.Read();
                DateTime DateTemp_Login = Convert.ToDateTime(objReader["LastLogIn"]);
                DateTime DateTemp_Created = Convert.ToDateTime(objReader["CreatedOn"]);
                shortClicks = Convert.ToInt16(objReader["Cliks"]);


                strLastLogInDate = DateTemp_Login.Day + " - " + DateTemp_Login.Month + " - " + DateTemp_Login.Year;
                strIDCreatedOn = DateTemp_Created.Day + " - " + DateTemp_Created.Month + " - " + DateTemp_Created.Year;

                strName = objReader["Name"].ToString();

                boolIsPhoto = Convert.ToBoolean(objReader["IsPhoto"]);

                boolIsPhotoProtected = Convert.ToBoolean(objReader["IsPhotoProtected"]);

                boolIsHoroscope = Convert.ToBoolean(objReader["IsHoroscope"]);

                boolIsHoroScopeProtected = Convert.ToBoolean(objReader["IsHoroProtected"]);

                sbyteReceivedInterestPending = Convert.ToSByte(objReader["IntrestResPending"]);
                sbyteReceivedInterestAccepted = Convert.ToSByte(objReader["IntrestResAccepted"]);
                sbyteReceivedInterestDeclined = Convert.ToSByte(objReader["IntrestResDeclined"]);

                sbyteSendInterestPending = Convert.ToSByte(objReader["IntrestSenPending"]);
                sbyteSendInterestAccepted = Convert.ToSByte(objReader["IntrestSenAccepted"]);
                sbyteSendInterestDeclined = Convert.ToSByte(objReader["IntrestSenDeclined"]);

                /// Messages send and Resived by the user

                sbyteSendMessage = Convert.ToSByte(objReader["MessageOutBox"]);
                sbyteReceivedMessage = Convert.ToSByte(objReader["MessageInBox"]);

                /// BookMarks Set By The User

                sbyteLinkNo = Convert.ToSByte(objReader["BookMarkCount"]);

                sbyteRequestPassword = Convert.ToSByte(objReader["PhotoPasswordReqCount"]);

                sbyteReceivedPassword = Convert.ToSByte(objReader["PhotoPasswordGrnCount"]);

                objReader.Close();
                objReader.Dispose();

            }
            catch (Exception Ex)
            {
                ErrorLog.WriteErrorLog("UserProfile.UserProfile()", Ex);
            }
            finally
            {
                objConnection.Close();
            }

        }


    }


    #region"Decliration of Private variables"

    // MainPanel
    private string strIDCreatedOn;
    private string strLastLogInDate;
    private string strName;
    private short shortClicks;

    // Visitors
    private string[] strArrayVisitors;


    // Check List
    private bool boolIsPhoto;
    private bool boolIsPhotoProtected;
    private bool boolIsHoroscope;
    private bool boolIsHoroScopeProtected;

    // Interest

    private sbyte sbyteReceivedInterestAccepted;
    private sbyte sbyteReceivedInterestDeclined;
    private sbyte sbyteReceivedInterestPending;

    private sbyte sbyteSendInterestAccepted;
    private sbyte sbyteSendInterestDeclined;
    private sbyte sbyteSendInterestPending;

    // Message

    private sbyte sbyteReceivedMessage;
    private sbyte sbyteSendMessage;

    // Request

    private sbyte sbyteReceivedPassword;
    private sbyte sbyteRequestPassword;

    // Link

    private sbyte sbyteLinkNo;

    #endregion


    #region"Public Properties"
    // MainPanel
    public string IDCreatedOn
    {
        set { strIDCreatedOn = value; }
        get { return strIDCreatedOn; }
    }
    public string LastLogInDate
    {
        set { strLastLogInDate = value; }
        get { return strLastLogInDate; }
    }
    public string Name
    {
        set { strName = value; }
        get { return strName; }
    }

    public short Clicks
    {
        set { shortClicks = value; }
        get { return shortClicks; }
    }


    // Visitors
    public string[] Visitors
    {
        set { strArrayVisitors = value; }
        get { return strArrayVisitors; }
    }



    // Check List
    public bool IsPhoto 
       {
        set { boolIsPhoto  = value; }
        get { return boolIsPhoto  ; }
    }

    public bool IsPhotoProtected
       {
        set { boolIsPhotoProtected = value; }
        get { return boolIsPhotoProtected ; }
    }

    public bool IsHoroscope
       {
        set { boolIsHoroscope = value; }
        get { return boolIsHoroscope ; }
    }

    public bool IsHoroScopeProtected
       {
        set { boolIsHoroScopeProtected = value; }
        get { return boolIsHoroScopeProtected ; }
    }


    // Interest

    public sbyte ReceivedInterestAccepted
    {
        set { sbyteReceivedInterestAccepted = value; }
        get { return sbyteReceivedInterestAccepted; }
    }

    public sbyte ReceivedInterestDeclined
    {
        set { sbyteReceivedInterestDeclined = value; }
        get { return sbyteReceivedInterestDeclined; }
    }

    public sbyte ReceivedInterestPending
    {
        set { sbyteReceivedInterestPending = value; }
        get { return sbyteReceivedInterestPending; }
    }


    public sbyte SendInterestAccepted
    {
        set { sbyteSendInterestAccepted = value; }
        get { return sbyteSendInterestAccepted; }
    }

    public sbyte SendInterestDeclined
    {
        set { sbyteSendInterestDeclined = value; }
        get { return sbyteSendInterestDeclined; }
    }

    public sbyte SendInterestPending
    {
        set { sbyteSendInterestPending = value; }
        get { return sbyteSendInterestPending; }
    }


    // Message

    public sbyte ReceivedMessage
    {
        set { sbyteReceivedMessage = value; }
        get { return sbyteReceivedMessage; }
    }

    public sbyte SendMessage
    {
        set { sbyteSendMessage = value; }
        get { return sbyteSendMessage; }
    }


    // Request

    public sbyte ReceivedPassword
    {
        set { sbyteReceivedPassword = value; }
        get { return sbyteReceivedPassword; }
    }

    public sbyte RequestPassword
    {
        set { sbyteRequestPassword = value; }
        get { return sbyteRequestPassword; }
    }


    // Link

    public sbyte NoOfLinks
    {
        set { sbyteLinkNo = value; }
        get { return sbyteLinkNo; }
    }

    #endregion
}


