<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FeedBack.aspx.cs" Inherits="Extras_FeedBack" %>

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
                                        <!-- MEMBER LOG IN ...-->
                                        <td background="../Resources/heading_bg.gif" style="height: 20px" width="37%">
                                            <div align="left">
                                                &nbsp; <span class="viewtextsmall"><strong>Feed Back ...</strong></span></div>
                                        </td>
                                        <td style="height: 20px" width="63%">
                                            &nbsp;</td>
                                    </tr>
                                </tbody>
                            </table>
                            <table align="center" border="0" cellpadding="0" cellspacing="0" class="submenubox" width="97%">
                                  <tbody>
                                      <tr>
                                        <td>
                                            <p class="textsmallnormal" style="padding-right: 3px; padding-left: 5px; text-transform: none;
                                                color: rgb(0,0,0); line-height: 16px; padding-top: 0pt; font-style: normal; text-align: justify">
                                            <br />
                                            <table runat="server" id="Table_FeedBack" visible ="true" align="center" border="0" cellpadding="5" cellspacing="4" width="97%">
                                                <tbody>
                                                    <tr>
                                                        <td colspan="2" style="text-align: center">
                                                            <span style="color: gray">
                                            Do you have a question, comment or suggestion? We appreciate your feedback which
                                            is very important and valuable to us.</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <div align="center">
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="5%">
                                                        </td>
                                                        <td>
                                                            <table  border="0" class="afterloglightyellow1" style="height: 76px" width="100%">
                                                                <tbody>
                                                                    <tr>
                                                                        <td bgcolor="#dbdbdb" colspan="2" height="20" style="text-align: left">
                                                                            <a class="bodylink" href="../Member/adv_search.aspx"><span style="color: #000000"><strong>
                                                                                Note</strong>: Please provide a valid and active Email ID so that we could get in
                                                touch with you. </span><span style="color: #000000">Valuable suggestions / feedback
                                                would get a surprise gift for their contribution.</span></a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td bgcolor="#f0f0f0" width="25%">
                                                                            <div align="center">
                                                                                Name :
                                                                            </div>
                                                                        </td>
                                                                        <td bgcolor="#f0f0f0" width="75%" style="text-align: left">
                                                            <asp:TextBox ID="TB_Name" runat="server" CssClass="forminput" Width="241px" MaxLength="64"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_Name"
                                                                                ErrorMessage="RequiredFieldValidator" SetFocusOnError="True"> *</asp:RequiredFieldValidator></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td bgcolor="#f0f0f0" width="25%">
                                                                            <div align="center">
                                                                                E-mail :
                                                                            </div>
                                                                        </td>
                                                                        <td bgcolor="#f0f0f0" width="75%" style="text-align: left">
                                                            <asp:TextBox ID="TB_Email" runat="server" CssClass="forminput" Width="241px" MaxLength="64"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TB_Email"
                                                                                ErrorMessage="RequiredFieldValidator" SetFocusOnError="True"> *</asp:RequiredFieldValidator>
                                                                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="TB_Email"
                                                                                Display="Dynamic" ErrorMessage="Invalid email Id   " ValidationExpression="[\w-]+([\+\.][\w-]*)?@([\w-]+\.)+[\w-]+"></asp:RegularExpressionValidator></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td bgcolor="#f0f0f0" width="25%">
                                                                            <div align="center">
                                                                                Suggestions / Feedback :
                                                                            </div>
                                                                        </td>
                                                                        <td bgcolor="#f0f0f0" width="75%" style="text-align: left">
                                                            <asp:TextBox ID="TB_Message" runat="server" CssClass="forminput" Height="82px" TextMode="MultiLine"
                                                                Width="369px" MaxLength="300"></asp:TextBox>
                                                                            You
                                                                            can have
                                                                            <asp:TextBox ID="txtCount" runat="server" BackColor="Transparent"
                                                                                BorderStyle="None" BorderWidth="0px" ForeColor="Red" ReadOnly="True" ToolTip="reminig letters"
                                                                                Width="21px">300</asp:TextBox><span style="color: gray">
                                                                                    more lettres
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TB_Message"
                                                                                ErrorMessage="RequiredFieldValidator" SetFocusOnError="True">Please Write some message</asp:RequiredFieldValidator>
                                                                                    &nbsp;</span></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td bgcolor="#f0f0f0" width="25%">
                                                                            <div align="center">
                                                                                &nbsp;</div>
                                                                        </td>
                                                                        <td bgcolor="#f0f0f0" width="75%" style="text-align: center">
                                                                        <asp:ImageButton ID="IB_Submit" runat="server" ImageUrl="~/Resources/submit.gif" /></td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            &nbsp;</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            </p>
                                                            <table id="Table_Success" visible ="false" runat="server" bgcolor="#dfea93" border="0" cellpadding="0" cellspacing="0" class="submenubox"
                                                                width="96%">
                                                                <tbody>
                                                                    <tr>
                                                                        <td align="center" class="Alert">
                                                                            <strong>
                                                                                <img align="absMiddle" border="0" src="../Resources/bngiconx64.gif" />&nbsp;<br />
                                                                                <br />
                                                                                Thnak you </strong>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><p>
                                                                            &nbsp;</p>
                                                                            <ul class="Alert">
                                                                                <li>We appreciate your feedback which is very important and valuable to us. </li>
                                                                            </ul>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                            <br />
                                        </td>
                                      </tr>

                                 </tbody>
                           </table>
                            
                            
                        </div>
                        </form>
                        <br />
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
