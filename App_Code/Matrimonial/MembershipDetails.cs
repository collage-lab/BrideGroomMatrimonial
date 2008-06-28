using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Data.SqlClient;

/// <summary>
/// Summary description for MembershipDetails
/// </summary>
public class MembershipDetails
{
    private string strName;
    private bool boolPaidMember;
    private string strCreatedOn;
    private short shortCliks;
    private string strPaidMemberForm;
    private string strPaidMemberupto;
    private string strPlan;

	public MembershipDetails( string MatrimonialID)
	{
        using (SqlConnection objConnection = DBConnection.GetSqlConnection())
        {

            SqlCommand objCommand = new SqlCommand("Matrimonial_MembershipDetails", objConnection);
            objCommand.CommandType = CommandType.StoredProcedure;

            objCommand.Parameters.Add("@MatrimonialID", SqlDbType.VarChar);
            objCommand.Parameters["@MatrimonialID"].Value = MatrimonialID;

            try
            {
                objConnection.Open();
                SqlDataReader objDataRader = objCommand.ExecuteReader();
                objDataRader.Read();

                strName = objDataRader["NAME"].ToString();
                DateTime dateTemp = Convert.ToDateTime(objDataRader["CREATEDIN"]);
                strCreatedOn = dateTemp.Day.ToString() + " : " + dateTemp.Month.ToString() + " : " + dateTemp.Year.ToString();
                shortCliks = Convert.ToInt16(objDataRader["CLICKS"]);
                boolPaidMember = Convert.ToBoolean(objDataRader["ISPaidMember"]);

                if (boolPaidMember == true)
                {
                    dateTemp = Convert.ToDateTime(objDataRader["MEMBERFROM"]);
                    strPaidMemberForm = dateTemp.Day.ToString() + " : " + dateTemp.Month.ToString() + " : " + dateTemp.Year.ToString();
                    dateTemp = Convert.ToDateTime(objDataRader["MEMBERTO"]);
                    strPaidMemberupto = dateTemp.Day.ToString() + " : " + dateTemp.Month.ToString() + " : " + dateTemp.Year.ToString();
                    strPlan = objDataRader["PLANNAME"].ToString();
                }

            }
            catch (Exception Ex)
            {


            }
        }
    }



    public string Name { get { return strName; } }
    public bool ISPaidMember { get { return boolPaidMember; } }
    public string CreatedOn { get { return strCreatedOn; } }
    public short Cliks { get { return shortCliks; } }
    public string PaidMemberForm { get { return strPaidMemberForm; } }
    public string PaidMemberupto { get { return strPaidMemberupto; } }
    public string Plan { get { return strPlan; } }




}
