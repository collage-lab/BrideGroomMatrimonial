<%@ Page Language="C#" MasterPageFile="~/Admin/Protected/AdministratorOnly/Admin.master" AutoEventWireup="true" CodeFile="CreatNewUser.aspx.cs" Inherits="Admin_Protected_CreatNewUser" Title="Create New User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table id="content" border="0" cellpadding="1" cellspacing="1" height="0" width="100%">
        <tbody>
            <tr>
                <td colspan="4" style="height: 54px" valign="middle">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tbody>
                            <tr>
                                <td style="width: 8%; height: 51px">
                                    <img src="../../../Resources/add-user.gif" /></td>
                                <td class="headertext" style="height: 51px" width="97%">
                                    &nbsp; &nbsp; &nbsp;<strong>CREATE NEW USER</strong>&nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 116px">
                </td>
                <td class="HeadText1" colspan="2" style="width: 589px; height: 173px; text-align: left"
                    valign="top">
                    <table align="left" border="0" cellpadding="2" cellspacing="1" style="width: 617px;
                        height: 241px">
                        <tbody>
                            <tr>

                                <td style="width: 502px; color: #000000; height: 81px; text-align: justify" colspan="4">
                                    <strong>
                                        
                                    </strong><span style="color: #808080">Some Captions regarding the creation of a new accout</span>
                                            .<br />
                                            <asp:Label ID="L_Error" runat="server" Font-Bold="False" Text="User Account Created"
                                                Visible="False" ForeColor="#FF0000"></asp:Label></td>
                            </tr>
                            <tr style="font-size: 8pt">
                                <td class="Partext1" style="width: 105px" rowspan="10">
                                </td>
                                <td style="width: 502px" colspan="3">
                                    </td>
                            </tr>
                            <tr style="color: #ff0033">
                                <td  style="width: 210px; height: 28px">
                                    <span style="color: #000000">
                                    User Name </span>
                                </td>
                                <td style="font-size: 8pt; width: 502px; color: #000000; height: 28px" colspan="2">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_UserName"
                                        ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="TB_UserName" runat="server" Width="208px"></asp:TextBox>&nbsp;
                                    <span class="smalltextred">(eg:Hari,Smitha) </span>
                                </td>
                            </tr>                            <tr style="color: #ff0033">
                                <td  style="width: 210px; height: 28px">
                                    <span style="color: #000000">
                                    User Type </span>
                                </td>
                                <td style="font-size: 8pt; width: 502px; color: #000000; height: 28px" colspan="2">
                                    &nbsp; &nbsp;&nbsp;<asp:RadioButton ID="RB_Admin" runat="server" Text="Administrator" GroupName="UserType" />&nbsp;
                                    <asp:RadioButton ID="RB_PUser" runat="server" Text="Power User" Checked="True" GroupName="UserType" /></td>
                            </tr>
                            <tr style="color: #000000">
                                <td class="Partext1" style="width: 210px">
                                    User ID</td>
                                <td style="width: 502px; color: #000000" colspan="2">
                                    <span style="color: #ff0033"><span
                                        style="color: #000000"> </span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TB_UserID"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="TB_UserID" runat="server" Width="207px"></asp:TextBox>&nbsp;
                                    </span><span class="smalltextred" style="color: #000000"><span style="color: #ff0033">(eg : ADM-2,POW-11</span>) </span>
                                </td>
                            </tr>
                            <tr style="color: #000000">
                                <td class="Partext1" style="width: 210px">
                                    <span>Password </span></td>
                                <td style="width: 502px; color: #ff0000" colspan="2">
                                    <span class="smalltextred" style="color: #000000"><span style="color: #ff0000">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TB_Password"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="TB_Password" runat="server" TextMode="Password" Width="208px"></asp:TextBox>
                                        &nbsp;&nbsp;<span class="smalltextred">(user Can change it latter) </span></span></span>
                                </td>
                            </tr>
                            <tr style="color: #000000">
                                <td class="Partext1" style="width: 210px">
                                    Password <em>(Confirm)</em></td>
                                <td style="width: 502px" colspan="2">
                                    <span class="smalltextred" style="color: #000000">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TB_Password_C"
                                            ErrorMessage="*" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                        <asp:TextBox ID="TB_Password_C" runat="server" Width="208px"></asp:TextBox>&nbsp;
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TB_Password"
                                            ControlToValidate="TB_Password_C" ErrorMessage="Password Missmatch" ForeColor="Tomato" Font-Bold="True"></asp:CompareValidator><span class="smalltextred"></span></span></td>
                            </tr>
                            <tr style="color: #000000">
                                <td class="Partext1" style="width: 210px">
                                    Email Address</td>
                                <td style="width: 502px" colspan="2">
                                    <span class="smalltextred" style="color: #000000">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TB_MailAdd"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="TB_MailAdd" runat="server" Width="208px"></asp:TextBox>&nbsp; <span
                                            style="color: #ff0033">(eg: smitha@gmail.com)</span><br />
                                        &nbsp; &nbsp;&nbsp; &nbsp;<asp:RegularExpressionValidator
                                                ID="revEmail" runat="server" ControlToValidate="TB_MailAdd" Display="Dynamic"
                                                ErrorMessage="Invalid email Id   " ValidationExpression="[\w-]+([\+\.][\w-]*)?@([\w-]+\.)+[\w-]+" ForeColor="Tomato" Font-Bold="True"></asp:RegularExpressionValidator>&nbsp;<span class="smalltextred"> </span></span>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 210px; height: 23px">
                                    &nbsp;</td>
                                <td style="width: 22px; height: 23px; text-align: right">
                    <asp:Button ID="B_CreatNewUser" runat="server" CssClass="green-button" Text="Creat New User"
                        Width="105px" /></td><td width="100"></td>
                            </tr>
                            <tr>
                                <td colspan="3" style="height: 29px">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" style="height: 27px">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 116px">
                    &nbsp;</td>
                <td style="width: 409px; text-align: center" colspan="3">
                    &nbsp;&nbsp;&nbsp;
                    <br />
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>

