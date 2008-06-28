<%@ Page Language="C#" MasterPageFile="~/Payment/PaymentMaster.master" AutoEventWireup="true" CodeFile="PayPalCheckOut.aspx.cs" Inherits="Payment_PayPalCheckOut" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="GuestContent" Runat="Server">
document.Paypal.submit();
    <h1 style="text-align: left">
        <span style="font-size: 11pt; color: #990099">
        Check Out Form</span></h1>
    <form id="Paypal" name="Paypal" action="https://www.paypal.com/cgi-bin/webscr" method="post">
        <b>Billing Info:</b>
        <table>
            <tr>
                <td style="width: 148px; text-align: left;">
                    Your FULL Name *</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtBillingName" runat="server" MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" ControlToValidate="txtBillingName"
                        ErrorMessage="Your FULL Name  is REQUIRED"></asp:RequiredFieldValidator></td>
            </tr>
            <tr style="color: #000000">
                <td style="width: 148px; text-align: left;">
                    Phone *</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtBillingPhone" runat="server" MaxLength="25"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqPhone" runat="server" ControlToValidate="txtBillingPhone"
                        ErrorMessage="Billing Phone # is REQUIRED"></asp:RequiredFieldValidator></td>
            </tr>
            <tr style="color: #000000">
                <td style="width: 148px; text-align: left;" valign="top">
                    Email *</td>
                <td>
                    <p style="text-align: left">
                        <asp:TextBox ID="txtBillingEmail" runat="server" MaxLength="255" Width="222px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqEmail" runat="server" ControlToValidate="txtBillingEmail"
                            ErrorMessage="Billing Email  is REQUIRED"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ControlToValidate="txtBillingEmail"
                            ErrorMessage="Billing Email doesn't look right." ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*[ ]*$"></asp:RegularExpressionValidator></p>
                </td>
            </tr>
            <!-- only display the rest if it is Wells Fargo -->
            <tr style="color: #000000">
                <td style="width: 148px; text-align: left;">
                    Addres<strong>s *</strong></td>
                <td style="font-weight: bold; text-align: left">
                    <asp:TextBox ID="txtBillingAddress1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" ControlToValidate="txtBillingAddress1"
                        ErrorMessage="Billing Address is REQUIRED"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 148px; text-align: left;">
                    Address 2</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtBillingAddress2" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 148px; text-align: left;">
                    City *</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtBillingCity" runat="server" MaxLength="40"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Requiredfieldvalidator4" runat="server" ControlToValidate="txtBillingCity"
                        ErrorMessage="Billing City or County  is REQUIRED"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 148px; text-align: left;">
                    State/Province *</td>
                <td style="text-align: left">
                    <asp:DropDownList ID="cboBillingState" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 148px; text-align: left;">
                    ZIP *</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtBillingZip" runat="server" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Requiredfieldvalidator6" runat="server" ControlToValidate="txtBillingZip"
                        ErrorMessage="Billing ZIP  is REQUIRED"></asp:RequiredFieldValidator></td>
            </tr>
        </table>
        <br />
        <b>Ship To: &nbsp;</b>&nbsp;
        <table>
            <tr>
                <td style="width: 164px; text-align: left;">
                    Name *</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtShipToName" runat="server" MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqName" runat="server" ControlToValidate="txtShipToName"
                        ErrorMessage="Ship To Name is REQUIRED"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 164px; text-align: left;">
                    Address *</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtShipToAddress1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqAddress" runat="server" ControlToValidate="txtShipToAddress1"
                        ErrorMessage="Ship To Address is REQUIRED"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 164px; text-align: left;">
                    Address 2</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtShipToAddress2" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 164px; text-align: left;">
                    City *</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtShipToCity" runat="server" MaxLength="40"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqCity" runat="server" ControlToValidate="txtShipToCity"
                        ErrorMessage="Ship To City or County  is REQUIRED"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 164px; text-align: left;">
                    State/Province *</td>
                <td style="text-align: left">
                    <asp:DropDownList ID="cboShipToState" runat="server" AutoPostBack="True">
                        
      </asp:DropDownList></td>
            </tr>
            <tr>
                <td style="width: 164px; text-align: left;">
                    ZIP *</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtShipToZip" runat="server" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqZip" runat="server" ControlToValidate="txtShipToZip"
                        ErrorMessage="Ship To ZIP is REQUIRED"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 164px">
                </td>
                <td style="text-align: left">
                </td>
            </tr>
            <tr>
                <td style="width: 164px">
                </td>
                <td style="text-align: left">
                    <asp:Button ID="B_PayPal" runat="server" OnClick="Button1_Click" Text="Button" />
            </tr>
        </table>
        &nbsp;<br />
        &nbsp;</form>

</asp:Content>

