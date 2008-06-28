<%@ Page Language="C#" MasterPageFile="~/Guest/Guest.master" AutoEventWireup="true" CodeFile="Membership.aspx.cs" Inherits="Extras_Membership" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="GuestContent" Runat="Server">
    <table>
        <tr>
            <td style="width: 3px; height: 8px">
            </td>
            <td style="width: 684px; height: 8px">
            </td>
            <td style="height: 8px">
            </td>
        </tr>
        <tr>
            <td style="width: 3px; height: 10px">
            </td>
            <td style="width: 684px; height: 10px">
                <strong>Comparison of membership schemes </strong>
                <p align="center">
                    For More Information email to our customer care <% Response.Write( WebConfig.GetValues(WebConfig.ConfigurationItem.emailSales)); %>
                </p>
            </td>
            <td style="height: 10px">
            </td>
        </tr>
        <tr>
            <td style="width: 3px; height: 10px">
            </td>
            <td style="width: 684px; height: 10px">
            </td>
            <td style="height: 10px">
            </td>
        </tr>
        <tr style="font-size: 7pt; color: #5f9ec9">
            <td style="width: 3px; height: 231px">
            </td>
            <td style="width: 684px; height: 231px">
                <table align="center" border="0" cellpadding="4" cellspacing="0" class="tborder"
                    width="95%">
                    <tbody>
                        <tr>
                            <td bgcolor="#ffefed"  valign="top" width="192">
                                <p class="style1">
                                    <span style="color: black"><strong>
                                    Services</strong></span></p>
                            </td>
                            <td bgcolor="#ffefed"  valign="top" width="73">
                                <span class="style2" style="color: #ffffff">
                                                        <asp:Label ID="L_Plan1Name" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label>
                                    </span>
                            </td>
                            <td bgcolor="#ffefed"  valign="top" width="59">
                                <p>
                                    <span class="style2" style="color: #ffffff">
                                                        <asp:Label ID="L_Plan2Name" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label></span></p>
                            </td>
                            <td bgcolor="#ffefed"  style="color: #ffffff" valign="top" width="61">
                                
                                    <span class="style2" style="color: #ffffff">
                                                        <asp:Label ID="L_Plan3Name" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label></span>
                            </td>
                            <td bgcolor="#ffefed"  style="color: #ffffff" valign="top" width="88">
                                <p class="style1">
                                    <strong><span style="color: black">Free Member</span></strong></p>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#ffefed"  colspan="5" height="1">
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#f9f9f9" valign="top" width="192">
                                <p>
                                    Printed profiles with Address Photo and Horoscope</p>
                            </td>
                            <td bgcolor="#e4e4c9" valign="top" width="73">
                                <p>
                                    Yes</p>
                            </td>
                            <td bgcolor="#d2e9ff" valign="top" width="59">
                                <p>
                                    Yes</p>
                            </td>
                            <td bgcolor="#e6ffe6" valign="top" width="61">
                                <p>
                                    Yes</p>
                            </td>
                            <td valign="top" width="88">
                                <p>
                                    No</p>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#ffefed"  colspan="5" height="1">
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#f9f9f9" valign="top" width="192">
                                <p>
                                    Photo / Horoscope Upload
                                </p>
                            </td>
                            <td bgcolor="#e4e4c9" valign="top" width="73">
                                <p>
                                    Yes</p>
                            </td>
                            <td bgcolor="#d2e9ff" valign="top" width="59">
                                <p>
                                    Yes</p>
                            </td>
                            <td bgcolor="#e6ffe6" valign="top" width="61">
                                <p>
                                    Yes</p>
                            </td>
                            <td valign="top" width="88">
                                <p>
                                    No</p>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#ffefed"  colspan="5" height="1">
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#f9f9f9" valign="top" width="192">
                                <p>
                                    Top Placement</p>
                            </td>
                            <td bgcolor="#e4e4c9" valign="top" width="73">
                                <p>
                                    Yes</p>
                            </td>
                            <td bgcolor="#d2e9ff" valign="top" width="59">
                                <p>
                                    Yes</p>
                            </td>
                            <td bgcolor="#e6ffe6" valign="top" width="61">
                                <p>
                                    No</p>
                            </td>
                            <td valign="top" width="88">
                                <p>
                                    No</p>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#ffefed"  colspan="5" height="1">
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#f9f9f9" valign="top" width="192">
                                <p>
                                                Protect Photo</p>
                            </td>
                            <td bgcolor="#e4e4c9" valign="top" width="73">
                                <p>
                                    Yes</p>
                            </td>
                            <td bgcolor="#d2e9ff" valign="top" width="59">
                                <p>
                                    Yes</p>
                            </td>
                            <td bgcolor="#e6ffe6" valign="top" width="61">
                                <p>
                                    Yes</p>
                            </td>
                            <td valign="top" width="88">
                                <p>
                                    No</p>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#ffefed"  colspan="5" height="1">
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#f9f9f9" valign="top" width="192">
                                <p>
                                    Add Horoscope</p>
                            </td>
                            <td bgcolor="#e4e4c9" valign="top" width="73">
                                <p>
                                    Yes</p>
                            </td>
                            <td bgcolor="#d2e9ff" valign="top" width="59">
                                <p>
                                    Yes</p>
                            </td>
                            <td bgcolor="#e6ffe6" valign="top" width="61">
                                <p>
                                    Yes</p>
                            </td>
                            <td valign="top" width="88">
                                <p>
                                    Yes</p>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#ffefed"  colspan="5" height="1">
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#f9f9f9" valign="top" width="192">
                                <p>
                                    Protect Horoscope</p>
                            </td>
                            <td bgcolor="#e4e4c9" valign="top" width="73">
                                <p>
                                    Yes</p>
                            </td>
                            <td bgcolor="#d2e9ff" valign="top" width="59">
                                <p>
                                    Yes</p>
                            </td>
                            <td bgcolor="#e6ffe6" valign="top" width="61">
                                <p>
                                    Yes</p>
                            </td>
                            <td valign="top" width="88">
                                <p>
                                    No</p>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#ffefed"  colspan="5" height="1">
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#f9f9f9" valign="top" width="192">
                                <p>
                                    Send &amp; Receive personalized messages from members
                                </p>
                            </td>
                            <td bgcolor="#e4e4c9" valign="top" width="73">
                                <p>
                                    Yes</p>
                            </td>
                            <td bgcolor="#d2e9ff" valign="top" width="59">
                                <p>
                                    Yes</p>
                            </td>
                            <td bgcolor="#e6ffe6" valign="top" width="61">
                                <p>
                                    Yes</p>
                            </td>
                            <td valign="top" width="88">
                                <p>
                                    No</p>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#ffefed"  colspan="5" height="1">
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#f9f9f9" valign="top" width="192">
                                <p>
                                    Book Mark Profiles</p>
                            </td>
                            <td bgcolor="#e4e4c9" valign="top" width="73">
                                <p>
                                    Yes</p>
                            </td>
                            <td bgcolor="#d2e9ff" valign="top" width="59">
                                <p>
                                    Yes</p>
                            </td>
                            <td bgcolor="#e6ffe6" valign="top" width="61">
                                <p>
                                    Yes</p>
                            </td>
                            <td valign="top" width="88">
                                <p>
                                    Yes</p>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#ffefed"  colspan="5" height="1">
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#f9f9f9" valign="top" width="192">
                                <p>
                                    Validity</p>
                            </td>
                            <td bgcolor="#e4e4c9" valign="top" width="73">
                                <p>
                                                        <asp:Label ID="L_Plan1Duration" runat="server" Font-Bold="True"></asp:Label>&nbsp;Days&nbsp;</p>
                            </td>
                            <td bgcolor="#d2e9ff" valign="top" width="59">
                                <p>
                                                        <asp:Label ID="L_Plan2Duration" runat="server" Font-Bold="True"></asp:Label>&nbsp;Days&nbsp;</p>
                            </td>
                            <td bgcolor="#e6ffe6" valign="top" width="61">
                                <p>
                                                        <asp:Label ID="L_Plan3Duration" runat="server" Font-Bold="True"></asp:Label>&nbsp;Days&nbsp;</p>
                            </td>
                            <td valign="top" width="88">
                                <p>
                                    &nbsp;</p>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#ffefed"  colspan="5" height="1">
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#f9f9f9" valign="top" width="192">
                                <p>
                                    Service Fee</p>
                            </td>
                            <td bgcolor="#e4e4c9" valign="top" width="73">
                                <p>
                                                        <asp:Label ID="L_Plan1Amount" runat="server" Font-Bold="True"></asp:Label>&nbsp;</p>
                            </td>
                            <td bgcolor="#d2e9ff" valign="top" width="59">
                                <p>
                                                        <asp:Label ID="L_Plan2Amount" runat="server" Font-Bold="True"></asp:Label>&nbsp;</p>
                            </td>
                            <td bgcolor="#e6ffe6" valign="top" width="61">
                                <p>
                                                        <asp:Label ID="L_Plan3Amount" runat="server" Font-Bold="True" ></asp:Label>&nbsp;</p>
                            </td>
                            <td valign="top" width="88">
                                <p>
                                    Free</p>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#ffefed"  colspan="5" height="1">
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#f9f9f9" valign="top" width="192">
                                <p>
                                    Select Your Plan &amp; Pay</p>
                            </td>
                            <td bgcolor="#e4e4c9" valign="top" width="73">
                                <p>
                                    Pay Now !</p>
                            </td>
                            <td bgcolor="#d2e9ff" valign="top" width="59">
                                <p>
                                    Pay Now !</p>
                            </td>
                            <td bgcolor="#e6ffe6" valign="top" width="61">
                                <p>
                                    Pay Now !</p>
                            </td>
                            <td valign="top" width="88">
                                <p>
                                    Pay Now &amp; Upgrade your membership
                                </p>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
            <td style="height: 231px">
            </td>
        </tr>
    </table>
</asp:Content>

