<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PasswordRequest.aspx.cs" Inherits="Member_PasswordRequest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head id="Head1" runat="server">
    <title>PhotoRequest</title>
<link rel="stylesheet" href="../Resources/bmstyle.css">
	
    <script type="text/javascript" language="JavaScript">
	    <!--
	    javascript:window.history.forward(1);
	    //-->

    </script>
    
</head>
	
	
<body topmargin="0" leftmargin="0" bgcolor="#ffffff" >
<center>
    <table border="1" cellpadding="4" cellspacing="0" bordercolor="#ffccff" style=" height: 100%; width: 420px;">
	<tbody>
	<tr>
	<td valign="top" style="width: 603px;">

		<form id="Form1" name="uploadForm"  runat ="server">
            <div style="border-right: rgb(241,212,146) 1px solid; border-top: rgb(241,212,146) 1px solid;
                padding-left: 10px; float: left; padding-bottom: 10px; border-left: rgb(241,212,146) 1px solid;
                border-bottom: rgb(241,212,146) 1px solid; height: 98%; background-color: rgb(255,255,255); width: 405px; text-align: center;">
                <div class="leftmenuhead" style="color: rgb(239,111,31); padding-top: 10px; text-align: left;">
                <asp:HiddenField ID="HF_ToID" runat="server" />
                    Send 
                    <asp:Label ID="L_Request_Type" runat="server"></asp:Label>
                    request &nbsp;to&nbsp;
                    <asp:Label ID="L_ToMatID" runat="server"></asp:Label></div>
                <div class="normaltxt1" style="padding-top: 5px; text-align: center">
                    <table>
                        <tr>
                            <td style="width: 25px">
                            </td>
                            <td style="width: 516px; text-align: justify">
                                The profile holder will get a password request ,after the approval from him/her
                                you can view the image.</td>
                        </tr>
                    </table>
                </div>
                &nbsp;<br />
                        <asp:ImageButton ID="IB_Send" runat="server" ImageUrl="~/Resources/button-send.gif" /></div>
        </form></td></tr></tbody></table>
		
		</center>
		
		
	

</body>

</html>
