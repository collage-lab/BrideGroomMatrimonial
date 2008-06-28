<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PaypalProcessing.aspx.cs" Inherits="PaypalProcessing" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Processing Paypal ...</title>
</head>
<body onload="document.Paypal.submit();">

		<!-- item_number should get passed back -->
		<form id="Paypal" name="Paypal" action="https://www.paypal.com/cgi-bin/webscr" method="post">
			
			<input type="hidden" name="cmd" value="_cart" />
			<input type="hidden" name="upload" value="1" />
			
			<input type="hidden" name="tax_cart" value="4.00" />
			
			<!-- STANDARD DATA -->
			<input type="hidden" name="business" value="sandbox@yourpaypalaccount.com" />
									
			<input type="hidden" name="invoice" value="1" />
			<input type="hidden" name="no_note" value="0" /> 
			<input type="hidden" name="currency_code" value="0" />
			<input type="hidden" name="return" value="<%=RetrunUrl() %>/ThankYou.aspx" />
			<input type="hidden" name="cancel_return" value="<%= WebConfig.GetValues(WebConfig.ConfigurationItem.sitename) %>" />
			<input type="hidden" name="email" value="sandbox@yourpaypalaccount.com" /> 
			<input type="hidden" name="cn" value="How did you hear about us?" />
           <input type="submit" value="Submit Payment Info" />
		</form>
	</body>
</html>