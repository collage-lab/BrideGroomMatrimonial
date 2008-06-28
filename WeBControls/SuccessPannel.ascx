<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SuccessPannel.ascx.cs" Inherits="WeBControls_SuccessPannel" %>
<%--<link href="../Resources/adminstyle.css" rel="stylesheet" type="text/css">
--%>
<div style="background-color:#ffe8f2;width:576px;text-align:center; border-right: #cc0099 1px solid; border-top: #cc0099 1px solid; border-left: #cc0099 1px solid; border-bottom: #cc0099 1px solid;">

<table>
<tr>
<td style="width: 144px; text-align: center; height: 18px;">
    <strong>
    Matrimony ID</strong></td>
<td style="width: 144px; text-align: center; height: 18px;">
    <strong>
    Bride</strong></td>
<td style="width: 144px; text-align: center; height: 18px;">
    <strong>
    Groom</strong></td>
<td style="width: 144px; text-align: center; height: 18px;">
    <strong>
    Marriage Date</strong></td>
</tr>
</table>

<table>
<tr>
<td style="width: 144px; text-align: center; height: 19px;">
    <asp:Label ID="L_MID" runat="server"></asp:Label></td>
<td style="width: 144px; text-align: center; height: 19px;">
    <asp:Label ID="L_Bride" runat="server"></asp:Label></td>
<td style="width: 144px; text-align: center; height: 19px;">
    <asp:Label ID="L_Groom" runat="server"></asp:Label></td>
<td style="width: 144px; text-align: center; height: 19px;">
    <asp:Label ID="L_Mdate" runat="server"></asp:Label></td>
</tr>
</table>
</div>

<div style="width:576px; border-right: #ff0099 1px solid; border-top: #ff0099 1px solid; border-left: #ff0099 1px solid; border-bottom: #ff0099 1px solid;">

<table>
<tr><td style="width: 145px; height: 128px; text-align: center;">
    <asp:Image ID="IMG_BnG" runat="server" /></td>
<td style="width: 445px; height: 128px; text-align: justify;">
    <asp:Label ID="L_SStory" runat="server"></asp:Label>
    <asp:HiddenField ID="HF_StoryID" runat="server" />
</td>
</tr>
</table>
</div>