<%@ Page Language="C#" MasterPageFile="~/Admin/Protected/Admin.master" AutoEventWireup="true" CodeFile="ManageMemberHoroscope.aspx.cs" Inherits="Admin_Protected_UploadMemberInfo" Title="Manage Member Horoscope" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table id="content" border="0" cellpadding="1" cellspacing="1" height="0" width="100%">
                             <tbody>
                                 
                                 <tr>
                                     <td colspan="4" style="height: 54px" valign="middle">
                                         <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                             <tbody>
                                                 <tr>
                                                     <td style="width: 8%; height: 51px">
                                                         <asp:Image ID="Img_icon" runat="server" ImageUrl="~/Resources/horo-32.gif" /></td>
                                                     <td class="headertext" style="height: 51px" width="97%">
                                                         &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; MANAGE MEMBER&nbsp;HOROSCOPE
                                                         &nbsp;</td>
                                                 </tr>
                                             </tbody>
                                         </table>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td style="height: 173px; width: 15%;">
                                     </td>
                                     <td class="HeadText1" colspan="4" style="height: 173px" valign="top">
                                     
                                     
                                     
                                     
                                     
                                     
                                           
                                             <table style="width: 99%">
                                             <tr>
                                                 <td style="height: 22px; width: 85%;" colspan="3">
                                                     &nbsp; Some Captions<br />
                                                     <asp:Label ID="L_State" runat="server" ForeColor="Red"></asp:Label><br />
                                                     <span style="color: #ff0000">
                                                         <asp:HiddenField ID="HF_TYPE" runat="server" />
                                                     </span></td>
                                                 </tr>  
                                                 <tr><td style="width: 10%" rowspan="4">
                                                     </td>
                                                     
                                                     <td colspan="3"></td>
                                                     </tr>  
                                                 <tr>
                                                 <td style="width: 15%; height: 22px">
                                                     Member-ID :</td>
                                                 <td style="height: 22px; width: 85%;">
                                                     <asp:TextBox ID="TB_MatrimonialID" runat="server" Width="166px"></asp:TextBox>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_MatrimonialID"
                                                         ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                     <span style="color: #ff0000"></span></td>
                                                 </tr>                                             
                                                 <tr>
                                                 <td style="width: 15%; height: 22px">
                                                     <asp:Label ID="L_Password" runat="server" Text="Password :"></asp:Label></td>
                                                 <td style="height: 22px; width: 85%;">
                                                     <asp:TextBox ID="TB_Password" runat="server" Width="166px" TextMode="Password"></asp:TextBox>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TB_Password"
                                                         ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                 <asp:Button ID="B_Search" runat="server" CssClass="green-button" Text="Search" Width="61px" OnClick="B_Search_Click" />
                                                     <asp:Label ID="L_Wron_Pass" runat="server" ForeColor="Red"
                                                         Text="Password Entred Is Wrong" Visible="False"></asp:Label><span style="color: #ff0000"></span></td>
                                                 </tr>
                                                 
                                                 <tr>
                                                 <td style="width: 15%; height: 15px"></td>
                                                 <td style="height: 15px; width: 85%;">
                                                   <asp:Panel ID="PN_ID_Album" runat="server" Height="200px" Width="525px" Visible="False">
                                                     
                                                      <table align="center" border="0" cellpadding="0" cellspacing="0" height="20px" style="width: 100%">
                                                        <tbody>
                                                            <tr>
                                                                <td background="../../Resources/heading_bg.gif" style="width: 192px">
                                                                    <div align="left">
                                                                        &nbsp; <span class="bodysg"><span class="bodysg">Manage Horoscope</span></span></div>
                                                                </td>
                                                                <td style="width: 284px">
                                                                    &nbsp;</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                 
                                                <table align="center" cellpadding="0" cellspacing="0"width="100%" style="border-right: #ec5984 1px solid; border-top: #ec5984 1px solid; border-left: #ec5984 1px solid; border-bottom: #ec5984 1px solid">
                                                        <tbody>
                                                            <tr>
                                                                <td style="height: 128px">
                                                                    <table width ="99%">
                                                                        <tr>
                                                                            <td style="text-align: center; width: 232px;" rowspan="2">
                                                                                <asp:HyperLink ID="HL_Horo" runat="server" ImageUrl="~/Resources/horonotFound.gif"></asp:HyperLink></td>
                                                                            <td style="height: 39px" >
                                                                                &nbsp;<br />
                                                                                &nbsp;</td>
                                                                                                                                                       
                                                                        </tr>
                                                                        <tr><td>
                                                                                <asp:CheckBox ID="CB_DEL" runat="server" Text="Yes Delete Hiriscope" Visible="False" />
                                                                            <br />
                                                                            &nbsp;<asp:Button ID="D_Delete" runat="server" CssClass="green-button" Text="Delete" Width="61px" Height="19px" OnClick="B_Delete_Click" Visible="False" /><input id="File_Image" runat="server" style="border-right: skyblue 1px solid;
                                                                                border-top: skyblue 1px solid; border-left: skyblue 1px solid; width: 200px;
                                                                                border-bottom: skyblue 1px solid; height: 19px" type="file" visible="false" /><br />
                                                                            &nbsp;<asp:Button ID="B_Upload" runat="server" CssClass="green-button" Text="Update" Width="61px" Height="19px" OnClick="B_Upload_Click" Visible="False" /></td>
                                                                         </tr>
                                                                      

                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                     </asp:Panel>
                                                     <asp:Panel ID="PN_ID_NotFound" runat="server" Height="100px" Width="85%" Visible="False">
                                                     <TABLE cellSpacing=0 cellPadding=0  border=0 style="border-right: #ec5984 1px solid; border-top: #ec5984 1px solid; border-left: #ec5984 1px solid; border-bottom: #ec5984 1px solid; width: 522px;">
                                                        <TBODY>
                                                            <TR>
                                                                <TD class="Alert" align=center>
                                                                    <STRONG><IMG src="../../Resources/warning.png"align=absMiddle border=0 /> 
                                                                        <span style="color: #ff0066">No Such Records Found</span></STRONG><span style="color: #ff0066">
                                                                        </span>
                                                                </TD>
                                                            </TR>
                                                            <TR>
                                                                <TD style="height: 33px">
                                                                    <UL class="Alert"><BR/>
                                                                        <LI style="text-align: center"><span style="color: #ff0033">There are no records matching records specified by you</span></LI><LI style="text-align: center"><span style="color: #ff0033">This ID is not present ,Pls check ...</span></LI></UL>
                                                                </TD>
                                                            </TR>
                                                        </TBODY>
                                                        </TABLE>
                                                     </asp:Panel>
                                                 
                                                 </td>
                                                 </tr>
                                                 
                                             </table>
                                        
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                        
                                     </td>
                                 </tr>
                                 <tr>
                                 <td style="height: 21px; text-align: left" colspan="5">
                                     &nbsp;</td>
                                 
                                 </tr>
                             </tbody>
                         </table>
</asp:Content>

