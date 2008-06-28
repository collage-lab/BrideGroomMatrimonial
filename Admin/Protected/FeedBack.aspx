<%@ Page Language="C#" MasterPageFile="~/Admin/Protected/Admin.master" AutoEventWireup="true" CodeFile="FeedBack.aspx.cs" Inherits="Admin_Protected_FeedBack" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table id="contentx" border="0" cellpadding="1" cellspacing="1" height="0" width="100%">
        <tbody>
            <tr>
                <td colspan="4" style="height: 54px" valign="middle">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tbody>
                            <tr>
                                <td style="width: 8%; height: 51px">
                                    <asp:Image ID="Img_icon" runat="server" ImageUrl="~/Resources/Del-user.gif" /></td>
                                <td class="headertext" style="height: 51px" width="97%">
                                    &nbsp; &nbsp; &nbsp;
                                    <asp:Label ID="L_Label" runat="server" Font-Bold="True" ForeColor="Gray"></asp:Label>&nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 12%">
                </td>
                <td class="HeadText1" colspan="4" style="text-align: left" valign="top">
                    <!-- Pannel Delete-->
                    <asp:Panel ID="PN_Settings" runat="server" Height="100%" Visible="False" Width="100%">
                        <table align="left" border="0" cellpadding="2" cellspacing="1" width="100%">
                            <tbody>
                                <tr>
                                    <td colspan="4" style="color: #000000; height: 19px; text-align: justify">
                                        <span style="color: #808080">Some Captions regarding the creation of Feed Back Settings<br />
                                        </span>
                                        <asp:Label ID="L_Alert" runat="server" Font-Bold="False" ForeColor="Red" Text="Settings Updated .. "
                                            Visible="False"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 24%; height: 22px; text-align: right">
                                        Filter :&nbsp;
                                    </td>
                                    <td style="width: 85%; height: 22px">
                                        <asp:RadioButton ID="RB_Filter_ON" runat="server" GroupName="RB_Filter" Text="ON" />&nbsp;
                                        <asp:RadioButton ID="RB_Filter_Off" runat="server" GroupName="RB_Filter" Text="OFF" /><span style="color: #ff0000"></span></td>
                                </tr>
                                <tr>
                                    <td style="width: 24%; height: 22px; text-align: right">
                                        Life Time :&nbsp;
                                    </td>
                                    <td style="width: 85%; height: 22px">
                                        &nbsp;<asp:TextBox ID="TB_Lifetime" runat="server" Width="119px" ToolTip="Number Between 30 - 365"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RFV_Date" runat="server" ControlToValidate="TB_Lifetime"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        <asp:RangeValidator ID="RV_Lifetime" runat="server" ControlToValidate="TB_Lifetime"
                                            ErrorMessage="Only Numbers between 30 -365 are alowded " MaximumValue="365" MinimumValue="30" Type="Integer"></asp:RangeValidator><span style="color: #ff0000"></span></td>
                                </tr>
                                <tr>
                                    <td style="width: 24%; height: 22px; text-align: right">
                                        &nbsp;</td>
                                    <td style="width: 85%; height: 22px">
                                        &nbsp;<asp:Button ID="B_Update" runat="server" CssClass="green-button" Text="Save Settings"
                                            Width="94px" />
                                        <span style="color: #ff0000"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" style="width: 86px">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="width: 82px">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </asp:Panel>
                    <!-- Pannel Check Annon-->
                    <asp:Panel ID="PN_CheckAnon" runat="server" Height="100%" Visible="False" Width="100%">
                        <table align="left" border="0" cellpadding="2" cellspacing="1" width="100%">
                            <tbody>
                                <tr>
                                    <td class="Partext1" style="width: 22px; height: 19px">
                                        <strong class="paratext"><span class="paratext" style="color: #000000"></span></strong>
                                    </td>
                                    <td colspan="2" style="width: 502px; color: #000000; height: 19px; text-align: justify">
                                        <span style="color: #808080">Some Captions 
                                        </span>
                                        </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td style="width: 22px">
                                    </td>
                                    <td style="width: 13px">
                                    </td>
                                    <td class="Partext1">
                                        <asp:Table ID="Table_View" runat="server" CaptionAlign="Top" CellPadding="1" CellSpacing="0"
                                            GridLines="Horizontal" Width="100%">
                                            <asp:TableRow ID="TableRow1" runat="server" BackColor="#8CD3EF" VerticalAlign="Middle">
                                                <asp:TableCell HorizontalAlign="Left" Text="Date" Width="12%"></asp:TableCell>
                                                <asp:TableCell runat="server" Width="23%">Name</asp:TableCell>
                                                <asp:TableCell runat="server" Width="25%">Email</asp:TableCell>
                                                <asp:TableCell runat="server" Width="40%">Message</asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </asp:Panel>
                    <!-- Pannel No record-->
                    <asp:Panel ID="PN_NoRecords" runat="server" Height="100%" Visible="False" Width="100%">
                        <br />
                        <br />
                        <table border="0" cellpadding="0" cellspacing="0" style="border-right: #ec5984 1px solid;
                            border-top: #ec5984 1px solid; border-left: #ec5984 1px solid; width: 522px;
                            border-bottom: #ec5984 1px solid">
                            <tbody>
                                <tr>
                                    <td align="center" class="Alert">
                                        <strong>
                                            <img align="absMiddle" border="0" src="../../Resources/warning.png" />
                                            <span style="color: #ff0066">No Feed Back Found</span></strong></td>
                                </tr>
                                <tr>
                                    <td style="height: 33px">
                                        <ul class="Alert">
                                            <br />
                                            <li style="text-align: center"><span style="color: #ff0033">There are no records matching
                                                records specified by you</span></li><li style="text-align: center"><span style="color: #ff0033">This ID is not present ,Pls
                                                check ...</span></li></ul>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td colspan="5">
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>

