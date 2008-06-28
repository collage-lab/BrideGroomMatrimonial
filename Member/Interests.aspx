<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interests.aspx.cs" Inherits="Member_Interests" %>

<%@ Register Src="../WeBControls/Intrest.ascx" TagName="Intrest" TagPrefix="uc4" %>

<%@ Register Src="../WeBControls/AdminLeftPanel.ascx" TagName="AdminLeftPanel" TagPrefix="uc1" %>
<%@ Register Src="../WeBControls/Footer_M.ascx" TagName="Footer_M" TagPrefix="uc2" %>
<%@ Register Src="../WeBControls/MemberLeftPanel.ascx" TagName="MemberLeftPanel"TagPrefix="uc3" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>My-Intrests</title>

<link href="../Resources/style.css" rel="stylesheet" type="text/css">
<script language="JavaScript">
<!-- Begin
var win = null;
function newWindow(mypage,myname,w,h,features) {
  var winl = (screen.width-w)/2;
  var wint = (screen.height-h)/2;
  if (winl < 0) winl = 0;
  if (wint < 0) wint = 0;
  var settings = 'height=' + h + ',';
  settings += 'width=' + w + ',';
  settings += 'top=' + wint + ',';
  settings += 'left=' + winl + ',';
  settings += features;
  win = window.open(mypage,myname,settings);
  win.window.focus();
}
//  End -->
</script>

</head>
<body class="body" bgcolor="#cccccc">
<div align="center">
<table class="BlueTborder" align="center" border="0" cellpadding="0" cellspacing="0" width="780">
          <%--DWLayoutTable--%>
          <tbody>               
                    <tr>
                        <td bgcolor="#ffffff" height="76" style="text-align: left">
                            <img border="0" src="../Resources/logo.gif" />
                        </td>
                    </tr>
        
          <tr>
            <td colspan="2" style="height: 31px">		<%-- MEMBER LOGGED IN --%>
		<img src="../Resources/logintopmenu.jpg" usemap="#Map2" border="0" height="29" width="780">
		<%--MyProfile Map will be added last --%>
		<map name="Map2" id="Map2">
		                                    <area shape="rect" coords="0,1,128,26"href="../Member/Profile.aspx"alt="My Matri">
		                                    <area shape="rect" coords="134,1,262,26" href="../Member/memberSearchOption.aspx" alt="My Search">
		                                    <area shape="rect" coords="287,2,427,27" href="../Member/Interests.aspx" alt="My Interest">
		                                    <area shape="rect" coords="448,2,538,25" href="../Member/Messages.aspx" alt="My Message">
		                                    <area shape="rect" coords="567,2,678,25" href="../Member/Membership.aspx" alt="My Membership">
		                                    <area shape="rect" coords="696,4,763,24" href="../Member/logout.aspx" alt="Logout">
		
		</map>

</td>
          </tr>
            <tr bgcolor="#ffffff">
                <td colspan="2" valign="top" style="height: 756px">
                
                    <div align="center">
                    <form id="Form1"  runat="server" name="form" onsubmit="return validate()">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="height: 642px">
                            <tbody>
                                <tr>
                                    <td bgcolor="#ffcccc" height="303" valign="top" style="width: 180px; background-color: mistyrose;">
                                        &nbsp;<br />
                                        <br />
                                        <uc3:MemberLeftPanel ID="MemberLeftPanel1" runat="server" />
                                        <br />
                                        <br />
                                        <br />
                                    </td>
                                    <td valign="top">
                                        <br />
                                        <table align="center" border="0" cellpadding="0" cellspacing="0" width="590">
                                            <tbody>
                                                <tr>
                                                    <td style="border-right: rgb(193,155,122) 1px solid; border-top: rgb(193,155,122) 1px solid;
                                                        border-left: rgb(193,155,122) 1px solid; border-bottom: rgb(193,155,122) 1px solid"
                                                        valign="top">
                                                        <table bgcolor="#ffd5e6" border="0" cellpadding="0" cellspacing="0" class="smallttxtnormal"
                                                            height="70" width="588">
                                                            <tbody>
                                                                <tr>
                                                                    <td colspan="2" height="5">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center" style="height: 13px" width="20">
                                                                        </td>
                                                                    <td style="height: 13px; text-align: left;" valign="middle">
                                                                        <b>Pending :</b> This folder displays the interests you've received but haven't
                                                                        accepted or declined.</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center" width="20" style="height: 14px">
                                                                        </td>
                                                                    <td valign="middle" style="text-align: left; height: 14px;">
                                                                        <b>Accepted :</b> This folder displays the interests you've received and have accepted.</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center" width="20">
                                                                        </td>
                                                                    <td valign="middle" style="text-align: left">
                                                                        <b>Declined :</b> This folder displays the interests you've received and have declined.</td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2" height="5">
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <br />
                                        <br>
                                        
                                        <table align="center" border="0" cellpadding="0" cellspacing="0" height="20" width="97%">
                                                <tbody>
                                                    <tr>
                                                        <td background="../Resources/heading_bg.gif" width="37%">
                                                            <div align="left">
                                                                &nbsp; <span class="bodysg"><span class="bodysg">Intrest 
                                                                    <asp:Label ID="L_Type" runat="server"></asp:Label></span></span></div>
                                                        </td>
                                                        <td width="63%">
                                                            &nbsp;</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                         
                                        <table align="center" border="0" cellpadding="0" cellspacing="0" class="submenubox"
                                                width="97%">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <uc4:Intrest ID="Intrest_1" runat="server" Visible="false" />
                                                            <uc4:Intrest ID="Intrest_2" runat="server" Visible="false" />
                                                            <uc4:Intrest ID="Intrest_3" runat="server" Visible="false" />
                                                            <uc4:Intrest ID="Intrest_4" runat="server" Visible="false" />
                                                            <uc4:Intrest ID="Intrest_5" runat="server" Visible="false" />
                                                            <uc4:Intrest ID="Intrest_6" runat="server" Visible="false" />
                                                            <uc4:Intrest ID="Intrest_7" runat="server" Visible="false" />
                                                            <uc4:Intrest ID="Intrest_8" runat="server" Visible="false" />
                                                            <uc4:Intrest ID="Intrest_9" runat="server" Visible="false" />
                                                            <uc4:Intrest ID="Intrest_10" runat="server" Visible="false" />
                                                            <table border="0" cellpadding="3" cellspacing="3" style="width: 100%; text-align: left">
                                                                <tr>
                                                                    <td style="width: 15%; height: 14px; text-align: right">
                                                                        &nbsp;</td>
                                                                    <td style="width: 15%; height: 14px; text-align: left">
                                                                        &nbsp;</td>
                                                                    <td style="width: 56%; height: 14px; text-align: right">
                                                                        <asp:LinkButton ID="LB_Previous_1" runat="server" Enabled="False" OnClick="LB_Previous_Click"><< Previous</asp:LinkButton>&nbsp;
                                                                        <asp:Label ID="L_Current_1" runat="server" Font-Bold="True"></asp:Label>
                                                                        of&nbsp;
                                                                        <asp:Label ID="L_Last_1" runat="server" Font-Bold="True"></asp:Label>
                                                                    </td>
                                                                    <td style="width: 13%; height: 14px; text-align: right">
                                                                        &nbsp;<asp:LinkButton ID="LB_Next_1" runat="server" Enabled="False" OnClick="LB_Next_Click">Next >></asp:LinkButton></td>
                                                                </tr>
                                                            </table>
                                                            <asp:HiddenField ID="HF_Start" runat="server" Value="0" />
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        <br />
                                        <br />
                                        <br />
                                       
                                    </td>
                                </tr>
                            </tbody>
                         </table>
                    
                    <uc2:Footer_M ID="Footer_M1" runat="server" />
                    </form>
                    </div>

                </td>
            </tr>
			
     <tr>
        <td>
        </td>
    </tr>
</tbody>

</table>
  
</div>




</body>
</html>

