<%@ Page Language="C#" MasterPageFile="~/Admin/Protected/AdministratorOnly/Admin.master" AutoEventWireup="true" CodeFile="ChangeState.aspx.cs" Inherits="Admin_Protected_ChangeState" Title="Untitled Page" %>
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
                                                         &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<strong><span style="color: gray"><asp:Label ID="L_SiteStatus"
                                                             runat="server" Font-Bold="True" ForeColor="Gray"></asp:Label></span></strong>&nbsp;</td>
                                                 </tr>
                                             </tbody>
                                         </table>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td style="height: 181px; width:15%">
                                     </td>
                                     <td class="HeadText1" style="height: 181px; width:85%" colspan="4"  valign="top">
                                         
                                             <table align="left" border="0" cellpadding="2" cellspacing="1" style="width: 98%; height: 241px;">
                                                 <tbody>
                                                     <tr>
                                                         
                                                         <td style="width: 80%; color: #000000; height: 81px; text-align: justify;" colspan="4">
                                                             <strong>
                                                             <%--and SMTP Connection--%>
                                                             </strong> <span style="color: gray">Captions</span><br />
                                                             <asp:Label ID="L_Alurt" runat="server" ForeColor="Red"></asp:Label></td>
                                                     </tr>
                                                       <tr>
                                                         <td class="Partext1" style="width: 13%" rowspan="5">
                                                         </td>
                                                         <td style="width: 80%" colspan="2">
                                                             </td>
                                                     </tr>
                                                     
                                                     <tr>
                                                         <td class="Partext1" style="width: 25%; height: 17px;">
                                                             Administator Password <span class="smalltextred">*</span><span style="color: #ff0000">
                                                             </span>
                                                         </td>
                                                         <td style="width: 80%; height: 17px;">
                                                             <asp:TextBox ID="TB_PAssword" runat="server" TextMode="Password" Width="211px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TB_PAssword"
                                                                 ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
                                                     </tr>
                                                     <tr style="color: #000000">
                                                         <td class="Partext1" style="width: 25%">
                                                             <span class="smalltextred">
                                                                 <asp:Label ID="L_Message" runat="server" Text="Message to Display  *"></asp:Label></span></td>
                                                         <td style="width: 80%">
                                                             <span style="color: #ff0033">
                                                                 <asp:TextBox ID="TB_Message" runat="server" TextMode="MultiLine" Width="441px" Height="145px"></asp:TextBox>
                                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_Message"
                                                                     ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator></span></td>
                                                     </tr>
                                                     <tr style="color: #000000">
                                                         <td class="Partext1" style="width: 25%">
                                                             </td>
                                                         <td style="width: 80%">
                                                             <span class="smalltextred" style="color: #000000"><span style="color: #ff0000">
                                                                 <span class="smalltextred"> 
                                                                     <asp:CheckBox ID="CB_Conform" runat="server" ForeColor="#404040" Text="Check The Box" />&nbsp;
                                                             <asp:Button ID="B_Submit" runat="server" CssClass="green-button"
                                                                 Text="Change to Running" Width="126px" /></span></span></span></td>
                                                     </tr>
                                                  
                                                     <tr>
                                                     <td style="height: 29px" colspan="2">
                                                         <asp:HiddenField ID="HF_State" runat="server" />
                                                     </td>
                                                     </tr>

                                                 </tbody>
                                             </table>
                                        
                                     </td>
                                 </tr>
                             </tbody>
                         </table>
</asp:Content>

