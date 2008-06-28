<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SerchFor.ascx.cs" Inherits="clt_SerchFor" %>
<link href="../Resources/style.css" rel="stylesheet" type="text/css">
<table style="width: 582px" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan=3 style="height: 33px" background="../Resources/serarch-top.gif">
        </td>
    </tr>
    <tr>
        <td background="../Resources/search-mid.gif" colspan="3">
            <table height="100%" width="100%">
                <tr>
                    <td style="width: 37px"></td>
                    <td class="bodyg" style="width: 176px; text-align: left;">
                        <strong>Gender : 
                            <asp:Label ID="L_Gender" runat="server">Female</asp:Label></strong></td>
                    <td class="bodyg" style="width: 147px; text-align: left;">
                        <strong>Age : 
                            <asp:Label ID="L_Age_min" runat="server"></asp:Label></strong> - <strong>
                            <asp:Label ID="L_Age_Max" runat="server"></asp:Label></strong></td>
                    <td class="bodyg" style="text-align: left">
                        <strong>Photo : 
                            <asp:Label ID="L_Photo" runat="server">Show all</asp:Label></strong></td>
                </tr>
                <tr>
                    <td style="width: 37px"></td>
                    
                    <td class="bodyg" style="width: 176px; text-align: left;">
                        <strong>Religion&nbsp; : 
                            <asp:Label ID="L_Religion" runat="server">Any</asp:Label></strong></td>
                    <td class="bodyg" style="width: 153px; text-align: left;" colspan="2">
                        <strong>Caste : 
                            <asp:Label ID="L_Cst" runat="server">Any</asp:Label></strong></td>
                    
                </tr>
                <tr>
                    <td style="width: 37px"></td>
                    
                    <td class="bodyg" style="width: 176px">
                    </td>
                    <td class="bodyg" style="width: 147px">
                    </td>
                    <td class="bodyg">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr >
        <td background="../Resources/search-bot.gif" style="height: 27px">
            <table height="100%" width="100%">
                <tr>
                    <td style="width: 229px">
                    </td>
                    <td style="width: 112px; text-align: center;">
                        <span style="color: #0000ff; text-decoration: underline">
                            <asp:HyperLink ID="HL_Back" style="text-decoration:none;cursor:pointer" runat="server">Refine Your Search</asp:HyperLink></span></td>
                    <td style="width: 45px">
                    </td>
                    <td style="width: 116px; text-align: center">
                        <asp:HyperLink ID="HL_AdvSearch" runat="server" style="text-decoration:none" NavigateUrl="~/Member/adv_search.aspx">Advance Search</asp:HyperLink><a><span style="color: #000000">&nbsp;</span></a></td>
                    <td>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
