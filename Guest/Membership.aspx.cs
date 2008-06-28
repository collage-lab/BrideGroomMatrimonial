//------------------------------------------------------------------------------------------------------------------------
//                                                  Matrimonial Membership Details
//------------------------------------------------==================================--------------------------------------
// Operations 
//============-------------------------------------------
// Displays information about diffrent membership plans
//-------------------------------------------------------
// User Roles
//==================
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
//------------------------------------------------------------------------------------------------------------------------
public partial class Extras_Membership : System.Web.UI.Page
{
    //--------------------------------------------------------------------------------------------------------------------
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //--------------------------------------------------------------------------------------
            MatMemberShipInformations objMemberShipInfo = new MatMemberShipInformations();
            L_Plan1Name.Text = objMemberShipInfo.Plan1Name;
            L_Plan1Duration.Text = objMemberShipInfo.Plan1Duration;
            L_Plan1Amount.Text = objMemberShipInfo.Plan1Amount;
            //--------------------------------------------------------------------------------------
            L_Plan2Name.Text = objMemberShipInfo.Plan2Name;
            L_Plan2Duration.Text = objMemberShipInfo.Plan2Duration;
            L_Plan2Amount.Text = objMemberShipInfo.Plan2Amount;
            //--------------------------------------------------------------------------------------
            L_Plan3Name.Text = objMemberShipInfo.Plan3Name;
            L_Plan3Duration.Text = objMemberShipInfo.Plan3Duration;
            L_Plan3Amount.Text = objMemberShipInfo.Plan3Amount;
            //--------------------------------------------------------------------------------------
        }// !IsPostBack
    }// Page_Load
}// Class