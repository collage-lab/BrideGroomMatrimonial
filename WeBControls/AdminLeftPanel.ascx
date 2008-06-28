<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdminLeftPanel.ascx.cs" Inherits="WeBControls_AdminLeftPanel" %>
<link href="../Resources/adminstyle.css" rel="stylesheet" type="text/css">

<center>
<table border="0" cellpadding="0" cellspacing="4" width="195">
    <tbody>
        <tr>
            <td class="paratext" colspan="2" height="25">
                <div align="center">
                    <strong>
                    Site Statistics </strong>
                </div>
            </td>
        </tr>
        <tr>
            <td style="width: 14px">
                &nbsp;</td>
                
            <td class="smalltextgrey" width="99%" style="text-align: left">
                Total Members : 
                <asp:Label ID="L_TotalMember" runat="server" ForeColor="Red" Font-Bold="False"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 14px">
                &nbsp;</td>
            <td class="smalltextgrey" style="text-align: left">
                In Active Members : 
                <asp:Label ID="L_InActiveMember" runat="server" ForeColor="Red" Font-Bold="False"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 14px">
                &nbsp;</td>
            <td class="smalltextgrey" style="text-align: left">
                Active Members :&nbsp;
                <asp:Label ID="L_ActiveMember" runat="server" ForeColor="Red" Font-Bold="False"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 14px">
                &nbsp;</td>
            <td class="smalltextgrey" style="text-align: left">
                Paid Members :&nbsp;
                <asp:Label ID="L_PaidMembers" runat="server" ForeColor="Red" Font-Bold="False"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 14px">
                &nbsp;</td>
            <td class="smalltextgrey">
                </td>
        </tr>
        <tr>
            <td style="width: 14px">
                &nbsp;</td>
            <td class="smalltextgrey" style="text-align: left">
                Male Profiles :&nbsp;
                <asp:Label ID="L_MProfile" runat="server" ForeColor="Red" Font-Bold="False"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 14px">
                &nbsp;</td>
            <td class="smalltextgrey" style="text-align: left">
                Female Profiles :&nbsp;
                <asp:Label ID="L_FProfile" runat="server" ForeColor="Red" Font-Bold="False"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 14px">
                &nbsp;</td>
            <td class="smalltextgrey">
                </td>
        </tr>
        <tr>
            <td style="width: 14px">
                &nbsp;</td>
            <td class="smalltextgrey" style="text-align: left">
                Clicks :
                <asp:Label ID="L_Clicks" runat="server" ForeColor="Red" Font-Bold="False"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 14px">
                &nbsp;</td>
            <td class="smalltextgrey" style="text-align: left">
                Members visited this week :
                <asp:Label ID="L_MembersVisited" runat="server" ForeColor="Red" Font-Bold="False"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 14px">
                &nbsp;</td>
            <td class="smalltextgrey">
                </td>
        </tr>
        
    </tbody>
</table>
</center>