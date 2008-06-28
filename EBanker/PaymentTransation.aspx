<%@ Page Language="C#" MasterPageFile="~/ebanker/MasterPage.master" AutoEventWireup="true" CodeFile="PaymentTransation.aspx.cs" Inherits="PaymentTransation" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">




    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
            <tr>
                <td height="15" valign="top" width="4" rowspan="40">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" class="text" colspan="3" valign="top" style="width: 607px">
                    <p>
                        <span class="bread">You are here: <a class="bread" href="#"><span style="color: #0000ff">
                            EBanker</span></a> | <b>Payment Section</b></span></p>
                    <p>
                        <span class="heading"></span>
                        <span class="subheading_blue">Enter your Credit Card Details for processing. &nbsp;
                        </span>
                    </p>
                    <table border="0" cellpadding="0" cellspacing="0" width="98%">
                        <tbody>
                            <tr>
                                <td class="text" valign="top" width="60%">
                                    <b>*All fields in BOLD are required.</b><br />
                                    <br />
                                    <div id="step1" style="display: block">
                                        <table border="0" cellpadding="3" cellspacing="1" class="bgcol" width="97%">
                                            <tbody>
                                                <tr>
                                                    <td align="left" colspan="3">
                                                        <p>
                                                            <br />
                                                            <b>
                                                                <asp:Label ID="L_ErrorMessage" runat="server" Font-Bold="True" ForeColor="Red" Visible="False"></asp:Label><!--Personal Information--></b></p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="text" style="width: 375px; height: 35px">
                                                        <b>Username</b>:</td>
                                                    <td align="left" class="text" style="height: 35px">
                                                        <div align="left">
                                                            <font color="red">
                                                                <asp:TextBox ID="txtUserName" runat="server" Width="196px"></asp:TextBox></font>&nbsp;<asp:RequiredFieldValidator
                                                                    ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" ErrorMessage="Enter Username"></asp:RequiredFieldValidator></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" style="width: 375px">
                                                    </td>
                                                    <td align="left" class="text_small">
                                                        <div align="left">
                                                            (min 6 characters alphanumeric)</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="text" style="width: 375px">
                                                        <b>Password</b>:</td>
                                                    <td align="left" class="text">
                                                        <div align="left">
                                                            <asp:TextBox ID="txtPassword" runat="server" Width="196px" TextMode="Password"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator
                                                                ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="EnterPassword"></asp:RequiredFieldValidator></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="text" style="width: 375px">
                                                        <strong>Pay To :</strong></td>
                                                    <td align="left" class="text">
                                                        <asp:Label ID="L_Counsumer" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="text" style="width: 375px">
                                                        <strong>Amount:</strong></td>
                                                    <td align="left" class="text">
                                                        <asp:Label ID="Amount" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="text" style="width: 375px" valign="top">
                                                        <b>Cridit Card No Number</b>:</td>
                                                    <td>
                                                        <table bgcolor="#ededed" border="0" cellpadding="4" cellspacing="0" class="text"
                                                            style="border-right: rgb(102,102,102) 1px dashed; border-top: rgb(102,102,102) 1px dashed;
                                                            border-left: rgb(102,102,102) 1px dashed; border-bottom: rgb(102,102,102) 1px dashed;
                                                            border-collapse: collapse" width="98%">
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <table bgcolor="#ededed" class="text_small">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td style="width: 383px">
                                                                                        <table border="0" cellpadding="0" cellspacing="0" class="text_small" width="100%">
                                                                                            <tbody>
                                                                                                <tr>
                                                                                                    <td colspan="3" style="height: 20px" valign="bottom">
                                                                                                        <asp:TextBox ID="txtCCNo" runat="server" Width="189px"></asp:TextBox>
                                                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCCNo"
                                                                                                            ErrorMessage="Enter Card NO"></asp:RequiredFieldValidator></td>
                                                                                                </tr>
                                                                                            </tbody>
                                                                                        </table>
                                                                                        
                                                                                            <span class="style1">Important:</span> !
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        <p>
                                                        </p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="text" style="width: 375px">
                                                        <b>Enter Security Code:</b></td>
                                                    <td align="left" class="text" width="72%">
                                                        &nbsp;
                                                        <table bgcolor="#ededed" border="0" cellpadding="4" cellspacing="0" class="text"
                                                                style="border-right: rgb(102,102,102) 1px dashed; border-top: rgb(102,102,102) 1px dashed;
                                                                border-left: rgb(102,102,102) 1px dashed; border-bottom: rgb(102,102,102) 1px dashed;
                                                                border-collapse: collapse" width="98%">
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <table bgcolor="#ededed" class="text_small">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td style="width: 383px">
                                                                                        <p>
                                                        <table>
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Image ID="Captcha" runat="server" ImageUrl="Captcha.aspx" /></td>
                                                                    <td>
                                                                        <!--<input name="submit" type="submit" value="Regenerate">-->
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                                                            <span class="style1">mportant:</span> Enter the letters shown above!
                                                                                        <asp:TextBox ID="TB_Captcha" runat="server" Width="196px"></asp:TextBox>
                                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TB_Captcha"
                                                                                                ErrorMessage="Enter Sequrity Question"></asp:RequiredFieldValidator><br />
                                                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Error - the code entered is incorrrect " Visible="False"></asp:Label></p>
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="text" style="width: 375px">
                                                        <div align="right">
                                                            <b></b>&nbsp;</div>
                                                    </td>
                                                    <td align="left" class="text">
                                                        <div align="left">
                                                            <input name="terms" type="checkbox" value="1" />
                                                            Start Payment <font color="red"></font>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr height="35">
                                                    <td colspan="2">
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tbody>
                                                                <tr>
                                                                    <td width="35%">
                                                                        &nbsp;</td>
                                                                    <td align="left" width="45%">
                                                                        <asp:Button ID="B_PayMent" runat="server" Text="Pay" Width="128px" /></td>
                                                                    <td width="20%">
                                                                        &nbsp;</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div id="step2" style="display: none">
                                        &nbsp;</div>
                                    <div id="step3" style="display: none">
                                        &nbsp;</div>
                                    <table border="0" cellpadding="0" cellspacing="0" class="text" width="100%">
                                        <tbody>
                                            <tr>
                                                <td width="20%">
                                                    <strong>Security &amp; Privacy</strong></td>
                                                <td width="80%">
                                                    <img src="Resources/secure_lock.gif" /></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <p>
                                        EBankers &nbsp;offers secure communications by encrypting all data to and from the
                                        site. We are committed to your privacy. For more information please read our <a href="#">
                                            <span style="color: #0000ff">privacy policy</span></a>.</p>
                                    <p>
                                        &nbsp;</p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>

