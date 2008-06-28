//------------------------------------------------------------------------------------------------------------------------
//                                                  Matrimonial Sign Up
//------------------------------------------------------------------------------------------------------------------------
// Operations 
//---------------------------------
// Vrification Of UserName 
// Redirect To registration Page
//---------------------------------
// User Roles
//------------
// Guest
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

public partial class Guest_JoinNow : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //------------------------------------------------------------------------------------------------------------------------
            // Adding meta Discription
            HtmlMeta objMeta = new HtmlMeta();
            objMeta.Name = "Description";
            objMeta.Content = WebConfig.GetValues("MetaDiscription");
            this.Header.Controls.Add(objMeta);
            //------------------------------------------------------------------------------------------------------------------------
            // Adding meta KeyWords
            objMeta = new HtmlMeta();
            objMeta.Name = "keywords";
            objMeta.Content = WebConfig.GetValues("MetaKeword");
            this.Header.Controls.Add(objMeta);
            //------------------------------------------------------------------------------------------------------------------------
        }
        else
        {
            //------------------------------------------------------------------------------------------------------------------------
            try
            {
                //------------------------------------------------------------------------------------------------------------------------
                // Is It By A Human
                L_CaptchaError.Visible = false;
                L_UserNmeExists.Visible = false;

                if (TB_Captcha.Text.ToLower() == Session["CaptchaString"].ToString().ToLower())
                {
                    //Yes
                    //remove session 
                    Session.Remove("CaptchaString");
                    // Checking Database for the avilable username
                    //------------------------------------------------------------------------------------------------------------------------
                    if (!MatrimonialMemberShip.CheckUserNameExsists(TB_ID.Text))
                    {
                        // Fine You get it
                        //------------------------------------------------------------------------------------------------------------------------
                        string strKey = Crypto.EnCrypto(DateTime.Today.ToString() + "#" + TB_ID.Text.ToLower());
                        string strUrlEncode = Server.UrlEncode(strKey);
                        //Go To Registration Step 1
                        Server.Transfer("../Guest/Verification.aspx?id=r&key=" + strUrlEncode);
                        //------------------------------------------------------------------------------------------------------------------------
                    }
                    else
                    {
                        //--------------------------------------------------
                        // Someone else Owns that Try some other ID else
                        L_UserNmeExists.Visible = true;
                        //--------------------------------------------------
                    }
                    //------------------------------------------------------------------------------------------------------------------------
                }
                else
                {
                    //--------------------------------------------------
                    // Wrong Captch String
                    TB_Captcha.Text = "";
                    L_CaptchaError.Visible = true;
                    L_UserNmeExists.Visible = false;
                    //--------------------------------------------------
                }
            }
            catch (NullReferenceException)
            {
                //------------------------------------------------------------------------------------------------------------------------
                Response.Redirect("../Extras/ErrorReport.aspx?id=Section");
                //------------------------------------------------------------------------------------------------------------------------
            }
        }//IsPostBack
    }// Load
}// Class
