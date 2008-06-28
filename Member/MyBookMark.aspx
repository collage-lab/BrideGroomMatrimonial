<%@ Page Language="C#" MasterPageFile="~/Member/MemberMaster.master" AutoEventWireup="true" CodeFile="MyBookMark.aspx.cs" Inherits="Member_MyBookMark" Title="My Bookmarks" %>

<%@ Register Src="../WeBControls/SmallMember.ascx" TagName="SmallMember" TagPrefix="uc4" %>


<asp:Content ID="Content1" ContentPlaceHolderID="CPH_Member" Runat="Server">

  <table align="center" border="0" cellpadding="0" cellspacing="0" height="20" width="97%">
                                                    <tbody>
                                                        <tr>
                                                            <td background="../Resources/heading_bg.gif" width="37%" style="height: 20px">
                                                                <div align="left">
                                                                    &nbsp; <span class="bodysg">MY BookMarks&nbsp;</span></div>
                                                            </td>
                                                            <td width="63%" style="height: 20px">
                                                                &nbsp;</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                              
                                                <table align="center" border="0" cellpadding="0" cellspacing="0" class="submenubox"
                                                    width="97%">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                            <table width="100%">
                                                                <tr><td colspan ="5"> </td></tr>
                                                                <tr>
                                                                <td colspan ="5"> </td></tr>
                                                                  <tr>
                                                                    <td></td>
                                                                    <td align="center" width ="40%"> 
                                                                        
                                                                        </td>
                                                                        <td align="center" width ="3%"> </td>
                                                                     <td align="center" width ="40%">
                                                                        <table width="98%">
                                                                        <tr>
                                                                                <td style="text-align: right">
                                                                                <asp:LinkButton ID="LB_Previous_1" runat="server" Enabled="False" OnClick="LB_Previous_Click"><< Previous</asp:LinkButton></td>
                                                                            <td style="width: 40%; color: #000000; text-align: right">
                                                                                &nbsp;: &nbsp;&nbsp; &nbsp;
                                                                                <asp:LinkButton ID="LB_Next_1" runat="server" OnClick="LB_Next_Click">Next >></asp:LinkButton></td>
                                                                        </tr>
                                                                    </table>
                                                                    </td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr><td colspan ="5"> </td></tr>
                                                                <!-- Starts -->
                                                                <tr>
                                                                    <td></td>
                                                                    <td align="center" width ="40%" style="text-align: left"> 
                                                                        <uc4:SmallMember ID="MatMember_1" runat="server" Visible="false" />
                                                                        </td>
                                                                        <td align="center" width ="3%"> </td>
                                                                     <td align="center" width ="40%" style="text-align: left">
                                                                        <uc4:SmallMember ID="MatMember_2" runat="server" Visible="false" />
                                                                    </td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr><td colspan ="5"> </td></tr>
                                                                <!-- Ends -->
                                                                <!-- Starts -->
                                                                <tr>
                                                                    <td></td>
                                                                    <td align="center" width ="40%" style="text-align: left"> 
                                                                        <uc4:SmallMember ID="MatMember_3" runat="server" Visible="false" />
                                                                        </td>
                                                                        <td align="center" width ="3%"> </td>
                                                                     <td align="center" width ="40%" style="text-align: left">
                                                                        <uc4:SmallMember ID="MatMember_4" runat="server" Visible="false" />
                                                                    </td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr><td colspan ="5"> </td></tr>
                                                                <!-- Ends -->
                                                                <!-- Starts -->
                                                                <tr>
                                                                    <td></td>
                                                                    <td align="center" width ="40%" style="text-align: left"> 
                                                                        <uc4:SmallMember ID="MatMember_5" runat="server" Visible="false" />
                                                                        </td>
                                                                        <td align="center" width ="3%"> </td>
                                                                     <td align="center" width ="40%" style="text-align: left">
                                                                        <uc4:SmallMember ID="MatMember_6" runat="server" Visible="false" />
                                                                    </td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr><td colspan ="5"> </td></tr>
                                                                <!-- Ends -->
                                                                <!-- Starts -->
                                                                <tr>
                                                                    <td></td>
                                                                    <td align="center" width ="40%" style="text-align: left"> 
                                                                        <uc4:SmallMember ID="MatMember_7" runat="server" Visible="false" />
                                                                        </td>
                                                                        <td align="center" width ="3%"> </td>
                                                                     <td align="center" width ="40%" style="text-align: left">
                                                                        <uc4:SmallMember ID="MatMember_8" runat="server" Visible="false" />
                                                                    </td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr><td colspan ="5"> </td></tr>
                                                                <!-- Ends -->  
                                                                <!-- Starts -->
                                                                <tr>
                                                                    <td></td>
                                                                    <td align="center" width ="40%" style="text-align: left"> 
                                                                        <uc4:SmallMember ID="MatMember_9" runat="server" Visible="false" />
                                                                        </td>
                                                                        <td align="center" width ="3%"> </td>
                                                                     <td align="center" width ="40%" style="text-align: left">
                                                                        <uc4:SmallMember ID="MatMember_10" runat="server" Visible="false" />
                                                                    </td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr><td colspan ="5"> </td></tr>
                                                                <!-- Ends -->     
                                                                 <tr>
                                                                    <td></td>
                                                                    <td align="center" width ="40%"> 
                                                                        
                                                                        </td>
                                                                        <td align="center" width ="3%"> </td>
                                                                     <td align="center" width ="40%">
                                                                        <table width="98%">
                                                                        <tr>
                                                                                <td style="text-align: right">
                                                                                <asp:LinkButton ID="LB_Previous_2" runat="server" Enabled="False" OnClick="LB_Previous_Click"><< Previous</asp:LinkButton></td>
                                                                            <td style="width: 40%; color: #000000; text-align: right">
                                                                                &nbsp;: &nbsp;&nbsp; &nbsp;
                                                                                <asp:LinkButton ID="LB_Next_2" runat="server" OnClick="LB_Next_Click">Next >></asp:LinkButton></td>
                                                                        </tr>
                                                                    </table>
                                                                    </td>
                                                                    <td></td>
                                                                </tr>           
                                                                <tr><td colspan ="5"> </td></tr>                                  
                                                                </table>
                                                                <asp:HiddenField ID="HF_Start" runat="server" Value="0" />
                                                                <asp:HiddenField ID="HF_Count" runat="server" Value="0" />
                                                               
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>

</asp:Content>

