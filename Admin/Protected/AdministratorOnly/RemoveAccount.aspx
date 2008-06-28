<%@ Page Language="C#" MasterPageFile="~/Admin/Protected/AdministratorOnly/Admin.master" AutoEventWireup="true" CodeFile="RemoveAccount.aspx.cs" Inherits="Admin_Protected_RemoveAccount" Title="Untitled Page" %>
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
                                    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; <span style="color: gray"><strong>DELETE ACCOUNT</strong></span></td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 15%">
                </td>
                <td class="HeadText1" colspan="4" style="width: 85%; height: 173px; text-align: left"
                    valign="top">
                    <table align="left" border="0" cellpadding="2" cellspacing="1" style="width: 617px;
                        height: 241px">
                        <tbody>
                            <tr>
                                
                                <td colspan="2" style="height: 81px; text-align: justify">
                                    <strong>
                                        <%--and SMTP Connection--%>
                                    </strong><span style="color: #808080">Some Captions regarding the creation of a new accout</span>
                                            .<br />
                                            <asp:Label ID="L_Error" runat="server" Font-Bold="False" Text="Account Deleted .."
                                                Visible="False" ForeColor="Red"></asp:Label></td>
                            </tr>
                            <tr style="font-size: 8pt">
                                <td class="Partext1" style="width: 140px">
                                </td>
                                <td style="width: 502px">
                                    </td>
                            </tr>
                            <tr style="color: #ff0033">
                                <td  style="width: 140px; height: 18px">
                                    <span ><span style="color: #000000">
                                    User Name</span> </span>
                                </td>
                                <td style="font-size: 8pt; width: 502px;  height: 18px">
                                    &nbsp;<asp:Label ID="TB_UserName" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="Gray"></asp:Label></td>
                            </tr>                            <tr style="color: #ff0033">
                                <td  style="width: 140px; height: 17px">
                                    <span style="color: #000000">
                                    
                                    User Type </span>
                                </td>
                                <td style="font-size: 8pt; width: 502px;  height: 17px">
                                    &nbsp;<asp:Label ID="TB_UserType" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="Gray"></asp:Label></td>
                            </tr>
                            <tr >
                                <td class="Partext1" style="width: 140px">
                                    User ID</td>
                                <td style="width: 502px;" >
                                    &nbsp;<asp:Label ID="TB_UserID" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="Gray"></asp:Label></td>
                            </tr>
                            <tr >
                                <td class="Partext1" style="width: 140px">
                                    Email Address</td>
                                <td style="width: 502px; color: #ff0000">
                                    
                                        &nbsp;<asp:Label ID="TB_MailAdd" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="Gray"></asp:Label></td>
                            </tr>
                            <tr >
                                <td class="Partext1" style="width: 140px; text-align: right;">
                                        <asp:CheckBox ID="CB_Del" runat="server" Text="Delete This Account" /></td>
                                <td style="width: 502px">
                                        <asp:Button ID="B_Delete" runat="server" CssClass="green-button" Text="Delete Account"
                        Width="105px" /></td>
                            </tr>
                            <tr >
                                <td class="Partext1" style="width: 140px">
                                    </td>
                                <td style="width: 502px">
                                    <span class="smalltextred" ><span class="smalltextred"> </span></span></td>
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

