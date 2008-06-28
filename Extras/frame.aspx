<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frame.aspx.cs" Inherits="_TEst_frame" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
        <link href="../Resources/adminstyle.css" rel="stylesheet" type="text/css" />
    <link href="../Resources/adminstyle.css" rel="stylesheet" type="text/css" />

</head>
<body style="background-color: #ffe8f2">
    <form id="form1" runat="server">
        <asp:ImageButton ID="IMG_AddLink" runat="server" ImageUrl="~/Resources/addBookmark.gif" OnClick="IMG_AddLink_Click" />
        <asp:HyperLink  ID="IMG_Label" runat="server" ImageUrl="~/Resources/bookMarkAdded.gif" Visible="False" NavigateUrl="~/Member/MyBookMark.aspx" Target="_blank" ></asp:HyperLink>
        <asp:HiddenField ID="HF_ID" runat="server" />
        <asp:HiddenField ID="HF_Type" runat="server" />
    </form>
</body>
</html>
