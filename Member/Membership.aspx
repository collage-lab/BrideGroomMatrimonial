<%@ Page Language="C#" MasterPageFile="~/Member/MemberMaster.master" AutoEventWireup="true" CodeFile="Membership.aspx.cs" Inherits="Member_Membership" Title="My Membership " %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPH_Member" Runat="Server">
    <table align="center" border="0" cellpadding="0" cellspacing="0" height="20" width="97%">
        <tbody>
            <tr>
                <td background="../Resources/heading_bg.gif" width="37%">
                    <div align="left">
                        &nbsp; <span class="bodysg"><span class="bodysg">MY Matrimonial Membership</span></span></div>
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
                <td style="height: 246px">
                    <strong>
                        <table align="center" border="0" cellpadding="2" cellspacing="2" width="100%">
                            <tbody>
                                <tr>
                                    <td colspan="1" style="width: 83px; height: 17px; text-align: left">
                                    </td>
                                    <td colspan="1" style="width: 135px; height: 17px; text-align: right">
                                        <strong>Matrimony ID</strong></td>
                                    <td colspan="1" style="width: 7px; height: 17px; text-align: left">
                                        :</td>
                                    <td colspan="2" style="height: 17px; text-align: left">
                                        <strong>
                                            <asp:Label ID="L_MatID" runat="server"></asp:Label></strong></td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="width: 83px; height: 17px; text-align: left">
                                    </td>
                                    <td colspan="1" style="width: 135px; height: 17px; text-align: right">
                                        Name</td>
                                    <td colspan="1" style="width: 7px; height: 17px; text-align: left">
                                        :</td>
                                    <td colspan="2" style="height: 17px; text-align: left">
                                        <asp:Label ID="L_Name" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="width: 83px; height: 17px; text-align: left">
                                    </td>
                                    <td colspan="1" style="width: 135px; height: 17px; text-align: right">
                                        <strong>Membership</strong></td>
                                    <td colspan="1" style="width: 7px; height: 17px; text-align: left">
                                        :</td>
                                    <td colspan="2" style="height: 17px; text-align: left">
                                        <asp:Label ID="L_membership" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="width: 83px; height: 17px; text-align: left">
                                    </td>
                                    <td colspan="1" style="width: 135px; height: 17px; text-align: right">
                                        <strong>Created On </strong></td>
                                    <td colspan="1" style="width: 7px; height: 17px; text-align: left">
                                        :</td>
                                    <td colspan="2" style="height: 17px; text-align: left">
                                        <asp:Label ID="L_CreatedOn" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="width: 83px; height: 17px; text-align: left">
                                    </td>
                                    <td colspan="1" style="width: 135px; height: 17px; text-align: right">
                                        <strong>Cliks</strong></td>
                                    <td colspan="1" style="width: 7px; height: 17px; text-align: left">
                                        :</td>
                                    <td colspan="2" style="height: 17px; text-align: left">
                                        <asp:Label ID="L_CLiks" runat="server"></asp:Label></td>
                                </tr>
                                <% Display(true); %>
                                <tr>
                                    <td colspan="1" style="width: 83px; height: 17px; text-align: left">
                                    </td>
                                    <td colspan="1" style="width: 135px; height: 17px; text-align: right">
                                        <strong>PaidMember Form</strong></td>
                                    <td colspan="1" style="width: 7px; height: 17px; text-align: left">
                                        :</td>
                                    <td colspan="2" style="height: 17px; text-align: left">
                                        <asp:Label ID="L_PaidMemberFrom" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="width: 83px; height: 17px; text-align: left">
                                    </td>
                                    <td colspan="1" style="width: 135px; height: 17px; text-align: right">
                                        <strong>Paid Member upto</strong></td>
                                    <td colspan="1" style="width: 7px; height: 17px; text-align: left">
                                        :</td>
                                    <td colspan="2" style="height: 17px; text-align: left">
                                        <asp:Label ID="L_PaidMemberUpTo" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="width: 83px; height: 17px; text-align: left">
                                    </td>
                                    <td colspan="1" style="width: 135px; height: 17px; text-align: right">
                                        <strong>Plan</strong></td>
                                    <td colspan="1" style="width: 7px; height: 17px; text-align: left">
                                        :</td>
                                    <td colspan="2" style="height: 17px; text-align: left">
                                        <asp:Label ID="L_Plan" runat="server" Font-Bold="True"></asp:Label></td>
                                </tr>
                                  <% Display(false); %>
                                <tr>
                                    <td colspan="3">
                                    </td>
                                    <td colspan="2" style="text-align: left">
                                        <asp:HyperLink ID="HL_Renew_Upgrade" runat="server" ImageUrl="~/Resources/Renewicon.gif" NavigateUrl="~/Payment/Order.aspx">Renew</asp:HyperLink></td>
                                </tr>
                               
                            </tbody>
                        </table>
                    </strong>
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>

