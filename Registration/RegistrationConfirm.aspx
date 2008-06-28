<%@ Page Language="C#" MasterPageFile="~/Guest/Guest.master" AutoEventWireup="true" CodeFile="RegistrationConfirm.aspx.cs" Inherits="Registration_RegistrationConfirm" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="GuestContent" Runat="Server">
    <table>
        <tr>
            <td style="width: 385px; height: 15px">
            </td>
            <td style="width: 492px; height: 15px">
            </td>
            <td style="width: 151px; height: 15px">
            </td>
        </tr>
        <tr>
            <td style="width: 385px; height: 106px">
            </td>
            <td style="width: 492px; height: 106px; text-align: left">
                <table align="center" border="0" cellpadding="0" cellspacing="0" height="20" width="100%">
                    <tbody>
                        <tr>
                            <td background="../Resources/heading_bg.gif" style="width: 42%">
                                <div align="left">
                                    &nbsp;&nbsp;<span class="bodysg"><span class="bodysg"> Register Confirm</span></span></div>
                            </td>
                            <td style="text-align: left" width="63%">
                                &nbsp;</td>
                        </tr>
                    </tbody>
                </table>
                <div class="submenubox" style="width: 490px">
                    <div class="submenuContent" style="width: 100%">
                        <div align="justify">
                            <div align="center" class="h2black">
                                <center>
                                    Thank you for Registering in Bride &amp; Groom &nbsp;</center>
                            </div>
                            <p align="left">
                                <strong>Congratulations</strong> Your FREE<% Response.Write(WebConfig.GetValues(WebConfig.ConfigurationItem.fname)); %>
                                &nbsp;profile has been created. A confirmation message has send to you.-Free membership
                                allows you to search and initiate contact.
                            </p>
                            <p>
                                <table border="0" cellpadding="0" cellspacing="0" width="500">
                                    <tbody>
                                        <tr>
                                            <td style="width: 475px; height: 21px; text-align: right" valign="top">
                                                <asp:ImageButton ID="IMG_Profile" runat="server" ImageUrl="~/Resources/gomyprofile.gif" OnClick="IMG_Profile_Click" /></td>
                                            <td style="height: 21px" valign="top">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </p>
                        </div>
                    </div>
                </div>
            </td>
            <td style="width: 151px; height: 106px">
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td style="width: 385px; height: 20px">
            </td>
            <td style="width: 492px; height: 20px">
                <br />
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tbody>
                        <tr>
                            <td class="bodylight" style="height: 21px; background-color: rgb(95,158,201); text-align: left"
                                valign="top" width="35%">
                                <font class="formheadertxt"><b>&nbsp;<span style="color: #66ff66; font-family: Verdana"><span
                                    style="color: #ffff99">Payment Methods</span> </span></b></font>
                            </td>
                            <td style="height: 21px" valign="top">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="border-right: #3399ff 1px solid; border-top: #3399ff 1px solid;
                                border-left: #3399ff 1px solid; border-bottom: #3399ff 1px solid; height: 21px"
                                valign="top" width="35%">
                                <div style="width: 94%">
                                    <div align="justify">
                                        <br />
                                        <span style="color: gray">Only a paid membership will give you the advantage of contacting
                                            profiles on a
                                            <br />
                                            personalized level. Become a paid member today.</span></div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
            <td style="width: 151px; height: 20px">
            </td>
        </tr>
        <tr>
            <td style="width: 385px; height: 18px">
            </td>
            <td style="width: 492px; height: 18px">
            </td>
            <td style="height: 18px">
            </td>
        </tr>
        <tr>
            <td style="width: 385px; height: 84px">
            </td>
            <td style="width: 492px; height: 84px">
                &nbsp;<table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tbody>
                        <tr>
                            <td class="bodylight" style="height: 21px; background-color: rgb(95,158,201); text-align: left"
                                valign="top" width="35%">
                                <font class="formheadertxt"><b>&nbsp;<span style="color: #66ff66; font-family: Verdana"><span
                                    style="color: #ffff00; font-family: Arial">Select Membership Package</span> </span>
                                </b></font>
                            </td>
                            <td style="height: 21px" valign="top" width="65%">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="border-right: #3399ff 1px solid; border-top: #3399ff 1px solid;
                                border-left: #3399ff 1px solid; border-bottom: #3399ff 1px solid; height: 21px"
                                valign="top" width="35%">
                                <table bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" style="border-right: rgb(245,245,245) 10px solid;
                                    border-top: rgb(245,245,245) 10px solid; border-left: rgb(245,245,245) 10px solid;
                                    border-bottom: rgb(245,245,245) 10px solid" width="100%">
                                    <tbody>
                                        <tr>
                                            <td height="30" width="89">
                                                <div align="left">
                                                    <font style="font-size: 11px; color: rgb(22,112,174); font-family: verdana"><b>&nbsp;<span
                                                        class="Partext1"> 
                                                        <asp:Label ID="L_Plan1Name" runat="server"></asp:Label></span></b></font></div>
                                            </td>
                                            <td width="128">
                                                <div align="left">
                                                    <font style="font-size: 11px; color: rgb(22,112,174); font-family: verdana"><b>
                                                        <asp:Label ID="L_Plan1Duration" runat="server"></asp:Label> Days</b></font></div>
                                            </td>
                                            <td width="142">
                                                <div align="left">
                                                    <span class="Partext1"><strong><span style="color: #1670ae">Rs.</span></strong>
                                                        <asp:Label ID="L_Plan1Amount" runat="server" Font-Bold="True"></asp:Label>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr style="font-weight: bold; font-size: 7pt; color: #5f9ec9">
                                            <td bgcolor="#f5f5f5" colspan="4" valign="top">
                                                <img height="1" src="../Resources/trans1.htm" width="1" /></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" style="border-right: rgb(245,245,245) 10px solid;
                                    border-top: rgb(245,245,245) 10px solid; border-left: rgb(245,245,245) 10px solid;
                                    border-bottom: rgb(245,245,245) 10px solid" width="100%">
                                    <tbody>
                                        <tr>
                                            <td height="30" width="89">
                                                <div align="left">
                                                    <font style="font-size: 11px; color: rgb(22,112,174); font-family: verdana"><b>&nbsp;<span
                                                        class="Partext1">
                                                        <asp:Label ID="L_Plan2Name" runat="server"></asp:Label></span></b></font></div>
                                            </td>
                                            <td width="128">
                                                <div align="left">
                                                    <font style="font-size: 11px; color: rgb(22,112,174); font-family: verdana"><b>
                                                        <asp:Label ID="L_Plan2Duration" runat="server"></asp:Label> Days</b></font></div>
                                            </td>
                                            <td width="142">
                                                <div align="left">
                                                    <span class="Partext1"><strong><span style="color: #1670ae">Rs.</span></strong>
                                                        <asp:Label ID="L_Plan2Amount" runat="server" Font-Bold="True"></asp:Label>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr style="font-weight: bold; font-size: 7pt; color: #5f9ec9">
                                            <td bgcolor="#f5f5f5" colspan="4" valign="top">
                                                <img height="1" src="../Resources/trans1.htm" width="1" /></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" style="border-right: rgb(245,245,245) 10px solid;
                                    border-top: rgb(245,245,245) 10px solid; border-left: rgb(245,245,245) 10px solid;
                                    border-bottom: rgb(245,245,245) 10px solid" width="100%">
                                    <tbody>
                                        <tr>
                                            <td height="30" width="89">
                                                <div align="left">
                                                    <font style="font-size: 11px; color: rgb(22,112,174); font-family: verdana"><b>&nbsp;<span
                                                        class="Partext1">
                                                        <asp:Label ID="L_Plan3Name" runat="server"></asp:Label></span></b></font></div>
                                            </td>
                                            <td width="128">
                                                <div align="left">
                                                    <font style="font-size: 11px; color: rgb(22,112,174); font-family: verdana"><b>
                                                        <asp:Label ID="L_Plan3Duration" runat="server"></asp:Label> Days</b></font></div>
                                            </td>
                                            <td width="142">
                                                <div align="left">
                                                    <span class="Partext1"><strong><span style="color: #1670ae">Rs.</span></strong>
                                                        <asp:Label ID="L_Plan3Amount" runat="server" Font-Bold="True"></asp:Label>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr style="font-weight: bold; font-size: 7pt; color: #5f9ec9">
                                            <td bgcolor="#f5f5f5" colspan="4" valign="top">
                                                <img height="1" src="../Resources/trans1.htm" width="1" /></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
            <td style="font-size: 7pt; color: #5f9ec9; height: 84px">
            </td>
        </tr>
        <tr style="font-size: 7pt; color: #5f9ec9">
            <td style="width: 385px; height: 231px">
            </td>
            <td style="width: 492px; height: 231px">
                <table style="width: 499px">
                    <tr>
                        <td style="width: 128px; height: 158px">
                            <table align="left" bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0"
                                style="border-right: rgb(95,158,201) 1px solid; border-top: rgb(95,158,201) 1px solid;
                                margin-top: 12px; border-left: rgb(95,158,201) 1px solid; border-bottom: rgb(95,158,201) 1px solid"
                                width="230">
                                <tbody>
                                    <tr bgcolor="#5f9ec9">
                                        <td style="height: 13px" valign="top">
                                            <font style="padding-left: 3px; font-size: 11px; color: rgb(255,255,255); font-family: verdana">
                                                <b><span style="color: #5f9ec9">Membership Benefits</span></b></font></td>
                                        <td style="height: 13px" valign="top">
                                            <font style="font-size: 11px; color: rgb(255,255,255); font-family: verdana"><b>Paid&nbsp;</b></font></td>
                                        <td style="height: 13px" valign="top">
                                            <font style="font-size: 11px; color: rgb(255,255,255); font-family: verdana"><b>Free</b></font></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" valign="top">
                                            <img height="5" src="../Resources/trans1.htm" width="1" /></td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <font style="padding-left: 5px; font-size: 10px; color: rgb(95,158,201); font-family: verdana">
                                                Create your profile</font></td>
                                        <td align="center" valign="top">
                                            <img alt="" border="0" height="12" src="../Resources/yes.gif" width="15" /></td>
                                        <td align="center" valign="top">
                                            <img alt="" border="0" height="12" src="../Resources/yes.gif" width="15" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" valign="top">
                                            <img height="5" src="../Resources/trans1.htm" width="1" /></td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#e2edf6" colspan="3" valign="top">
                                            <img height="1" src="../Resources/trans1.htm" width="1" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" valign="top">
                                            <img height="5" src="../Resources/trans1.htm" width="1" /></td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <font style="padding-left: 5px; font-size: 10px; color: rgb(95,158,201); font-family: verdana">
                                                Add photos</font></td>
                                        <td align="center" valign="top">
                                            <img alt="" border="0" height="12" src="../Resources/yes.gif" width="15" /></td>
                                        <td align="center" valign="top">
                                            <img alt="" border="0" height="12" src="../Resources/yes.gif" width="15" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" valign="top">
                                            <img height="5" src="../Resources/trans1.htm" width="1" /></td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#e2edf6" colspan="3" valign="top">
                                            <img height="1" src="../Resources/trans1.htm" width="1" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" valign="top">
                                            <img height="5" src="../Resources/trans1.htm" width="1" /></td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <font style="padding-left: 5px; font-size: 10px; color: rgb(95,158,201); font-family: verdana">
                                                Search for suitable matches</font></td>
                                        <td align="center" valign="top">
                                            <img alt="" border="0" height="12" src="../Resources/yes.gif" width="15" /></td>
                                        <td align="center" valign="top">
                                            <img alt="" border="0" height="12" src="../Resources/yes.gif" width="15" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" valign="top">
                                            <img height="5" src="../Resources/trans1.htm" width="1" /></td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#e2edf6" colspan="3" valign="top">
                                            <img height="1" src="../Resources/trans1.htm" width="1" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" valign="top">
                                            <img height="5" src="../Resources/trans1.htm" width="1" /></td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <font style="padding-left: 5px; font-size: 10px; color: rgb(95,158,201); font-family: verdana">
                                                Create a favorite list</font></td>
                                        <td align="center" valign="top">
                                            <img alt="" border="0" height="12" src="../Resources/yes.gif" width="15" /></td>
                                        <td align="center" valign="top">
                                            <img alt="" border="0" height="12" src="../Resources/yes.gif" width="15" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" valign="top">
                                            <img height="5" src="../Resources/trans1.htm" width="1" /></td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#e2edf6" colspan="3" valign="top">
                                            <img height="1" src="../Resources/trans1.htm" width="1" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" valign="top">
                                            <img height="5" src="../Resources/trans1.htm" width="1" /></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 12px" valign="top">
                                            <font style="padding-left: 5px; font-size: 10px; color: rgb(95,158,201); font-family: verdana">
                                                Send Interests</font></td>
                                        <td align="center" style="height: 12px" valign="top">
                                            <img alt="" border="0" height="12" src="../Resources/yes.gif" width="15" /></td>
                                        <td align="center" style="height: 12px" valign="top">
                                            <img alt="" border="0" height="12" src="../Resources/yes.gif" width="15" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" valign="top">
                                            <img height="5" src="../Resources/trans1.htm" width="1" /></td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#e2edf6" colspan="3" valign="top">
                                            <img height="1" src="../Resources/trans1.htm" width="1" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" valign="top">
                                            <img height="5" src="../Resources/trans1.htm" width="1" /></td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <font style="padding-left: 5px; font-size: 10px; color: rgb(95,158,201); font-family: verdana">
                                                Send Messages</font></td>
                                        <td align="center" valign="top">
                                            <img alt="" border="0" height="12" src="../Resources/yes.gif" width="15" /></td>
                                        <td align="center" valign="top">
                                            <img alt="" border="0" height="12" src="../Resources/no.gif" width="7" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" valign="top">
                                            <img height="5" src="../Resources/trans1.htm" width="1" /></td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#e2edf6" colspan="3" valign="top">
                                            <img height="1" src="../Resources/trans1.htm" width="1" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" valign="top">
                                            <img height="5" src="../Resources/trans1.htm" width="1" /></td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <font style="padding-left: 5px; font-size: 10px; color: rgb(95,158,201); font-family: verdana">
                                                Reply to Message</font></td>
                                        <td align="center" valign="top">
                                            <img alt="" border="0" height="12" src="../Resources/yes.gif" width="15" /></td>
                                        <td align="center" valign="top">
                                            <img alt="" border="0" height="12" src="../Resources/no.gif" width="7" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" valign="top">
                                            <img height="5" src="../Resources/trans1.htm" width="1" /></td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#e2edf6" colspan="3" valign="top">
                                            <img height="1" src="../Resources/trans1.htm" width="1" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" valign="top">
                                            <img height="5" src="../Resources/trans1.htm" width="1" /></td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <font style="padding-left: 5px; font-size: 10px; color: rgb(95,158,201); font-family: verdana">
                                                Protect Image in album</font></td>
                                        <td align="center" valign="top">
                                            <img alt="" border="0" height="12" src="../Resources/yes.gif" width="15" /></td>
                                        <td align="center" valign="top">
                                            <img alt="" border="0" height="12" src="../Resources/no.gif" width="7" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" valign="top">
                                            <img height="5" src="../Resources/trans1.htm" width="1" /></td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        <td style="width: 43px; height: 158px">
                        </td>
                        <td style="text-align: right">
                            &nbsp;<table border="0" cellpadding="0" cellspacing="0">
                                <tbody>
                                    <tr>
                                        <td style="width: 85%; height: 21px; text-align: right" valign="top"><asp:ImageButton ID="IMB_UpGrade" runat="server" ImageUrl="~/Resources/upgradenow.gif" OnClick="IMB_UpGrade_Click" /></td>
                                        <td style="height: 10%" valign="top">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="height: 231px">
            </td>
        </tr>
    </table>
</asp:Content>

