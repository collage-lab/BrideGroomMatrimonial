<%@ Page Language="C#" MasterPageFile="~/Admin/Protected/Admin.master" AutoEventWireup="true" CodeFile="SaleReport.aspx.cs" Inherits="Admin_Protected_SaleReport" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
<script language="JavaScript" type ="text/javascript">
    <!-- Begin
    var win = null;
    function newWindow(mypage,myname,w,h,features) {
    var winl = (screen.width-w)/2;
    var wint = (screen.height-h)/2;
    if (winl < 0) winl = 0;
    if (wint < 0) wint = 0;
    var settings = 'height=' + h + ',';
    settings += 'width=' + w + ',';
    settings += 'top=' + wint + ',';
    settings += 'left=' + winl + ',';
    settings += features;
    win = window.open(mypage,myname,settings);
    win.window.focus();
    }
    //  End -->
</script>
   
   
    <table id="content" border="0" cellpadding="1" cellspacing="1" height="0" width="100%">
        <tbody>
            <tr>
                <td colspan="4" style="height: 54px" valign="middle">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tbody>
                            <tr>
                                <td style="width: 8%; height: 51px">
                                    <img src="../../Resources/DatabaseSettings32.gif" /></td>
                                <td class="headertext" style="height: 51px" width="97%">
                                    &nbsp; &nbsp; &nbsp; &nbsp; <strong><span style="color: gray">
                                        <asp:Label ID="L_SiteStatus" runat="server" Font-Bold="True" ForeColor="Gray"></asp:Label></span></strong><span
                                            style="font-size: 8pt; color: #ff0000">&nbsp;</span></td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr style="font-size: 8pt; color: #ff0000">
                <td style="width: 15%; height: 181px">
                </td>
                <td class="HeadText1" colspan="4" style="width: 85%; height: 181px" valign="top">
                    <table align="left" border="0" cellpadding="2" cellspacing="1" style="width: 99%;
                        height: 241px">
                        <tbody>
                            <tr>
                                <td colspan="5" style="width: 80%; color: #000000; height: 42px; text-align: justify">
                                    
                                    Captions
                                    </td>
                            </tr>
                            <tr style="color: #000000">
                                <td class="Partext1" rowspan="3" style="width: 7%">
                                </td>
                                <td colspan="4" style="width: 576px">
                                </td>
                            </tr>
                            <tr style="color: #000000">
                                <td class="Partext1" colspan="4" style="width: 576px">
                                   
                                        <asp:Table ID="Table_View" runat="server" CaptionAlign="Top" CellPadding="1" CellSpacing="0"
                                            GridLines="Horizontal" Width="100%">
                                            <asp:TableRow ID="TableRow1" runat="server" BackColor="#8CD3EF">
                                                <asp:TableCell ID="TableCell5" runat="server" HorizontalAlign="Left" Text="Customer" VerticalAlign="Middle" Width="18%"></asp:TableCell>
                                                <asp:TableCell runat="server" Width="40%">Bill To</asp:TableCell>
                                                <asp:TableCell runat="server" Width="10%">Price</asp:TableCell>
                                                <asp:TableCell runat="server" Width="18%">Sale Date</asp:TableCell>
                                                <asp:TableCell runat="server" Width="12%">View </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
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
                                    
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="height: 29px; width: 576px;">
                                    &nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>

