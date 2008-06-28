<%@ Page Language="C#" MasterPageFile="~/Guest/Guest.master" AutoEventWireup="true" CodeFile="SuccessStory.aspx.cs" Inherits="Guest_SuccessStory" Title="Success Story" %>

<%@ Register Src="../WeBControls/SuccessPannel.ascx" TagName="SuccessPannel" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="GuestContent" Runat="Server">
    <table align="center" border="0" cellpadding="0" cellspacing="0" height="20" width="97%">
        <tbody>
            <tr>
                <!-- MEMBER LOG IN ...-->
                <td background="../Resources/heading_bg.gif" style="height: 20px; width: 37%;">
                    <div align="left">
                        &nbsp; <span class="viewtextsmall"><strong>Success Story ...</strong></span></div>
                </td>
                <td style="height: 20px" width="63%">
                    &nbsp;</td>
            </tr>
        </tbody>
    </table>
    <table align="center" border="0" cellpadding="0" cellspacing="0" class="submenubox"
        width="97%">
        <tbody>
            <tr>
                <td style="text-align: justify">
                    <table>
                        <tr>
                            <td style="width: 32px">
                            </td>
                            <td style="text-align: justify">
                                We value the lakhs of members who have successfully found their life partners on
                                <% Response.Write(WebConfig.GetValues("FName")); %>
                                Read about their experiences in this exclusive section dedicated to them. Here's
                                wishing them the very best for a happily married life together.<br />
                                <br />
                                Found your life partner on
                                <% Response.Write(WebConfig.GetValues("FName")); %>
                                ? Share your success story and win fabulous gifts. You could also mail your success
                                story along with a photo of you and your partner to
                                <% Response.Write(WebConfig.GetValues("emailSStory")); %>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    <table width="98%">
        <tr>
            <td colspan="3">
                <br />
                <asp:HiddenField ID="HF_Start" runat="server" Value="0" />
                <asp:HiddenField ID="HF_Count" runat="server" Value="0" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <table width="98%">
                    <tr>
                        <td style="width: 48%; text-align: right">
                        </td>
                        <td style="width: 39%; text-align: right">
                            <asp:LinkButton ID="LB_Previous_1" runat="server" Enabled="False" OnClick="LB_Previous_Click"><< Previous</asp:LinkButton></td>
                        <td style="width: 24%; color: #000000; text-align: right">
                            &nbsp;: &nbsp;
                            <asp:LinkButton ID="LB_Next_1" runat="server" OnClick="LB_Next_Click">Next >></asp:LinkButton></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="3">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                &nbsp;<uc1:SuccessPannel ID="SuccessPannel1" runat="server" />
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td colspan="3">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <uc1:SuccessPannel ID="SuccessPannel2" runat="server" />
                &nbsp;</td>
            <td>
            </td>
        </tr>
        <tr>
            <td colspan="3">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <uc1:SuccessPannel ID="SuccessPannel3" runat="server" />
                &nbsp;</td>
            <td>
            </td>
        </tr>
        <tr>
            <td colspan="3">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <uc1:SuccessPannel ID="SuccessPannel4" runat="server" />
                &nbsp;</td>
            <td>
            </td>
        </tr>
        <tr>
            <td colspan="3">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <uc1:SuccessPannel ID="SuccessPannel5" runat="server" />
                &nbsp;</td>
            <td>
            </td>
        </tr>
        <tr>
            <td colspan="3">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <uc1:SuccessPannel ID="SuccessPannel6" runat="server" />
                &nbsp;</td>
            <td>
            </td>
        </tr>
        <tr>
            <td colspan="3">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <uc1:SuccessPannel ID="SuccessPannel7" runat="server" />
                &nbsp;</td>
            <td>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">
                <table width="98%">
                    <tr>
                        <td style="width: 48%; text-align: right">
                        </td>
                        <td style="width: 39%; text-align: right">
                            <asp:LinkButton ID="LB_Previous_2" runat="server" Enabled="False" OnClick="LB_Previous_Click"><< Previous</asp:LinkButton></td>
                        <td style="width: 24%; text-align: right">
                            &nbsp;: &nbsp;
                            <asp:LinkButton ID="LB_Next_2" runat="server" OnClick="LB_Next_Click">Next >></asp:LinkButton></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

