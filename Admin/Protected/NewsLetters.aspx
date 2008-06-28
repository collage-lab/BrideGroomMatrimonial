<%@ Page Language="VB" MasterPageFile="~/Admin/Protected/Admin.master" AutoEventWireup="false" CodeFile="NewsLetters.aspx.vb" Inherits="Admin_Protected_NewsLetters" title="News Lettres" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="JavaScript" type="text/javascript" src="../../Resources/html2xhtml.js"></script>
<script language="JavaScript" type="text/javascript" src="../../Resources/richtext_compressed.js"></script>
 
                             <table id="content" border="0" cellpadding="1" cellspacing="1" height="0" width="100%">
                             <tbody>
                                 
                                 <tr>
                                     <td colspan="4" style="height: 54px" valign="middle">
                                         <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                             <tbody>
                                                 <tr>
                                                     <td style="width: 8%; height: 51px">
                                                         <asp:Image ID="Img_icon" runat="server" ImageUrl="~/Resources/mail-Group32.gif" /></td>
                                                     <td class="headertext" style="height: 51px" width="97%">
                                                         &nbsp; &nbsp; &nbsp; &nbsp;SEND EMAILS TO MEMBERS&nbsp;</td>
                                                 </tr>
                                             </tbody>
                                         </table>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td style="height: 173px; width: 15%;">
                                     </td>
                                     <td class="HeadText1" colspan="4" style="height: 173px; text-align: left; width: 85%;" valign="top">
                                         <br />
                                         <br />
                                         <table border="0" cellpadding="5" cellspacing="0" width="95%" style="text-align: left">
                                             <tbody>
                                                 <tr>
                                                     <td width="14%">
                                                         To</td>
                                                     <td width="86%">
                                                         <asp:DropDownList ID="DDL_Member" runat="server" Width="93px" Enabled="False">
                                                            <asp:ListItem Value="0">All</asp:ListItem>
                                                             <asp:ListItem Value="1">Active</asp:ListItem>
                                                             <asp:ListItem Value="2">Inactive</asp:ListItem>
                                                             <asp:ListItem Value="3">Paid</asp:ListItem>
                                                         </asp:DropDownList>
                                                         <asp:TextBox ID="TB_ID" runat="server" Visible="False" Width="191px"></asp:TextBox>
                                                         <asp:RequiredFieldValidator ID="RFV_MemID" runat="server" ControlToValidate="TB_ID"
                                                             Enabled="False" ErrorMessage="*"></asp:RequiredFieldValidator><span class="formselect">Members<asp:Label ID="L_ID" runat="server" Text="By ID" Visible="False"></asp:Label></span></td>
                                                 </tr>
                                                 <tr>
                                                     <td>
                                                         Subject</td>
                                                     <td>
                                                         <asp:TextBox ID="TB_Subject" runat="server" CssClass="formselect" MaxLength="100"
                                                             Width="445px"></asp:TextBox>
                                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TB_Subject"
                                                             ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                                 </tr>
                                                 <tr>
                                                     <td>Body</td>
                                                     <td>
                                                     <script language="JavaScript" type="text/javascript">
                                                        <!--
                                                        function submitForm() {
	                                                        //make sure hidden and iframe values are in sync for all rtes before submitting form
	                                                        updateRTEs();
                                                        	
	                                                        return true;
                                                        }

                                                        //Usage: initRTE(imagesPath, includesPath, cssFile, genXHTML, encHTML)
                                                        initRTE("./images/", "./", "", true, true);
                                                        //-->
                                                        </script>
                                                        <noscript>
                                                        <p>
                                                        <b><span style="color: #ff0000">Javascript must be enabled to use this form</span>.</b></p>
                                                        </noscript>

                                                        <script language="JavaScript" type="text/javascript">
                                                            <!--
                                                            //build new richTextEditor
                                                            var rte1 = new richTextEditor('rte1');
                                                            rte1.html = '<%=sContent%>';
                                                            //rte1.toggleSrc = false;
                                                            rte1.build();
                                                            function Submit1_onclick() {

                                                            }

                                                            //-->
                                                        </script>
                                                          
                                                     </td>
                                                 </tr>
                                                 <tr>
                                                     <td>&nbsp;</td>
                                                     <td>&nbsp;<asp:Button ID="B_Send" runat="server" CssClass="green-button"   Text="Send" Width="61px" /></td>
                                                 </tr>
                                             </tbody>
                                         </table>
                                         &nbsp;</td>
                                 </tr>
                                 <tr><td style="height: 21px">
                                 
                                 </td>
                                 <td style="height: 21px; text-align: left;" colspan="4">
                                     &nbsp;<asp:HiddenField ID="HF_MailType" runat="server" Value="0" />
                                 </td>
                                 
                                 </tr>
                             </tbody>
                         </table>
</asp:Content>

