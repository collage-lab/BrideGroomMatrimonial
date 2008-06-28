<%@ Page Language="C#"  MasterPageFile="~/Admin/Protected/AdministratorOnly/Admin.master" AutoEventWireup="true" CodeFile="ContactSettings.aspx.cs" Inherits="Admin_Protected_ContactSettings" Title="Contact Settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table id="content" border="0" cellpadding="1" cellspacing="1" height="0" width="100%">
                             <tbody>
                                 <tr>
                                     <td colspan="4" height="54" valign="middle">
                                         <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                             <tbody>
                                                 <tr>
                                                     <td style="width: 8%; height: 51px">
                                                         <img src="../../../Resources/ContactSettings32.gif" /></td>
                                                     <td class="headertext" width="97%" style="height: 51px">
                                                         &nbsp; &nbsp;&nbsp; <strong><span style="color: gray">CONTACT SETTINGS </span></strong>
                                                     </td>
                                                 </tr>
                                             </tbody>
                                         </table>
                                     </td>
                                 </tr>
                                 <tr>
                                 <td width="13%"></td>
                                     <td class="HeadText1" colspan="4" valign="top">
                                             
                                             <table align="left" border="0" cellpadding="2" cellspacing="1" style="width: 100%">
                                                 <tbody>
                                                     <tr>
                                                         <td style="width: 468px;" colspan="3" rowspan="">
                                                             &nbsp;<br />
                                                             <br />
                                                             <span style="color: gray">
                                                             add discription<br />
                                                             </span>
                                                             <asp:Label ID="L_Report" runat="server" ForeColor="Red"></asp:Label><br />
                                                         </td>
                                                     </tr>
                                                              
                                                                                                                   <tr>
                                                         <td class="Partext1" style="width: 73px" rowspan="12">
                                                             
                                                             </td>
                                                         <td style="width: 468px;" colspan="2">
                                                             <br />
                                                         </td>
                                                     </tr>  
                                                         
                                                         <tr>
                                                         <td class="Partext1" style="width: 229px">
                                                             SMTP Server <span class="smalltextred">*</span><span style="color: #ff0000">
                                                             </span>
                                                         </td>
                                                         <td style="width: 468px">
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TB_SMTP"
                                                                 ErrorMessage="*"></asp:RequiredFieldValidator>
                                                             <asp:TextBox ID="TB_SMTP" runat="server" Width="208px"></asp:TextBox>&nbsp; <span class="smalltextred">
                                                                 (Maiserver.com) </span>
                                                         </td>
                                                     </tr>
                                                         <tr>
                                                         <td colspan="2" >
                                                             
                                                         </td>
                                                       
                                                     </tr>
                                                     <tr>
                                                         <td class="Partext1" style="width: 229px">
                                                             From Email Address <span class="smalltextred">*</span><span style="color: #ff0000">
                                                             </span>
                                                         </td>
                                                         <td style="width: 468px">
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_From"
                                                                 ErrorMessage="*"></asp:RequiredFieldValidator>
                                                             <asp:TextBox ID="TB_From" runat="server" Width="208px"></asp:TextBox>&nbsp; <span class="smalltextred">
                                                                 (admini@matrimony.com) </span>
                                                         </td>
                                                     </tr>
                                                     <tr style="color: #000000">
                                                         <td class="Partext1" style="width: 229px">
                                                             To Email Address&nbsp; <span class="smalltextred">*</span></td>
                                                         <td style="width: 468px">
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TB_To"
                                                                 ErrorMessage="*"></asp:RequiredFieldValidator>
                                                             <asp:TextBox ID="TB_To" runat="server" Width="208px"></asp:TextBox>&nbsp; <span class="smalltextred" style="color: #000000"><span style="color: #ff0033">(support@matrimony.com</span>) </span>
                                                         </td>
                                                     </tr>
                                                     <tr style="color: #000000">
                                                         <td class="Partext1" style="width: 229px">
                                                             Feedback Email</td>
                                                         <td style="width: 468px">
                                                             <span class="smalltextred" style="color: #000000"><span style="color: #ff0000">
                                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TB_FeedBack"
                                                                     ErrorMessage="*"></asp:RequiredFieldValidator>
                                                                 <asp:TextBox ID="TB_FeedBack" runat="server" Width="208px"></asp:TextBox>&nbsp;
                                                                 <span
                                                                     class="smalltextred">(Feedback@matrimony.com) </span></span>
                                                             </span>
                                                         </td>
                                                     </tr>
                                                     <tr style="color: #000000">
                                                         <td class="Partext1" style="width: 229px">
                                                             Contact Us Email
                                                         </td>
                                                         <td style="width: 468px">
                                                             <span class="smalltextred" style="color: #000000">
                                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TB_Contact"
                                                                     ErrorMessage="*"></asp:RequiredFieldValidator>
                                                                 <asp:TextBox ID="TB_Contact" runat="server" Width="208px"></asp:TextBox>&nbsp; <span
                                                                     class="smalltextred">(enquiry@matrimony.com) </span></span></td>
                                                     </tr>
                                                     <tr style="color: #000000">
                                                         <td class="Partext1" style="width: 229px;">
                                                             Sales Email <span class="smalltextred">*</span></td>
                                                         <td style="width: 468px;">
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TB_Sales"
                                                                 ErrorMessage="*"></asp:RequiredFieldValidator>
                                                             <asp:TextBox ID="TB_Sales" runat="server" Width="208px"></asp:TextBox>&nbsp; <span
                                                                 style="color: #ff0000">(sales@example.com)</span></td>
                                                     </tr>
                                                     <tr>
                                                         <td class="Partext1" style="width: 229px">
                                                             Photo assistance Email <span style="color: #ff0000">*</span></td>
                                                         <td style="width: 468px">
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TB_Photo"
                                                                 ErrorMessage="*"></asp:RequiredFieldValidator>
                                                             <asp:TextBox ID="TB_Photo" runat="server" Width="208px"></asp:TextBox>&nbsp; <span
                                                                 style="color: #ff0000">(photos@example.com)</span></td>
                                                     </tr>
                                                     <tr>
                                                         <td class="Partext1" style="width: 229px; height: 12px;">
                                                             Horoscope assistance Email <span style="color: #ff0000">*</span></td>
                                                         <td style="width: 468px; height: 12px;">
                                                             <span class="smalltextgrey">
                                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TB_Horoscop"
                                                                     ErrorMessage="*"></asp:RequiredFieldValidator>
                                                                 <asp:TextBox ID="TB_Horoscop" runat="server" Width="208px"></asp:TextBox>&nbsp;
                                                                 <span
                                                                     style="color: #ff0000">(Horoscop@example.com)</span></span></td>
                                                     </tr>
                                                     <tr>
                                                         <td class="Partext1" style="width: 229px; height: 12px;">
                                                             Success Story assistance Email <span style="color: #ff0000">*</span></td>
                                                         <td style="width: 468px; height: 12px;">
                                                             <span class="smalltextgrey">
                                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TB_SStory"
                                                                     ErrorMessage="*"></asp:RequiredFieldValidator>
                                                                 <asp:TextBox ID="TB_SStory" runat="server" Width="208px"></asp:TextBox>&nbsp; <span
                                                                     style="color: #ff0000">(SuccessStory@example.com)</span></span></td>
                                                     </tr>
                                    <tr>
                                                         <td style="width: 229px; height: 23px">
                                                             &nbsp;</td>
                                                         <td style="text-align: center; width: 468px; height: 23px;">
                                                             <asp:Button ID="B_Submit" runat="server" CssClass="green-button" Text="Save" Width="61px" />
                                                             &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                         </td>
                                                     </tr>
                                                 </tbody>
                                             </table>
                                             
                                        
                                     </td>
                                 </tr>
                                 <tr><td colspan="5">
                                     <br />
                                 </td></tr>
                             </tbody>
                         </table>
</asp:Content>

