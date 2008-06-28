<%@ Page Language="C#" AutoEventWireup="true" CodeFile="referafriend.aspx.cs" Inherits="referafriend" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>Bride & groom Matrimony</title>

		<link rel="shortcut icon" href="../Resources/icon.ico">
<link rel="stylesheet" href="../Resources/bmstyle.css">
<link rel="stylesheet" href="../Resources/style.css">

	
</head>
	
	
<body topmargin="0" leftmargin="0" bgcolor="#ffffff" >
    <table class="brownpopclr" bgcolor="#ffffff" border="0" cellpadding="4" cellspacing="0" height="450" width="565" bordercolor="#ffcccc">
	<tbody><tr><td valign="top">

		<form id="Form1" name="ForwFriendForm" method="post" runat ="server" onsubmit="return frmvalidate()">
<div style="padding: 5px; width: 580px; float: left; background-color: rgb(253, 247, 235);">
	<div style="border: 1px solid rgb(241, 212, 146); width: 568px; float: left; background-color: rgb(255, 255, 255); padding-left: 10px; padding-bottom: 10px;">
		<div class="leftmenuhead" style="color: rgb(239, 111, 31); padding-top: 10px;">
            Invite a friend</div>
		<div class="normaltxt1" style="padding-top: 5px;"><b>Fill the form below to send an invitation to someone you know.</b></div>

		<div class="normaltxt1" style="padding-top: 15px;"><b>From</b></div>
		<div style="margin-top: 5px; width: 540px;">
			<div style="padding: 5px; float: left; width: 540px; background-color: #fff0cb;">
				<div class="normaltxt1" style="float: left; width: 240px; padding-left: 20px; padding-top: 3px;">Your Name</div>
				<div class="normaltxt1" style="float: left;">:</div>
				<div class="normaltxt1" style="float: left; padding-left: 20px; text-align: left;">
                    <asp:TextBox ID="TB_SName" runat="server" Width="200px" CssClass="forminput"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_SName"
                        ErrorMessage="*"></asp:RequiredFieldValidator>&nbsp;
                </div>
			</div>

			<div style="padding: 5px; float: left; width: 540px; background-color: #ffe6e7;">
				<div class="normaltxt1" style="float: left; width: 240px; padding-left: 20px; padding-top: 3px;">Your E-mail ID</div>
				<div class="normaltxt1" style="float: left;">:</div>
				<div class="normaltxt1" style="float: left; padding-left: 20px;">
                    <asp:TextBox ID="TB_SEmail" runat="server" Width="200px" CssClass="forminput"></asp:TextBox>&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TB_SEmail"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="TB_SEmail"
                        Display="Dynamic" ErrorMessage="Invalid email address                   " ValidationExpression="[\w-]+([\+\.][\w-]*)?@([\w-]+\.)+[\w-]+"></asp:RegularExpressionValidator></div>
			</div>


			<div class="normaltxt1" style="padding-top: 5px; padding-bottom: 5px;"><b>To</b></div>

			<div style="padding: 5px; float: left; width: 540px; background-color: #ffe6e7;">
				<div class="normaltxt1" style="float: left; width: 240px; padding-left: 20px; padding-top: 3px;">Recipient Name</div>
				<div class="normaltxt1" style="float: left;">:</div>
				<div class="normaltxt1" style="float: left; padding-left: 20px;">
                    <asp:TextBox ID="TB_RName" runat="server" Width="200px" CssClass="forminput"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TB_RName"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                </div>
			</div>

			<div style="padding: 5px; float: left; width: 540px; background-color: rgb(251, 238, 214);">
				<div class="normaltxt1" style="float: left; width: 240px; padding-left: 20px; padding-top: 3px;">Recipient's E-mail ID<br><!-- <font color="#7E7B75">(If multiple recipients, <br>separate E-mail IDs with comma)</font> --></div>
				<div class="normaltxt1" style="float: left;">:</div>
				<div class="normaltxt1" style="float: left; padding-left: 20px;">
                    <asp:TextBox ID="TB_REMail" runat="server" Width="200px" CssClass="forminput"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TB_REMail"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TB_REMail"
                        Display="Dynamic" ErrorMessage="Invalid email address                   " ValidationExpression="[\w-]+([\+\.][\w-]*)?@([\w-]+\.)+[\w-]+"></asp:RegularExpressionValidator>
                </div>
			</div>

		

			<div style="padding: 5px; float: left; width: 540px; background-color: #ffe6e7;">
				<div class="normaltxt1" style="float: left; width: 240px; padding-left: 20px; padding-top: 3px;">Message/Comments <br><font color="#7e7b75">(Maximum 200 characters)</font></div>
				<div class="normaltxt1" style="float: left;">:</div>
				<div class="normaltxt1" style="float: left; padding-left: 20px;">
                    <asp:TextBox ID="TB_Message" runat="server" Height="106px" TextMode="MultiLine" MaxLength="200" CssClass="forminput" Width="200px"></asp:TextBox>
                <asp:TextBox ID="txtCount" runat="server" BackColor="Transparent" BorderColor="#E0E0E0"
                    BorderStyle="None" BorderWidth="1px" ForeColor="Red" ReadOnly="True" ToolTip="reminig letters"
                    Width="21px">200</asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TB_Message"
                        ErrorMessage="Write Some message"></asp:RequiredFieldValidator>
                    &nbsp;
                </div>
                </div>

			<div style="float: left; width: 550px ! important; background-color: #ffcccc; text-align: center;">
                &nbsp;
                <asp:ImageButton ID="IB_Submit" runat="server" ImageUrl="~/Resources/button-forward.gif" /></div>


		</div>		
		
	</div>
</div>
		</form></td></tr></tbody></table>
		
		
		
		
	

</body>
</html> 
