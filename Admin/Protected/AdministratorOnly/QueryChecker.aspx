<%@ Page Language="C#" MasterPageFile="~/Admin/Protected/AdministratorOnly/Admin.master" AutoEventWireup="true" CodeFile="QueryChecker.aspx.cs" Inherits="Admin_Protected_MQueryChecker" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table id="content" border="0" cellpadding="1" cellspacing="1" height="0" width="100%">
                             <tbody>
                                 <tr>
                                     <td colspan="4" style="height: 54px" valign="middle">
                                         <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                             <tbody>
                                                 <tr>
                                                     <td style="width: 8%; height: 51px">
                                                         <img src="../../../Resources/Database-Sql32.gif" /></td>
                                                     <td class="headertext" style="height: 51px" width="97%">
                                                         &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<strong><span style="color: gray">QUERY EXAMINER&nbsp;</span></strong></td>
                                                 </tr>
                                             </tbody>
                                         </table>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td style="width: 116px" rowspan="2">
                                     </td>
                                     <td  class="smalltextred" colspan="4" style="height: 64px; text-align: left; width: 589px;" valign="top">
                                     
                                         <span style="color: gray">
                                                             Below is the option for the Database Checkup by entering the Microsoft SqlServer
                                                                 query in the text box you can get the reports directly from database.<br />
                                                            
                                                                 <asp:Label ID="L_QueryError" runat="server" Font-Bold="False" Text="Error In Exexution Of Your Query Plase Check your Query"
                                                                     Visible="False" ForeColor="Red"></asp:Label>
                                                                 <asp:Label ID="L_noSelectError" runat="server" Font-Bold="False" Text="It Is Only Posible To Execute SELECT Query"
                                                                     Visible="False" ForeColor="Red"></asp:Label>
                                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_SQL_Query"
                                                                     ErrorMessage="Plase Enter your Query" Font-Bold="False" SetFocusOnError="True"></asp:RequiredFieldValidator></span></td></tr>
                                         <tr>
                                         
                                         <td rowspan = "2" style="width: 15px"></td>
                                         <td>
                                         
                                         
                                         
                                         
                                         <asp:TextBox ID="TB_SQL_Query" runat="server" Height="168px" TextMode="MultiLine"
                                             Width="564px" Font-Bold="True" Font-Names="Arial Narrow" Font-Size="Smaller">SELECT * FROM </asp:TextBox><br />
                                         <asp:GridView ID="GV_Query" runat="server" BorderWidth="1px" CellPadding="4" CssClass="forminput"
                                             ForeColor="#333333" GridLines="None" Visible="False" Width="569px">
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
                                 <tr><td style="width: 116px">
                                     <asp:HiddenField ID="HF_Query" runat="server" />
                                 </td>
                                     <td style="width: 409px; text-align: center" colspan="2"> &nbsp;<asp:Button ID="B_Submit" runat="server" CssClass="green-button" OnClick="B_Submit_Click" Text="Execute Query" Width="105px" /><br />
                                         <asp:Button ID="B_NewQuery" runat="server" CssClass="green-button" OnClick="B_NewQuery_Click" Text="Execute New  Query" Width="105px" Visible="False" />
                                         <asp:Button ID="B_SaveExcel" runat="server" CssClass="green-button" OnClick="B_SaveExcel_Click"  Text="Save As Excel" Width="105px" Visible="False" />&nbsp;<br />
                                         <br />
                                     </td>
                                </tr>
                             </tbody>
                         </table>
</asp:Content>

