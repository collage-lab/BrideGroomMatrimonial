<%@ Page Language="C#" MasterPageFile="~/Guest/Guest.master" AutoEventWireup="true" CodeFile="GetPassword.aspx.cs" Inherits="Guest_GetPassword" Title="Account Assistance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="GuestContent" Runat="Server">


        <br />
        <table align="center" border="0" cellpadding="0" cellspacing="0" height="20" width="97%">
            <tbody>
                <tr>
                     <%--MEMBER LOG IN --%>
                    <td background="../Resources/heading_bg.gif" width="37%" style="height: 20px">
                        <div align="left">
                            &nbsp; <span class="viewtextsmall"><strong>Get Password ...</strong></span></div>
                    </td>
                    
                    
                    
                    <td width="63%" style="height: 20px">&nbsp;</td>
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
                                        <td colspan="2" valign="top" style="height: 272px; width: 27%;">
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
                                                        <td width="77%" style="text-align: left">
                                                            &nbsp; &nbsp;
                                                            View Profiles (Free)</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">
                                                            2.</td>
                                                        <td style="text-align: left">
                                                            &nbsp; &nbsp;
                                                            Contact Profiles</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">
                                                            3.</td>
                                                        <td style="text-align: left">
                                                            &nbsp; &nbsp;
                                                            Get Match Alerts</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">
                                                            4.</td>
                                                        <td style="text-align: left">
                                                            &nbsp; &nbsp;
                                                            Upload Photo(s)</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">
                                                            5.</td>
                                                        <td style="text-align: left">
                                                            &nbsp; &nbsp;
                                                            Privacy Assured</td>
                                                    </tr>
                                                   
                                                    <tr align="center">
                                                    
                                                    
                                                        <td colspan="2" height="50">
                                                            <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Resources/ssregisterfreeicon.gif"
                                                                NavigateUrl="~/Guest/JoinNow.aspx">Register Now</asp:HyperLink></td>
                                                        
                                                        
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                        <td style="height: 272px; width: 1%;">
                                            <img height="272" src="../Resources/vertical_line.jpg" width="1" /></td>
                                        <td valign="top" width="45%" style="height: 272px">
                                            <br />
                                            <table border="0" cellpadding="4" cellspacing="2" width="100%">
                                                <tbody>
                                                    <tr><td style="text-align: left" colspan="2">
                                                        <strong>Have you forgotten your password?</strong></td></tr>
                                                    <tr>
                                                    
                                                        <td colspan="2">
                                                            <span class="textnormal" style="font-size: 8pt; font-family: Verdana">Please enter the
                                                                email address you use to sign in to your account. If you are a <% Response.Write(WebConfig.GetValues(WebConfig.ConfigurationItem.fname)); %> &nbsp;user, please
                                                                enter  <% Response.Write(WebConfig.GetValues(WebConfig.ConfigurationItem.fname)); %>  your&nbsp; username.....</span></td>
                                                    </tr>
                                                    <tr>

                                                        <td width="65%" style="text-align: left" colspan="2">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 136px">
                                                            <div align="right" style="text-align: center">
                                                                &nbsp;
                                                            ID/Email &nbsp;&nbsp;
                                                            </div>
                                                        </td>
                                                        <td style="text-align: left">
                                                            <asp:Label ID="L_WPassword" runat="server" ForeColor="Red" Text="Wrong UserName"
                                                                Visible="False"></asp:Label>
                                                            <asp:TextBox ID="TB_ID" runat="server" CssClass="forminput" Width="161px"></asp:TextBox>&nbsp;<br />
                                                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="TB_ID"
                                                                Display="Dynamic" ErrorMessage="Invalid email Id   " ValidationExpression="[\w-]+([\+\.][\w-]*)?@([\w-]+\.)+[\w-]+"></asp:RegularExpressionValidator><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_ID"
                                                                ErrorMessage="Email ID Requied" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </td>
                                                    </tr>
                                                                                                                                                <tr>
                                                        <td style="width: 136px">
                                                           
                                                                <img id="Captcha" alt="" src="../Extras/Captcha.aspx" style="width: 123px; height: 40px" />
                                                        </td>
                                                        <td style="text-align: left">
                                                            <asp:TextBox ID="TB_Captcha" runat="server" CssClass="forminput" Width="163px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TB_Captcha"
                                                                ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                                            <span style="color: gray">
                                                            Enter the charater seen in the image&nbsp; here</span>
                                                            <asp:Label ID="L_Captcha" runat="server" ForeColor="Red" Text="Wrong entry" Visible="False"></asp:Label>&nbsp;&nbsp;&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 136px">
                                                            </td>
                                                        <td style="text-align: right">
                                                            <span class="gaia le rem">&nbsp; &nbsp;<asp:ImageButton ID="IB_Submit" runat="server"
                                                                ImageUrl="~/Resources/Getit-button.gif" />
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" style="text-align: right">
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
        <br />
        <br />
        <br />
</asp:Content>

