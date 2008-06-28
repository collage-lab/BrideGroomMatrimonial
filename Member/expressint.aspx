<%@ Page Language="C#" AutoEventWireup="true" CodeFile="expressint.aspx.cs" Inherits="Member_expressint" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<link rel="stylesheet" href="../Resources/bmstyle.css">
	
    <script type="text/javascript" language="JavaScript">
	    <!--
	    javascript:window.history.forward(1);
	    //-->

    </script>
    
   <script language="javascript">
      <!--
        function displayBlock() {
          if (document.getElementById('RB_T1').checked) 
          {
            document.getElementById('IB_Send').disabled = false;
            document.getElementById('L_Warning').innerText = " ";
          } 
          else if (document.getElementById('RB_T2').checked) 
          {
            document.getElementById('IB_Send').disabled = false;
            document.getElementById('L_Warning').innerText = " ";
          }
          else if (document.getElementById('RB_T3').checked) 
          {
            document.getElementById('IB_Send').disabled = false;
            document.getElementById('L_Warning').innerText = " ";
          }
          else if (document.getElementById('RB_T4').checked) 
          {
            document.getElementById('IB_Send').disabled = false;
            document.getElementById('L_Warning').innerText = " ";
          }
          else if (document.getElementById('RB_T5').checked) 
          {
            document.getElementById('IB_Send').disabled = false;
            document.getElementById('L_Warning').innerText = " ";
          }
          
          else 
          {
            document.getElementById('IB_Send').disabled = true;
            document.getElementById('L_Warning').innerText = "Please Select any option";
          }
        }
        -->
  </script>
</head>
	
	
<body topmargin="0" leftmargin="0" bgcolor="#ffffff" >
    <table border="1" cellpadding="4" cellspacing="0" bordercolor="#ffccff" style="width: 385px; height: 279px">
	<tbody>
	<tr>
	<td valign="top" style="height: 358px; width: 603px;">

		<form id="Form1" name="uploadForm"  runat ="server" onsubmit="return frmvalidate()">
            <div style="border-right: rgb(241,212,146) 1px solid; border-top: rgb(241,212,146) 1px solid;
                padding-left: 10px; float: left; padding-bottom: 10px; border-left: rgb(241,212,146) 1px solid;
                width: 561px; border-bottom: rgb(241,212,146) 1px solid; height: 336px; background-color: rgb(255,255,255)">
                <div class="leftmenuhead" style="color: rgb(239,111,31); padding-top: 10px">
                <asp:HiddenField ID="HF_ToID" runat="server" />
                    Express Interest</div>
                <div class="normaltxt1" style="padding-top: 5px; text-align: center">
                    <table>
                        <tr>
                            <td style="width: 25px">
                            </td>
                            <td style="width: 518px; text-align: justify">
                                Express Interest by sending pre-set messages to members for free. You will be intimated
                                by e-mail if someone is interested in you. Go ahead, select a message and send an
                                interest.</td>
                        </tr>
                    </table>
                </div>
                <div style="margin-top: 5px; font-size: 12pt; width: 566px; font-family: Times New Roman;
                    height: 55px">
                    <div style="padding-right: 5px; padding-left: 5px; float: left; padding-bottom: 5px;
                        width: 548px; padding-top: 5px; background-color: #fff0cb">
                        <asp:Label ID="L_Warning" runat="server" CssClass="forminput" Font-Bold="False" ForeColor="Red"
                            Text="Please Select any option"></asp:Label>
                        <table border="1" cellpadding="3" cellspacing="1" width="550" bordercolor="#339966">
                            <tbody>
                                <tr>
                                    <td style="width: 20px;">
                                        <asp:RadioButton ID="RB_T1" runat="server" CssClass="forminput" GroupName="mail" onclick="displayBlock();" /></td>
                                    <td style="font-size: 8pt; font-family: Verdana; height: 34px;" valign="middle">
                                        <font class="normaltxt1"><font color="#000000">I am interested in your profile. If you
                                            are interested in my profile, please contact me.</font></font></td>
                                </tr>
                                <tr>
                                    <td style="width: 20px; ">
                                        <asp:RadioButton ID="RB_T2" runat="server" CssClass="forminput" GroupName="mail" onclick="displayBlock();" /></td>
                                    <td style="font-size: 8pt; font-family: Verdana; height: 32px;" valign="middle">
                                        <font class="normaltxt1"><font color="#000000">I have gone through your details and
                                            feel we have lot in common. Would sure like to know your opinion on this?</font></font></td>
                                </tr>
                                <tr>
                                    <td style="width: 20px;">
                                        <asp:RadioButton ID="RB_T3" runat="server" CssClass="forminput" GroupName="mail" onclick="displayBlock();"/></td>
                                    <td valign="middle" style="height: 31px">
                                        <font class="normaltxt1"><font color="#000000">You are someone special I wish to know
                                            better. Please contact me at the earliest.</font></font></td>
                                </tr>
                                <tr>
                                    <td style="width: 20px;" >
                                        <asp:RadioButton ID="RB_T4" runat="server" CssClass="forminput" GroupName="mail" onclick="displayBlock();" /></td>
                                    <td style="height: 31px" valign="middle">
                                        <font class="normaltxt1"><font color="#000000">We found your profile to be a good match.
                                            Please contact us to proceed further.</font></font></td>
                                </tr>
                                <tr>
                                    <td style="width: 20px; ">
                                        <asp:RadioButton ID="RB_T5" runat="server" CssClass="forminput" GroupName="mail" onclick="displayBlock();" /></td>
                                    <td style="height: 19px" valign="middle">
                                        <font class="normaltxt1"><font color="#000000">You are the kind of person we were searching
                                            for. Please send us your contact details.</font></font></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="normaltxt1" style="padding-bottom: 5px; padding-top: 5px">
            &nbsp;</div>
                    <div style="padding-right: 5px; padding-left: 5px; float: left; padding-bottom: 5px;
                        width: 549px; padding-top: 5px; background-color: #ffe6e7; text-align: center">
                        <asp:ImageButton ID="IB_Send" runat="server" ImageUrl="~/Resources/button-send.gif" Enabled="False" /></div>
                </div>
                &nbsp;
            </div>
        </form></td></tr></tbody></table>
		
		
		
		
	

</body>

</html>
