//------------------------------------------------------------------------------------------------------------------------
//                                                  Matrimonial Membership Details
//------------------------------------------------==================================--------------------------------------
// Operations 
//============-------------------------------------------
// Change Users invalid Password
//-------------------------------------------------------
// User Roles
//==================
// Members
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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
//------------------------------------------------------------------------------------------------------------------------
public partial class Guest_newPassword : System.Web.UI.Page
{
    //------------------------------------------------------------------------------------------------------------------------
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //----------------------------------------------------------------------------------------------------------------
            // Is Key Presents
            //----------------------------------------------------------
            if (Request.QueryString["key"] != null)
            {
                //-----------------------------------------------------
                // Storing Into Hidden Field
                //-----------------------------------------------------
                HF_SeqtID.Value = Request.QueryString["key"];
                //-----------------------------------------------------
            }
            else
            {
                //-----------------------------------------------------
                //Session Variable Not found
                //-----------------------------------------------------
                Server.Transfer("~/Extras/ErrorReport.aspx?id=Session");
                //-----------------------------------------------------
            }
        }
        else
        {
            //--------------------------------------------------------------------------------------------------------------------------------------------
            string strApplicationID;
            try
            {
                //-----------------------------------------------------------------------------------------------------------------------------------------  
                // Getting ApplicationID for given UserID
                strApplicationID = MatrimonialMemberShip.GetApplicationID(Session[HF_SeqtID.Value].ToString(),true,false);
                // No More Use Of Session Variable
                Session.Remove(Request.QueryString["key"]);
                // Changing The Password
                MatrimonialMemberShip.SetPassword(strApplicationID, FormsAuthentication.HashPasswordForStoringInConfigFile(TB_Password_Conform.Text, "MD5"));
                Response.Redirect("~/Guest/Login.aspx");
                //----------------------------------------------------------------------------------------------------------------------------------------- 
            }
            catch (Exception Ex)
            {
                //-----------------------------------------------------
                //Session Variable Not found
                //-----------------------------------------------------
                ErrorLog.WriteErrorLog("Guest_newPassword.PostBack", Ex);
                Server.Transfer("~/Extras/ErrorReport.aspx?id=Session");
                //-----------------------------------------------------
            }
        }
    }
}
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------
