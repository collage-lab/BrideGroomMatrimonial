<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ErrorReport.aspx.cs" Inherits="Extras_ErrorReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<title>Page not found</title>
<link rel=stylesheet type=text/css href="../Resources/hosting0.css">
</head>
<body>
<br>
    <br />
    <br />
<br>
<br>
<table width="675" border="0" align="center" cellpadding="0" cellspacing="0" background="../Resources/main_bg.gif" bordercolor="#ffccff">
	<tr> 
		<td align="center"><table width="673" height="74" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr> 
					<td height="3" bgcolor="#800000"></td>
				</tr>
				<tr> 
					<td height="71" background="../Resources/top_bg00.gif"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
							<tr> 
								<td>
								<img src="../Resources/top_logo.gif" width="126" height="48" border="0">
								</td>
								<td valign="bottom"><div align="right">
							</div></td>
							</tr>
						</table></td>
				</tr>
			</table>
			<table width="650" border="0" cellspacing="0" cellpadding="0">
				<tr> 
					<td height="25"></td>
				</tr>
				<tr> 
					<td>
    <asp:Image ID="Img_Error" runat="server" ImageUrl="~/Resources/img_erro.gif" /></td>
				</tr>
				<tr> 
					<td>&nbsp;</td>
				</tr>
				<tr> 
					<td align="center" style="text-align: right"><table border="0" cellspacing="0" cellpadding="0" style="width: 577px">
							<tr> 
								<td width="22" valign="top"><img src="../Resources/bl_t_010.gif" width="19" height="18"></td>
								<td width="600" style="text-align: left">
    &nbsp;
    <asp:Label ID="L_ErrorHeading" runat="server" Text="Label"></asp:Label></td>
							</tr>
							<tr> 
								<td height="15" colspan="2"> </td>
							</tr>
							<tr> 
								<td style="height: 136px">&nbsp;</td>
								<td style="height: 136px"><p style="margin-left:15; text-align: left;"><font color="#3366CC"><strong>
        <asp:Label ID="L_urlRequested" runat="server" Text="Label"></asp:Label></strong></font><br>
										<br>
        <asp:Label ID="L_Message" runat="server" Text="Label"></asp:Label>
        &nbsp;</td>
							</tr>
							<tr> 
								<td height="30" colspan="2"> </td>
							</tr>
						</table></td>
				</tr>
				<tr> 
					<td>&nbsp;</td>
				</tr>
			</table></td>
	</tr>
	<tr> 
		<td height="1" bgcolor="maroon"></td>
	</tr>
</table>
</body>
</html>
