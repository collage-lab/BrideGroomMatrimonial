<%@ Page Language="C#" MasterPageFile="~/Admin/Protected/Admin.master" AutoEventWireup="true" CodeFile="AddSuccessStory.aspx.cs" Inherits="Admin_Protected_AddSuccessStory" Title="Untitled Page" %>

<%@ Register Assembly="eWorld.UI" Namespace="eWorld.UI" TagPrefix="ew" %>

<%@ Register Src="../../WeBControls/SuccessPannel.ascx" TagName="SuccessPannel" TagPrefix="uc1" %>
<asp:Content ID="CON_SSTORY" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table id="content" border="0" cellpadding="1" cellspacing="1" height="0" width="100%">
        <tbody>
            <tr>
                <td colspan="5" style="height: 54px" valign="middle">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tbody>
                            <tr>
                                <td style="width: 8%; height: 51px">
                                    <img src="../../Resources/add-user.gif" /></td>
                                <td class="headertext" style="height: 51px" width="97%">
                                    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<strong><span style="color: gray">ADD SUCCESS STORY</span></strong>&nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 116px">
                    &nbsp;</td>
                <td class="HeadText1" colspan="4" style="width: 589px; height: 173px; text-align: left"
                    valign="top" align="left">
                    
                    
                      <table align="left" border="0" cellpadding="2" cellspacing="2" style="width: 116%">
                                <tbody>
                                    <tr>
                                        <td colspan="5" style="height: 17px; text-align: left">
                                            <strong>caption 
                                                <br />
                                                <asp:Label ID="L_Alart" runat="server" Font-Bold="False" ForeColor="Red" Text="Sucess Storry Added . ."
                                                    Visible="False"></asp:Label></strong></td>
                                            </tr>
                                            <tr><td colspan="" rowspan="3" width="10%">
                                                &nbsp;
                                            </td><td colspan="4"></td></tr>
                                            <tr><td style="width: 588px" colspan="2"> 
                                                <table><tbody>
                                                                 <tr>
                                        <td style="width: 186px; text-align: left;">
                                            <span style="color: #ff0000">
                                            <span class="style1">&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</span></span>Matrimony ID</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="TB_MatID" runat="server" CssClass="forminput" MaxLength="50" Width="207px" ></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_MatID"
                                                ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                    </tr>     
                                      <tr>
                                        <td style="width: 186px; text-align: left;">
                                            <span class="style1" style="color: #000000">&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
                                            </span> <asp:Label ID="L_Password" runat="server" Text="Password"></asp:Label></td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="TB_Password" runat="server" CssClass="forminput" MaxLength="50" Width="207px" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TB_Password"
                                                ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:Button ID="B_LogIN" runat="server" CssClass="green-button" Text="Search User"
                        Width="105px" OnClick="B_LogIN_Click" /></td>
                                    </tr></tbody></table>
                                            
                                            
                                            </td></tr>                                    
                                    <tr>
                                      
                                        <td colspan="4" style="text-align: center" >
                                            <asp:Panel ID="PN_ID_Album" runat="server" Height="100%" Visible="False" Width="100%">
                                                <table style="width: 100%; height: 375px;">
                                                    <tbody>
                                                        <tr>
                                                            <td style="width: 273px; text-align: left">
                                                                <span class="style1" style="color: #ff0000">&nbsp; &nbsp;&nbsp; *</span> Name Of
                                                                Bride&nbsp;</td>
                                                            <td style="text-align: left">
                                                                <asp:TextBox ID="TB_Bride" runat="server" CssClass="forminput" MaxLength="50" Width="207px"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TB_Bride"
                                                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 273px; text-align: left">
                                                                <span class="style1" style="color: #ff0000">&nbsp; &nbsp;&nbsp; *</span> Name Of
                                                                Groom &nbsp;
                                                            </td>
                                                            <td style="text-align: left">
                                                                <asp:TextBox ID="TB_Groom" runat="server" CssClass="forminput" MaxLength="50" Width="207px"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TB_Groom"
                                                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 273px; text-align: left">
                                                                <span class="style1" style="color: #ff0000">&nbsp; &nbsp;&nbsp; *</span> Date Of
                                                                Marriage&nbsp;</td>
                                                            <td style="text-align: left">
                                                                &nbsp;<ew:CalendarPopup ID="TB_Date" runat="server" Width="173px">
                                                                </ew:CalendarPopup>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TB_Date"
                                                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 273px; text-align: left">
                                                                <span class="style1" style="color: #ff0000">&nbsp; &nbsp;&nbsp; *</span> Success
                                                                Story &nbsp;</td>
                                                            <td style="text-align: left">
                                                                <asp:TextBox ID="TB_SucessStory" runat="server" CssClass="forminput" Height="164px"
                                                                    MaxLength="1000" TextMode="MultiLine" Width="405px"></asp:TextBox><br />
                                                                <asp:TextBox ID="txtCount" runat="server" BorderColor="#E0E0E0" BorderStyle="None"
                                                                    BorderWidth="1px" ForeColor="Red" ReadOnly="True" Width="31px">1000</asp:TextBox>
                                                                <span class="style1">You could enter details about you or a bried description your sucess
                                                                    story.(Min 50 chas and Max 1000 chars).
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TB_SucessStory"
                                                                        ErrorMessage="*"></asp:RequiredFieldValidator></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 273px; text-align: left">
                                                                <span class="style1" style="color: #ff0000">&nbsp; &nbsp;&nbsp; *</span> Wedding
                                                                Photo &nbsp;&nbsp;</td>
                                                            <td style="text-align: left">
                                                                <input id="File_Image" runat="server" class="forminput" style="width: 281px" type="file" />
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="File_Image"
                                                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                                        </tr>
                                                        <tr><td style="width: 273px"></td><td><asp:Button ID="B_AddSucessStorry" runat="server" CssClass="green-button" Text="Add Sucess Storry"
                        Width="105px" OnClick="B_AddSucessStorry_Click" /></td></tr>

                                                    </tbody>
                                                </table>
                                            </asp:Panel>
                                            
                                            <asp:Panel ID="PN_ID_NotFound" runat="server" Height="100%" Visible="False" Width="85%">
                        <table border="0" cellpadding="0" cellspacing="0" style="border-right: #ec5984 1px solid;
                            border-top: #ec5984 1px solid; border-left: #ec5984 1px solid; border-bottom: #ec5984 1px solid;
                            width: 522px;">
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
                    </asp:Panel><asp:Panel ID="PN_Success" runat="server" Height="100%" Visible="False" Width="100%">
                        <uc1:SuccessPannel ID="SuccessPannel1" runat="server" />
                    </asp:Panel>
                                        </td>
                                    </tr>

                                        
                                </tbody>
                            </table>
                    
                </td>
            </tr>
            <tr>
                <td style="width: 409px; text-align: center" colspan="5">
                                       
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>

