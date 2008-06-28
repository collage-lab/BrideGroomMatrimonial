<%@ Page Language="C#" AutoEventWireup="true" CodeFile="invoice.aspx.cs" Inherits="Admin_Protected_invoice" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../../Resources/adminstyle.css" rel="stylesheet" type="text/css" />
<script>
        function hide(tag) {
	        if (document.getElementById) { //  Netscape, Mozilla, etc.
		        var state = document.getElementById(tag).style.display;
	        } else if (document.all) {     //  IE, Konqueror, etc.
		        var state = document.all[tag].style.display;
	        }
	        var newState = "";

	        if ( state == "block") {
		        newState = "none";
	        } else {
		        newState = "block";
	        }

	        if (document.getElementById) {
		        document.getElementById(tag).style.display = newState;
	        } else if (document.all) {
		        document.all[tag].style.display = newState;
	        }
        }

        function startPrinting() {
	        window.print();
	        location.reload();
        }
    </script>
</head>
<body>
<form>
        <table class="blackbox" align="center" border="0" cellpadding="5" cellspacing="1" width="83%">
          <tbody><tr>
            <td colspan="5"><div align="left"><img src="../../Resources/logo.gif"></div></td>
            </tr>
          <tr>
            <td colspan="5"><div align="center"><img src="../../Resources/invoice.gif" height="31" width="122"></div></td>
          </tr>
          <tr>
            <td valign="top" width="8%">Bill To : </td>
            <td width="43%">
              <span class="bodysg">
                  <asp:Label ID="L_CoustmerName_1" runat="server"></asp:Label></span></td>
            <td width="6%">&nbsp;</td>
            <td valign="top" width="16%"><div align="right">Ship To : </div></td>
            <td width="27%"><span class="bodysg">
                <asp:Label ID="L_CoustmerAddress_" runat="server" Text="Label"></asp:Label></span></td>
          </tr>
          
          <tr>
            <td colspan="2"><em>Payment mode : 
              Cash    </em></td>
            <td colspan="3"><div align="right">Date :<span class="Partext1"> 
                <asp:Label ID="L_Date" runat="server" Text="Label"></asp:Label>
            </span> </div></td>
          </tr>
          
          <tr>
            <td bgcolor="#d5d5d5" height="23"><div align="left"><strong>No</strong></div></td>
            <td bgcolor="#d5d5d5" height="23"><div align="center"><strong>Item</strong></div></td>
            <td bgcolor="#d5d5d5" height="23"><div align="center"><strong>Qty</strong></div></td>
            <td bgcolor="#d5d5d5"><div align="center"><strong>Unit Price</strong></div></td>
            <td bgcolor="#d5d5d5" height="23"><div align="center"><strong>Price</strong></div></td>
          </tr>
          <tr>
            <td bgcolor="#f5f5f5"><span class="Partext1">
                <asp:Label ID="L_SelNo" runat="server"></asp:Label></span></td>
            <td bgcolor="#f5f5f5">
              <span class="bodyp">
                  <asp:Label ID="L_PlanName" runat="server"></asp:Label>
                  Membership for 
                  <asp:Label ID="L_LifeTime" runat="server"></asp:Label>
                  days</span></td>
            <td bgcolor="#f5f5f5"><div align="center">1</div></td>
            <td bgcolor="#f5f5f5"><div align="center"><span class="Partext1">Rs.<asp:Label ID="L_Price_1" runat="server"></asp:Label>
            </span></div></td>
            <td bgcolor="#f5f5f5"><div align="center"><span class="Partext1">
                <asp:Label ID="L_Price_2" runat="server"></asp:Label></span></div></td>
          </tr>
          <tr>
            <td bgcolor="#f5f5f5">&nbsp;</td>
            <td bgcolor="#f5f5f5">&nbsp;</td>
            <td bgcolor="#f5f5f5">&nbsp;</td>
            <td bgcolor="#f5f5f5">&nbsp;</td>
            <td bgcolor="#f5f5f5">&nbsp;</td>
          </tr>
          <tr>
            <td bgcolor="#f5f5f5">&nbsp;</td>
            <td bgcolor="#f5f5f5">&nbsp;</td>
            <td bgcolor="#f5f5f5">&nbsp;</td>
            <td bgcolor="#f5f5f5">&nbsp;</td>
            <td bgcolor="#f5f5f5">&nbsp;</td>
          </tr>
          <tr>
            <td bgcolor="#f5f5f5">&nbsp;</td>
            <td bgcolor="#f5f5f5">&nbsp;</td>
            <td bgcolor="#f5f5f5">&nbsp;</td>
            <td bgcolor="#f5f5f5">&nbsp;</td>
            <td bgcolor="#f5f5f5">&nbsp;</td>
          </tr>
          <tr>
            <td bgcolor="#f5f5f5">&nbsp;</td>
            <td bgcolor="#f5f5f5">&nbsp;</td>
            <td bgcolor="#f5f5f5">&nbsp;</td>
            <td bgcolor="#f5f5f5">&nbsp;</td>
            <td bgcolor="#f5f5f5">&nbsp;</td>
          </tr>
          <tr>
            <td bgcolor="#f5f5f5">&nbsp;</td>
            <td bgcolor="#f5f5f5">&nbsp;</td>
            <td bgcolor="#f5f5f5">&nbsp;</td>
            <td bgcolor="#f5f5f5">&nbsp;</td>
            <td bgcolor="#f5f5f5">&nbsp;</td>
          </tr>
          <tr>
            <td bgcolor="#f5f5f5">&nbsp;</td>
            <td bgcolor="#f5f5f5">&nbsp;</td>
            <td bgcolor="#f5f5f5">&nbsp;</td>
            <td bgcolor="#f5f5f5">&nbsp;</td>
            <td bgcolor="#f5f5f5">&nbsp;</td>
          </tr>
          <tr>
            <td bgcolor="#ece9d8">&nbsp;</td>
            <td bgcolor="#ece9d8">&nbsp;</td>
            <td bgcolor="#ece9d8">&nbsp;</td>
            <td bgcolor="#ece9d8"><div align="right"><strong>Total</strong></div></td>
            <td bgcolor="#ece9d8"><div align="center"><span class="Partext1">Rs.<asp:Label ID="L_Price_3" runat="server" Text="Label" Font-Bold="True"></asp:Label></span></div></td>
          </tr>
        </tbody>
        </table>
        <!-- Hides When Printer Starts printing -->
        <div id="prin-off" style="display: block; text-align: center;">
            <br />
            <a href="javascript:hide('print-off2');hide('prin-on2');hide('prin-off');hide('prin-on');startPrinting()" class="text"><img src="../../Resources/print.gif" border="0"></a>
        </div>
        <!-- Displays When Printer Starts printing -->
        <div id="prin-on" style="display: none;">
        </div>
      </form>

</body>
</html>
