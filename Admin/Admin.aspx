<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>


<title>Administrator : Gateway</title>
<link href="../Resources/adminstyle.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 10px;
}
a:link {text-decoration: none ; color: #FFFFFF; letter-spacing: 1px; font-size: 11px;}
a:visited {text-decoration: none ; color: #FFFFFF; letter-spacing: 1px; font-size: 11px;}
a:active {text-decoration: none ; color: #FFFFFF; letter-spacing: 1px; font-size: 11px;}
a:hover {text-decoration: none ; color: #FFFFFF; letter-spacing: 1px; font-size: 11px;}
.td {
	padding: 0 0 0 10; 
	color:#FFFFFF; 
	background-color:#7B7B7B; 
	height:16px;
}
.td1 {
	padding: 0 0 0 10; 
	color:#FFFFFF; 
	background-color:#7B7B7B; 
	height:14px;
}
.forminput {
	FONT-SIZE: 11px; 
	FONT-FAMILY: verdana;
	color: #000000;
}
.div_hidden {
	position:absolute;
	display:none;
}
-->
</style>
<script type="text/javascript">
<!--
	/*
	 * detect browser settings for showing and hiding DIVs
	 */
   isNS4 = ( document.layers) ? true : false;
   isIE4 = ( document.all && !document.getElementById) ? true : false;
   isIE5 = ( document.all &&  document.getElementById) ? true : false;
   isNS6 = (!document.all &&  document.getElementById) ? true : false;
	/* *** */
	
	/* check window resize action */
	window.onresize = reDrawDiv;
	
	/* define main div */
	var divArray = new Array('Layer1', 'Layer2', 'Layer3');
	var imgArray = new Array('m1', 'm2', 'm3');
		
	/*
	 * display main menu
	 */
	function displayDiv(showIndex) {
		var objElement;
		
		if (isNS4) {
			objElement = document.layers[divArray[showIndex]];
			objElement.display = 'block';
		} else if (isIE4) {
			objElement = document.all[divArray[showIndex]].style;
			objElement.display = 'block';
		} else if (isIE5 || isNS6) {
			hideAllDiv(divArray);
			
			var imageElement = document.getElementById(imgArray[showIndex]);
			var imagePosition = findPos(imageElement);

			objElement = document.getElementById(divArray[showIndex]);
			objElement.style.display = 'block';
			objElement.style.left = imagePosition[0] - ((parseInt(objElement.style.width) - imageElement.width)/2);
			objElement.style.top = imagePosition[1] - ((parseInt(objElement.style.height) - imageElement.height)/2);
			
		} else {
			alert('You web browser is not supported this gateway script.');
		}
	}

	
	function hideAllDiv(divs) {
		var objElement;
		
		for(var idx=0; idx<divs.length; idx++) {
			if (isNS4) {
				objElement = document.layers[divs[idx]];
				if (objElement.display == 'block') objElement.display = 'none';
			} else if (isIE4) {
				objElement = document.all[divs[idx]].style;
				if (objElement.display == 'block') objElement.display = 'none';
			} else if (isIE5 || isNS6) {
				objElement = document.getElementById(divs[idx]).style;
				if (objElement.display == 'block') objElement.display = 'none';
			}
		}
	}
	
	function findPos(obj) {
		var curleft = curtop = 0;
		if (obj.offsetParent) {
			curleft = obj.offsetLeft;
			curtop = obj.offsetTop;
			while (obj = obj.offsetParent) {
				curleft += obj.offsetLeft;
				curtop += obj.offsetTop;
			}
		}
		return [curleft,curtop];
	}

	function getIndexDisplayDiv(divs) {
		var objElement;
		var divIndex = -1;
		
		for(var idx=0; idx<divs.length; idx++) {
			if (isNS4) {
				objElement = document.layers[divs[idx]];
				if (objElement.display == 'block') {
					divIndex = idx;
					break;
				}
			} else if (isIE4) {
				objElement = document.all[divs[idx]].style;
				if (objElement.display == 'block') {
					divIndex = idx;
					break;
				}
			} else if (isIE5 || isNS6) {
				objElement = document.getElementById(divs[idx]).style;
				if (objElement.display == 'block') {
					divIndex = idx;
					break;
				}
			}
		}
		
		return divIndex;
	}
	
	function reDrawDiv() {
		var displayedDivIndex = getIndexDisplayDiv(divArray);
		if (displayedDivIndex != -1) displayDiv(displayedDivIndex);
	}
	
	function HideAll()
	{
	            document.getElementById('Layer1').style.display = "none";
	            document.getElementById('Layer2').style.display = "none";
	            document.getElementById('Layer3').style.display = "none";
	}
			
	
//-->
</script>

















</head><body onload="HideAll();">

<form id="Form1" name="login" runat="server" >
<div id="Layer1" class="div_hidden" style="position: absolute; left: 158px; top: 267px; width: 280px; height: 183px; z-index: 1; display: none;">
	
	
	<table border="1" bordercolor="#b30044" cellpadding="0" cellspacing="0" width="100%" style="height: 93%">
		<tbody>		
		<tr><td style="text-align: right" bgcolor="#993366">
            <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="../Resources/srch-close-icon.gif"
                onclick="HideAll();"></asp:HyperLink></td></tr>
		<tr>
			<td align="center" bgcolor="white" style="height: 152px">
                &nbsp;<table bgcolor="#ffffff" border="0" cellpadding="3" cellspacing="1" width="100%">
                                <tr>
                                    <td class="smalltextgrey" colspan="3">
                                        <div align="center">
                                            <strong>Enter the sequrity Key &nbsp;</strong></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 106px">
                                        <strong class="Text1"></strong>
                                    </td>
                                    <td style="width: 12px">
                                    </td>
                                    <td style="width: 250px; text-align: left">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 106px; text-align: right;">
                                        <asp:TextBox ID="TextBox3" runat="server" CssClass="forminput" MaxLength="5" Width="62px"></asp:TextBox></td>
                                    <td style="width: 12px; text-align: center;">
                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="forminput" MaxLength="5" TextMode="Password"
                                            Width="62px"></asp:TextBox></td>
                                    <td style="width: 250px; text-align: left">
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="forminput" MaxLength="5" Width="62px"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 106px">
                                        &nbsp;</td>
                                    <td style="width: 12px; text-align: center">
                                        </td>
                                    <td style="width: 250px; text-align: left;">
                                        <asp:Button ID="B_Submit" runat="server" CssClass="green-button" OnClick="B_Submit_Click1"
                                            Text="Submit" Width="67px" /></td>
                                </tr>
                            </table>
                </td>
		</tr>
	</tbody></table>

</div>


<div id="Layer2" class="div_hidden" style="position: absolute; left: 350px; top: 265px; width: 280px; height: 164px; z-index: 1; display: block;">
	
	
	<table border="1" bordercolor="#b30044" cellpadding="0" cellspacing="0" width="280" style="height: 155px">
		<tbody>
		<tr><td style="text-align: right" bgcolor="#993366">
            <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="../Resources/srch-close-icon.gif"
                onclick="HideAll();"></asp:HyperLink></td></tr>
		<tr>
			<td align="center" bgcolor="#ffffff" style="width: 290px; text-align: left;">
                <br />
                &nbsp;
                <asp:Label ID="L_invalidLogin" runat="server" Font-Size="Smaller" ForeColor="Red"
                    Text="invalid Login Try Again" Visible="False"></asp:Label><br />
                                <table bgcolor="#ffffff" border="0" cellpadding="3" cellspacing="1" width="100%">
                                    <tbody>
                                        <tr>
                                            <td class="smalltextgrey" colspan="3">
                                                <div align="center">
                                                    <strong>Administrator Login Area </strong>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 106px">
                                                <strong class="Text1">Username</strong></td>
                                            <td>
                                                :</td>
                                            <td style="text-align: left; width: 250px;">
                                                <asp:TextBox ID="TB_Admin" runat="server" onfocus="this.style.backgroundColor='#fce6ea'; this.style.color = 'Black';" onblur="this.style.backgroundColor='Window'; this.style.color='WindowText';" style="background-color: window; color: windowtext;" CssClass="forminput" Width="143px"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td style="width: 106px; height: 27px;">
                                                <strong class="Text1">Password</strong></td>
                                            <td style="height: 27px">
                                                :</td>
                                            <td style="text-align: left; width: 250px; height: 27px;">
                                                <asp:TextBox ID="TB_Password" runat="server" onfocus="this.style.backgroundColor='#fce6ea'; this.style.color = 'Black';" onblur="this.style.backgroundColor='Window'; this.style.color='WindowText';" style="background-color: window; color: windowtext;" CssClass="forminput"
                                                    Width="143px" TextMode="Password"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td style="width: 106px; height: 25px;">
                                                &nbsp;</td>
                                            <td style="height: 25px">
                                                &nbsp;</td>
                                            <td style="width: 250px; height: 25px;">
                                                &nbsp;<asp:Button ID="B_LogIn" runat="server" CssClass="green-button" Text="Login" OnClick="B_LogIn_Click" BackColor="Pink" BorderColor="Black" ForeColor="Black" Width="66px" /></td>
                                        </tr>
                                    </tbody>
                                </table>
			
			</td>
		</tr>
	</tbody></table>

</div>


<div id="Layer3" class="div_hidden" style="position: absolute; left: 595px; top: 190px; width: 280px; height: 287px; z-index: 1; display: none;">
	<table border="1" bordercolor="#b30044" cellpadding="0" cellspacing="0" height="280" width="280">
		<tbody>
		<tr><td style="text-align: right" bgcolor="#993366">
            <asp:HyperLink ID="HyperLink3" runat="server" ImageUrl="../Resources/srch-close-icon.gif"
                onclick="HideAll();"></asp:HyperLink></td></tr>
		<tr>
			<td align="center" bgcolor="#ffffff"> 
                <img src="../Resources/b&G.jpg" border="0" usemap="#Map" />  
                
                
                
                </td>
		</tr>
	</tbody>
	
	</table>
</div>

	</form>
<table align="center" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
	<tbody><tr>
		<td align="center" valign="middle">
			<table border="0" cellpadding="0" cellspacing="0" width="750">
				<tbody>
				<tr>

					<td valign="bottom" style="width: 392px; text-align: left; height: 99px;" align="left">
                                    <img src="../Resources/logo.gif" /></td>
					<td align="right" valign="bottom" style="text-align: right; height: 99px;">
                                    <img src="../Resources/as.gif" /></td>
						
				</tr>
				<tr>
					<td align="center" background="../Resources/visual_01.jpg" height="450" valign="middle" width="750" colspan="2">
						<table border="0" cellpadding="0" cellspacing="0" height="157" width="750">
							<tbody><tr valign="top">
								<td style="" align="center" width="250">
								<asp:Image ID="IMG_Setup" runat="server" ImageUrl="~/Resources/menu01_off.gif"  name="m1" border="0" height="137" width="137"/>
								</td>
								<td style="" align="center" width="250">
								<asp:Image ID="IMG_AdminLogin" runat="server" ImageUrl="~/Resources/menu02_off.gif"  name="m2"  border="0" height="137" width="137"/>
								</td>
								<td style="" align="center" width="250">
								<asp:Image ID="IMG_GoMatrimonial" runat="server" ImageUrl="~/Resources/menu03_off.gif"  name="m3"  border="0" height="137" width="137"/>
								</td>
							</tr>
						</tbody></table>
					</td>
				</tr>
				<tr>
					<td height="19" colspan="2"></td>
				</tr>
				<tr>
					<td style="height: 7px; text-align: center;" colspan="2">
                        <strong><span style="color: gray; font-size: 7pt"><% Response.Write(WebConfig.GetValues("WebFooter")); %></span></strong>
                        </td>
				</tr>
			</tbody></table>
		</td>
	</tr>
</tbody></table>
	
<map name="Map">
<area shape="rect" coords="55,250,105,190" href="../Default.aspx">

</map>
</body></html>
