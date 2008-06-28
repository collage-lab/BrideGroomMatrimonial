<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sucess.aspx.cs" Inherits="Extras_Sucess" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head>
<title>Close me</title>
<script type="text/javascript" language="JavaScript">
<!--
function display(){
    window.resizeTo(485,285);
    }
//-->
</script>
<link rel="stylesheet" href="../Resources/bmstyle.css">


</head>
<body topmargin="3" leftmargin="0" bgcolor="#ffffff" style="text-align: center" vlink="#ffcc33" onload = display(); scroll="no" >
    <table border="1" cellpadding="4" cellspacing="0" bordercolor="#ffccff" style=" width: 100%; height: 250px;">
	<tbody>
	<tr>
	<td valign="top" style="text-align: center" >

		<form id="Form1" name="uploadForm"  runat ="server">
            &nbsp;<br />
            <br />
            <br />
            <br />
                    <table align="center">
                        <tbody>
                            <tr>
                                <td class="leftmenuhead" colspan="2" style="padding: 5px 1px 5px 3px; color: rgb(239, 111, 31); text-align: center;" valign="top">
                                <b><span style="color: #990099"><asp:Label ID="L_Message" runat="server" Text="Label"></asp:Label></span></b>
                                </td>
                            </tr>

                            <tr>
                                <td align="right" valign="middle" style="text-align: center">&nbsp;<font color="#333333"><a href="javascript:window.close();" class="normaltxt1"><u>Close</u></a></font>
                                </td>
                            </tr>

                        </tbody>
                    </table>
        </form></td></tr></tbody></table>
		
		
		
		
	

</body>

</html>





