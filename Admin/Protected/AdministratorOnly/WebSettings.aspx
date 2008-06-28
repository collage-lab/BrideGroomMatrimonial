<%@ Page Language="C#" MasterPageFile="~/Admin/Protected/AdministratorOnly/Admin.master" AutoEventWireup="true" CodeFile="WebSettings.aspx.cs" Inherits="Admin_Protected_WebSettings" Title="Web Settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table id="content" border="0" cellpadding="1" cellspacing="1" height="0" width="100%">
                             <tbody>
                                 <tr>
                                     <td colspan="4" height="54" valign="middle">
                                         <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                             <tbody>
                                                 <tr>
                                                     <td style="width: 8%; height: 51px">
                                                         <img src="../../../Resources/SiteSettings32.gif" /></td>
                                                     <td class="headertext" width="97%" style="height: 51px">
                                                         &nbsp; &nbsp; <strong><span style="color: gray">
                                                         SITE CONFGURATION SETTINGS</span></strong>
                                                     </td>
                                                 </tr>
                                             </tbody>
                                         </table>
                                     </td>
                                 </tr>
                                 <tr>
                                 <td width="13%"></td>
                                     <td class="HeadText1" colspan="4" valign="top">
                                             <table align="left" border="0" cellpadding="2" cellspacing="1" style="width: 617px">
                                                 <tbody>
                                                     <tr>
                                                         <td class="Partext1" style="width: 210px" colspan="3">
                                                             <strong class="paratext"><span style="color: #000000" class="paratext">
                                                                 <asp:Label ID="L_Report" runat="server" ForeColor="Red"></asp:Label><br />
                                                             </span></strong></td>
                                                                                                              </tr>
                                                                                                              <tr><td style="width: 46px" rowspan="9"></td></tr>
                                                     <tr>
                                                         <td class="Partext1" style="width: 210px">
                                                             Website Name <span class="smalltextred" style="color: #000000">*</span>
                                                         </td>
                                                         <td style="width: 441px">
                                                             <asp:TextBox ID="TB_SiteName" runat="server" Width="355px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_SiteName"
                                                                 ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                                             <span class="smalltextred" style="color: #000000"><span style="font-size: 7pt"><span
                                                                 style="color: #ff0033">(http://www.example.com)</span> </span></span>
                                                         </td>
                                                     </tr>
                                                     <tr style="color: #000000">
                                                         <td class="Partext1" style="width: 210px">
                                                             Website Friendly Name <span class="smalltextred">*</span></td>
                                                         <td style="width: 441px">
                                                             <asp:TextBox ID="TB_FName" runat="server" Width="355px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TB_FName"
                                                                 ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                                             <span class="smalltextred" style="color: #ff0033">(<span style="font-size: 7pt">Example.Com)</span>
                                                             </span>
                                                         </td>
                                                     </tr>
                                                     <tr style="color: #000000">
                                                         <td class="Partext1" style="width: 210px">
                                                             Website Logo Path <span class="smalltextred">*</span></td>
                                                         <td style="width: 441px">
                                                             <span class="smalltextred" style="color: #000000">
                                                                 <asp:TextBox ID="TB_LPath" runat="server" Width="355px"></asp:TextBox>
                                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TB_LPath"
                                                                     ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                                                 <span style="color: #ff0033"><span style="font-size: 7pt">(images/logo.gif)</span> </span>
                                                             </span>
                                                         </td>
                                                     </tr>
                                                     <tr style="color: #000000">
                                                         <td class="Partext1" style="width: 210px">
                                                             Website title <span class="smalltextred">*</span></td>
                                                         <td style="width: 441px">
                                                             <asp:TextBox ID="TB_Title" runat="server" Width="355px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TB_Title"
                                                                 ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                                             <span class="smalltextred" style="font-size: 7pt;">(BnG Matrimonials)</span></td>
                                                     </tr>
                                                     <tr style="color: #000000">
                                                         <td class="Partext1" style="width: 210px; height: 77px">
                                                             Meta Description
                                                         </td>
                                                         <td style="width: 441px; height: 77px">
                                                             <asp:TextBox ID="TB_MetaDiscription" runat="server" TextMode="MultiLine" Width="354px" Height="75px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TB_MetaDiscription"
                                                                 ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
                                                     </tr>
                                                     <tr>
                                                         <td class="Partext1" style="width: 210px">
                                                             Meta Keywords
                                                         </td>
                                                         <td style="width: 441px">
                                                             <asp:TextBox ID="TB_MetaKeword" runat="server" TextMode="MultiLine" Width="354px" Height="72px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TB_MetaKeword"
                                                                 ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
                                                     </tr>
                                                     <tr>
                                                         <td class="Partext1" style="width: 210px">
                                                             Website Footer <span class="smalltextred">*</span></td>
                                                         <td style="width: 441px">
                                                             <span class="smalltextgrey">
                                                                 <asp:TextBox ID="TB_WebFooter" runat="server" Width="355px"></asp:TextBox>
                                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TB_WebFooter"
                                                                     ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                                                 <span style="font-size: 7pt; color: #ff0000">(Copyright © 2007-2008 Example.com Matrimonials - All Rights
                                                                 Reserved</span></span><span style="font-size: 7pt; color: #ff0000">.)</span></td>
                                                     </tr>
                                                      <tr>
                                                         <td style="width: 210px; height: 23px">
                                                             &nbsp;</td>
                                                         <td style="text-align: center; width: 441px; height: 23px;">
                                                             <asp:Button ID="B_Submit" runat="server" CssClass="green-button" Text="Save" Width="61px" />
                                                         </td>
                                                     </tr>
                                                 </tbody>
                                             </table>

                                        
                                     </td>
                                 </tr>
                             </tbody>
                         </table>
</asp:Content>

