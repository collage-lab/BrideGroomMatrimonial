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

public partial class Extras_FeedBack : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Request.QueryString["id"] == "")
            {
                Footer_G1.Visible = false;
                Footer_M1.Visible = true;
                GuestLeftPanel1.Visible = false;
                MemberLeftPanel1.Visible = true;
                Img_Guest.Visible = false;
                Img_Member.Visible = true;
                TD_Left.Attributes.Add("bgcolor","#ffefed");
            }
            else
            {
               TD_Left.Attributes.Add("bgcolor","#f5f5f5");
            }

            txtCount.Text = TB_Message.MaxLength.ToString();

            //Adding Attributes to Text Box

            TB_Message.Attributes.Add("onKeyUp",
               "javascript:document.getElementById('" + txtCount.ClientID +
               "').setAttribute('value', (" + TB_Message.MaxLength +
               " - parseInt(document.getElementById('" + TB_Message.ClientID +
               "').getAttribute('value').length)));");

        
        }
        else
        {
            MatrimonialCoustomerSupportManager.AddNewFeedBack(TB_Email.Text, TB_Name.Text, TB_Message.Text);
            Table_FeedBack.Visible = false;
            Table_Success.Visible = true;

        }
    }

    
    public int MaxLength
    {
        get { return TB_Message.MaxLength; }
        set { TB_Message.MaxLength = value; }
    }




}
