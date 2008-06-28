<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SiteMap.aspx.cs" Inherits="Extras_SiteMap" %>

<%@ Register Src="../WeBControls/Footer_M.ascx" TagName="Footer_M" TagPrefix="uc3" %>
<%@ Register Src="../WeBControls/MemberLeftPanel.ascx" TagName="MemberLeftPanel"
    TagPrefix="uc4" %>

<%@ Register Src="../WeBControls/GuestLeftPanel.ascx" TagName="GuestLeftPanel" TagPrefix="uc2" %>

<%@ Register Src="../WeBControls/Footer_G.ascx" TagName="Footer_G" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
       <title></title>
        <link href="../Resources/style.css" rel="stylesheet" type="text/css">
 <link href="../Resources/style.css" rel="stylesheet" type="text/css" />
		<link rel="shortcut icon" href="../Resources/icon.ico">
</head>

<body class="body" bgcolor="#cccccc">
    <div align="center">
       <table class="BlueTborder" align="center" border="0" cellpadding="0" cellspacing="0" width="780" id="TABLE1" language="javascript" onclick="return TABLE1_onclick()">
            <tbody>               
                  <tr>
                      <td bgcolor="#ffffff" height="76" style="text-align: left">
                                    <img border="0" src="../Resources/logo.gif" />
                       </td>
                  </tr>
                
                  <tr>
                    <td colspan="2">		
                    <!-- MEMBER NOT LOGGED IN -->
                    
                    
		                    <asp:Image ID="Img_Guest" runat="server" ImageUrl="../Resources/guesttopmenu.jpg" usemap="#Mapmenu" border="0" height="29" width="780"/>
                    		
		                     <map name="Mapmenu" id="Mapmenu">
                                <!--Index--->
                                <area shape="rect" coords="10,5,59,25" href="../Guest/Home.aspx"title="Home"/>
                                 <!--registration--->
                                <area shape="rect" coords="74,3,156,24" href="../Guest/JoinNow.aspx" title="registration."/>
                                <!--login--->
                                <area shape="rect" coords="172,6,268,24" href="../Guest/login.aspx" title="Login."/> 
                                <!--searchoption--->
                                <area shape="rect" coords="282,5,378,22" href="../Guest/SearchOptions.aspx" title="Search."/>
                                <!--membership--->
                                <area shape="rect" coords="393,3,481,25" href="../Guest/Membership.aspx"title="Mbership Options."/>
                                <!--help--->
                                <area shape="rect" coords="494,5,527,25" href="../Extras/Help.aspx" title="Help."/>
                                <!--successstory--->
                                <area shape="rect" coords="541,4,650,24" href="../Guest/successstory.aspx" title="Success Story."/>
                                <!--paymentoptions--->
                                <area shape="rect" coords="659,4,776,21" href="../Extras/PaymentOptions.aspx" title="Payment Options."/>
                            </map>
                            
                    		<asp:Image ID="Img_Member" runat="server" ImageUrl="../Resources/logintopmenu.jpg" usemap="#Map2" border="0" height="29" width="780" Visible="False"/>
                            <!--------MyProfile Map will be added last------->
                                <map name="Map2" id="Map2">
                                    <area shape="rect" coords="0,1,128,26"href="../Member/Profile.aspx"alt="My Matri">
                                    <area shape="rect" coords="134,1,262,26" href="../Member/searchoption.aspx" alt="My Search">
                                    <area shape="rect" coords="287,2,427,27" href="../Member/Interests.aspx" alt="My Interest">
                                    <area shape="rect" coords="448,2,538,25" href="../Member/mymessage.aspx" alt="My Message">
                                    <area shape="rect" coords="567,2,678,25" href="../Member/mymembership.aspx" alt="My Membership">
                                    <area shape="rect" coords="696,4,763,24" href="../Member/logout.aspx" alt="Logout">
                                </map>

                
                        </td>
                  </tr>
                  <tr bgcolor="#ffffff">
                    <td colspan="2" valign="top">
                    <!-- START LEFT PART -->  
                    <div align="center">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tbody>
                    <tr>
                    <td id ="TD_Left" runat ="server" valign="top" style="width: 186px; height: 422px;">
                        <br />
                        <br />
                        <uc2:GuestLeftPanel ID="GuestLeftPanel1" runat="server" />
                        <uc4:MemberLeftPanel ID="MemberLeftPanel1" runat="server" Visible="false" />
                        <br />
                        <br />
                        <br />

                    <!-- ''''''''''''''NORMAL ''''''''''''''' -->
                    </td>
                    <td valign="top" style="height: 422px"><br>
                        <br />
                        
                       <form  name="MatriForm" id="MatriForm" runat="server">
                        <div>
                            &nbsp;<table align="center" border="0" cellpadding="0" cellspacing="0" height="20"
                                width="97%">
                                <tbody>
                                    <tr>
                                        <td background="../Resources/heading_bg.gif" width="37%">
                                            <div align="left">
                                                &nbsp; <strong>Sitemap </strong>
                                            </div>
                                        </td>
                                        <td width="63%">
                                            &nbsp;</td>
                                    </tr>
                                </tbody>
                            </table>
                            <table id="TBL_Guest_Map" visible="false" runat="server" align="center" border="0" cellpadding="0" cellspacing="0" class="submenubox"
                                width="97%">
                                <tbody>
                                    <tr>
                                        <td>
                                            <table border="0" cellpadding="3" cellspacing="3" style="color: #ff99cc; text-decoration: none"
                                                width="98%">
                                                <tbody>
                                                    <tr>
                                                        <td colspan="3">
                                                            <strong>Matrimonials Info</strong></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            <a href="../Guest/Home.aspx"class="bngShyperText">Home</a></td>
                                                        <td style="color: #0000ff">
                                                            <a href="../Guest/joinNow.aspx"class="bngShyperText">
                                                                Free Registration </a>
                                                        </td>
                                                    </tr>
                                                    <tr style="color: #0000ff">
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            <a href="../guest/login.aspx"class="bngShyperText">Member
                                                                Login </a>
                                                        </td>
                                                        <td style="color: #0000ff">
                                                            <a href="../Guest/SearchOptions.aspx"class="bngShyperText">
                                                                Search Profile </a>
                                                        </td>
                                                    </tr>
                                                    <tr style="color: #0000ff">
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            <a href="PaymentOptions.aspx"class="bngShyperText">Payment
                                                                Options </a>
                                                        </td>
                                                        <td style="color: #0000ff">
                                                            <a href="Membership.aspx"class="bngShyperText">Membership Schemes</a>
                                                        </td>
                                                    </tr>
                                                    <tr style="color: #0000ff">
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            <a href="Help.aspx"class="bngShyperText">Help and Faq </a>
                                                        </td>
                                                        <td style="color: #0000ff">
                                                            <a href="Aboutus.aspx"class="bngShyperText">Contact Us</a>
                                                        </td>
                                                    </tr>
                                                    <tr style="color: #0000ff">
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            <a href="Aboutus.aspx"class="bngShyperText">About Us</a>
                                                        </td>
                                                        <td style="color: #0000ff">
                                                            <a href="../Guest/SuccessStory.aspx"class="bngShyperText">Success Stories </a>
                                                        </td>
                                                    </tr>
                                                    <tr style="color: #0000ff">
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            <a href="#"class="bngShyperText">Share Experience </a>
                                                        </td>
                                                        <td style="color: #0000ff">
                                                            <a href="#"class="bngShyperText">Refer a Friend </a>
                                                        </td>
                                                    </tr>
                                                    <tr style="color: #0000ff">
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            <a href="terms_con.aspx" class="bngShyperText">Terms and
                                                                Conditions </a>
                                                        </td>
                                                        <td style="color: #0000ff">
                                                            <a href="PrivacyPolicy.aspx"class="bngShyperText">Privacy
                                                                Policy </a>
                                                        </td>
                                                    </tr>
                                                    <tr style="color: #0000ff">
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            &nbsp;</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table><table id="TBL_Member_Map" runat="server" align="center" visible="false" border="0" cellpadding="0" cellspacing="0" class="submenubox"
                                width="97%">
                                <tbody>
                                    <tr>
                                        <td>
                                            <table border="0" cellpadding="3" cellspacing="3" style="color: #ff99cc; text-decoration: none"
                                                width="98%">
                                                <tbody>
                                                    <tr>
                                                        <td colspan="3">
                                                            <strong>Matrimonials Info</strong></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            <a href="../Guest/Home.aspx"class="bngShyperText">Home</a></td>
                                                        <td style="color: #0000ff">
                                                            <a href="../Guest/joinNow.aspx"class="bngShyperText">Free Registration </a>
                                                        </td>
                                                    </tr>
                                                    <tr style="color: #0000ff">
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            <a href="../guest/login.aspx"class="bngShyperText">Member Login </a>
                                                        </td>
                                                        <td style="color: #0000ff">
                                                            <a href="../Guest/SearchOptions.aspx"class="bngShyperText">Search Profile </a>
                                                        </td>
                                                    </tr>
                                                    <tr style="color: #0000ff">
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            <a href="PaymentOptions.aspx"class="bngShyperText">Payment Options </a>
                                                        </td>
                                                        <td style="color: #0000ff">
                                                            <a href="Membership.aspx"class="bngShyperText">Membership Schemes</a>
                                                        </td>
                                                    </tr>
                                                    <tr style="color: #0000ff">
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            <a href="Help.aspx"class="bngShyperText">Help and Faq </a>
                                                        </td>
                                                        <td style="color: #0000ff">
                                                            <a href="Aboutus.aspx"class="bngShyperText">Contact Us</a>
                                                        </td>
                                                    </tr>
                                                    <tr style="color: #0000ff">
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            <a href="Aboutus.aspx"class="bngShyperText">About Us</a>
                                                        </td>
                                                        <td style="color: #0000ff">
                                                            <a href="../Guest/SuccessStory.aspx"class="bngShyperText">Success Stories </a>
                                                        </td>
                                                    </tr>
                                                    <tr style="color: #0000ff">
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            <a href="#"class="bngShyperText">Share Experience </a>
                                                        </td>
                                                        <td style="color: #0000ff">
                                                            <a href="#"class="bngShyperText">Refer a Friend </a>
                                                        </td>
                                                    </tr>
                                                    <tr style="color: #0000ff">
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            <a href="terms_con.aspx" class="bngShyperText">Terms and Conditions </a>
                                                        </td>
                                                        <td style="color: #0000ff">
                                                            <a href="PrivacyPolicy.aspx"class="bngShyperText">Privacy Policy </a>
                                                        </td>
                                                    </tr>
                                                    <tr style="color: #0000ff">
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            &nbsp;</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        <br />
                            
                            
                        </div>
                        </form>
                    </td>
                    </tr>
                    </tbody></table>

                    </div>
                    <!-- END LEFT PART -->	
                    <uc1:Footer_G ID="Footer_G1" runat="server" /><uc3:Footer_M ID="Footer_M1" runat="server" Visible="false" />
		            </td>
                    </tr>
        			
                  <tr>
                    <td></td>
                  </tr>
                  <tr></tr>
                  <tr></tr>
              </tbody>
      </table>
  
</div>
</body>

</html>

