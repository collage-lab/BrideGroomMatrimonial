<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PasswordDisplay.ascx.cs" Inherits="WeBControls_PasswordDisplay" %>
<table align="center" border="0" cellpadding="3" cellspacing="0" class="blackbox"
    style="border-top: #e3ae2d 1px; border-bottom: #e3ae2d 1px dotted"
    width="98%">
    <tbody>
        <tr bgcolor="#ffffff" onmouseout="this.bgColor='#FFFFFF';" onmouseover="this.bgColor='#ffe7f8';">
            <td class="Partext1" style="width: 4%; text-align: right; ">
                <asp:CheckBox ID="CB_Delete" runat="server" /></td>
            <td class="Partext1" style="width: 16%; text-align: center; ">
                <asp:Label ID="L_No" runat="server"></asp:Label>&nbsp;
            </td>
            <td class="Partext1" style="width: 16%; text-align: left; ">
                <asp:Label ID="L_Type" runat="server"></asp:Label></td>
            <td class="Partext1" style="width: 20%; text-align: left; ">
                &nbsp;<asp:Label ID="L_RequestFrom_To" runat="server"></asp:Label>
                <asp:HiddenField ID="HF_Type" runat="server" />
            </td>
             <td class="Partext1" style="width: 20%; text-align: center; ">
                 <asp:HyperLink ID="HL_ViewProfile" runat="server" ImageUrl="~/Resources/View-Profile.gif"
                     Visible="False">View Profile</asp:HyperLink></td>

            <td class="Partext1" style="width: 20%; text-align: center; ">
            <% IFrame(); %>
                <asp:HyperLink ID="HL_ViewAlbum" runat="server" ImageUrl="~/Resources/viewAlbum2.gif"
                    Visible="False">View Abbum</asp:HyperLink></td>
        </tr>
    </tbody>
</table>