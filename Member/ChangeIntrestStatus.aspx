<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangeIntrestStatus.aspx.cs" Inherits="Member_ChangeIntrestStatus" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
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
            document.getElementById('L_Warning').innerText = "";
          } 
          else if (document.getElementById('RB_T2').checked) 
          {
            document.getElementById('IB_Send').disabled = false;
            document.getElementById('L_Warning').innerText = "";
          }
          else if (document.getElementById('RB_T3').checked) 
          {
            document.getElementById('IB_Send').disabled = false;
            document.getElementById('L_Warning').innerText = "";
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
	
	
<body topmargin="0" leftmargin="0" bgcolor="#ffffff" style="text-align: center" >
    <table border="1" cellpadding="4" cellspacing="0" bordercolor="#ffccff" style="width: 385px; height: 207px">
	        <tbody>
	            <tr>
	                <td valign="top">
		                <form id="Form1" name="uploadForm"  runat ="server" onsubmit="return frmvalidate()">
                            <div style="border-right: rgb(241,212,146) 1px solid; border-top: rgb(241,212,146) 1px solid;
                                padding-left: 10px; float: left; padding-bottom: 10px; border-left: rgb(241,212,146) 1px solid;
                                width: 561px; border-bottom: rgb(241,212,146) 1px solid; background-color: rgb(255,255,255); height: 217px;">
                                
                                <div class="leftmenuhead" style="color: rgb(239,111,31); padding-top: 10px; text-align: left;">
                                <asp:HiddenField ID="HF_ToID" runat="server" />
                                    Express Interest
                                </div>
                                <div class="normaltxt1" style="padding-top: 5px; text-align: center">
                                    <table>
                                        <tr>
                                            <td style="width: 25px">
                                            </td>
                                            <td style="width: 518px; text-align: justify">
                                                Some Caption</td>
                                        </tr>
                                    </table>
                                    </div>
                
                
                                <div class="normaltxt1" style="text-align: center">
                                    <br />
                                <table style=" font-size: 12pt; width: 566px; font-family: Times New Roman">
                    <tr><td>
                    
                    <div style=" float: left; 
                        width: 548px;  background-color: #fff0cb; text-align: left;">
                        
                        <asp:Label ID="L_Warning" runat="server" CssClass="forminput" Font-Bold="False" ForeColor="Red"
                            Text="Please Select any option"></asp:Label><strong><span style="font-size: 8pt"> </span>
                            </strong>
                        <table border="1" cellpadding="3" cellspacing="1" width="100%" bordercolor="#339966" style="font-weight: bold; font-size: 8pt">
                            <tbody>
                                <tr>
                                    <td style="width: 20px;">
                                        <asp:RadioButton ID="RB_T1" runat="server" CssClass="forminput" GroupName="mail" onclick="displayBlock();" /></td>
                                    <td style="font-size: 8pt; font-family: Verdana;" valign="middle">
                                        <font class="normaltxt1"><font color="#000000">Change Into Pending
                                            List.</font></font></td>
                                </tr>
                                <tr>
                                    <td style="width: 20px; ">
                                        <asp:RadioButton ID="RB_T2" runat="server" CssClass="forminput" GroupName="mail" onclick="displayBlock();" /></td>
                                    <td style="font-size: 8pt; font-family: Verdana; height: 32px;" valign="middle">
                                        <font class="normaltxt1"><font color="#000000"><strong>Accept </strong>Intrestreceived&nbsp;
                                            .</font></font></td>
                                </tr>
                                <tr>
                                    <td style="width: 20px;" >
                                        <asp:RadioButton ID="RB_T3" runat="server" CssClass="forminput" GroupName="mail" onclick="displayBlock();"/></td>
                                    <td valign="middle" >
                                        <font class="normaltxt1"><font color="#000000">
                                            <p class="MsoNormal" style="margin: 0in 0in 10pt; text-align: left;">
                                                <strong>
                                                Decline</strong> the interest you received 
                                            </p>
                                        </font></font></td>
                                </tr>

                            </tbody>
                        </table>
                        </div>
                        
                        </td></tr>
                        
                        <tr><td>
                                   

                
                          </td></tr></Table>
                                   

                
                          <asp:ImageButton ID="IB_Send" runat="server" ImageUrl="~/Resources/button-send.gif" Enabled="False" />&nbsp;</div>
                         </div>
                        </form>
                    </td>
                </tr>
            </tbody>
    </table>
</body>

</html>
