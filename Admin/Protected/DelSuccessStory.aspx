<%@ Page Language="C#" MasterPageFile="~/Admin/Protected/Admin.master" AutoEventWireup="true" CodeFile="DelSuccessStory.aspx.cs" Inherits="Admin_Protected_DelSuccessStory" Title="Delete Sucess Story" %>

<%@ Register Src="../../WeBControls/SuccessPannel.ascx" TagName="SuccessPannel" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table id="content" border="0" cellpadding="1" cellspacing="1" height="0" width="100%">
        <tbody>
            <tr>
                <td colspan="4" style="height: 54px" valign="middle">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tbody>
                            <tr>
                                <td style="width: 8%; height: 51px">
                                    <img src="../../Resources/Del-user.gif" /></td>
                                <td class="headertext" style="height: 51px" width="97%">
                                    &nbsp; &nbsp; &nbsp;&nbsp; <strong><span style="color: gray">DELETE SUCESS STORY</span></strong>&nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 13%">
                </td>
                <td class="HeadText1" colspan="4" style="width: 90%px; height: 173px; text-align: left"
                    valign="top">
                    <table align="left" border="0" cellpadding="2" cellspacing="1" style="height: 241px" width="100%">
                        <tbody>
                            <tr>
                                <td class="Partext1" style="width: 63px; height: 19px">
                                    <strong class="paratext"><span class="paratext" ></span></strong>
                                </td>
                                <td style="width: 575px; color: #000000; height: 19px; text-align: justify">
                                     <span style="color: #808080">Some Captions regarding the creation of a Delete
                                        accout</span> <br />
                                    <asp:Label ID="L_Error" runat="server" Font-Bold="False" ForeColor="Red" Text="Sucess Story Deleted"
                                        Visible="False"></asp:Label></td>
                                        <td></td>
                            </tr>

                            <tr >
                                <td class="Partext1">
                                    &nbsp;</td>

                                <td class="Partext1" style="width: 575px" >
                                    &nbsp;<uc1:SuccessPannel ID="SuccessPannel1" runat="server" />
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                            <td></td>
                                <td style="width: 575px; text-align: center" >
                                    <asp:CheckBox ID="CB_Delete" runat="server" Text="Yes Delete Sucess Story" />&nbsp;
                                    <asp:Button ID="B_Delete" runat="server" CssClass="green-button" Text="Delete" Width="87px" /></td>
                            <td></td>
                            </tr>
                            <tr>
                                <td colspan="3" >
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
            <td colspan="5"></td>
            </tr>
        </tbody>
    </table>
</asp:Content>

