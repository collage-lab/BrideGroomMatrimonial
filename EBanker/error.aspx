<%@ Page Language="C#" MasterPageFile="~/ebanker/MasterPage.master" AutoEventWireup="true" CodeFile="error.aspx.cs" Inherits="_Default" Title="Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="0" cellpadding="3" cellspacing="1" class="bgcol" width="97%">
        <tbody>
            <tr>
                <td align="left" colspan="3">
                    <p>
                        <br />
                        <b>
                            <!--Personal Information-->
                        </b>
                    </p>
                </td>
            </tr>
            <tr>
                <td align="right" class="text" style="width: 156px; height: 35px">
                </td>
                <td align="left" class="text" style="height: 35px">
                    <asp:Label ID="l_Error" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td align="left" class="text" style="width: 156px">
                </td>
                <td align="left" class="text">
                </td>
            </tr>
            <tr height="35">
                <td colspan="2">
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>

