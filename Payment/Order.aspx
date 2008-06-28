<%@ Page Language="C#" MasterPageFile="~/Payment/PaymentMaster.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Payment_Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="GuestContent" Runat="Server">
    <br />
    <table border="1" cellpadding="0" cellspacing="0" width="96%" bordercolor="#993366" contenteditable="">
        <tbody>
            <tr>
                <td colspan="3"
                    valign="top" width="35%">
                    <table align="center" border="0" cellpadding="4" cellspacing="0" class="tbborder"
                        height="185" width="100%">
                        <tbody>
                            <tr>
                                <td bgcolor="#993366" height="10" valign="center" width="15%" style="color: #ffffff">
                                    <p align="center">
                                        <strong>Packages</strong></p>
                                </td>
                                <td bgcolor="#993366" height="10" valign="center" width="13%" style="color: #ffffff">
                                    <p align="center">
                                        <strong>Duration</strong></p>
                                </td>
                                <td bgcolor="#993366" height="10" valign="center" width="13%" style="color: #ffffff">
                                    <div align="center">
                                        <strong>Price</strong></div>
                                </td>
                                <td bgcolor="#993366" height="10" valign="center" width="16%" style="color: #ffffff">
                                    <div align="center">
                                        <strong>Buy Online</strong></div>
                                </td>
                                <td bgcolor="#993366" height="10" valign="center" width="21%" style="color: #ffffff">
                                    <div align="center">
                                        <strong>Pay Now </strong>
                                    </div>
                                </td>
                            </tr>
                            <tr bgcolor="#fffff4">
                                <td bgcolor="#f4f5f7" height="25">
                                    <div align="left">
                                        <strong>Free</strong></div>
                                </td>
                                <td bgcolor="#f4f5f7">
                                    <div align="center">
                                        <strong>UnLimited</strong></div>
                                </td>
                                <td bgcolor="#f4f5f7">
                                    <div align="center">
                                        Nil</div>
                                </td>
                                <td bgcolor="#f4f5f7">
                                    <a href="http://www.e-matrimony4web.info/paymentorder.aspx"></a>
                                </td>
                                <td bgcolor="#f4f5f7">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td bgcolor="#f4f5f7" height="25">
                                    <div align="left">
                                        <font style="font-size: 11px; color: rgb(22,112,174); font-family: verdana"><b><span
                                            class="Partext1">&nbsp;<asp:Label ID="L_Plan1Name" runat="server"></asp:Label></span></b></font></div>
                                </td>
                                <td bgcolor="#f4f5f7">
                                    <div align="center">
                                        <font style="font-size: 11px; color: rgb(22,112,174); font-family: verdana"><b>
                                            <asp:Label ID="L_Plan1Duration" runat="server"></asp:Label>
                                            days </b></font>
                                    </div>
                                </td>
                                <td bgcolor="#f4f5f7">
                                    <div align="center">
                                        <span class="Partext1"><strong><span style="color: #1670ae">Rs.&nbsp; </span></strong>
                                    <asp:Label ID="L_Plan1Amount" runat="server" Font-Bold="True"></asp:Label></span></div>
                                </td>
                                <td bgcolor="#f4f5f7">
                                    <div align="center">
                                        <a href="http://www.e-matrimony4web.info/paymentorder.aspx"></a>
                                    <asp:RadioButton ID="RB_Pln_1" runat="server" GroupName="RB_G1" Checked="True" />&nbsp;</div>
                                </td>
                                <td bgcolor="#f4f5f7">
                                    <div align="center">
                                        Pay Now !
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#f4f5f7" height="25">
                                    <div align="left">
                                        <font style="font-size: 11px; color: rgb(22,112,174); font-family: verdana"><b><span
                                            class="Partext1">&nbsp;<asp:Label ID="L_Plan2Name" runat="server"></asp:Label></span></b></font></div>
                                </td>
                                <td bgcolor="#f4f5f7">
                                    <div align="center">
                                        <font style="font-size: 11px; color: rgb(22,112,174); font-family: verdana"><b>
                                            <asp:Label ID="L_Plan2Duration" runat="server"></asp:Label>
                                            days </b></font>
                                    </div>
                                </td>
                                <td bgcolor="#f4f5f7">
                                    <div align="center">
                                        <span class="Partext1">Rs.&nbsp;
                                    <asp:Label ID="L_Plan2Amount" runat="server" Font-Bold="True"></asp:Label></span></div>
                                </td>
                                <td bgcolor="#f4f5f7">
                                    <div align="center">
                                        <a href="http://www.e-matrimony4web.info/paymentorder.aspx"></a>
                                    <asp:RadioButton ID="RB_Pln_2" runat="server" GroupName="RB_G1" />&nbsp;</div>
                                </td>
                                <td bgcolor="#f4f5f7">
                                    <div align="center">
                                        Pay Now !
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#f4f5f7" height="25">
                                    <div align="left">
                                        <font style="font-size: 11px; color: rgb(22,112,174); font-family: verdana"><b><span
                                            class="Partext1">&nbsp;<asp:Label ID="L_Plan3Name" runat="server"></asp:Label></span></b></font></div>
                                </td>
                                <td bgcolor="#f4f5f7">
                                    <div align="center">
                                        <font style="font-size: 11px; color: rgb(22,112,174); font-family: verdana"><b>
                                            <asp:Label ID="L_Plan3Duration" runat="server"></asp:Label>
                                            days </b></font>
                                    </div>
                                </td>
                                <td bgcolor="#f4f5f7">
                                    <div align="center">
                                        <span class="Partext1">Rs.&nbsp;<asp:Label ID="L_Plan3Amount"
                                        runat="server" Font-Bold="True"></asp:Label></span></div>
                                </td>
                                <td bgcolor="#f4f5f7">
                                    <div align="center">
                                        <a href="http://www.e-matrimony4web.info/paymentorder.aspx"></a>
                                    <asp:RadioButton ID="RB_Pln_3" runat="server" GroupName="RB_G1" />&nbsp;</div>
                                </td>
                                <td bgcolor="#f4f5f7">
                                    <div align="center">
                                        Pay Now !
                                    </div>
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
    <table border="1" cellpadding="0" cellspacing="0" width="96%" bordercolor="#993366">
        <tbody>
            <tr>
                <td class="bodylight" style="height: 21px;  text-align: left"
                    valign="top" width="35%" bgcolor="#993366">
                    <font class="formheadertxt"><b>&nbsp;<span style="color: #66ff66; font-family: Verdana"><span
                        style="color: #ffff00; font-family: Arial">Select&nbsp; Payment Options</span>&nbsp;</span></b></font></td>
                <td style="height: 21px" valign="top" width="65%">
                </td>
            </tr>
            <tr>
                <td colspan="3"
                    valign="top" width="35%">
                    <table bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" style="border-right: rgb(245,245,245) 10px solid;
                        border-top: rgb(245,245,245) 10px solid; border-left: rgb(245,245,245) 10px solid;
                        border-bottom: rgb(245,245,245) 10px solid" width="100%">
                        <tbody>
                            <tr>
                                <td style="height: 30px; width: 89px;">
                                    <asp:RadioButton ID="RB_DD" runat="server" GroupName="RB_G2" Checked="True" /></td>
                                <td style="height: 30px; text-align: left;" colspan="2">
                                    &nbsp;&nbsp; Pay At Counter Or Sending DD
                                </td>
                                <td width="142" style="height: 30px">
                                    </td>
                            </tr>
                        </tbody>
                    </table>
                    <table bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" style="border-right: rgb(245,245,245) 10px solid;
                        border-top: rgb(245,245,245) 10px solid; border-left: rgb(245,245,245) 10px solid;
                        border-bottom: rgb(245,245,245) 10px solid" width="100%">
                        <tbody>
                            <tr>
                                <td style="height: 30px; text-align: center;" width="89">
                                    <asp:RadioButton ID="RB_EB" runat="server" GroupName="RB_G2" /></td>
                                <td style="height: 30px; text-align: left;" colspan="2">
                                    &nbsp; EBanker</td>
                                <td width="142" style="height: 30px">
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
    <table border="1" cellpadding="0" cellspacing="0" width="96%" bordercolor="#993366">
        <tbody>
            <tr>
                <td class="bodylight" style="height: 21px;  text-align: left"
                    valign="top" width="35%" bgcolor="#993366">
                    <font class="formheadertxt"><b>&nbsp;<span style="color: #66ff66; font-family: Verdana"><span
                        style="color: #ffff00; font-family: Arial">Address For Payment</span></span></b></font></td>
                <td style="height: 21px" valign="top" width="65%">
                </td>
            </tr>
            <tr>
                <td colspan="3"
                    valign="top" width="35%" bordercolor="#993366"><table align="center" border="0" cellpadding="2" cellspacing="2" width="100%">
                        <tbody>
                            <tr>
                                <td colspan="1" style="width: 83px; height: 17px; text-align: left">
                                </td>
                                <td colspan="4" rowspan="1" style="text-align: left">
                                    <strong>Send you DD's To this Address</strong></td>
                            </tr>
                            <tr>
                                <td colspan="1" style="width: 83px; height: 17px; text-align: left">
                                </td>
                                <td colspan="2" rowspan="5" style="width: 14px; text-align: left">
                                </td>
                                <td colspan="2" style="text-align: left" rowspan="5" valign="top">
                                    <asp:Label ID="L_Add" runat="server" Font-Bold="True"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="1" style="width: 83px; height: 17px; text-align: left">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="1" style="width: 83px; height: 17px; text-align: left">
                                </td>
                            </tr>
                            <tr style="font-weight: bold">
                                <td colspan="1" style="width: 83px; height: 17px; text-align: left">
                                </td>
                            </tr>
                            <% Display(true); %>
                            <tr>
                                <td colspan="1" style="width: 83px; height: 17px; text-align: left">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                </td>
                                <td colspan="2" style="text-align: left">
                                    &nbsp;</td>
                            </tr>
                            <% Display(false); %>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    <br />
    <table border="1" cellpadding="0" cellspacing="0" width="96%" bordercolor="#993366">
        <tbody>
            <tr>
                <td class="bodylight" style="height: 21px;  text-align: left"
                    valign="top" width="35%" bgcolor="#993366">
                    <font class="formheadertxt"><b>&nbsp;<span style="color: #66ff66; font-family: Verdana"><span
                        style="color: #ffff00; font-family: Arial">Member Informations</span></span></b></font></td>
                <td style="height: 21px" valign="top" width="65%">
                </td>
            </tr>
            <tr>
                <td colspan="3"
                    valign="top" width="35%">
                    <table align="center" border="0" cellpadding="2" cellspacing="2" width="100%">
                        <tbody>
                            <tr>
                                <td colspan="1" style="width: 83px; text-align: left" rowspan="7">
                                </td>
                                <td colspan="1" style="width: 135px; height: 17px; text-align: right">
                                    <strong>Matrimony ID</strong></td>
                                <td colspan="1" style="width: 7px; height: 17px; text-align: left">
                                    :</td>
                                <td colspan="2" style="height: 17px; text-align: left">
                                    <strong>
                                        <asp:Label ID="L_MatID" runat="server"></asp:Label></strong></td>
                            </tr>
                            <tr>
                                <td colspan="1" style="width: 135px; height: 17px; text-align: right">
                                    Name</td>
                                <td colspan="1" style="width: 7px; height: 17px; text-align: left">
                                    <strong>:</strong></td>
                                <td colspan="2" style="font-weight: bold; height: 17px; text-align: left">
                                    <asp:Label ID="L_Name" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="1" style="width: 135px; height: 17px; text-align: right">
                                    <strong>Membership</strong></td>
                                <td colspan="1" style="width: 7px; height: 17px; text-align: left">
                                    :</td>
                                <td colspan="2" style="height: 17px; text-align: left">
                                    <asp:Label ID="L_membership" runat="server"></asp:Label></td>
                            </tr>
                            <tr style="font-weight: bold">
                                <td colspan="1" style="width: 135px; height: 17px; text-align: right">
                                    Created On
                                </td>
                                <td colspan="1" style="width: 7px; height: 17px; text-align: left">
                                    :</td>
                                <td colspan="2" style="height: 17px; text-align: left">
                                    <asp:Label ID="L_CreatedOn" runat="server"></asp:Label></td>
                            </tr>
                            <% Display(true); %>
                            <tr>
                                <td colspan="1" style="width: 135px; height: 17px; text-align: right">
                                    <strong>PaidMember Form</strong></td>
                                <td colspan="1" style="width: 7px; height: 17px; text-align: left">
                                    :</td>
                                <td colspan="2" style="height: 17px; text-align: left">
                                    <asp:Label ID="L_PaidMemberFrom" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="1" style="width: 135px; height: 17px; text-align: right">
                                    <strong>Paid Member upto</strong></td>
                                <td colspan="1" style="width: 7px; height: 17px; text-align: left">
                                    :</td>
                                <td colspan="2" style="height: 17px; text-align: left">
                                    <asp:Label ID="L_PaidMemberUpTo" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="1" style="width: 135px; height: 17px; text-align: right">
                                    <strong>Plan</strong></td>
                                <td colspan="1" style="width: 7px; height: 17px; text-align: left">
                                    :</td>
                                <td colspan="2" style="height: 17px; text-align: left">
                                    <asp:Label ID="L_Plan" runat="server" Font-Bold="True"></asp:Label></td>
                            </tr>
                            <% Display(false); %>
                            <tr>
                                <td colspan="3">
                                </td>
                                <td colspan="2" style="text-align: left">
                                    &nbsp;<asp:ImageButton ID="HL_Renew_Upgrade" runat="server" ImageUrl="~/Resources/Renewicon.gif"
                                        OnClick="HL_Renew_Upgrade_Click" /></td>
                            </tr>
                            
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>

