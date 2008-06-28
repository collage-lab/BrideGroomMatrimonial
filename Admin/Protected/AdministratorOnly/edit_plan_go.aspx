<%@ Page Language="C#" AutoEventWireup="true" CodeFile="edit_plan_go.aspx.cs" Inherits="Admin_Protected_edit_plan_go" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Edit Plans</title>
<link href="../../../Resources/adminstyle.css" rel="stylesheet" type="text/css">

<script language="JavaScript">
<!-- 
function win(){
window.opener.location.href="MembershipPlan.aspx";
self.close();
//-->
}
</script>
</head>

<body style="text-align: center">
<table class="GreenBox" border="0" cellpadding="0" cellspacing="0" style="width: 339px; height: 356px">
  <tbody><tr>
    <td>
	<form runat ="server" method="post">
        <br />
	
	<table align="center" bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0"  width="100%" style="height: 335px">
	      <tbody><tr>
        <td width="3%">&nbsp;</td>
        <td colspan="2"><div align="center">
            <strong><span style="color: gray">EDIT MEMBERSHIP PLAN </span></strong>
            <asp:HiddenField ID="HF_Type" runat="server" /><br />
            <asp:Label ID="L_Display" runat="server" ForeColor="Red" Text="Setting Updated . ."
                Visible="False"></asp:Label></div></td>
        </tr>
      <tr>
        <td>&nbsp;</td>
        <td class="Partext1" style="width: 123px">Plan Display Name </td>
        <td style="width: 114px; text-align: left">
            <asp:TextBox ID="TB_PlneName" runat="server"></asp:TextBox></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td class="Partext1" style="width: 123px">No of Contacts </td>
        <td style="width: 114px; text-align: left">
            <asp:TextBox ID="TB_NoOfContacts" runat="server" ReadOnly="True"></asp:TextBox></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td class="Partext1" style="width: 123px">Plan Duration </td>
        <td style="width: 114px; text-align: left">
            <asp:TextBox ID="TB_PlaneDuration" runat="server" Width="69px"></asp:TextBox>
            Days</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td class="Partext1" style="width: 123px">Plan Amount </td>
        <td style="width: 114px; text-align: left">
            <asp:TextBox ID="TB_PlaneAmount" runat="server" Width="68px"></asp:TextBox>
            Rs</td>
      </tr>
      <tr>
        <td colspan="3"><div align="center">
            <asp:Button ID="B_Save" runat="server" CssClass="green-button" Height="24px" Text="Save" Width="81px"  />
            <input name="button" class="green-button" onclick="win();" value="Close me" type="button" style="width: 83px; height: 23px"></div></td>
        </tr>
     
     
		    </tbody></table>
	
	</form>
	</td>
  </tr>
</tbody></table>


</body></html>