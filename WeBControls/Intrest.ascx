<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Intrest.ascx.cs" Inherits="Intrest" %>


<table align="center" border="0" cellpadding="3" cellspacing="0" class="blackbox"
    height="30" width="100%" style="border-top: #e3ae2d 1px; border-bottom: #e3ae2d 1px dotted" unselectable="off">
    <tbody>
        <tr bgcolor="#ffffff" onmouseout="this.bgColor='#FFFFFF';" onmouseover="this.bgColor='#ffe7f8';">
            <td class="Partext1" style="width: 4%; text-align: center;">
                <asp:Label ID="L_No" runat="server"></asp:Label></td>
            <td class="Partext1" style="width: 14%; text-align: left;">
                <asp:Label ID="L_Date" runat="server"></asp:Label></td>
            <td class="Partext1" style="width: 16%; text-align: left;">
                &nbsp;<asp:HyperLink ID="HL_IntrestFrom"  style="text-decoration: none;" runat="server" Target="_blank" ToolTip="View Profile">[HL_IntrestFrom]</asp:HyperLink></td>
            <td class="Partext1" style="width: 54%; text-align: left;">
                <asp:Label ID="L_Intrest" runat="server"></asp:Label></td>
            <td class="Partext1" style="width: 6%; text-align: center;">
                &nbsp;
                <asp:HyperLink ID="HL_ChangeStatus" runat="server" ImageUrl="~/Resources/ChangeSettings.gif" Visible="False">Change Status</asp:HyperLink></td>
            <td class="Partext1" style="width: 6%; text-align: center;">
                &nbsp;<asp:HyperLink ID="HL_Message" runat="server" ImageUrl="~/Resources/Message.gif" Visible="False" ToolTip="Send Message">Send Message</asp:HyperLink></td>
           
        </tr>
    </tbody>
</table>
