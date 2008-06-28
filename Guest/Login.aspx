<%@ Page Language="C#" MasterPageFile="~/Guest/Guest.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Guest_Login" Title="LogIn " %>
<asp:Content ID="Content1" ContentPlaceHolderID="GuestContent" Runat="Server">
    <table align="center" border="0" cellpadding="0" cellspacing="0" height="20" width="97%">
        <tbody>
            <tr>
                <!-- MEMBER LOG IN ...-->
                <td background="../Resources/heading_bg.gif" style="height: 20px" width="37%">
                    <div align="left">
                        &nbsp; <span class="viewtextsmall"><strong>Member Login ...</strong></span></div>
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
                                <td colspan="2" style="height: 272px" valign="top" width="53%">
                                    <br />
                                    <!--lOGIN TABLE-->
                                    <table border="0" cellpadding="4" cellspacing="2" width="100%">
                                        <tbody>
                                            <tr>
                                                <td colspan="2">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    Kindly provide your Login ID &amp; Password to enjoy uninterupted services</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <span class="textnormal"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="15%">
                                                    <div align="right">
                                                        <br />
                                                        ID/Email &nbsp;&nbsp;
                                                    </div>
                                                </td>
                                                <td width="35%" style="text-align: left">
                                                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="TB_ID"
                                                        Display="Dynamic" ErrorMessage="Invalid email Id   " ValidationExpression="[\w-]+([\+\.][\w-]*)?@([\w-]+\.)+[\w-]+"></asp:RegularExpressionValidator><br />
                                                    <asp:TextBox ID="TB_ID" runat="server" CssClass="forminput" MaxLength="50" Width="173px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_ID"
                                                        ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                            </tr>
                                            <tr style="color: #a24f11">
                                                <td>
                                                    <div align="right" style="text-align: center">
                                                        Password<br />
                                                                                                            </div>
                                                </td>
                                                <td style="font-weight: bold; text-align: left;">
                                                    <asp:TextBox ID="TB_Password" runat="server" CssClass="forminput" MaxLength="50"
                                                        TextMode="Password" Width="173px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TB_Password"
                                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    <asp:Label ID="L_WPassword" runat="server" ForeColor="Red" Text="Wrong Password"
                                                        Visible="False"></asp:Label></td>
                                            </tr>
                                            <tr style="color: #000000">
                                                <td>
                                                    &nbsp;</td>
                                                <td style="text-align: right">
                                                    <span class="gaia le rem">
                                                        <asp:CheckBox ID="CB" runat="server" />Rmember me&nbsp;
                                                        <asp:ImageButton ID="IB_LogIn" runat="server" ImageUrl="~/Resources/lgn-button.gif" />
                                                        &nbsp; &nbsp;</span></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <div align="center">
                                                        <a href="GetPassword.aspx"><span style="color: #000000">Forgot Your Password?</span></a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                                <td style="height: 272px" width="2%">
                                    <img height="272" src="../Resources/vertical_line.jpg" width="1" /></td>
                                <td style="height: 272px" valign="top" width="45%">
                                    <br />
                                    <table cellpadding="2" cellspacing="2">
                                        <tbody>
                                            <tr>
                                                <td colspan="2">
                                                    <strong><span style="color: #990033">
                                                    Not Yet a Member? Join Now</span></strong></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    Registration with us and we will provide you with the following privileges:</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" height="10">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" width="23%">
                                                    1.</td>
                                                <td style="text-align: left" width="77%">
                                                    &nbsp; &nbsp; View Profiles (Free)</td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    2.</td>
                                                <td style="text-align: left">
                                                    &nbsp; &nbsp; Contact Profiles</td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    3.</td>
                                                <td style="text-align: left">
                                                    &nbsp; &nbsp; Get Match Alerts</td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    4.</td>
                                                <td style="text-align: left">
                                                    &nbsp; &nbsp; Upload Photo(s)</td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    5.</td>
                                                <td style="text-align: left">
                                                    &nbsp; &nbsp; Privacy Assured</td>
                                            </tr>
                                            <tr align="center">
                                                <td colspan="2" height="50">
                                                    <div align="center">
                                                        &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Resources/ssregisterfreeicon.gif"
                                                            NavigateUrl="~/Guest/JoinNow.aspx">Register Now</asp:HyperLink>
                                                    </div>
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
        </tbody>
    </table>
</asp:Content>

