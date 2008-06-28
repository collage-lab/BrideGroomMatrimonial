<%@ Page Language="C#" MasterPageFile="~/Admin/Protected/AdministratorOnly/Admin.master" AutoEventWireup="true" CodeFile="ManageAdminAccounts.aspx.cs" Inherits="Admin_Protected_ManageAdminAccounts" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table id="content" border="0" cellpadding="1" cellspacing="1" height="0" width="100%">
        <tbody>
            <tr>
                <td colspan="4" style="height: 54px" valign="middle">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tbody>
                            <tr>
                                <td style="width: 8%; height: 51px">
                                    <img src="../../../Resources/Del-user.gif" /></td>
                                <td class="headertext" style="height: 51px" width="97%">
                                    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span style="color: gray"><strong>MANAGE ADMIN USER ACCOUNT</strong>&nbsp;</span></td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 4%">
                </td>
                <td class="HeadText1" colspan="4" style="width: 90%px; height: 173px; text-align: left"
                    valign="top">
                    <table align="left" border="0" cellpadding="2" cellspacing="1" style="height: 241px" width="100%">
                        <tbody>
                            <tr>
                                <td class="Partext1" style="width: 18px; height: 19px">
                                    <strong class="paratext"><span class="paratext" style="color: #000000"></span></strong>
                                </td>
                                <td style="width: 502px; color: #000000; height: 19px; text-align: justify">
                                     <span style="color: #808080">Some Captions regarding the creation of a Delete
                                        accout</span> <br />
                                    <asp:Label ID="L_Error" runat="server" Font-Bold="False" ForeColor="#FF0000" Text="User Account Created"
                                        Visible="False"></asp:Label></td>
                            </tr>

                            <tr style="color: #000000">
                                <td class="Partext1" colspan="2">
                                <asp:table id="Table_View" runat="server" CellSpacing="0" CellPadding="1" GridLines="Horizontal" Width="100%" CaptionAlign="Top">
                                    <asp:TableRow ID="TableRow1" BackColor="#8CD3EF" runat="server">
                                        <asp:TableCell ID="TableCell1" Width="18%" HorizontalAlign="Left" Text="User ID" runat="server" VerticalAlign="Middle"></asp:TableCell>
                                        <asp:TableCell ID="TableCell2" Width="20%" HorizontalAlign="Left" Text="User Name" runat="server" VerticalAlign="Middle"></asp:TableCell>
                                        <asp:TableCell ID="TableCell3" Width="30%" HorizontalAlign="Left" Text="Email" runat="server" VerticalAlign="Middle"></asp:TableCell>
                                        <asp:TableCell ID="TableCell4" Width="11%" HorizontalAlign="Left" Text="Created on" runat="server" VerticalAlign="Middle"></asp:TableCell>
                                        <asp:TableCell ID="TableCell5" Width="11%" HorizontalAlign="Left" Text="LastLogin" runat="server" VerticalAlign="Middle"></asp:TableCell>
                                        <asp:TableCell ID="TableCell7" Width="5%" Font-Size="XX-Small" HorizontalAlign="Left" Text="Update" runat="server" VerticalAlign="Middle"></asp:TableCell>
                                        <asp:TableCell ID="TableCell8" Width="5%" Font-Size="XX-Small" HorizontalAlign="Left" Text="Delete" runat="server" VerticalAlign="Middle"></asp:TableCell>
                                    </asp:TableRow>
                                </asp:table>
                                
                                
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 210px;" colspan="2"></td>
                            </tr>
                            <tr>
                                <td colspan="2" >
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
            <td colspan="5"></td>
            </tr>
        </tbody>
    </table>
</asp:Content>

