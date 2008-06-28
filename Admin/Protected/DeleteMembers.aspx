<%@ Page Language="C#" MasterPageFile="~/Admin/Protected/Admin.master" AutoEventWireup="true" CodeFile="DeleteMembers.aspx.cs" Inherits="Admin_Protected_DeleteMembers" Title="Delete Members" %>

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
                                                         <asp:Image ID="Img_icon" runat="server" ImageUrl="~/Resources/DeleteUser-Active32.gif" /></td>
                                                     <td class="headertext" style="height: 51px" width="97%">
                                                         &nbsp; &nbsp; &nbsp; &nbsp;<strong><span style="color: gray">DELETE MEMBER</span></strong>&nbsp;</td>
                                                 </tr>
                                             </tbody>
                                         </table>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td style="height: 173px;" width="13%">
                                     </td>
                                     <td class="HeadText1" colspan="4" style="height: 173px" valign="top">
                                         <table align="left" border="0" cellpadding="2" cellspacing="1" style="height: 241px"
                                             width="100%">
                                             <tbody>
                                                 <tr>

                                                     <td style="width: 575px;height: 19px; text-align: justify" colspan="4">
                                                         <span style="color: #808080">Some Captions regarding the creation of a Delete accout</span>
                                                         <br />
                                                         <asp:Label ID="L_Error" runat="server" Font-Bold="False" ForeColor="Red" Text="User Profile Deleted"
                                                             Visible="False"></asp:Label></td>
                                                   
                                                 </tr>
                                                 <tr>
                                                     <td class="Partext1" width="10%">
                                                         &nbsp;</td>
                                                     <td class="Partext1" style="text-align: left;" colspan="2">
                                                        <div style="text-align: left">
                                                         <uc1:MemberPannel ID="MemberPannel1" runat="server" Visible="true" />
                                                            <br />
                                                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                            &nbsp; &nbsp;&nbsp;
                                                         <asp:CheckBox ID="CB_Delete" runat="server" Text="Yes Delete Member Profile" />&nbsp;
                                                         <asp:Button ID="B_Delete" runat="server" CssClass="green-button" Text="Delete" Width="101px" BackColor="Red" Font-Bold="True" ForeColor="White" />

                                                         </div>
                                                     </td>
                                                     <td width="6%">
                                                     </td>
                                                 </tr>
                                                 <tr>
                                                                                                         
                                                     <td style="width: 575px; text-align: center">
                                                         &nbsp;
                                                     </td>
                                                     <td colspan="2" width="500">
                                                     <div style="text-align: center">
                                                         &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                                         </div>
                                                         </td>
                                                         <td style="width: 1px"></td>
                                                         
                                                 </tr>
                                                 <tr>
                                                     <td colspan="4">
                                                     </td>
                                                 </tr>
                                             </tbody>
                                         </table>
                                        
                                     </td>
                                 </tr>
                                 <tr><td style="width: 26px; height: 21px">
                                 
                                 </td>
                                 <td style="height: 21px; text-align: right" colspan="5">
                                     &nbsp;</td>
                                 
                                 </tr>
                             </tbody>
                         </table>
</asp:Content>

