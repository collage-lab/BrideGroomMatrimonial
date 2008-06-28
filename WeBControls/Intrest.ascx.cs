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

public partial class Intrest : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    //Public Properties
    public string ImageButtonID
    {
        set
        {
            HL_Message.Visible = true;
            HL_Message.Attributes.Add("onclick", "newWindow('SendMessages.aspx?id=" + value + "','SendMessage','500','250')");
        }
    }

    //Public methode

    public void Bind(MemberIntrest UserIntrest)
    {
        try
        {


            switch (UserIntrest.IntrestType)
            {
                case 1:
                    L_Intrest.Text = "I am interested in your profile. If you are interested in my profile, please contact me.";
                    break;
                case 2:
                    L_Intrest.Text = "I have gone through your details and feel we have lot in common. Would sure like to know your opinion on this?";
                    break;
                case 3:
                    L_Intrest.Text = "You are someone special I wish to know better. Please contact me at the earliest.";
                    break;
                case 4:
                    L_Intrest.Text = "We found your profile to be a good match. Please contact us to proceed further.";
                    break;
                case 5:
                    L_Intrest.Text = "You are the kind of person we were searching for. Please send us your contact details.";
                    break;
                default:
                    break;
            }

            //Intrest From 
            HL_IntrestFrom.Text = UserIntrest.IntrestFrom.ToUpper();
            HL_IntrestFrom.NavigateUrl = "../MyProfile/" + UserIntrest.IntrestFrom + ".aspx";

            //Date
            L_Date.Text = UserIntrest.Date;

            // Index
            L_No.Text = UserIntrest.Index.ToString();

            // Settings For change status

            if (UserIntrest.mailBox == InternalMessage.MailType.Inbox)
            {
                HL_ChangeStatus.Visible = true;
                HL_ChangeStatus.Attributes.Add("onclick", "newWindow('ChangeIntrestStatus.aspx?&typ="+UserIntrest.IntrestStatus.ToString()+"&id=" + UserIntrest.IntrestFrom + "','SendMessage','585','275')");
            }
            else
            {
                HL_ChangeStatus.Visible = false;
            }

            try
            {
                HttpCookieCollection objHttpCookieCollection = Request.Cookies;
                HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");
                //<<<ForTesting>>>>
                if (Crypto.DeCrypto(objHttpCookie.Values["UserType"]) == "PaidMember")
                {
                    HL_Message.Visible = true;
                    HL_Message.Attributes.Add("onclick", "newWindow('SendMessages.aspx?id=" + UserIntrest.IntrestFrom + "','SendMessage','585','300')");
                }

            }
            catch (Exception)
            { }
 


            
            this.Visible = true;
        }
        catch (Exception)
        {
            this.Visible = false;
        }
    } 
    
}
