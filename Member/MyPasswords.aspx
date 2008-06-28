<%@ Page Language="C#" MasterPageFile="~/Member/MemberMaster.master" AutoEventWireup="true" CodeFile="MyPasswords.aspx.cs" Inherits="Member_MyPasswords" Title="Untitled Page" %>

<%@ Register Src="../WeBControls/PasswordDisplay.ascx" TagName="PasswordDisplay"
    TagPrefix="uc2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="CPH_Member" Runat="Server">
<script language="JavaScript" type="text/javascript">
<!-- Begin
var win = null;
function newWindow(mypage,myname,w,h,features) {
  var winl = (screen.width-w)/2;
  var wint = (screen.height-h)/2;
  if (winl < 0) winl = 0;
  if (wint < 0) wint = 0;
  var settings = 'height=' + h + ',';
  settings += 'width=278,';
  settings += 'top=' + wint + ',';
  settings += 'left=' + winl + ',';
  settings += features;
  win = window.open(mypage,myname,settings);
  win.window.focus();
}
//  End -->
</script>

  <table align="center" border="0" cellpadding="0" cellspacing="0" height="20" width="97%">
                                                <tbody>
                                                    <tr>
                                                        <td background="../Resources/heading_bg.gif" width="37%">
                                                            <div align="left">
                                                                &nbsp; <span class="bodysg">Password
                                                                    <asp:Label ID="L_Type" runat="server"></asp:Label></span></div>
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
                                                        <table border="0" cellpadding="3" cellspacing="3" style="width: 100%; text-align: left">
                                                            <tr>
                                                                <td style="width: 15%; text-align: right">
                                                                    <asp:ImageButton ID="IB_Delete_1" runat="server" ImageUrl="~/Resources/mesdelete.gif"
                                                                        OnClick="IB_Delete_Click" Visible="False" />&nbsp;</td>
                                                                <td style="width: 15%; text-align: left">
                                                                    &nbsp;</td>
                                                                <td style="width: 57%; text-align: right">
                                                                    <asp:LinkButton ID="LB_Previous_1" runat="server" Enabled="False" OnClick="LB_Previous_Click"><< Previous</asp:LinkButton>&nbsp;
                                                                    <asp:Label ID="L_Current_1" runat="server" Font-Bold="True"></asp:Label>
                                                                    of&nbsp;
                                                                    <asp:Label ID="L_Last_1" runat="server" Font-Bold="True"></asp:Label>
                                                                </td>
                                                                <td style="width: 13%; text-align: left">
                                                                    &nbsp;<asp:LinkButton ID="LB_Next_1" runat="server" Enabled="False" OnClick="LB_Next_Click">Next >></asp:LinkButton></td>
                                                            </tr>
                                                        </table>
                                                        <uc2:PasswordDisplay id="PasswordDisplay1" runat="server" Visible="false">
                                                        </uc2:PasswordDisplay>
                                                        <uc2:PasswordDisplay id="PasswordDisplay2" runat="server" Visible="false">
                                                        </uc2:PasswordDisplay>
                                                        <uc2:PasswordDisplay id="PasswordDisplay3" runat="server" Visible="false">
                                                        </uc2:PasswordDisplay>
                                                        <uc2:PasswordDisplay id="PasswordDisplay4" runat="server" Visible="false">
                                                        </uc2:PasswordDisplay>
                                                        <uc2:PasswordDisplay id="PasswordDisplay5" runat="server" Visible="false">
                                                        </uc2:PasswordDisplay>
                                                        <uc2:PasswordDisplay id="PasswordDisplay6" runat="server" Visible="false">
                                                        </uc2:PasswordDisplay>
                                                        <uc2:PasswordDisplay id="PasswordDisplay7" runat="server" Visible="false">
                                                        </uc2:PasswordDisplay>
                                                        <uc2:PasswordDisplay id="PasswordDisplay8" runat="server" Visible="false">
                                                        </uc2:PasswordDisplay>
                                                        <uc2:PasswordDisplay id="PasswordDisplay9" runat="server" Visible="false">
                                                        </uc2:PasswordDisplay>
                                                        <uc2:PasswordDisplay id="PasswordDisplay10" runat="server" Visible="false">
                                                        </uc2:PasswordDisplay>
                                                        
                                                        <table border="0" cellpadding="3" cellspacing="3" style="width: 100%; text-align: left">
                                                            <tr>
                                                                <td style="width: 15%; text-align: right">
                                                                    <asp:ImageButton ID="IB_Delete_2" runat="server" ImageUrl="~/Resources/mesdelete.gif"
                                                                        OnClick="IB_Delete_Click" Visible="False" />&nbsp;</td>
                                                                <td style="width: 15%; text-align: left">
                                                                    &nbsp;</td>
                                                                <td style="width: 57%; text-align: right">
                                                                    <asp:LinkButton ID="LB_Previous_2" runat="server" Enabled="False" OnClick="LB_Previous_Click"><< Previous</asp:LinkButton>&nbsp;
                                                                    <asp:Label ID="L_Current_2" runat="server" Font-Bold="True"></asp:Label>
                                                                    of&nbsp;
                                                                    <asp:Label ID="L_Last_2" runat="server" Font-Bold="True"></asp:Label>
                                                                </td>
                                                                <td style="width: 13%; text-align: left">
                                                                    &nbsp;<asp:LinkButton ID="LB_Next_2" runat="server" Enabled="False" OnClick="LB_Next_Click">Next >></asp:LinkButton></td>
                                                            </tr>
                                                        </table>
                                                        <asp:HiddenField ID="HF_Start" runat="server" Value="0" /> <asp:HiddenField ID="HF_Count" runat="server" Value="0" /><asp:HiddenField ID="HF_Type" runat="server" Value="0" />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
</asp:Content>

