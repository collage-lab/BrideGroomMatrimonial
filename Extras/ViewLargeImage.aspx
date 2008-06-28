<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewLargeImage.aspx.cs" Inherits="Extras_ViewLargeImage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Large image</title>
    <link href="../Resources/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" language="JavaScript">
<!--
function display(){
        var height = document.getElementById('Img_image').offsetHeight;
        var Width = document.getElementById('Img_image').offsetWidth;
        height = height+180;
        Width = Width+170;
        window.resizeTo(Width,height);
    }
//-->
</script>
</head>
<body onload ="display()">
    <form id="form1" runat="server">
    <div style="border:1,3,#ffedff; position: relative; top: 10px;">
        <table width="100%" border="0" class="submenubox" height="100%">
            <tr>
                <td style="width: 20%; height: 24px; text-align: right;" >
                    <asp:ImageButton ID="IB_Pre" runat="server" ImageUrl="~/Resources/previ.gif" OnClick="IB_Pre_Click" />
                    &nbsp;
                </td>
                <td style="width: 60%; height: 24px;">
                    Matrimonila ID :
                    <asp:Label ID="L_MatID" runat="server" Font-Bold="True"></asp:Label>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                    <br />
                    Photo ID :
                    <asp:Label ID="L_PhotoID" runat="server" Font-Bold="True"></asp:Label>&nbsp;
                </td>
                <td style="width: 20%; height: 24px;">
                    &nbsp;
                    <asp:ImageButton ID="IB_Next" runat="server" ImageUrl="~/Resources/next.gif" OnClick="IB_Next_Click" /></td>
            </tr>
            <tr>
                <td style="width: 20%">
                </td>
                <td style="width: 60%; text-align: center;">
                    <asp:Image ID="Img_image" runat="server" /></td>
                <td style="width: 20%">
                </td>
            </tr>
            <tr>
                <td style="width: 20%; height: 24px;">
                    <asp:HiddenField ID="HF_ID" runat="server" />
                </td>
                <td style="width: 60%; height: 24px; text-align: center;">
                    
                    <img alt="Close Me" src="../Resources/button-closeme.gif" onclick="javascript:window.close();" /></td>
                <td style="width: 20%; height: 24px;">
                    <asp:HiddenField ID="HF_Type" runat="server" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
