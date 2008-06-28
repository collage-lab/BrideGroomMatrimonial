<%@ Page Language="C#" MasterPageFile="~/Admin/Protected/Admin.master" AutoEventWireup="true" CodeFile="ApproveMembers.aspx.cs" Inherits="Admin_ApproveMembers" Title="Approve Members" %>

<%@ Register Src="../../WeBControls/MemberPannel.ascx" TagName="MemberPannel" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table id="content" border="0" cellpadding="1" cellspacing="1" height="0" width="100%">
                             <tbody>
                                 
                                 <tr>
                                     <td colspan="4" style="height: 54px" valign="middle">
                                         <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                             <tbody>
                                                 <tr>
                                                     <td style="width: 8%; height: 51px">
                                                         <asp:Image ID="Img_icon" runat="server" ImageUrl="~/Resources/User-active32.gif" /></td>
                                                     <td class="headertext" style="height: 51px" width="97%">
                                                         &nbsp; &nbsp; &nbsp; <strong><span style="color: gray">&nbsp;
                                                             <asp:Label ID="L_LAbel" runat="server" Text="APPROVE"></asp:Label>
                                                             MEMBERS&nbsp;</span></strong></td>
                                                 </tr>
                                             </tbody>
                                         </table>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td style="height: 178px; width: 16%;">
                                     </td>
                                     <td class="HeadText1" colspan="4" style="height: 178px" valign="top">
                       <!-- Pannel Search -->
                      <asp:Panel ID="PN_Search" runat="server" Height="100%" Width="100%">
                                             <table align="left" border="0" cellpadding="2" cellspacing="1" width="100%">
                                                 <tbody>
                                                     <tr>
                                                         <td colspan="4" style="color: #000000; height: 19px; text-align: justify">
                                                             <span>
                                                             </span><span style="color: #808080">Please enter the user-id or matrimonial id and go
                                                                 for search options!!!</span><asp:Label ID="L_Error_2" runat="server" Font-Bold="False" ForeColor="Red" Text="Server Not Responding"
                                                                 Visible="False"></asp:Label></td>
                                                     </tr>
                                                     <tr>
                                                         <td colspan="4">
                                                         </td>
                                                     </tr>
                                                     <tr>
                                                         <td colspan="2" style="width: 10%">
                                                         </td>
                                                         <td width="20%" style="text-align: left">
                                                             <asp:RadioButton ID="RB_MatID" runat="server" GroupName="Search" Text="Matrimonial ID" Checked="True" /></td>
                                                         <td width="50%">
                                                             <asp:RadioButton ID="RB_UserID" runat="server" GroupName="Search" Text="User ID" /></td>
                                                     </tr>
                                                     <tr>
                                                         <td colspan="2" style="width: 82px">
                                                         </td>
                                                         <td style="width: 116px; text-align: left;">
                                                             &nbsp;
                                                             <asp:Label ID="L_ID" runat="server" Text="ID"></asp:Label></td>
                                                         <td style="width: 452px">
                                                             &nbsp;<asp:TextBox ID="TB_ID" runat="server" Width="212px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_ID"
                                                                 ErrorMessage=" * "></asp:RequiredFieldValidator></td>
                                                     </tr>
                                                     <tr>
                                                         <td colspan="3" style="width: 86px">
                                                         </td>
                                                         <td style="width: 452px">
                                                             &nbsp;<asp:Button ID="B_Search" runat="server" CssClass="green-button" Text="Search" Width="97px" OnClick="B_Search_Click" /></td>
                                                     </tr>
                                                     <tr>
                                                         <td colspan="4" style="width: 82px">
                                                         </td>
                                                     </tr>
                                                 </tbody>
                                             </table>
                                         </asp:Panel>
                    <!-- Pannel Check Annon-->
                    <asp:Panel ID="PN_RenewPaid" runat="server" Height="350px" Visible="False" Width="100%">
                        <table align="left" border="0" cellpadding="2" cellspacing="1" width="100%">
                            <tbody>
                                <tr>

                                    <td style="width: 502px; color: #000000; height: 19px; text-align: justify" colspan="3">
                                        <span style="color: #808080">
                                        </span>
                                        <asp:Label ID="L_Report_1" runat="server" Font-Bold="False" ForeColor="Red" Text="Server Not Responding"
                                            Visible="False"></asp:Label></td>
                                </tr>
                                <tr style="color: #000000">
                                <td style="width: 10%; height: 193px;"></td>
                                <td style="width: 48%; height: 193px; text-align: left;">
                                    <uc1:MemberPannel ID="MemberPannel_Renew" runat="server" />
                                </td>
                                    <td class="Partext1" width="25%" style="height: 193px">
                                        &nbsp; &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                <td></td>
                                <td colspan="2">
                                    &nbsp;<asp:RadioButton ID="RB_MemberFree" runat="server" GroupName="Member" Checked="True" Font-Bold="True" Text="Remove membership" />
                                    <asp:RadioButton ID="RB_MemberPlan1" runat="server" GroupName="Member" Font-Bold="True" Text="Plan 1" />
                                    <asp:RadioButton ID="RB_MemberPlan2" runat="server" GroupName="Member" Font-Bold="True" Text="Plan 2" />
                                    <asp:RadioButton ID="RB_MemberPlan3" runat="server" GroupName="Member" Font-Bold="True" Text="Plan 3" /></td>
                              </tr>
                              <tr><td></td><td style="text-align: right"><asp:Button ID="B_Renew" runat="server" CssClass="green-button" OnClick="B_Renew_Click"
                             Text="Renew" Width="99px" Visible="False" />
                                  <asp:Button ID="B_App" runat="server" CssClass="green-button" OnClick="B_App_Click"
                             Text="Approve" Width="99px" /></td><td></td></tr>
                                
                            </tbody>
                        </table>
                    </asp:Panel>
                    <!-- -->
                     <asp:Panel ID="PN_Activate" runat="server" Height="350px" Visible="False" Width="100%">
                        <table align="left" border="0" cellpadding="2" cellspacing="1" width="100%">
                            <tbody>
                                <tr>

                                    <td style="width: 502px; color: #000000; height: 19px; text-align: justify" colspan="3">
                                        <span style="color: #808080">
                                        </span>
                                        <asp:Label ID="L_Report_2" runat="server" Font-Bold="False" ForeColor="Red" Text="Server Not Responding"
                                            Visible="False"></asp:Label></td>
                                </tr>
                                <tr style="color: #000000">
                                <td style="width: 10%; height: 193px;"></td>
                                <td style="width: 48%; height: 193px; text-align: left;">
                                    <uc1:MemberPannel ID="MemberPannel_Activate" runat="server" />
                                </td>
                                    <td class="Partext1" width="25%" style="height: 193px">
                                        &nbsp; &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                <td></td>
                                <td colspan="2">
                                    &nbsp; &nbsp;
                                </td>
                              </tr>
                              <tr><td></td><td style="text-align: right"><asp:Button ID="B_Active" runat="server" CssClass="green-button" OnClick="B_Active_Click"
                             Text="Change to Active  member" Width="142px" /></td><td></td></tr>
                                
                            </tbody>
                        </table>
                    </asp:Panel>
                    <!-- Pannel No record-->
                    <asp:Panel ID="PN_NoRecords" runat="server" Height="100%" Visible="False" Width="100%">
                        <br />
                        <br />
                        <table border="0" cellpadding="0" cellspacing="0" style="border-right: #ec5984 1px solid;
                            border-top: #ec5984 1px solid; border-left: #ec5984 1px solid; width: 522px;
                            border-bottom: #ec5984 1px solid">
                            <tbody>
                                <tr>
                                    <td align="center" class="Alert">
                                        <strong>
                                            <img align="absMiddle" border="0" src="../../Resources/warning.png" />
                                            <span style="color: #ff0066">No Such Records Found</span></strong><span style="color: #ff0066">
                                            </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 33px">
                                        <ul class="Alert">
                                            <br />
                                            <li style="text-align: center"><span style="color: #ff0033">There are no records matching
                                                records specified by you</span></li><li style="text-align: center"><span style="color: #ff0033">This ID is not present ,Pls
                                                check ...</span></li></ul>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </asp:Panel>
                                     </td>
                                 </tr>
                                 <tr>
                                 <td style="height: 21px; text-align: center" colspan="5">
                                     <asp:HiddenField ID="HF_Type" runat="server" /><asp:HiddenField ID="HF_ID" runat="server" />
                                     &nbsp;&nbsp;</td>
                                 
                                 </tr>
                             </tbody>
                         </table>
</asp:Content>

