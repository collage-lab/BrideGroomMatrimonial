<%@ Page Language="C#" MasterPageFile="~/Guest/Guest.master" AutoEventWireup="true" CodeFile="JoinNow.aspx.cs" Inherits="Guest_JoinNow" Title="Join Now ! Its Free!!" %>
<asp:Content ID="Content1" ContentPlaceHolderID="GuestContent" Runat="Server">
    <table align="center" border="0" cellpadding="0" cellspacing="0" height="20" width="97%">
        <tbody>
            <tr>
                <!-- MEMBER LOG IN ...-->
                <td background="../Resources/heading_bg.gif" style="height: 20px" width="37%">
                    <div align="left">
                        &nbsp; <span class="viewtextsmall"><strong>Join Now ...</strong></span></div>
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
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="97%">
                        <tbody>
                            <tr>
                                <td colspan="2" style="width: 27%; height: 272px" valign="top">
                                    <br />
                                    <!--lOGIN TABLE-->
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    Enter your email Address and starts&nbsp; your&nbsp; registration absolutly for free ...</td>
                                <td style="width: 1%; height: 272px">
                                    <img height="272" src="../Resources/vertical_line.jpg" width="1" /></td>
                                <td style="height: 272px" valign="top" width="45%">
                                    <br />
                                    <table border="0" cellpadding="4" cellspacing="2" width="100%">
                                        <tbody>
    
                                            <tr>
                                                <td colspan="2">
                                                    <span class="textnormal" style="font-size: 8pt; font-family: Verdana"><span style="font-size: 7pt;
                                                        color: #808080">
                                                        <br />
                                                    </span></span></td>
                                            </tr>
                                            <tr>
                                                <td width="35%">
                                                    <div align="right">
                                                        &nbsp; ID/Email &nbsp; &nbsp;
                                                    </div>
                                                </td>
                                                <td style="text-align: left" width="65%">
                                                    <asp:Label ID="L_UserNmeExists" runat="server" ForeColor="Red" Text="Username exists Try Another"
                                                        Visible="False"></asp:Label>
                                                    <asp:TextBox ID="TB_ID" runat="server" CssClass="forminput" Width="163px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_ID"
                                                        ErrorMessage="*"></asp:RequiredFieldValidator>&nbsp;<br />
                                                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="TB_ID"
                                                        Display="Dynamic" ErrorMessage="Invalid email Id   " ValidationExpression="[\w-]+([\+\.][\w-]*)?@([\w-]+\.)+[\w-]+"></asp:RegularExpressionValidator>&nbsp;</td>
                                            </tr>
                                            <tr style="font-size: 8pt; color: #000000">
                                                <td colspan="2">
                                                    Type the characters you see in this picture</td>
                                            </tr>
                                            <tr style="font-size: 7pt; color: #a99aa9">
                                                <td>
                                                    <div align="right" style="text-align: center">
                                                        &nbsp;</div>
                                                </td>
                                                <td style="text-align: left">
                                                    <img id="Captcha" alt="" border="1" src="../Extras/Captcha.aspx" style="width: 167px;
                                                        height: 40px" />&nbsp;<br />
                                                    <span style="color: #a99aa9"><span style="font-size: 7pt"><span style="color: #000000">
                                                        </span></span>
                                                    </span>
                                                    <asp:TextBox ID="TB_Captcha" runat="server" CssClass="forminput" Width="163px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TB_Captcha"
                                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                                        <asp:Label ID="L_CaptchaError" runat="server" ForeColor="Red" Visible="False">Invalid Sequrity String</asp:Label><br />
                                                    <strong><span style="font-size: 7pt">
                                                        The picture contains 8 characters.</span></strong></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;</td>
                                                <td style="text-align: right">
                                                    <span class="gaia le rem">
                                                        <asp:ImageButton ID="IB_Submit" runat="server" ImageUrl="~/Resources/Signup-button.gif" />
                                                        &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;</span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>

</asp:Content>

