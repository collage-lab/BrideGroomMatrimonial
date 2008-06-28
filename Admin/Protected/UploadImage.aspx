<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UploadImage.aspx.cs" Inherits="UploadImage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head  runat="server">
    <title>Upload Your Photo....</title>
<link rel="stylesheet" href="../../Resources/bmstyle.css">




</head>
	
	
<body topmargin="2" leftmargin="0" bgcolor="#ffffff" bottommargin="0" rightmargin="0" scroll="no">
    <table bgcolor="#ff00ff" border="0" cellpadding="4" cellspacing="0" width="565" bordercolor="#ffccff" style="height: 227px">
	<tbody>
	<tr>
	<td valign="top" style="height: 268px">

		<form id="Form1" name="uploadForm"  runat ="server" onsubmit="return frmvalidate()">
        <div style="padding: 5px; width: 580px; float: left; background-color: rgb(253, 247, 235); height: 259px;">
	        <div style="border: 1px solid rgb(241, 212, 146); width: 568px; float: left; background-color: rgb(255, 255, 255); padding-left: 10px; padding-bottom: 10px; height: 245px;">
		<div class="leftmenuhead" style="color: rgb(239, 111, 31); padding-top: 10px;">
            Uplaod your photo</div>
		<div class="normaltxt1" style="padding-top: 5px; text-align: justify;">
		
		<table>
		<tr>
		<td style="width: 25px">
		</td>
		<td style="width: 518px">
		If your photo is not in GIF/JPG format or if the image size is more than 300KB, email your photos to 
            <asp:Label ID="L_PhotoMailID" runat="server" Text="photo@bridengroom.com"></asp:Label>
            with your Matrimony ID and Password. We will reduce the image size and upload it, absolutely FREE. If your photos are already uploaded, please indicate which photo you would like to replace.&nbsp;</td>
		</tr>
		</table>
		<b>
            <br />
            Select Your most resent photo </b></div>
		<div style="margin-top: 5px; width: 540px; height: 55px;">
			<div style="padding: 5px; float: left; width: 540px; background-color: #fff0cb;">
				<div class="normaltxt1" style="float: left; width: 177px; padding-left: 20px; padding-top: 3px; height: 24px;">
                    Select your image</div>
				<div class="normaltxt1" style="float: left;">:</div>
				<div class="normaltxt1" style="float: left; padding-left: 20px;" id="DIV1" language="javascript" onclick="return DIV1_onclick()">
                    <asp:FileUpload ID="File_Upload" runat="server" /></div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="File_Upload"
                    ErrorMessage="*"></asp:RequiredFieldValidator></div>


			<div class="normaltxt1" style="padding-top: 5px; padding-bottom: 5px;">

		

			<div style="padding: 5px; float: left; width: 540px; background-color: #ffe6e7; text-align: center;">
                <asp:ImageButton ID="IB_Upload" runat="server" ImageUrl="~/Resources/Upload-button.gif" /></div>

			</div>


		</div>		
		
	</div>
</div>
		</form></td></tr></tbody></table>
		
		
		
		
	

</body>
</html>
