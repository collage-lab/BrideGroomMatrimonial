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

public partial class CheckYourMail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected string GetMask(string index,bool Start)
    {
        switch (Request.QueryString["id"])
        { 
            case "Guest":
                switch (index)
                {
                    case "Guest":
                        switch (Start)
                        {
                            case true:
                                return " ";
                            case false:
                                return " ";
                            default:
                                return " ";
                        }
                    case "Member":
                        switch (Start)
                        {
                            case true:
                                return " <!-- ";
                            case false:
                                return " --> ";
                            default:
                                return " ";
                        }
                    default:
                        return " ";
                }
            case "Member":
                switch (index)
                {
                    case "Guest":
                        switch (Start)
                        {
                            case true:
                                return " <!-- ";
                            case false:
                                return " --> ";
                            default:
                                return " ";
                        }
                    case "Member":
                        switch (Start)
                        {
                            case true:
                                return " ";
                            case false:
                                return " ";
                            default:
                                return " ";
                        }
                    default:
                        return " ";
                 }
            default:
                switch (Start)
                {
                    case true:
                        return "<!--"; 
                    case false:
                        return "-->";
                    default:
                        return " ";
                }
             }
    
    
    }

}

/*
<img border="0" height="29" src="../Resources/guesttopmenu.jpg" usemap="#Mapmenu"
                                width="780" />
                              <map name="Mapmenu" id="Mapmenu">
                                <!--Index--->
	                            <area shape="rect" coords="10,5,59,25" href="Home.aspx"title="Home."/>
	                             <!--registration--->
	                            <area shape="rect" coords="74,3,156,24" href="JoinNow.aspx" title="registration."/>
	                            <!--login--->
	                            <area shape="rect" coords="172,6,268,24" href="login.aspx" title="Login."/> 
	                            <!--searchoption--->
	                            <area shape="rect" coords="282,5,378,22" href="SearchOptions.aspx" title="Search."/>
	                            <!--membership--->
	                            <area shape="rect" coords="393,3,481,25" href="Extra/Membership.aspx"title="Mbership Options."/>
	                            <!--help--->
	                            <area shape="rect" coords="494,5,527,25" href="Extra/Help.aspx" title="Help."/>
	                            <!--successstory--->
	                            <area shape="rect" coords="541,4,650,24" href="successstory.aspx" title="Success Story."/>
	                            <!--paymentoptions--->
	                            <area shape="rect" coords="659,4,776,21" href="Extra/paymentoptions.aspx" title="Payment Options."/>
                            </map>

*/