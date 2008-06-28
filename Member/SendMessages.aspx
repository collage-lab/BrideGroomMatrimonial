<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SendMessages.aspx.cs" Inherits="Member_SendMessages" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
<link rel="stylesheet" href="../Resources/bmstyle.css">
	
    <script type="text/javascript" language="JavaScript">
	    <!--
	    javascript:window.history.forward(1);
	    //-->

    </script>

</head>
	
	
<body topmargin="0" leftmargin="0" bgcolor="#ffffff" >
<center>
    <table border="1" cellpadding="4" cellspacing="0" bordercolor="#ffccff" style=" height: 100%; width: 589px;">
	<tbody>
	<tr>
	<td valign="top" style="width: 603px;">

		<form id="Form1" name="uploadForm"  runat ="server">
            <div style="border-right: rgb(241,212,146) 1px solid; border-top: rgb(241,212,146) 1px solid;
                padding-left: 10px; float: left; padding-bottom: 10px; border-left: rgb(241,212,146) 1px solid;
                border-bottom: rgb(241,212,146) 1px solid; height: 98%; background-color: rgb(255,255,255)">
                <div class="leftmenuhead" style="color: rgb(239,111,31); padding-top: 10px; text-align: left;">
                <asp:HiddenField ID="HF_ToID" runat="server" />
                    Send Messages to&nbsp;
                    <asp:Label ID="L_ToMatID" runat="server"></asp:Label></div>
                <div class="normaltxt1" style="padding-top: 5px; text-align: center">
                    <table>
                        <tr>
                            <td style="width: 25px">
                            </td>
                            <td style="width: 516px; text-align: justify">
                                send instant messages to your loved ones......
                                <br />
                                have a great time chatting with your pair...........<br />
                                Do you need to see some examples<a onclick="window.open('../Extras/Tipsonwritingmessages.htm','Tips','scrollbars=no,width=440,height=340')" href = "#"><span
                                    style="color: #ff9966"><strong>?</strong></span></a><br />
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="margin-top: 5px; font-size: 12pt; width: 566px; font-family: Times New Roman;">
                    <div style="padding-right: 5px; padding-left: 5px; float: left; padding-bottom: 5px;
                        width: 548px; padding-top: 5px; background-color: #fff0cb; text-align: center;">
                        <table width="97%" style="text-align: center">
                            <tbody>
                                <tr>
                                    <td  class="normaltxt1" style="width: 36px; text-align: left;" valign="top">
                                        <span style="font-size: 8pt"></span>
                                    </td>
                                    <td style="width: 450px;font-size: 8pt; font-family: Verdana; text-align: right;" valign="middle" bordercolor="#009900">
                                        <asp:TextBox ID="TB_Message" runat="server" Height="100px" TextMode="MultiLine" Width="98%" MaxLength="200"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TB_Message"
                                            ErrorMessage="Write Some message"></asp:RequiredFieldValidator><span style="color: gray">You can have </span>
                                        <asp:TextBox ID="txtCount" runat="server" BackColor="Transparent" BorderColor="#E0E0E0"
                                            BorderStyle="None" BorderWidth="1px" ForeColor="Red" ReadOnly="True" ToolTip="reminig letters"
                                            Width="21px">200</asp:TextBox><span style="color: gray"><span style="font-size: 8pt">
                                        more lettres</span>&nbsp;</span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="normaltxt1" style="padding-bottom: 5px; padding-top: 5px">
            &nbsp;</div>
                    <div style="padding-right: 5px; padding-left: 5px; float: left; padding-bottom: 5px;
                        width: 549px; padding-top: 5px; background-color: #ffe6e7; text-align: center">
                        <asp:ImageButton ID="IB_Send" runat="server" ImageUrl="~/Resources/button-send.gif" /></div>
                </div>
                &nbsp;
            </div>
        </form></td></tr></tbody></table>
</center>
</body>

</html>
