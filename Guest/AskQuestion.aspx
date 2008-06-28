<%@ Page Language="C#" MasterPageFile="~/Guest/Guest.master" AutoEventWireup="true" CodeFile="AskQuestion.aspx.cs" Inherits="Guest_AskQuestion" Title="Password Assistance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="GuestContent" Runat="Server">
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
                                    <%--lOGIN TABLE--%>
                                    <table cellpadding="2" cellspacing="2">
                                        <tbody>
                                            <tr>
                                                <td colspan="2" style="text-align: left">
                                                    <strong>Not Yet a Member? Join Now</strong></td>
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
                                                    <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Resources/ssregisterfreeicon.gif"
                                                        NavigateUrl="~/Guest/JoinNow.aspx">Register Now</asp:HyperLink></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                                <td style="width: 1%; height: 272px">
                                    <img height="272" src="../Resources/vertical_line.jpg" width="1" /></td>
                                <td style="height: 272px" valign="top" width="45%">
                                    <br />
                                    <table border="0" cellpadding="4" cellspacing="2" width="100%">
                                        <tbody>
                                            <tr>
                                                <td colspan="2" style="text-align: left">
                                                    <strong>Answer to the question to recover password?</strong></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <span class="textnormal" style="font-size: 8pt; font-family: Verdana">Enter your answer
                                                        for the sequrity question you selected at the time of your reqistration &nbsp;such
                                                        and you can reset your password....</span></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="text-align: left" width="65%">
                                                    &nbsp;<asp:Label ID="L_SequrityQuestion" runat="server" Font-Bold="True"></asp:Label>
                                                    <strong> ??</strong></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 136px">
                                                    <div align="right" style="text-align: center">
                                                        &nbsp;<strong> Answer &nbsp;</strong>&nbsp;
                                                    </div>
                                                </td>
                                                <td style="text-align: left">
                                                    <asp:TextBox ID="TB_passwordAnswwer" runat="server" CssClass="forminput" Width="161px" MaxLength="64" ToolTip="Enter your Sequrity Answer Here"></asp:TextBox>&nbsp;<br />
                                                    <asp:Label ID="L_WPassword" runat="server" ForeColor="Red" Text="Wrong Answer" Visible="False"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 136px">
                                                </td>
                                                <td style="text-align: right">
                                                    <span class="gaia le rem">&nbsp; &nbsp;<asp:ImageButton ID="IB_Submit" runat="server"
                                                        ImageUrl="~/Resources/Getit-button.gif" OnClick="IB_Submit_Click" />
                                                        &nbsp; &nbsp; &nbsp;</span></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="text-align: left">
                                                    Forgot your answer?<br />
                                                    &nbsp; &nbsp; &nbsp;
                                                    <asp:LinkButton ID="LB_Email" runat="server" OnClick="LB_Email_Click">Change your password by sending an email to you</asp:LinkButton></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="text-align: left">
                                                    <asp:HiddenField ID="HF_Session" runat="server" />
                                                    &nbsp; &nbsp; &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
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

