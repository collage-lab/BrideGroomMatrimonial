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

public partial class Admin_Protected_DelSuccessStory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //is it have a ssID
            string strSSID = Request.QueryString["id"];
            if ((strSSID != "") && (strSSID != null))
            {
                //Load Pannel
                SuccessPannel1.Bind(strSSID);
                
            }
            else
            {
                Response.Redirect("~/Extras/ErrorReport.aspx?id=404");
            }
        }
        else
        {
            //Ok You can Delete
            if (CB_Delete.Checked)
            {
                //Delete
                if (SuccessPannel1.DeleteMe())
                {
                    //Change Settings
                    L_Error.Text = "SucessStory Deleted";
                    L_Error.Visible = true;
                    SuccessPannel1.Visible = false;
                    CB_Delete.Visible = false;
                    B_Delete.Visible=false;
                }
                else
                {
                    //Error
                    L_Error.Text = "Server Not Resopnding";
                }
            }
            else
            {
                //You have to Check The Check Box
                CB_Delete.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
