<%@ Page Language="C#" MasterPageFile="~/Admin/Protected/AdministratorOnly/Admin.master" AutoEventWireup="true" CodeFile="DatabaseSettings.aspx.cs" Inherits="Admin_Protected_DatabaseSettings" Title="DataBase Settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table id="content" border="0" cellpadding="1" cellspacing="1" height="0" width="100%">
                             <tbody>
                                 <tr>
                                     <td colspan="4" style="height: 54px" valign="middle">
                                         <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                             <tbody>
                                                 <tr>
                                                     <td style="width: 8%; height: 51px">
                                                         <img src="../../../Resources/DatabaseSettings32.gif" /></td>
                                                     <td class="headertext" style="height: 51px" width="97%">
                                                         &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<strong><span style="color: gray">DATABASE CONFGURATION SETTINGS</span></strong>&nbsp;</td>
                                                 </tr>
                                             </tbody>
                                         </table>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td style="height: 181px" width="13%">
                                     </td>
                                     <td class="HeadText1" colspan="4" style="height: 181px" valign="top">
                                         
                                             <table align="left" border="0" cellpadding="2" cellspacing="1" style="width: 98%; height: 241px;">
                                                 <tbody>
                                                     <tr>
                                                        
                                                         <td style="width: 502px; color: #000000; height: 81px; text-align: justify;" colspan="3">
                                                             <%--and SMTP Connection--%>
                                                             <span style="color: gray">
                                                             <strong>
                                                                 Setting up Your Database :<br />
                                                             </strong>Your Website needs to connect
                                                             to a database in order to function properly. Fill in the following fields with the connection information for your database. Note: you should already have completed the import of the database schema as outlined in the installation guide.</span>
                                                             <br />
                                                             <asp:Label ID="lblErrorHeader" runat="server" ForeColor="Red"></asp:Label>
                                                             <br />
                                                             <asp:Label ID="L_Report" runat="server" ForeColor="Red"></asp:Label>&nbsp;<br />
                                                             <asp:Label ID="lblConnectError" runat="server" ForeColor="Red"></asp:Label></td>
                                                                                                                  </tr>
                                                       <tr>
                                                         <td class="Partext1" style="width: 83px" rowspan="9">
                                                         </td>
                                                         <td style="width: 502px" colspan="2">
                                                             </td>
                                                     </tr>
                                                     
                                                     <tr>
                                                         <td class="Partext1" style="width: 210px; height: 28px;">
                                                             Server</td>
                                                         <td style="width: 502px; height: 28px;">
                                                             <asp:TextBox ID="TB_DataSource" runat="server" Width="208px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_DataSource"
                                                                 ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                             <span class="smalltextred">(eg: Localhost,145.156.6.4) </span>
                                                         </td>
                                                     </tr>
                                                     <tr style="color: #000000">
                                                         <td class="Partext1" style="width: 210px">
                                                             Username</td>
                                                         <td style="width: 502px">
                                                             <asp:TextBox ID="TB_UserID" runat="server" Width="209px"></asp:TextBox><span style="color: #ff0033">
                                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TB_UserID"
                                                                     ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                             </span><span class="smalltextred" style="color: #000000"><span style="color: #ff0033">
                                                                 (eg : SA,Admin</span>) </span>
                                                         </td>
                                                     </tr>
                                                     <tr style="color: #000000">
                                                         <td class="Partext1" style="width: 210px">
                                                             Password </td>
                                                         <td style="width: 502px">
                                                             <span class="smalltextred" style="color: #000000"><span style="color: #ff0000">
                                                                 <asp:TextBox ID="TB_Password" runat="server" Width="208px" TextMode="Password"></asp:TextBox>
                                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TB_Password"
                                                                     ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>&nbsp;
                                                                 <span class="smalltextred">(eg: Asds@31) </span></span></span>
                                                         </td>
                                                     </tr>
                                                     <tr style="color: #000000">
                                                         <td class="Partext1" style="width: 210px">
                                                             Database Name</td>
                                                         <td style="width: 502px">
                                                             <span class="smalltextred" style="color: #000000">
                                                                 <asp:TextBox ID="TB_Database" runat="server" Width="208px"></asp:TextBox>
                                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TB_Database"
                                                                     ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>&nbsp; .mdf
                                                                 <span
                                                                     class="smalltextred">(Matrimonial) </span></span>
                                                         </td>
                                                     </tr>
                                                     
                                                       <tr style="color: #000000">
                                                         <td class="Partext1" style="width: 210px">
                                                             Connection Timeout</td>
                                                         <td style="width: 502px">
                                                             <span class="smalltextred" style="color: #000000">
                                                                 <asp:TextBox ID="TB_Timeout" runat="server" Width="208px"></asp:TextBox>
                                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TB_Timeout"
                                                                     ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>&nbsp; 
                                                                 <span
                                                                     class="smalltextred">(eg: 15 Sec) </span></span>
                                                         </td>
                                                     </tr>
                                                     
                                                     <tr>
                                                         <td style="width: 210px; height: 23px">
                                                             &nbsp;</td>
                                                         <td style="width: 502px; height: 23px; text-align: center">
                                                             <asp:Button ID="B_Submit" runat="server" CssClass="green-button"
                                                                 Text="Save" Width="61px" />
                                                             &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                                                             &nbsp; &nbsp;&nbsp;</td>
                                                     </tr>
                                                     
                                                     <tr>
                                                     <td style="height: 29px" colspan="2"></td>
                                                     </tr>
                                                     <tr>
                                                     <td style="height: 27px" colspan="2"></td>
                                                     </tr>
                                                 </tbody>
                                             </table>
                                        
                                     </td>
                                 </tr>
                             </tbody>
                         </table>
</asp:Content>

