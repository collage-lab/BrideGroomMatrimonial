//------------------------------------------------------------------------------------------------------------------------
//                                                  Matrimonial Password Asistance Step 2
//------------------------------------------------------------------------------------------------------------------------
// Operations 
//------------
// Displays Sequrity Question
// Vrification Of Asswer
//------------
// User Roles
//------------
// Members
//------------------------------------------------------------------------------------------------------------------------


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

public partial class Guest_AskQuestion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //------------------------------------------------------------------------------------------------------------------------
        if (!IsPostBack)
        {
            //------------------------------------------------------------------------------------------------------------------------
            // What About Serrion ID
            if ((Request.QueryString["key"] != "") && (Request.QueryString["key"] != null))
            {
                //------------------------------------------------------------------------------------------------------------------------
                // error in url?
                //No
                if ((Session[Request.QueryString["key"]].ToString() != "") && (Session[Request.QueryString["key"]].ToString() != null))
                {
                    //------------------------------------------------------------------------------------------------------------------------
                    // Loading Sequrity Question
                    L_SequrityQuestion.Text = MatrimonialMemberShip.GetSequrityQuestion(Session[Request.QueryString["key"]].ToString());
                    // Add Session Key Into Hiden Feld
                    HF_Session.Value = Request.QueryString["key"];
                    //------------------------------------------------------------------------------------------------------------------------
                }
                else
                {
                    //------------------------------------------------------------------------------------------------------------------------
                    // UserName not Present in Session
                    Server.Transfer("~/Extras/ErrorReport.aspx?id=session");
                    //------------------------------------------------------------------------------------------------------------------------
                }
            }
            else
            {
                //------------------------------------------------------------------------------------------------------------------------
                Server.Transfer("~/Extras/ErrorReport.aspx?id=406");
                //------------------------------------------------------------------------------------------------------------------------
            }
            //------------------------------------------------------------------------------------------------------------------------
        }
    }

    /// <summary>
    /// Checks Sequrity Question Currect 
    /// if so Redirect to Password Change form
    /// </summary>
    protected void IB_Submit_Click(object sender, ImageClickEventArgs e)
    {
        // Does Sequrty Question's Answer Correct?
        //------------------------------------------------------------------------------------------------------------------------
        if (MatrimonialMemberShip.CheckSequrityQuestion(Session[HF_Session.Value].ToString(), TB_passwordAnswwer.Text))
        {
            //------------------------------------------------------------------------------------------------------------------------
            // Create Key For Password Renewal
            string strKey = Crypto.EnCrypto(DateTime.Today.ToString() + "$" + Session[HF_Session.Value].ToString().ToLower());
            string strUrlEncode = Server.UrlEncode(strKey);
            //Redirect to Password Changer
            Server.Transfer("~/Guest/newPassword.aspx?key=" + Server.UrlEncode(HF_Session.Value));
            //------------------------------------------------------------------------------------------------------------------------
        }
        else
        {
            //------------------------------------------------------------------------------------------------------------------------
            // Display Wrong Password Message
            L_WPassword.Visible = true;
            //------------------------------------------------------------------------------------------------------------------------
        }

    }

    protected void LB_Email_Click(object sender, EventArgs e)
    {
        //send mail        

        ////Creating Mail body
        //string emailSubject = "Password Assistance";
        ////Creating Link
        //string emailLink = WebConfig.GetValues("SiteName") + "//Guest//Verification.aspx?id=p&key=" + Crypto.EnCrypto(DateTime.Today.ToString() + "$" + TB_ID.Text);
        //string emailFrom = "norepplay@" + WebConfig.GetValues("FName");
        //// Making Body
        //string emailBody = "Click The link below to reset your password" + Environment.NewLine;//<<<<<<<ForTesting>>>>>>>>>>>
        //emailBody += emailLink + Environment.NewLine + "Thank you.." + Environment.NewLine + " Administrator" + Environment.NewLine + WebConfig.GetValues(WebConfig.ConfigurationItem.fname);
        ////Sending Mail
        //if (EmailManager.SendMail(TB_ID.Text, emailFrom, emailSubject, emailBody))
        //{
        //    ///redirect into check mail
        //    Response.Redirect("../Extras/CheckYourMail.aspx?id=p", true);
        //}
        //else
        //{
        //    ///display error message
        //    Response.Redirect("Error.aspx", true);
        //}
    }
}
