<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RFrame.aspx.cs" Inherits="Member_RFrame" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
<style>
    body {
    padding : 0;
    margin : 0;
    line-height : 1.2em;
    background : #fff;
    color:#000000;
    leftmargin="0"; 
    topmargin="0"; 
    marginwidth="0";
    marginheight="0";
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ImageButton ID="IMG_Grand" runat="server" ImageUrl="~/Resources/GrandPermision.gif" OnClick="IMG_Grand_Click" /><asp:Image ID="IMG_Granted" runat="server" ImageUrl="~/Resources/Granted.gif" Visible="False" /><asp:HiddenField ID="HF_ID" runat="server" /><asp:HiddenField ID="HF_Type" runat="server" />
    </form>
</body>
</html>

