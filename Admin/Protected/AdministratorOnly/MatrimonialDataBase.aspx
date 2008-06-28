<%@ Page Language="C#" MasterPageFile="~/Admin/Protected/AdministratorOnly/Admin.master" AutoEventWireup="true" CodeFile="MatrimonialDataBase.aspx.cs" Inherits="Admin_Protected_MatrimonialDataBase" Title="DataBase State" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table id="content" border="0" cellpadding="1" cellspacing="1" height="0" width="100%">
        <tbody>
            <tr>
                <td colspan="4" style="height: 54px" valign="middle">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tbody>
                            <tr>
                                <td style="width: 8%; height: 51px">
                                    <img src="../../../Resources/xls.gif" /></td>
                                <td class="headertext" style="height: 51px" width="97%">
                                    &nbsp; &nbsp; &nbsp;DATABSE DETAILS&nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 116px">
                </td>
                <td class="HeadText1" colspan="4" style="width: 589px; height: 173px; text-align: left"
                    valign="top">
                    <table align="center" border="0" cellpadding="0" cellspacing="0" width="98%">
                        <tr>
                            <td style="width: 583px; height: 42px">
                                <div align="center" class="smalltextgrey">
                                    <div align="left" class="smalltextred">
                                        <span style="color: gray">It contains all the details of matrimonial database.</span><span class="verdana"><span style="color: gray">.<br />
                                        </span>
                                            <asp:Label ID="L_QueryError" runat="server" Font-Bold="True" Text="Error In Exexution Of  Query "
                                                Visible="False"></asp:Label></span></div>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:GridView ID="GV_Query" runat="server" BorderWidth="1px" CellPadding="4" CssClass="forminput"
                        ForeColor="#333333" GridLines="None" Width="569px" ShowFooter="True">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#EFF3FB" />
                        <EditRowStyle BackColor="#2461BF" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <br />
                </td>
            </tr>
            <tr>
                <td style="width: 116px">
                    &nbsp;</td>
                <td style="width: 409px; text-align: center">
                    &nbsp;&nbsp;
                    <asp:Button ID="B_SaveExcel" runat="server" CssClass="green-button" Text="Save As Excel"
                        Width="105px" />
                    <br />
                </td>
            </tr>
        </tbody>
    </table>
    <br />
</asp:Content>

