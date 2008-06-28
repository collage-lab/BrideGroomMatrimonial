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

using InfoSoftGlobal;

public partial class Admin_MemberReport : System.Web.UI.Page
{
    string ChartType;
    DataTable objDataTable;
    protected void Page_Load(object sender, EventArgs e)
    {

        switch (Request.QueryString["id"])
        {
            case "1":   // Full Members PieDigram
                Img_icon.ImageUrl = "~/Resources/User-ID32.gif";
                ChartType = "1";
                break;
            case "2":   //Paid user 3D
                Img_icon.ImageUrl = "~/Resources/User-paid32.gif";
                ChartType = "2";
                //load control from database
                break;
            case "3":  // Members Registred
                //load control from database
                Img_icon.ImageUrl = "~/Resources/User-active32.gif";
                ChartType = "3";
                break;
            case "4":   //Sailes Report
                //load control from database
                Img_icon.ImageUrl = "~/Resources/User-Inactive32.gif";
                ChartType = "4";
                break;
            default: // Full Members PieDigram
                // disable control
                //make id label and text box visible 
                //
                Img_icon.ImageUrl = "~/Resources/User-ID32.gif";
                ChartType = "2";
                break;
        }
    }


    protected string DrowChart()
    {
        //Creating Data XML
        string strRetrun = "<table><tr><td>";
        string strXML= null;
        string[]  strAColour = { "AFD8F8", "F6BD0F", "8BBA00", "FF8E46", "008E8E", "D64646", "8E468E", "588526", "B3AA00", "008ED6", "9D080D", "A186BE" };
        switch ( ChartType)
        { 
               
            case "1":
                this.objDataTable = MatrimonialSales.GetMatrimonialUserStatis();
                strXML = "";
                strXML += "<graph caption='Matrimonial Member Ratio' xAxisName='' yAxisName='' decimalPrecision='0' formatNumberScale='0'>";
                strXML += "<set name='Paid Members' value='" + objDataTable.Rows[0]["PAIDMEMBERS"].ToString() + "' color='F6BD0F'/>";
                strXML += "<set name='Free Members' value='" + objDataTable.Rows[0]["ACTIVE"].ToString() + "' color='588526'/>";
                strXML += "<set name='Inactive Members' value='" + objDataTable.Rows[0]["INACTIVE"].ToString() + "' color='9D080D'/>";
                strXML += "</graph>";
                //Pie Digram
                strRetrun += FusionCharts.RenderChart("../../Chart/Chart3DPie.swf", "", strXML, "MatrimonialSiteStatics_1", "350", "350", false, false);
                strRetrun += "</td><td>";
                strXML = "";
                strXML += "<graph caption='Matrimonial Male Female Ratio' xAxisName='' yAxisName='' decimalPrecision='0' formatNumberScale='0'>";
                strXML += "<set name='Male Members' value='" + this.objDataTable.Rows[0]["MALE"].ToString() + "' color='008E8E'/>";
                strXML += "<set name='Female Members' value='" + this.objDataTable.Rows[0]["FEMALE"].ToString() + "' color='9D080D'/>";
                strXML += "</graph>";
                strRetrun += FusionCharts.RenderChart("../../Chart/Chart3DPie.swf", "", strXML, "MatrimonialSiteStatics_2", "350", "350", false, false);
                break;
            case "2":

                //Members Registrade as paid members
                strXML = "";
                this.objDataTable = MatrimonialSales.GetUserStatis(MatrimonialSales.DetailsType.PaidMember);
                strXML += "<graph caption='Matrimonial Sales' xAxisName='Month' yAxisName='Paid Members Registerd' decimalPrecision='0' formatNumberScale='0'>";
                for (int intIncreminenter = 11; intIncreminenter >= 0; --intIncreminenter)
                {
                    DataRow objDataRow = this.objDataTable.Rows[intIncreminenter];
                    strXML += "<set name='" + objDataRow["Index_Name"].ToString().Substring(0, 3) + "' value='" + objDataRow["Member_Count"].ToString() + "' color='" + strAColour[intIncreminenter] + "'/>";
                }
                strXML += "</graph>";
                //Paid user 3D
                //3D Chart
                strRetrun = FusionCharts.RenderChart("../../Chart/Chart3DBlock.swf", "", strXML, "myNext", "600", "300", false, false);
                break;
            case "3":
                // Total Members Details

                strXML = "";
                this.objDataTable = MatrimonialSales.GetUserStatis(MatrimonialSales.DetailsType.TotalUser);
                strXML += "<graph caption='Matrimonial Sales' xAxisName='Month' yAxisName='Members Joined' decimalPrecision='0' formatNumberScale='0'>";
                for (int intIncreminenter = 11; intIncreminenter >= 0; --intIncreminenter)
                {
                    DataRow objDataRow = this.objDataTable.Rows[intIncreminenter];
                    strXML += "<set name='" + objDataRow["Index_Name"].ToString().Substring(0, 3) + "' value='" + objDataRow["Member_Count"].ToString() + "' color='" + strAColour[intIncreminenter] + "'/>";
                }
                strXML += "</graph>";
                //Paid user 3D
                //3D Chart
                strRetrun = FusionCharts.RenderChart("../../Chart/Chart2DBlock.swf", "", strXML, "myNext", "600", "300", false, false);
                break;
            case "4":

                strXML = "";
                this.objDataTable = MatrimonialSales.GetUserStatis(MatrimonialSales.DetailsType.Sales);//.GetSalesStatis();
                strXML += "<graph caption='Matrimonial Sales' xAxisName='Month' yAxisName='Sales in Rs' decimalPrecision='0' formatNumberScale='0'>";
                for (int intIncreminenter = 11; intIncreminenter >= 0; --intIncreminenter)
                {
                    DataRow objDataRow = this.objDataTable.Rows[intIncreminenter];
                    strXML += "<set name='" + objDataRow["Index_Name"].ToString().Substring(0, 3) + "' value='" + objDataRow["Member_Count"].ToString() + "' color='" + strAColour[intIncreminenter] + "'/>";
                }
                strXML += "</graph>";
                //// Line Graph
                strRetrun = FusionCharts.RenderChart("../../Chart/ChartLine.swf", "", strXML, "Matrimonial_Sailes", "600", "300", false, false);

                break;
            case "5": 

                break;
        }

        strRetrun += "</td></tr></table>";
        return strRetrun;
    }
}
