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

using System.Data.SqlClient;

public partial class Payment_Order : System.Web.UI.Page
{
    bool boolPaidMember;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Load Controsls

            /* * * * * * * * * * * * * * * * * * * * * * * * * * * * 
            Procedure Name : MatrimonialMembershipPlan_GetPlan
             * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
            Type: SELECT 
             * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
            Parameters :
             * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
                        [PlanName]
                        [PlanDuration]
                        [PlanAmount]
             * * * * * * * * * * * * * * * * * * * * * * * * * * * */

            using (SqlConnection objConnection = DBConnection.GetSqlConnection())
            {
                try
                {
                    //Inserting data into

                    //Creating Command object
                    SqlCommand objCommand = new SqlCommand("MatrimonialMembershipPlan_GetPlan", objConnection);
                    objCommand.CommandType = CommandType.StoredProcedure;

                    objConnection.Open();
                    SqlDataReader objReader = objCommand.ExecuteReader();
                    objReader.Read();
                    L_Plan1Name.Text = objReader["PlanName"].ToString();
                    L_Plan1Duration.Text = objReader["PlanDuration"].ToString();
                    L_Plan1Amount.Text = objReader["PlanAmount"].ToString();

                    objReader.Read();
                    L_Plan2Name.Text = objReader["PlanName"].ToString();
                    L_Plan2Duration.Text = objReader["PlanDuration"].ToString();
                    L_Plan2Amount.Text = objReader["PlanAmount"].ToString();

                    objReader.Read();
                    L_Plan3Name.Text = objReader["PlanName"].ToString();
                    L_Plan3Duration.Text = objReader["PlanDuration"].ToString();
                    L_Plan3Amount.Text = objReader["PlanAmount"].ToString();
                    objReader.Close();
                    objConnection.Close();
                }
                catch (Exception)
                {
                    objConnection.Close();
                    Response.Redirect("~/Extras/ErrorReport.aspx");
                }

                HttpCookieCollection objHttpCookieCollection = Request.Cookies;
                HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");

                string strMtaID = Crypto.DeCrypto(objHttpCookie.Values["MatrimonialID"]);

                L_MatID.Text = strMtaID;
                MembershipDetails objMembeship = new MembershipDetails(strMtaID);
                L_Name.Text = objMembeship.Name;
                if (objMembeship.ISPaidMember)
                {
                    L_membership.Text = "Paid member";
                    boolPaidMember = true;
                    HL_Renew_Upgrade.ImageUrl = "~/Resources/Renewicon.gif";
                    this.Title = "Renew Your Membership";
                }
                else
                {
                    L_membership.Text = "Free member";
                    boolPaidMember = false;
                    HL_Renew_Upgrade.ImageUrl = "~/Resources/upgradenow.gif";
                    this.Title = "Upgrade Your Membership";
                }
                L_CreatedOn.Text = objMembeship.CreatedOn;
                L_PaidMemberFrom.Text = objMembeship.PaidMemberForm;
                L_PaidMemberUpTo.Text = objMembeship.PaidMemberupto;
                L_Plan.Text = objMembeship.Plan;
                objMembeship = null;
            }

            L_Add.Text = WebConfig.GetValues(WebConfig.ConfigurationItem.fname) +"<br/>"+
                        "Vellayambalam Po"+"<br/>"
                        + "Trivandrum"+"<br/>"
                        + "Kerala Pin 6901025"+"<br/>"
                        +"India";
        }
    }

    protected void Display(bool ISStart)
    {
        if (!boolPaidMember)
        {
            if (ISStart)
            {
                Response.Write("<!--");
            }
            else
            {
                Response.Write("-->");
            }

        }

    }
    protected void HL_Renew_Upgrade_Click(object sender, ImageClickEventArgs e)
    {
        HttpCookie objHttpCookie = new HttpCookie("ebanker");
        objHttpCookie.Values["ACC"] = Crypto.EnCrypto(WebConfig.GetValues( WebConfig.ConfigurationItem.fname));

       
        if (RB_Pln_1.Checked)
        {
            objHttpCookie.Values["Amount"] = Crypto.EnCrypto(L_Plan1Amount.Text);
            objHttpCookie.Values["PLanID"] = Crypto.EnCrypto("1");

        }
        else if (RB_Pln_2.Checked)
        {
            objHttpCookie.Values["Amount"] = Crypto.EnCrypto(L_Plan2Amount.Text);
            objHttpCookie.Values["PLanID"] = Crypto.EnCrypto("2");
        }
        else if (RB_Pln_3.Checked)
        {
            objHttpCookie.Values["Amount"] = Crypto.EnCrypto(L_Plan3Amount.Text);
            objHttpCookie.Values["PLanID"] = Crypto.EnCrypto("3");
        }
        if (RB_EB.Checked)
        {
            Response.Cookies.Add(objHttpCookie);
            Response.Redirect("~/ebanker/PaymentTransation.aspx");

        }
    }
}
