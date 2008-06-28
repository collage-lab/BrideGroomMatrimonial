<%@ Page Language="C#" MasterPageFile="~/Admin/Protected/AdministratorOnly/Admin.master" AutoEventWireup="true" CodeFile="MembershipPlan.aspx.cs" Inherits="Admin_Protected_MembershipPlan" Title="Edit Membership Plans" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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

<table id="content" border="0" cellpadding="1" cellspacing="1" height="0" width="100%">
                             <tbody>
                                 <tr>
                                     <td colspan="4" height="54" valign="middle">
                                         <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                             <tbody>
                                                 <tr>
                                                     <td style="width: 8%; height: 51px">
                                                         <img src="../../../Resources/EditmembershipSettings32.gif" /></td>
                                                     <td class="headertext" width="97%" style="height: 51px">
                                                         &nbsp; &nbsp;&nbsp;&nbsp; <strong><span style="color: gray">EDIT MEMBERSHIP PLANS</span></strong>
                                                     </td>
                                                 </tr>
                                             </tbody>
                                         </table>
                                     </td>
                                 </tr>
                                 <tr>
                                 <td></td>
                                     <td class="HeadText1" colspan="4" valign="top" style="text-align: left">
                                           <br />
                                                 <br />
                                                 <table border="0" cellpadding="3" cellspacing="0" class="blackbox"
                                                     height="30" width="95%" style="text-align: left">
                                                     <tbody>
                                                         <tr>
                                                             <td bgcolor="#ececec" class="paratext">
                                                                 Plan ID</td>
                                                             <td bgcolor="#ececec" class="paratext">
                                                                 Plan Name</td>
                                                             <td bgcolor="#ececec" class="paratext">
                                                                 Plan Display Name</td>
                                                             <td bgcolor="#ececec" class="paratext">
                                                                 No of Contacts Allocation</td>
                                                             <td bgcolor="#ececec" class="paratext">
                                                                 Plan Duration</td>
                                                             <td bgcolor="#ececec" class="paratext">
                                                                 Plan Amount</td>
                                                             <td bgcolor="#ececec" class="paratext">
                                                                 Edit Plan</td>
                                                         </tr>
                                                         <tr bgcolor="#ffffff" onmouseout="this.bgColor='#FFFFFF';" onmouseover="this.bgColor='#00ddff';">
                                                             <td class="Partext1" style="text-align: center">
                                                                 1</td>
                                                             <td class="Partext1">
                                                                 Plan 1</td>
                                                             <td class="Partext1">
                                                                 <asp:Label ID="L_Plan1Name" runat="server" Text="Diamond"></asp:Label></td>
                                                             <td class="Partext1">
                                                                 <asp:Label ID="L_Plan1Contacts" runat="server" Text="Label"></asp:Label></td>
                                                             <td class="Partext1">
                                                                 <asp:Label ID="L_Plan1Duration" runat="server" Text="Label"></asp:Label>
                                                                 Das
                                                             </td>
                                                             <td class="Partext1">
                                                                 <asp:Label ID="L_Plan1Amount" runat="server" Text="Label"></asp:Label></td>
                                                             <td class="Partext1" style="text-align: center">
                                                                 <a href="#null" onclick="newWindow('edit_plan_go.aspx?id=1','','360','386')" title="Edit Plan1">
                                                                     <img border="0" height="14" src="../../../Resources/edit.gif" width="14" /><span
                                                                         style="color: #0000ff; text-decoration: underline"> </span></a>
                                                             </td>
                                                         </tr>
                                                         <tr style="color: #0000ff; text-decoration: underline">
                                                             <td background="../../Resources/dot.gif" colspan="7" style="height: 2px">
                                                             </td>
                                                         </tr>
                                                         
                                                         <tr bgcolor="#ffffff" onmouseout="this.bgColor='#FFFFFF';" onmouseover="this.bgColor='#00ddff';">
                                                             <td class="Partext1" style="text-align: center">
                                                                 2</td>
                                                             <td class="Partext1">
                                                                 Plan 2</td>
                                                             <td class="Partext1">
                                                                 <asp:Label ID="L_Plane2Name" runat="server" Text="Gold"></asp:Label></td>
                                                             <td class="Partext1">
                                                                 <asp:Label ID="L_Plan2Contacts" runat="server" Text="Label"></asp:Label></td>
                                                             <td class="Partext1">
                                                                 <asp:Label ID="L_Plan2Duration" runat="server" Text="Label"></asp:Label>
                                                                 Days</td>
                                                             <td class="Partext1">
                                                                 <asp:Label ID="L_Plan2Amount" runat="server" Text="Label"></asp:Label></td>
                                                             <td class="Partext1" style="text-align: center">
                                                                 <a href="#null" onclick="newWindow('edit_plan_go.aspx?id=2','','400','400')" title="Edit Plan2">
                                                                     <img border="0" height="14" src="../../../Resources/edit.gif" width="14" /><span
                                                                         style="color: #0000ff; text-decoration: underline"> </span></a>
                                                             </td>
                                                         </tr>
                                                         <tr style="color: #0000ff; text-decoration: underline">
                                                             <td background="../../Resources/dot.gif" colspan="7" height="2">
                                                             </td>
                                                         </tr>
                                                         <tr bgcolor="#ffffff" onmouseout="this.bgColor='#FFFFFF';" onmouseover="this.bgColor='#00ddff';">
                                                             <td class="Partext1" style="text-align: center">
                                                                 3</td>
                                                             <td class="Partext1">
                                                                 Plan 3</td>
                                                             <td class="Partext1">
                                                                 <asp:Label ID="L_Plane3Name" runat="server" Text="Silver"></asp:Label></td>
                                                             <td class="Partext1">
                                                                 <asp:Label ID="L_Plan3Contacts" runat="server" Text="Label"></asp:Label></td>
                                                             <td class="Partext1">
                                                                 <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
                                                                 Days</td>
                                                             <td class="Partext1">
                                                                 <asp:Label ID="L_Plan3Amount" runat="server" Text="Label"></asp:Label></td>
                                                             <td class="Partext1" style="text-align: center">
                                                                 <a href="#null" onclick="newWindow('edit_plan_go.aspx?id=3','','400','400')" title="Edit Plan3">
                                                                     <img border="0" height="14" src="../../../Resources/edit.gif" width="14" /><span
                                                                         style="color: #0000ff; text-decoration: underline"> </span></a>
                                                             </td>
                                                         </tr>
                                                         <tr>
                                                             <td background="../../Resources/dot.gif" colspan="7" height="2">
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
</asp:Content>

