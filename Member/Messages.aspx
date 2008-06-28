<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Messages.aspx.cs" Inherits="Member_Messages" %>

<%@ Register Src="../WeBControls/Messages.ascx" TagName="Messages" TagPrefix="uc4" %>

<%@ Register Src="../WeBControls/MemberLeftPanel.ascx" TagName="MemberLeftPanel"
    TagPrefix="uc1" %>

<%@ Register Src="../WeBControls/Footer_M.ascx" TagName="Footer_M" TagPrefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>My-Messages</title>
<link href="../Resources/style.css" rel="stylesheet" type="text/css"/>
<script language="JavaScript" type ="text/javascript">
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
                      <tbody>               
                            <tr>
                                <td bgcolor="#ffffff" height="76" style="text-align: left">
                                    <img border="0" src="../Resources/logo.gif" />
                                </td>
                            </tr>
                
                            <tr>
                                <td colspan="2" style="height: 31px">		<!-- MEMBER LOGGED IN -->
		                            <img src="../Resources/logintopmenu.jpg" usemap="#Map2" border="0" height="29" width="780">
		                                <map name="Map2" id="Map2">
		                                    <area shape="rect" coords="0,1,128,26"href="../Member/Profile.aspx"alt="My Matri">
		                                    <area shape="rect" coords="134,1,262,26" href="../Member/membersearchoption.aspx" alt="Partner Search Options">
		                                    <area shape="rect" coords="287,2,427,27" href="Interests.aspx" alt="My Interest">
		                                    <area shape="rect" coords="448,2,538,25" href="Messages.aspx" alt="My Message">
		                                    <area shape="rect" coords="567,2,678,25" href="Membership.aspx" alt="My Membership">
		                                    <area shape="rect" coords="696,4,763,24" href="logout.aspx" alt="Logout">
		                                </map>
                                 </td>
                              </tr>
                              <tr bgcolor="#ffffff">
                                <td colspan="2" valign="top">
                                 <%--START LEFT PART --%>
                                    <div align="center">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tbody><tr>
                                    <td bgcolor="#ffefed" height="303" valign="top" style="width: 180px">
                                        &nbsp;<br />
                                        <br />
                                        <uc1:MemberLeftPanel ID="MemberLeftPanel1" runat="server" />
                                        <br />
                                        <br />
                                        <br />
                                        <br />

                               
                                    </td>
                                    <td valign="top"><br><br><br>
                                        <form runat = "server" id= "MatrimonialForm">
                                          <%--Content Starts--%>
                                                <table align="center" border="0" cellpadding="0" cellspacing="0" height="20" width="97%">
                                                        <tbody>
                                                            <tr>
                                                                <td background="../Resources/heading_bg.gif" width="37%">
                                                                    <div align="left">
                                                                        &nbsp; <span class="bodysg"><span class="bodysg">Message Received</span></span></div>
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
                                                                <td><table border="0" cellpadding="3" cellspacing="3" style="width: 100%; text-align: left">
                                                                    <tr>
                                                                        <td style="width: 15%; text-align: right">
                                                                            <asp:ImageButton ID="IB_Delete_1" runat="server" ImageUrl="~/Resources/mesdelete.gif" OnClick="IB_Delete_Click" Visible="False" />&nbsp;</td>
                                                                        <td style="width: 15%; text-align: left">
                                                                            &nbsp;</td>
                                                                        <td style="width: 57%; text-align: right">
                                                                            <asp:LinkButton ID="LB_Previous_1" runat="server" Enabled="False" OnClick="LB_Previous_Click"><< Previous</asp:LinkButton>&nbsp;
                                                                            <asp:Label ID="L_Current_1" runat="server" Font-Bold="True"></asp:Label>
                                                                            of&nbsp;
                                                                            <asp:Label ID="L_Last_1" runat="server" Font-Bold="True"></asp:Label>
                                                                        </td>
                                                                        <td style="width: 13%; text-align: left">
                                                                            &nbsp;<asp:LinkButton ID="LB_Next_1" runat="server" OnClick="LB_Next_Click" Enabled="False">Next >></asp:LinkButton></td>
                                                                    </tr>
                                                                </table>
                                                                    <uc4:Messages ID="Messages_1" runat="server" Visible="false" />
                                                                    <uc4:Messages ID="Messages_2" runat="server" Visible="false" />
                                                                    <uc4:Messages ID="Messages_3" runat="server" Visible="false" />
                                                                    <uc4:Messages ID="Messages_4" runat="server" Visible="false" />
                                                                    <uc4:Messages ID="Messages_5" runat="server" Visible="false" />
                                                                    <uc4:Messages ID="Messages_6" runat="server" Visible="false" />
                                                                    <uc4:Messages ID="Messages_7" runat="server" Visible="false" />
                                                                    <uc4:Messages ID="Messages_8" runat="server" Visible="false" />
                                                                    <uc4:Messages ID="Messages_9" runat="server" Visible="false" />
                                                                    <uc4:Messages ID="Messages_10" runat="server" Visible="false" />
                                                                    <table border="0" cellpadding="3" cellspacing="3" style="width: 100%; text-align: left">
                                                                        <tr>
                                                                            <td style="width: 15%; text-align: right">
                                                                                <asp:ImageButton ID="IB_Delete_2" runat="server" ImageUrl="~/Resources/mesdelete.gif" OnClick="IB_Delete_Click" Visible="False" />&nbsp;</td>
                                                                            <td style="width: 15%; text-align: left">
                                                                                &nbsp;</td>
                                                                            <td style="width: 57%; text-align: right">
                                                                                <asp:LinkButton ID="LB_Previous_2" runat="server" Enabled="False" OnClick="LB_Previous_Click"><< Previous</asp:LinkButton>&nbsp;
                                                                                <asp:Label ID="L_Current_2" runat="server" Font-Bold="True"></asp:Label>
                                                                                of&nbsp;
                                                                                <asp:Label ID="L_Last_2" runat="server" Font-Bold="True"></asp:Label>
                                                                            </td>
                                                                            <td style="width: 13%; text-align: left">
                                                                                &nbsp;<asp:LinkButton ID="LB_Next_2" runat="server" OnClick="LB_Next_Click" Enabled="False">Next >></asp:LinkButton></td>
                                                                        </tr>
                                                                    </table>
                                                                    <asp:HiddenField ID="HF_Start" runat="server" Value="0" />
                                                                    <asp:HiddenField ID="HF_Count" runat="server" Value="0" /><asp:HiddenField ID="HF_In_Out" runat="server" Value="0" />
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                                                    
                                           <%--Content Ends--%>
                                          </form>
                                     <br />
                                    </td>
                                    </tr>
                                    </tbody></table>

                                    </div>
                                    <%--END LEFT PART--%> 	
		                        </td>
                                </tr>
                              <tr>
                                <td style="height: 105px">
                                    <uc3:Footer_M ID="Footer_M1" runat="server" />
                                 </td>
                              </tr>
                              <tr> </tr>
                              <tr></tr>
                    </tbody>
            </table>
        </div>
</body>
</html>