<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DeletefromAlbum.aspx.cs" Inherits="Member_DeletefromAlbum" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1"  runat="server">
    <title>Delete Your Photo....</title>
    
<link rel="stylesheet" href="../../Resources/bmstyle.css">
    <script type="text/javascript" language="JavaScript">
	    <!--
	    javascript:window.history.forward(1);
	    //-->

    </script>
    
     <script language="javascript">
      <!--
        function displayBlock() {
          if (document.getElementById('CB_Delete').checked) 
          {
            document.getElementById('IB_Upload').disabled = false;
            document.getElementById('L_Warning').innerText = " ";
          } else 
          {
            document.getElementById('IB_Upload').disabled = true;
            document.getElementById('L_Warning').innerText = "You need to conform deletion";
          }
        }
        -->
  </script>


</head>
	
	
<body topmargin="0" leftmargin="0" bgcolor="#ffffff" >
    <table bgcolor="#ff00ff" border="0" cellpadding="4" cellspacing="0" width="565" bordercolor="#ffccff" style="height: 227px">
	<tbody>
	<tr>
	<td valign="top" style="height: 268px">

		<form id="Form1" name="uploadForm"  runat ="server" onsubmit="return frmvalidate()">
        <div style="padding: 5px; width: 580px; float: left; background-color: rgb(253, 247, 235); height: 259px;">
	        <div style="border: 1px solid rgb(241, 212, 146); width: 568px; float: left; background-color: rgb(255, 255, 255); padding-left: 10px; padding-bottom: 10px; height: 245px;">
		<div class="leftmenuhead" style="color: rgb(239, 111, 31); padding-top: 10px;">
            Delete your photo</div>
		<div class="normaltxt1" style="padding-top: 5px; text-align: justify;">
		
		<table style="height: 67px">
		<tr>
		<td style="width: 25px">
		</td>
		<td style="width: 518px">
		If you any some technicalproblem for deleting your image from your album, email your photo-password 
		alongwith your Matrimony ID &amp; please indicate which photo you would like to delete to
            <asp:Label ID="L_PhotoMailID" runat="server" Text="photo@bridengroom.com"></asp:Label>
            .</td>
		</tr>
		</table>
		<b>
            <br />
            &nbsp;Check the box for conforminig deletion&nbsp;</b></div>
		<div style="margin-top: 5px; width: 540px; height: 55px;">
			<div style="padding: 5px; float: left; width: 540px; background-color: #fff0cb;">
				<div class="normaltxt1" style="float: left; width: 101px; padding-left: 20px; padding-top: 3px; height: 24px; text-align: center;">
                    <asp:Label ID="L_PhotoID" runat="server" Font-Bold="True" Text="Label"></asp:Label></div>
				<div class="normaltxt1" style="float: left;">:</div>
				<div class="normaltxt1" style="float: left; padding-left: 20px; height: 24px; width: 329px;" id="DIV1" language="javascript" onclick="return DIV1_onclick()">
                    <asp:CheckBox ID="CB_Delete" runat="server" Text=" Yes I Need to delete this image from my album" onclick="displayBlock();"/><br />
                    &nbsp; &nbsp; &nbsp;
                    <asp:Label ID="L_Warning" runat="server" Font-Bold="False" ForeColor="Red" Text="You need to conform deletion"></asp:Label></div>
                </div>


			<div class="normaltxt1" style="padding-top: 5px; padding-bottom: 5px;">

		

			<div style="padding: 5px; float: left; width: 540px; background-color: #ffe6e7; text-align: center;">
                <asp:ImageButton ID="IB_Upload" runat="server" ImageUrl="~/Resources/delete-button.gif" /></div>

			</div>


		</div>		
		
	</div>
</div>
		</form></td></tr></tbody></table>
		
		
		
		
	

</body>
</html>
