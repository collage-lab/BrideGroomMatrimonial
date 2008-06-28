<%@ Page Language="C#" MasterPageFile="~/Admin/Protected/AdministratorOnly/Admin.master" AutoEventWireup="true" CodeFile="ChangeAccountSettings.aspx.cs" Inherits="Admin_Protected_ChangeAccountSettings" Title="change Account Settings" %>
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
                                    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span style="color: gray"><strong>CHANGE ACCOUNT SETTINGS</strong>&nbsp;</span></td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 116px">
                </td>
                <td class="HeadText1" colspan="4" style="width: 589px; height: 173px; text-align: left"
                    valign="top">
                    <table align="left" border="0" cellpadding="2" cellspacing="1" style="width: 617px;
                        height: 241px">
                        <tbody>
                            <tr>
                                <td class="Partext1" style="width: 210px; height: 81px">
                                    <strong class="paratext"><span class="paratext" style="color: #000000"></span></strong>
                                </td>
                                <td style="width: 502px; color: #000000; height: 81px; text-align: justify">
                                    <strong>
                                        <%--and SMTP Connection--%>
                                    </strong><span style="color: #808080">Some Captions regarding the creation of a new accout</span>
                                            .<br />
                                            <asp:Label ID="L_Error" runat="server" Font-Bold="False" Text="User Account Updated"
                                                Visible="False" ForeColor="Red"></asp:Label></td>
                            </tr>
                            <tr style="font-size: 8pt">
                                <td class="Partext1" style="width: 210px">
                                </td>
                                <td style="width: 502px">
                                    </td>
                            </tr>
                            <tr style="color: #ff0033">
                                <td  style="width: 210px; height: 28px">
                                    <span style="color: #000000">
                                    User Name </span>
                                </td>
                                <td style="font-size: 8pt; width: 502px; color: #000000; height: 28px">
                                    &nbsp;<asp:TextBox ID="TB_UserName" runat="server" Width="208px" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
                            </tr>                            <tr style="color: #ff0033">
                                <td  style="width: 210px; height: 28px">
                                    <span style="color: #000000">
                                    User Type </span>
                                </td>
                                <td style="font-size: 8pt; width: 502px; color: #000000; height: 28px">
                                    <asp:RadioButton ID="RB_Admin" runat="server" Text="Administrator" GroupName="UserType" />&nbsp;
                                    <asp:RadioButton ID="RB_PUser" runat="server" Text="Power User" Checked="True" GroupName="UserType" /></td>
                            </tr>
                            <tr style="color: #000000">
                                <td class="Partext1" style="width: 210px">
                                    User ID</td>
                                <td style="width: 502px; color: #000000">
                                    <span style="color: #ff0033"><span
                                        style="color: #000000"> </span>&nbsp;<asp:TextBox ID="TB_UserID" runat="server" Width="207px" BorderWidth="0px" ReadOnly="True"></asp:TextBox></span></td>
                            </tr>
                            <tr style="color: #000000">
                                <td class="Partext1" style="width: 210px">
                                    Email Address<br />
                                </td>
                                <td style="width: 502px; color: #ff0000">
                                    <span class="smalltextred" style="color: #000000"><span style="color: #ff0000">
                                        <span class="smalltextred">&nbsp;<asp:TextBox ID="TB_MailAdd" runat="server" Width="208px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TB_MailAdd"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            &nbsp; <span
                                            style="color: #ff0033">(eg: smitha@gmail.com)</span><br />
                                        &nbsp;<asp:RegularExpressionValidator
                                                ID="revEmail" runat="server" ControlToValidate="TB_MailAdd" Display="Dynamic"
                                                ErrorMessage="Invalid email Id   " ValidationExpression="[\w-]+([\+\.][\w-]*)?@([\w-]+\.)+[\w-]+" ForeColor="Tomato"></asp:RegularExpressionValidator></span></span></span></td>
                            </tr>
                            <tr style="color: #000000">
                                <td class="Partext1" style="width: 210px">
                                    </td>
                                <td style="width: 502px">
                                    <span class="smalltextred" style="color: #000000">&nbsp;<asp:Button ID="B_Update" runat="server" CssClass="green-button" Text="Update Account"
                        Width="105px" /></span></td>
                            </tr>
                            <tr style="color: #000000">
                                <td class="Partext1" style="width: 210px">
                                    </td>
                                <td style="width: 502px">
                                    <span class="smalltextred" style="color: #000000">&nbsp; &nbsp; &nbsp; &nbsp;<span class="smalltextred"> </span></span>
                                </td>
                            </tr>


                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                
                <td colspan="5" >
                    <br />
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>

