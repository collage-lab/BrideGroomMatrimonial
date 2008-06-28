//------------------------------------------------------------------------------------------------------------------------
//                                                  Matrimonial Password Asistance Step 1
//------------------------------------------------------------------------------------------------------------------------
// Operations 
//---------------------------------
// Vrification Of User Account
//---------------------------------
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
//------------------------------------------------------------------------------
public partial class Guest_GetPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //---------------------------------------------------------------------
        if (!IsPostBack)
        {
            //-----------------------------------------------------------------
            // Adding meta Discription
            HtmlMeta objMeta = new HtmlMeta();
            objMeta.Name = "Description";
            objMeta.Content = WebConfig.GetValues("MetaDiscription");
            this.Header.Controls.Add(objMeta);
            //-----------------------------------------------------------------
            // Adding meta KeyWords
            objMeta = new HtmlMeta();
            objMeta.Name = "keywords";
            objMeta.Content = WebConfig.GetValues("MetaKeword");
            this.Header.Controls.Add(objMeta);
            //----------------------------------------------------------------
        }
        else 
        {
            //----------------------------------------------------------------
            // Start Verifications
            try
            {
                //------------------------------------------------------------------------------
                // Checking Captch Image string
                //Works!!
                if (TB_Captcha.Text.ToLower() == Session["CaptchaString"].ToString().ToLower())
                {
                    //------------------------------------------------------------------------------
                    //remove session 
                    L_Captcha.Visible = false;
                    Session.Remove("CaptchaString");
                    //------------------------------------------------------------------------------
                    //Checking UserName Exsists
                    //Yes
                    if (MatrimonialMemberShip.CheckUserNameExsists(TB_ID.Text))
                    {
                        //------------------------------------------------------------------------------
                        //Adding UserName Into Session For Sequrity
                        string strRandom = RandomString.GenerateStirng(5, false);
                        Session.Add(strRandom, TB_ID.Text);
                        // Transfer Control to Step 2
                        //Send Session Key to access UserName
                        Server.Transfer("~/Guest/AskQuestion.aspx?key=" + strRandom);
                        //------------------------------------------------------------------------------
                    }
                    else
                    {   //No Such User
                        //------------------------------------------------------------------------------
                        L_WPassword.Visible = true;
                        //------------------------------------------------------------------------------
                    }

                }
                else // Wrong Captcha
                {
                    //------------------------------------------------------------------------------
                    L_Captcha.Visible = true;
                    TB_Captcha.Text = "";
                    L_WPassword.Visible = false;
                    //------------------------------------------------------------------------------
                }
            }
            catch (NullReferenceException)
            {
                //Session Variable Expread
                //------------------------------------------------------------------------------
                Response.Redirect("../Extras/ErrorReport.aspx?id=Section");
                //------------------------------------------------------------------------------
            }
        }
    }
}



