<%@ Page Language="C#" MasterPageFile="~/Admin/Protected/Admin.master" AutoEventWireup="true" CodeFile="ManageMemberPhoto.aspx.cs" Inherits="Admin_Protected_AddPhotoNHoroscope" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table id="content" border="0" cellpadding="1" cellspacing="1" height="0" width="100%">
                             <tbody>
                                 <tr>
                                     <td colspan="4" style="height: 54px" valign="middle">
                                         <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                             <tbody>
                                                 <tr>
                                                     <td style="width: 8%; height: 51px">
                                                          <asp:Image ID="Img_icon" runat="server" ImageUrl="~/Resources/UserPhoto32.gif" /></td>
                                                     <td class="headertext" style="height: 51px" width="97%">
                                                         &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<strong><span style="color: gray">MANAGE MEMBER
                                                             PHOTO</span></strong></td>
                                                 </tr>
                                             </tbody>
                                         </table>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td style="height: 173px;width: 15%">
                                     </td>
                                     <td class="HeadText1" colspan="4" style="height: 173px; width: 85%" valign="top">
                                        
                                        
                                            <%--    Table Starts --%>  
                                                                                  
                                             <table style="width: 650px">
                                             <tr>
              
                                                 <td style="height: 22px; width: 525px;" colspan="3">
                                                     Some Captions<br />
                                                     <span style="color: #ff0000">
                                                         <asp:Label ID="L_Alart" runat="server" ForeColor="Red" Text="Please Check the photo you need to delete"
                                                             Visible="False"></asp:Label></span></td>
                                                 </tr>    
                                                 <tr>
                                                 <td style="width: 128px; height: 22px">
                                                     Member-ID :</td>
                                                 <td style="height: 22px; width: 525px;">
                                                     <asp:TextBox ID="TB_MatrimonialID" runat="server" Width="166px"></asp:TextBox>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_MatrimonialID"
                                                         ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                     <asp:Label ID="L_MatID" runat="server"></asp:Label>
                                                     <asp:HiddenField ID="HF_Type" runat="server" />
                                                     <span style="color: #ff0000"></span></td>
                                                 </tr>                                             
                                                 <tr>
                                                 <td style="width: 128px; height: 22px">
                                                     <asp:Label ID="L_Password" runat="server" Text="Password :"></asp:Label></td>
                                                 <td style="height: 22px; width: 525px;">
                                                     <asp:TextBox ID="TB_Password" runat="server" Width="166px" TextMode="Password"></asp:TextBox>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TB_Password"
                                                         ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                 <asp:Button ID="B_Search" runat="server" CssClass="green-button" Text="Search" Width="61px" OnClick="B_Search_Click" />
                                                     <asp:Label ID="L_Wron_Pass" runat="server" ForeColor="Red"
                                                         Text="Password Entred Is Wrong" Visible="False"></asp:Label><span style="color: #ff0000"></span></td>
                                                 </tr>
                                                 
                                                 <tr>
                                                 <td style="width: 128px; height: 15px"></td>
                                                 <td style="height: 15px; width: 525px;">
                                                   <asp:Panel ID="PN_ID_Album" runat="server" Height="220px" Width="525px" Visible="False">
                                                     
                                                      <table align="center" border="0" cellpadding="0" cellspacing="0" height="20px" style="width: 100%">
                                                        <tbody>
                                                            <tr>
                                                                <td background="../../Resources/heading_bg.gif" style="width: 192px">
                                                                    <div align="left">
                                                                        &nbsp; <span class="bodysg"><span class="bodysg">Manage Photo</span></span></div>
                                                                </td>
                                                                <td style="width: 284px">
                                                                    &nbsp;</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                 
                                                <table align="center" cellpadding="0" cellspacing="0"width="100%" style="border-right: #ec5984 1px solid; border-top: #ec5984 1px solid; border-left: #ec5984 1px solid; border-bottom: #ec5984 1px solid">
                                                        <tbody>
                                                            <tr>
                                                                <td style="height: 191px">
                                                                    <table width ="99%">
                                                                        <tr>
                                                                            <td style="text-align: center">
                                                                                <asp:HyperLink ID="HL_Photo_1" runat="server" ImageUrl="~/Resources/nophoto.gif"></asp:HyperLink></td>
                                                                            <td style="text-align: center">
                                                                                <asp:HyperLink ID="HL_Album_1" runat="server" ImageUrl="~/Resources/paidphoto.gif">Album - 1</asp:HyperLink></td>
                                                                            <td style="text-align: center">
                                                                                <asp:HyperLink ID="HL_Album_2" runat="server" ImageUrl="~/Resources/paidphoto.gif">Album - 2</asp:HyperLink></td>
                                                                            <td style="text-align: center">
                                                                                <asp:HyperLink ID="HL_Album_3" runat="server" ImageUrl="~/Resources/paidphoto.gif">Album-3</asp:HyperLink></td>
                                                                            
                                                                        </tr>  
                                                                        <tr>
                                                                            <td style="text-align: center">
                                                                                &nbsp;<asp:HyperLink ID="HL_UP_1" runat="server" ImageUrl="~/Resources/UploadPhoto.gif"
                                                                                    NavigateUrl="#" ToolTip="Upload Image" Visible="False">Upload Image</asp:HyperLink>
                                                                                </td>
                                                                            <td style="text-align: center">
                                                                                <asp:HyperLink ID="HL_UP_2" runat="server" ImageUrl="~/Resources/UploadPhoto.gif"
                                                                                    NavigateUrl="#" ToolTip="Upload Image" Visible="False">Upload Image</asp:HyperLink>
                                                                                </td>
                                                                            <td style="text-align: center">
                                                                                <asp:HyperLink ID="HL_UP_3" runat="server" ImageUrl="~/Resources/UploadPhoto.gif"
                                                                                    NavigateUrl="#" ToolTip="Upload Image" Visible="False">Upload Image</asp:HyperLink>
                                                                                </td>
                                                                            <td style="text-align: center">
                                                                                &nbsp;<asp:HyperLink ID="HL_UP_4" runat="server" ImageUrl="~/Resources/UploadPhoto.gif"
                                                                                    NavigateUrl="#" ToolTip="Upload Image" Visible="False">Upload Image</asp:HyperLink>
                                                                                </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: center">
                                                                                &nbsp;
                                                                                <asp:CheckBox ID="CB_P" runat="server" Visible="False" /></td>
                                                                            <td style="text-align: center">
                                                                                &nbsp;&nbsp;<asp:CheckBox ID="CB_ALB_1" runat="server" Visible="False" /></td>
                                                                            <td style="text-align: center">
                                                                                &nbsp; &nbsp;<asp:CheckBox ID="CB_ALB_2" runat="server" Visible="False" /></td>
                                                                            <td style="text-align: center">
                                                                                &nbsp;<asp:CheckBox ID="CB_ALB_3" runat="server" Visible="False" />
                                                                                &nbsp;&nbsp;</td>
                                                                       <tr><td style="text-align: right" colspan="4"><asp:Button ID="B_delete" runat="server" CssClass="green-button" Text="Delete Selected Image" Width="130px" OnClick="B_delete_Click" BackColor="#FF8080" /></td>
                                                                        </tr>

                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                     </asp:Panel>
                                                     &nbsp;
                                                     <asp:Panel ID="PN_ID_NotFound" runat="server" Height="100px" Width="525px" Visible="False">
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
                                        
                                             <%--TableEnds--%>
                                             
                                         <br />
                                     </td>
                                 </tr>
                             </tbody>
                         </table>
</asp:Content>

