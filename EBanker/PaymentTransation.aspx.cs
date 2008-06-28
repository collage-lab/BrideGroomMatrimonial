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

public partial class PaymentTransation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            HttpCookieCollection objHttpCookieCollection = Request.Cookies;
            HttpCookie objHttpCookie = objHttpCookieCollection.Get("ebanker");
            L_Counsumer.Text = Crypto.DeCrypto(objHttpCookie.Values["ACC"]);
            Amount.Text = Crypto.DeCrypto(objHttpCookie.Values["Amount"]);
        }
        else
        {
            L_ErrorMessage.Visible = false;

            if (TB_Captcha.Text.ToLower() == Session["CaptchaString"].ToString().ToLower())
            {

                //remove session 

                Session.Remove("CaptchaString");
                switch (AccountHandiler.Transaction(txtUserName.Text, txtPassword.Text, txtCCNo.Text, "",Amount.Text))
                {
                    case 1:
                        Response.Redirect("~/Payment/paymentSuccess.aspx");
                        break;
                    case 2:
                        L_ErrorMessage.Visible = true;
                        L_ErrorMessage.Text = "Username or pasword is incurrect!! Try Again ";
                        break;
                    case 3:
                        L_ErrorMessage.Visible = true;
                        L_ErrorMessage.Text = "You Dont Have enough Money in your account ";
                        break;
                    case 4:
                        break;
                }
            }
            else
            {
                L_ErrorMessage.Visible = true;
                TB_Captcha.Text = "";
                L_ErrorMessage.Text = "Error In entering sequrity string ";
            }
        }
    }
}
