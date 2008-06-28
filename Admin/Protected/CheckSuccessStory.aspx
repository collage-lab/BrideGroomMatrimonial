<%@ Page Language="C#" MasterPageFile="~/Admin/Protected/Admin.master" AutoEventWireup="true" CodeFile="CheckSuccessStory.aspx.cs" Inherits="Admin_Protected_CheckSuccessStory" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <table id="contentx" border="0" cellpadding="1" cellspacing="1" height="0" width="100%">
        <tbody>
            <tr>
                <td colspan="4" style="height: 54px" valign="middle">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tbody>
                            <tr>
                                <td style="width: 8%; height: 51px">
                                    <img src="../../Resources/Del-user.gif" /></td>
                                <td class="headertext" style="height: 51px" width="97%">
                                    &nbsp; &nbsp; &nbsp; <strong>
                                        <asp:Label ID="L_Label" runat="server"></asp:Label>
                                        SUCESS STORY</strong>&nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 12%">
                </td>
                <td class="HeadText1" colspan="4" style="width: 90%px; text-align: left"
                    valign="top">
                    
                    
                    
           <asp:Panel ID="PN_Delete" runat="server" Height="100%" Width="100%" Visible="False">
                            <table align="left" border="0" cellpadding="2" cellspacing="1"width="100%">
                                <tbody>
                                    <tr>
                                        <td style=" color: #000000; height: 19px; text-align: justify" colspan="4">
                                            <span style="color: #808080"></span>
                                            <asp:Label ID="L_Error_2" runat="server" Font-Bold="False" ForeColor="Red" Text="Server Not Responding"
                                                Visible="False"></asp:Label></td>
                                    </tr>
                                    <tr >
                                         <td colspan="4" ></td>
                                    </tr>                                   
                                    <tr >
                                         <td style="width: 10%" colspan="2"></td>
                                         <td width="18%" >
                                             <asp:RadioButton ID="RB_SSID" runat="server" Checked="True" GroupName="Search"
                                                 Text="Sucess Story ID" /></td> 
                                         <td style="width: 72%" >
                                             <asp:RadioButton ID="RB_MatID" runat="server" GroupName="Search" Text="Matrimonial ID" /></td> 
                                    </tr>                                   
                                     <tr >
                                         <td style="width: 82px" colspan="2"></td>
                                         <td style="width: 116px" >
                                             &nbsp;
                                             <asp:Label ID="L_ID" runat="server" Text="SucessStory"></asp:Label></td> 
                                         <td style="width: 452px" >
                                             <asp:TextBox ID="TB_ID" runat="server" Width="212px"></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_ID"
                                                 ErrorMessage=" * "></asp:RequiredFieldValidator></td> 
                                    </tr>                                   
                                     <tr >
                                         <td style="width: 86px" colspan="3"></td>
                                         <td style="width: 452px" >
                                             <asp:Button ID="B_Search" runat="server" CssClass="green-button" Text="Search" Width="97px" /></td> 
                                    </tr>                                   
                                     <tr >
                                         <td style="width: 82px" colspan="4"></td>

                                    </tr>                                   
 
                                </tbody>
                            </table>
              </asp:Panel>
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                   <asp:Panel ID="PN_CheckAnon" runat="server" Height="100%" Width="100%" Visible="False">
                        <table align="left" border="0" cellpadding="2" cellspacing="1" width="100%">
                            <tbody>
                                <tr>
                                    <td class="Partext1" style="width: 18px; height: 19px">
                                        <strong class="paratext"><span class="paratext" style="color: #000000"></span></strong>
                                    </td>
                                    <td style="width: 502px; color: #000000; height: 19px; text-align: justify">
                                        <span style="color: #808080"></span>
                                        <asp:Label id="L_Error" runat="server" Font-Bold="False" ForeColor="Red" Text="Server Not Responding"
                                            Visible="False"></asp:Label></td>
                                </tr>
                                <tr style="color: #000000">
                                    <td class="Partext1" colspan="2">
                                        <asp:table id="Table_View" runat="server" CaptionAlign="Top" CellPadding="1" CellSpacing="0"
                                            GridLines="Horizontal" Width="100%">
                                            <asp:TableRow ID="TableRow1" runat="server" BackColor="#8CD3EF">
                                                <asp:TableCell ID="TableCell1" runat="server" HorizontalAlign="Left" Text="Story ID"
                                                    VerticalAlign="Middle" Width="18%"></asp:TableCell>
                                                <asp:TableCell ID="TableCell2" runat="server" HorizontalAlign="Left" Text="Matrimonial ID"
                                                    VerticalAlign="Middle" Width="18%"></asp:TableCell>
                                                <asp:TableCell runat="server" Width="54%">Message</asp:TableCell>
                                                <asp:TableCell runat="server" Width="10%" HorizontalAlign="Center">View/Delete</asp:TableCell>
                                            </asp:TableRow>
                                        </asp:table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                </asp:Panel>
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                        <asp:Panel ID="PN_NoRecords" runat="server" Height="100%" Width="100%" Visible="False">
                            <table border="0" cellpadding="0" cellspacing="0" style="border-right: #ec5984 1px solid;
                                border-top: #ec5984 1px solid; border-left: #ec5984 1px solid; width: 522px;
                                border-bottom: #ec5984 1px solid">
                                <tbody>
                                    <tr>
                                        <td align="center" class="Alert">
                                            <strong>
                                                <img align="absMiddle" border="0" src="../../Resources/warning.png" />
                                                <span style="color: #ff0066">No Such Records Found</span></strong><span style="color: #ff0066">
                                                </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 33px">
                                            <ul class="Alert">
                                                <br />
                                                <li style="text-align: center"><span style="color: #ff0033">There are no records matching
                                                    records specified by you</span></li>
                                                <li style="text-align: center"><span style="color: #ff0033">This ID is not present ,Pls
                                                    check ...</span></li>
                                            </ul>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </asp:Panel>
                    
                    </td>
            </tr>
            <tr>
            <td colspan="5"></td>
            </tr>
        </tbody>
    </table>
</asp:Content>

