<%@ Page Language="C#" MasterPageFile="~/Member/MemberMaster.master" AutoEventWireup="true" CodeFile="SearchResult.aspx.cs" Inherits="Member_SearchResult" %>
<%@ Register Src="../WeBControls/MemberDisplay.ascx" TagName="MemberDisplay" TagPrefix="uc2" %>

<%@ Register Src="../WeBControls/SerchFor.ascx" TagName="SerchFor" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPH_Member" Runat="Server">
    <uc1:SerchFor id="SerchFor1" runat="server">
    </uc1:SerchFor>
    <br />
    <br />
    <table id="content" align="center" border="0" cellpadding="1" cellspacing="1" width="97%">
        <tbody>
            <tr>
                <td colspan="2" class="forminput">
                    <span style="color: #707171"><span style="font-size: 10px">
                    Our various search tools will make your partner search much faster and easier.<br />
                        Go
                    ahead and enjoy your search</span>. </span>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div align="center">
                        <table border="0" cellpadding="3" cellspacing="3" style="width: 100%; text-align: left">
                            <tr>
                                <td style="width: 15%; text-align: right">
                                    &nbsp;</td>
                                <td style="width: 15%; text-align: left">
                                    &nbsp;</td>
                                <td style="width: 57%; text-align: right">
                                    <asp:LinkButton ID="LB_Previous_1" runat="server" Enabled="False" OnClick="LB_Previous_Click"><< Previous</asp:LinkButton>&nbsp;
                                    <asp:Label ID="L_Current_1" runat="server" Font-Bold="True"></asp:Label>
                                    of&nbsp;
                                    <asp:Label ID="L_Last_1" runat="server" Font-Bold="True"></asp:Label>
                                </td>
                                <td style="width: 13%; text-align: left">
                                    &nbsp;<asp:LinkButton ID="LB_Next_1" runat="server" Enabled="False" OnClick="LB_Next_Click">Next >></asp:LinkButton></td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="text-align: left">
                    <uc2:MemberDisplay ID="MemberDisplay1" runat="server" Visible="false" />
                </td>
                <td style="text-align: left">
                    <uc2:MemberDisplay ID="MemberDisplay2" runat="server" Visible="false" />
                </td>
            </tr>
            <tr>
                <td style="text-align: left">
                    <uc2:MemberDisplay ID="MemberDisplay3" runat="server" Visible="false" />
                </td>
                <td style="text-align: left">
                    <uc2:MemberDisplay ID="MemberDisplay4" runat="server" Visible="false" />
                </td>
            </tr>
            <tr>
                <td style="text-align: left">
                    <uc2:MemberDisplay ID="MemberDisplay5" runat="server" Visible="false" />
                </td>
                <td style="text-align: left">
                    <uc2:MemberDisplay ID="MemberDisplay6" runat="server" Visible="false" />
                </td>
            </tr>
            <tr>
                <td style="text-align: left">
                    <uc2:MemberDisplay ID="MemberDisplay7" runat="server" Visible="false" />
                </td>
                <td style="text-align: left">
                    <uc2:MemberDisplay ID="MemberDisplay8" runat="server" Visible="false" />
                </td>
            </tr>
            <tr>
                <td style="text-align: left">
                   <uc2:MemberDisplay ID="MemberDisplay9" runat="server" Visible="false" />
                </td>
                <td style="text-align: left">
                    <uc2:MemberDisplay ID="MemberDisplay10" runat="server" Visible="false" />
                </td>
            </tr>
            <tr>
                <td style="text-align: left">
                    <uc2:MemberDisplay ID="MemberDisplay11" runat="server" Visible="false" />
                </td>
                <td style="text-align: left">
                    <uc2:MemberDisplay ID="MemberDisplay12" runat="server"  Visible="false" />
                </td>
            </tr>
            <tr>
                <td style="text-align: left">
                    <uc2:MemberDisplay ID="MemberDisplay13" runat="server" Visible="false" />
                </td>
                <td style="text-align: left">
                    <uc2:MemberDisplay ID="MemberDisplay14" runat="server" Visible="false" />
                 </td>
            </tr>
            <tr><td colspan="2">
                <asp:HiddenField ID="HF_Rel" runat="server" Value="0" />
                <asp:HiddenField ID="HF_Cst" runat="server" Value="0" />
                <asp:HiddenField ID="HF_AMin" runat="server" Value="21" />
                <asp:HiddenField ID="HF_AMax" runat="server" Value="35" />
                <asp:HiddenField ID="HF_Gen" runat="server" Value="0" />
                <asp:HiddenField ID="HF_ISPhoto" runat="server" Value="0" />
                <asp:HiddenField ID="HF_Start" runat="server" Value="0" />
                <asp:HiddenField ID="HF_Depth" runat="server" Value="1" />
                <asp:HiddenField ID="HF_Type" runat="server" />
                <asp:HiddenField ID="HF_Criteria" runat="server" Value="0" />
                <asp:HiddenField ID="HF_String" runat="server" />
            </td></tr>

            <tr>
                <td colspan="2">
                    <table border="0" cellpadding="3" cellspacing="3" style="width: 100%; text-align: left">
                        <tr>
                            <td style="width: 15%; text-align: right">
                                &nbsp;</td>
                            <td style="width: 15%; text-align: left">
                                &nbsp;</td>
                            <td style="width: 57%; text-align: right">
                                <asp:LinkButton ID="LB_Previous_2" runat="server" Enabled="False" OnClick="LB_Previous_Click"><< Previous</asp:LinkButton>&nbsp;
                                <asp:Label ID="L_Current_2" runat="server" Font-Bold="True"></asp:Label>
                                of&nbsp;
                                <asp:Label ID="L_Last_2" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td style="width: 13%; text-align: left">
                                &nbsp;<asp:LinkButton ID="LB_Next_2" runat="server" Enabled="False" OnClick="LB_Next_Click">Next >></asp:LinkButton></td>
                        </tr>
                    </table>
                    &nbsp;</td>
            </tr>
        </tbody>
    </table>
</asp:Content>



