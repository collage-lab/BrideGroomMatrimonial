<%@ Control Language="C#" AutoEventWireup="true" CodeFile="IntrestMessageBar.ascx.cs" Inherits="clt_IntrestMessageBar" %>
<link href="~/Resources/style.css" rel="stylesheet" type="text/css">
<table border="0" cellpadding="3" cellspacing="3" style="width: 100%;text-align: left">
    <tbody>
        <tr>
            <td style="width: 15%; text-align: right; height: 25px;">
                &nbsp;</td>
            <td style="width: 15%; text-align: left; height: 25px;">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Resources/mesdelete.gif" />&nbsp;</td>
            <td style="width: 57%; text-align: right; text-align: right; height: 25px;">
                        <asp:HyperLink ID="HL_Previous" runat="server" Font-Overline="False" Font-Underline="False"><< Previous</asp:HyperLink>&nbsp;
                        <asp:Label ID="L_Current" runat="server" Font-Bold="True"></asp:Label>
                        of&nbsp;
                        <asp:Label ID="L_Last" runat="server" Font-Bold="True"></asp:Label>
            </td>
            <td style="width: 13%; text-align: left; height: 25px;">
                &nbsp;<asp:HyperLink ID="HL_Next" runat="server" Font-Strikeout="False" Font-Underline="False">Next >></asp:HyperLink></td>

        </tr>
    </tbody>
</table>
