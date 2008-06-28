<%@ Page Language="C#" MasterPageFile="~/Admin/Protected/Admin.master" AutoEventWireup="true" CodeFile="AdminIndex.aspx.cs" Inherits="Admin_Protected_AdminIndex" Title="Administrator Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table id="content" border="0" cellpadding="2" cellspacing="1" height="400" width="100%">
                      <tbody>
                        
                              <tr>
                                    <td colspan="7" valign="top">&nbsp;</td>
                              </tr>
                              <tr>
                                <td colspan="7" class="HeadText1" valign="top"><div class="headertext" align="center">
                                  <div align="left"><strong><span style="color: gray">&nbsp; &nbsp; ADMIN CONTROL PANEL</span>&nbsp;</strong></div>
                                </div></td>
                                </tr>
                              <tr>
                                <td colspan="7"  valign="top"></td>
                              </tr>
                              <tr>
                                    <td rowspan="31" valign="top" width="10%">&nbsp;</td>
                              </tr>
                              <!-- Site Configuration -->
                              <tr>
                                <td colspan="2" class="HeadText1" height="15" valign="top">
                                <strong>Site Configuration </strong></td>
                                <td colspan="2" valign="top">
                                <span class="HeadText1"><strong>Manage User Accounts</strong></span></td>
                                <td colspan="2" valign="top">
                                <span class="HeadText1"><strong>Database&nbsp;</strong></span></td>
                               </tr>
                               
                              
                              <tr>
                                <td class="HeadText1" height="15" valign="top" style="text-align: right"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td class="HeadText1" height="15" valign="top" style="width: 30%">
                                <asp:HyperLink ID="HL_WebSettings"  Enabled="false" class="Lightblue" runat="server" NavigateUrl="AdministratorOnly/WebSettings.aspx">Web Settings </asp:HyperLink></td>
                                <td valign="top" style="text-align: center; width: 20px;"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td valign="top" style="width: 30%"> <asp:HyperLink ID="HL_CreateUser"  Enabled="false" class="Lightblue" runat="server" NavigateUrl="AdministratorOnly/CreatNewUser.aspx">Create New User</asp:HyperLink> </td>
                                <td valign="top" style="text-align: center"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td valign="top" style="width: 30%"> <asp:HyperLink ID="HL_QueryChecker"  Enabled="false" class="Lightblue" runat="server" NavigateUrl="AdministratorOnly/QueryChecker.aspx">Database Checkup</asp:HyperLink>&nbsp;</td>
                              </tr>

                              <tr>
                                <td class="HeadText1" height="15" valign="top" style="text-align: right"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td class="HeadText1" height="15" valign="top" style="width: 30%">
                                <asp:HyperLink ID="HL_MemberShipSettings"  Enabled="false" class="Lightblue" runat="server" NavigateUrl="AdministratorOnly/MembershipPlan.aspx"> Edit Member Plans </asp:HyperLink></td>
                                <td valign="top" style="text-align: center; width: 20px;"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td valign="top" style="width: 30%"><a href="PasswordSettings.aspx" class="Lightblue">Change Password</a>
                                </td>
                                <td valign="top" style="text-align: center"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td valign="top" style="width: 30%"> <asp:HyperLink ID="HL_DBStatus"  Enabled="false" class="Lightblue" runat="server" NavigateUrl="AdministratorOnly/MatrimonialDataBase.aspx">Database Status</asp:HyperLink>&nbsp;</td>
                              </tr>
                              
                              <tr>
                                <td class="HeadText1" height="15" valign="top" style="text-align: right"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td class="HeadText1" height="15" valign="top" style="width: 30%">
                                <asp:HyperLink ID="HL_DBSettings" Enabled="false" class="Lightblue" runat="server" NavigateUrl="AdministratorOnly/DatabaseSettings.aspx">Database
                                    &nbsp;Settings </asp:HyperLink></td>
                                <td valign="top" style="text-align: center; width: 20px;"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td valign="top" style="width: 30%"> <asp:HyperLink ID="HL_AccountsSettings"  Enabled="false" class="Lightblue" runat="server" NavigateUrl="AdministratorOnly/ManageAdminAccounts.aspx" >Manage User Account</asp:HyperLink>&nbsp;</td>
                                <td colspan="2" ></td>
                              </tr>
                              
                                                            <tr>
                                <td class="HeadText1" height="15" valign="top" style="text-align: right"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td class="HeadText1" height="15" valign="top" style="width: 30%">
                                <asp:HyperLink ID="HL_ContactsSettings" class="Lightblue" Enabled="false" runat="server" NavigateUrl="AdministratorOnly/ContactSettings.aspx">ContactsSettings</asp:HyperLink> 
                                </td>
                                <td valign="top" style="text-align: right" colspan="2"></td>
                                <td colspan="2" valign="top"><span class="HeadText1"><strong>Web Site State</strong></span></td>

                              </tr>
                              <!--       -->
                              <tr>
                                <td colspan="2" class="HeadText1" height="15" valign="top">&nbsp;</td>
                                <td valign="top" colspan="2">
                                    <strong><span style="font-family: Trebuchet MS">News Letters</span></strong></td>
                                                                    <td valign="top" style="text-align: center"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td valign="top" style="width: 30%"> <asp:HyperLink ID="HL_WebState"  Enabled="false" class="Lightblue" runat="server" NavigateUrl="AdministratorOnly/Lightblue">Change Wesite State</asp:HyperLink></td>

                                
                              </tr>
                              <tr>
                                <td colspan="2" class="HeadText1" height="15" valign="top"><strong>Membership Approval / 
								Renewal</strong></td>
                                <td  valign="top" style="text-align: center; width: 20px;"><IMG height=16 src="../../Resources/adminicon.gif" width=16 /></td>
                                <td style="width: 30%"><a href="NewsLetters.aspx?id=0" class="Lightblue">Group Emails</a></td>
                                </tr>
                              <tr>
                                <td height="18" valign="top" width="3%" style="text-align: right"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td valign="top" style="width: 30%"><a href ="ApproveMembers.aspx?id=1"class="Lightblue">Approve Paid Members</a></td>
                                <td valign="top" style="text-align: center; width: 20px;"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td valign="top" style="width: 30%"><a href="NewsLetters.aspx?id=1" class="Lightblue">
                                    Send Emails to Paid Members </a></td>
                              </tr>
                              <tr>
                                <td valign="top" style="text-align: right"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td valign="top" style="width: 30%"><a href="ApproveMembers.aspx?id=2" class="Lightblue">Activate Inactive Member</a></td>
                                <td valign="top" style="text-align: center; width: 20px;"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td valign="top" style="width: 30%"><a href="NewsLetters.aspx?id=2" class="Lightblue">
                                        Send Emails to Active Members </a></td>
                              </tr>
                              <tr>
                                <td valign="top" style="text-align: right"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td valign="top" style="width: 30%"><a href="ApproveMembers.aspx?id=3" class="Lightblue">Renew Paid Membership </a></td>
                                <td valign="top" style="text-align: center; width: 20px;"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td valign="top" style="width: 30%"><a href ="NewsLetters.aspx?id=3" class="Lightblue">Send Emails to Inactive Members</a></td>
                              </tr>
                              
                              <tr>
                                <td colspan="2" valign="top"></td>
                                <td valign="top" style="text-align: center; width: 20px;"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td valign="top" style="width: 30%"><a href ="NewsLetters.aspx?id=4" class="Lightblue">Send Emails to Members by ID</a>&nbsp;</td>
                              </tr>
                              
                              <tr>
                                <td colspan="2" valign="top"><span class="HeadText1"><strong>Edit Member Profile&nbsp;</strong></span></td><td valign="top" style="text-align: center; width: 20px;">
                                    <img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                  <td valign="top" style="width: 30%">
                                      <a href ="NewsLetters.aspx?id=6" class="Lightblue">Send NewsLetters</a>&nbsp;</td>
                              </tr>
                              
                               
                               
                              <tr>
                                <td valign="top" style="text-align: right"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td valign="top" style="width: 30%"><a href="EditUserProfile.aspx" class="Lightblue">Edit Member Profile&nbsp;</a>
                                </td><td valign="top" style="text-align: center; width: 20px;">
                                    <img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                  <td valign="top" style="width: 30%">
                                      <a href ="NewsLetters.aspx?id=7" class="Lightblue">Send New Featrures</a>&nbsp;</td>
                                <td colspan="2" valign="top"></td>
                              </tr>
                               <tr>
                                <td colspan="2" valign="top"></td><td valign="top" style="text-align: right" colspan="2">
                                </td>
                              </tr>
                              <tr>
                                <td colspan="2" valign="top"><span class="HeadText1"><strong>Manage Photo &amp; Horoscope </strong></span></td>
                                <td valign="top" style="text-align: left" colspan="2"><strong><span style="font-family: Trebuchet MS">Members Report &nbsp;</span></strong>
                                </td>
                                  
                              </tr>
                              <tr>
                                <td valign="top" style="text-align: center; width: 20px;"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td valign="top" style="width: 30%"><a href="ManageMemberPhoto.aspx?id=1" class="Lightblue">
                                    Upload Member's Photos </a></td><td valign="top" style="text-align: right"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td valign="top" style="width: 30%"><a href="MemberReport.aspx?id=1" class="Lightblue">Wesite Statitics&nbsp;</a></td>

                              </tr>
                              <tr>
                                <td valign="top" style="text-align: center; width: 20px;"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td valign="top" style="width: 30%"><a href="ManageMemberPhoto.aspx?id=2" class="Lightblue">
                                    Delete Member's Photos </a></td><td valign="top" style="text-align: right"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td valign="top" style="width: 30%"><a href="MemberReport.aspx?id=2" class="Lightblue">New Paid Members </a></td>
                              </tr>
                              <tr>
                                <td valign="top" style="text-align: center; width: 20px;"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td valign="top" style="width: 30%"><a href="ManageMemberHoroscope.aspx" class="Lightblue">Upload Member's Horoscope</a></td>
                                <td valign="top" style="text-align: right"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td valign="top" style="width: 30%"><a href="MemberReport.aspx?id=3" class="Lightblue">New Members </a></td>
                              </tr>
                              <tr>
                                <td valign="top" style="text-align: center; width: 20px;"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td valign="top" style="width: 30%">
                                <a class="Lightblue" href="ManageMemberHoroscope.aspx">Delete Member's Horoscope</a></td><td valign="top" style="text-align: right">
                                    <img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                  <td valign="top" style="width: 30%">
                                      <a href="MemberReport.aspx?id=4" class="Lightblue">Salse in this year&nbsp;</a></td>
                              </tr>

                              <tr>
                                <td valign="top" colspan="2">&nbsp;</td>
                                <td></td><td></td>
                              </tr>
                              <tr>
                                <td colspan="2" valign="top"><span class="HeadText1"><strong>Delete Members </strong></span></td>
                                <td colspan="2" valign="top"><span class="HeadText1"><strong>Reports</strong></span></td>
                                </tr>
                              <tr>
                                <td valign="top" style="text-align: right"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td valign="top" style="width: 30%"><a href="CheckMembers.aspx?id=1" class="Lightblue">Check Anonymous Members</a></td>
                                <td valign="top" style="text-align: center; width: 20px;"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td valign="top" style="width: 30%"><a href="SaleReport.aspx" class="Lightblue">
                                    Salse Report</a></td>
                              </tr>
                              <tr>
                                <td valign="top" style="text-align: right"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td valign="top" style="width: 30%"><a href ="CheckMembers.aspx?id=2" class="Lightblue">Remove Member With ID</a></td>
                                <td valign="top" style="text-align: center; width: 20px;"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td valign="top" style="width: 30%"><a href="SaveReport.aspx" class="Lightblue">
                                    Save Report in Excel File </a></td>
                              </tr>
                              <tr>
                                <td valign="top" style="text-align: center" colspan="4"></td>
                              </tr>
                              <tr>
                                <td colspan="2" valign="top"><span class="HeadText1"><strong>Success 
								Story Approval </strong></span></td>                               
								 <td colspan="2" valign="top"><span class="HeadText1"><strong>Feed Backs </strong></span></td>
                                </tr>
                              <tr>
                                <td valign="top" style="width: 20px; text-align: center"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td valign="top" style="width: 30%"><a class="Lightblue" href="CheckSuccessStory.aspx?id=1">Check anonymous Success story</a></td>
                                <td valign="top" style="width: 20px; text-align: center"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td valign="top" style="width: 30%"><a class="Lightblue" href="FeedBack.aspx">Read FeedBack</a> &nbsp; &nbsp;
                                </td>
                              </tr>
                              
                              <tr>
                                <td valign="top" style="width: 20px; text-align: center"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td style="width: 30%"><a href="CheckSuccessStory.aspx?id=2" class="Lightblue">Delete Success story </a></td>
                                <td valign="top" style="width: 20px; text-align: center"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td style="width: 30%"><a href="FeedBack.aspx?id=1" class="Lightblue">Feed Back Settings</a></td>
                                
                                </tr>
                              
                              <tr>
                                <td valign="top" style="width: 20px; text-align: center"><img src="../../Resources/adminicon.gif" height="16" width="16"></td>
                                <td style="width: 30%"><a href="AddSuccessStory.aspx" class="Lightblue">Add Success story </a></td>
                                <td valign="top" style="width: 20px; text-align: center" colspan="2"></td>
                                
                                </tr>
                              <tr>
                              </tr>
                              

                            
            </tbody>
                     </table>
</asp:Content>

