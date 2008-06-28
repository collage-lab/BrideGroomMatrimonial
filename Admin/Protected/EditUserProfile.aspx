<%@ Page Language="C#" MasterPageFile="~/Admin/Protected/Admin.master" AutoEventWireup="true" CodeFile="EditUserProfile.aspx.cs" Inherits="Admin_Protected_EditUserProfile" Title="Untitled Page" %>
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
                                    &nbsp; &nbsp; &nbsp; <strong><span style="color: gray">&nbsp;EDIT MEMBER PROFILE</span></strong>
                                    <asp:Label ID="L_Label" runat="server" Font-Bold="True" ForeColor="Gray"></asp:Label></td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 13%">
                </td>
                <td class="HeadText1" colspan="4" style="text-align: left" valign="top">
                    <asp:Panel ID="PN_Edit" runat="server" Height="100%" Width="100%">
                        <table align="left" border="0" cellpadding="2" cellspacing="1" width="100%">
                            <tbody>
                                <tr>
                                    <td colspan="4" style="color: #000000; height: 19px; text-align: justify">
                                        <span style="color: #808080">Some Captions regarding the creation of a Delete Member</span><br />
                                        <asp:Label ID="L_Error_2" runat="server" Font-Bold="False" ForeColor="Red" Text="Server Not Responding"
                                            Visible="False"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 24%; height: 22px; text-align: right">
                                        Member-ID :&nbsp;
                                    </td>
                                    <td style="width: 85%; height: 22px">
                                        <asp:TextBox ID="TB_MatrimonialID" runat="server" Width="166px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_MatrimonialID"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        <span style="color: #ff0000"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 24%; height: 22px; text-align: right">
                                        &nbsp;</td>
                                    <td style="height: 22px; width: 85%;">
                                                     <asp:TextBox ID="TB_Password" runat="server" Width="166px" TextMode="Password"></asp:TextBox>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TB_Password"
                                                         ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                 <asp:Button ID="B_Search" runat="server" CssClass="green-button" Text="Search" Width="61px" />
                                                     <asp:Label ID="L_Wron_Pass" runat="server" ForeColor="Red"
                                                         Text="Password Entred Is Wrong" Visible="False"></asp:Label><span style="color: #ff0000"></span>
                                  </TD></tr>
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
                                            <span style="color: #ff0066">No Such Records Found</span></strong><span style="color: #ff0066">
                                            </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 33px">
                                        <ul class="Alert">
                                            <br />
                                            <li style="text-align: center"><span style="color: #ff0033">There are no records matching
                                                records specified by you</span></li>
                                            <li style="text-align: center"><span style="color: #ff0033">This ID is not present ,Pls
                                                check ...</span></li>
                                        </ul>
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

