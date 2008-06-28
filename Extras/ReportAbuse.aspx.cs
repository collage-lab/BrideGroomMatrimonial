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

public partial class Member_ReportAbuse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if ((Request.QueryString["typ"] != null) && (Request.QueryString["id"] != null))
            {

                HF_ToID.Value = Request.QueryString["id"];
                switch (Request.QueryString["typ"])
                {
                    case "prf":
                        L_ToMatID.Text = "- MatrimonialID > " + Request.QueryString["id"];
                        HF_Type.Value = "prf";
                        break;
                    case "ss":
                        L_ToMatID.Text = "- Succsss Story ID > " + Request.QueryString["id"];
                        HF_Type.Value = "ss";
                        break;
                    default:
                        Response.Redirect("~/Extras/ErrorReport.aspx?id=406");
                        break;
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
                Response.Redirect("~/Extras/ErrorReport.aspx?id=406");
            }

        } //Submit

        else
        {
            switch (HF_Type.Value)
            {
                case "prf":
                    MatrimonialCoustomerSupportManager.ReportAbuse(HF_ToID.Value, TB_Message.Text, true);
                    Response.Redirect("~/Extras/Sucess.aspx");
                    break;
                case "ss":
                    MatrimonialCoustomerSupportManager.ReportAbuse(HF_ToID.Value, TB_Message.Text, false);
                    Response.Redirect("~/Extras/Sucess.aspx");
                    break;
                default:
                    Response.Redirect("~/Extras/Sucess.aspx?id=Error in url");
                    break;
            }
        }
    }


    public int MaxLength
    {
        get { return TB_Message.MaxLength; }
        set { TB_Message.MaxLength = value; }
    }
}
