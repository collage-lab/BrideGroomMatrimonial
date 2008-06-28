<%@ Page Language="C#" MasterPageFile="~/Member/MemberMaster.master" AutoEventWireup="true" CodeFile="MatrimonialIDSearch.aspx.cs" Inherits="Member_MatrimonialIDSearch" Title="MatrimonialID Search" %>

<%@ Register Src="../WeBControls/MemberPannel.ascx" TagName="MemberPannel" TagPrefix="uc4" %>


<asp:Content ID="Content1" ContentPlaceHolderID="CPH_Member" Runat="Server">
                                                    <table align="center" border="0" cellpadding="0" cellspacing="0" height="20" width="97%">
                                                        <tbody>
                                                            <tr>
                                                                <td background="../Resources/heading_bg.gif" width="37%">
                                                                    <div align="left">
                                                                        &nbsp; <span class="bodysg"><span class="bodysg">Matrimony ID Search</span></span></div>
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
                                                                    <asp:Panel ID="PN_Search" runat="server" Height="100%" Width="100%">
                                                                        <br />
                                                                        <table align="center" border="0" cellpadding="2" cellspacing="2" width="97%">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td colspan="2" style="height: 17px; text-align: left">
                                                                                        <strong>Search for a specific profile</strong> by entering the Matrimony ID</td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td style="width: 104px">
                                                                                        &nbsp;</td>
                                                                                    <td width="83%">
                                                                                        &nbsp;</td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td style="width: 104px">
                                                                                        <span class="style1">*</span> Matrimony ID
                                                                                    </td>
                                                                                    <td style="text-align: left">
                                                                                        <asp:TextBox ID="TB_Mat_ID" runat="server"></asp:TextBox></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td style="width: 104px">
                                                                                        &nbsp;</td>
                                                                                    <td style="text-align: left">
                                                                                        <asp:ImageButton ID="IMB_Search" runat="server" ImageUrl="~/Resources/search-button.gif" /></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td colspan="2">
                                                                                        <div align="left">
                                                                                            Matrimony ID is the identity of the profile which is provided by the user at the
                                                                                            time of creating the profile. Each profile ID is unique; Please ensure &amp; enter
                                                                                            the correct Matrimony ID to get the specific result.</div>
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </asp:Panel>
                                                                    <asp:Panel ID="PN_Member" runat="server" Height="100%" Visible="False" Width="100% " Wrap="False" HorizontalAlign="Left">
                                                                        <br />
                                                                        <table style="width: 100%"><tr>
                                                                        <td style="width: 15%"></td>
                                                                        <td style="width: 70%">
                                                                        <uc4:MemberPannel ID="MemberPannel1" runat="server" />
                                                                        </td>
                                                                        <td style="width: 15%"></td>
                                                                        </tr></table>
                                                                    </asp:Panel>
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
</asp:Content>

