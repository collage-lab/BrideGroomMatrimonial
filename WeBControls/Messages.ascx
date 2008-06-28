<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Messages.ascx.cs" Inherits="Messages" %>
<link href="../Resources/adminstyle.css" rel="stylesheet" type="text/css">



<table align="center" border="0" cellpadding="3" cellspacing="0" class="blackbox"
    style="border-top: #e3ae2d 1px; border-bottom: #e3ae2d 1px dotted"
    width="100%">
    <tbody>
        <tr bgcolor="#ffffff" onmouseout="this.bgColor='#FFFFFF';" onmouseover="this.bgColor='#ffe7f8';">
            <td class="Partext1" style="width: 4%; text-align: right; ">
                <asp:CheckBox ID="CB_Delete" runat="server" /></td>
            <td class="Partext1" style="width: 4%; text-align: center; ">
                <asp:Image ID="Img_Status" runat="server" ImageUrl="~/Resources/mesnotread.gif" ToolTip="Unreaded Message" Visible="False" /></td>
            <td class="Partext1" style="width: 6%; text-align: center; ">
                <asp:Label ID="L_No" runat="server"></asp:Label>
                <asp:HiddenField ID="HF_ID" runat="server" />
            </td>
            <td class="Partext1" style="width: 12%; text-align: left; ">
                <asp:Label ID="L_Date" runat="server"></asp:Label></td>
            <td class="Partext1" style="width: 13%; text-align: left; ">
                <asp:HyperLink ID="HL_MessageFrom_To" runat="server">[HL_MessageFrom_To]</asp:HyperLink></td>
            <td class="Partext1" style="width: 31%; text-align: justify; ">
                <asp:Label ID="L_Message" runat="server"></asp:Label></td>
            <td class="Partext1" style="width: 10%; text-align: center; ">
                <asp:HyperLink ID="HL_Replay" runat="server" ImageUrl="~/Resources/Message.gif"
                    Visible="False"></asp:HyperLink></td>
        </tr>
    </tbody>
</table>

