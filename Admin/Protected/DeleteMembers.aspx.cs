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

public partial class Admin_Protected_DeleteMembers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //is it have a ssID
            string strMatID = Request.QueryString["id"];
            if ((strMatID != "") && (strMatID != null))
            {
                //Load Pannel
                
                if (!MemberPannel1.Bind(strMatID))
                {
                    L_Error.Visible = true;
                    L_Error.Text = "profile Not Found";
                    CB_Delete.Visible = false;
                    B_Delete.Visible = false;

                }

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
                if (MemberPannel1.DeleteMe())
                {
                    L_Error.Visible = true;
                }
                else
                {
                    L_Error.Visible = true;
                    L_Error.Text = "Profile Successfully Deleted";
                }
            }

        }
    }
}    

