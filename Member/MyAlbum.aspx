<%@ Page Language="C#" MasterPageFile="~/Member/MemberMaster.master" AutoEventWireup="true" CodeFile="MyAlbum.aspx.cs" Inherits="Member_MyAlbum" Title="MY Album" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPH_Member" Runat="Server">

<script language="javascript">
function detectPopupBlocker() {
	var myTest = window.open("about:blank","","directories=no,height=100,width=100,menubar=no,resizable=no,scrollbars=yes,status=no,titlebar=no,top=0,location=no");
	if (!myTest) 
	{
		alert("A popup blocker was detected. Please disable your popup blocker before you click Submit.");
	} 
	else 
	{
		myTest.close();
	} 
}
detectPopupBlocker();
</script>
<%--onload="detectPopupBlocker();"--%>
<table align="center" border="0" cellpadding="0" cellspacing="0" height="20" width="97%" >
                                                    <tbody>
                                                        <tr>
                                                            <td background="../Resources/heading_bg.gif" width="37%">
                                                                <div align="left">
                                                                    &nbsp; <span class="bodysg"><span class="bodysg">Manage Photo</span></span></div>
                                                            </td>
                                                            <td width="63%">
                                                                &nbsp;</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                             
                                            <table align="center" border="0" cellpadding="0" cellspacing="0" class="submenubox"
                                                    width="97%">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <table width ="100%">
                                                                    <tr>
                                                                        <td>
                                                                            <asp:HyperLink ID="HL_Photo_1" runat="server" ImageUrl="~/Resources/nophoto.gif"></asp:HyperLink></td>
                                                                        <td>
                                                                            <asp:HyperLink ID="HL_Album_1" runat="server" ImageUrl="~/Resources/paidphoto.gif">Album - 1</asp:HyperLink></td>
                                                                        <td>
                                                                            <asp:HyperLink ID="HL_Album_2" runat="server" ImageUrl="~/Resources/paidphoto.gif">Album - 2</asp:HyperLink></td>
                                                                        <td>
                                                                            <asp:HyperLink ID="HL_Album_3" runat="server" ImageUrl="~/Resources/paidphoto.gif">Album-3</asp:HyperLink></td>
                                                                        
                                                                    </tr>  
                                                                    <tr>
                                                                        <td>
                                                                            &nbsp;<asp:HyperLink ID="HL_UP_1" runat="server" ImageUrl="~/Resources/UploadPhoto.gif"
                                                                                NavigateUrl="#" ToolTip="Upload Image">Upload Image</asp:HyperLink>
                                                                            </td>
                                                                        <td>
                                                                            <asp:HyperLink ID="HL_UP_2" runat="server" ImageUrl="~/Resources/UploadPhoto.gif"
                                                                                NavigateUrl="#" ToolTip="Upload Image" Visible="False">Upload Image</asp:HyperLink>
                                                                            </td>
                                                                        <td>
                                                                            <asp:HyperLink ID="HL_UP_3" runat="server" ImageUrl="~/Resources/UploadPhoto.gif"
                                                                                NavigateUrl="#" ToolTip="Upload Image" Visible="False">Upload Image</asp:HyperLink>
                                                                            </td>
                                                                        <td>
                                                                            &nbsp;<asp:HyperLink ID="HL_UP_4" runat="server" ImageUrl="~/Resources/UploadPhoto.gif"
                                                                                NavigateUrl="#" ToolTip="Upload Image" Visible="False">Upload Image</asp:HyperLink>
                                                                            </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            &nbsp;
                                                                            <asp:HyperLink ID="HL_Del_1" runat="server" ImageUrl="~/Resources/DeletePhoto.gif"
                                                                                ToolTip="Delete Image" 
                                                                                onclick = "window.open('DeletefromAlbum.aspx?image=1','Delete','scrollbars=no,width=600,height = 277')" NavigateUrl="#" Visible="False">Delete Image</asp:HyperLink></td>
                                                                        <td>
                                                                            &nbsp;<asp:HyperLink ID="HL_Del_2" runat="server" ImageUrl="~/Resources/DeletePhoto.gif"
                                                                                onclick="window.open('DeletefromAlbum.aspx?image=2','Delete','scrollbars=no,width=600,height = 277')" 
                                                                                ToolTip="Delete Image" NavigateUrl="#" Visible="False">Delete Image</asp:HyperLink>&nbsp;</td>
                                                                        <td>
                                                                            &nbsp;
                                                                            <asp:HyperLink ID="HL_Del_3" runat="server" ImageUrl="~/Resources/DeletePhoto.gif"
                                                                                onclick="window.open('DeletefromAlbum.aspx?image=3','Delete','scrollbars=no,width=600,height = 277')" 
                                                                                ToolTip="Delete Image" NavigateUrl="#" Visible="False">Delete Image</asp:HyperLink>&nbsp;</td>
                                                                        <td>
                                                                            &nbsp;&nbsp;
                                                                            <asp:HyperLink ID="HL_Del_4" runat="server" ImageUrl="~/Resources/DeletePhoto.gif"
                                                                                onclick="window.open('DeletefromAlbum.aspx?image=4','Delete','scrollbars=no,width=600,height = 277')" 
                                                                                ToolTip="Delete Image" NavigateUrl="#" Visible="False">Delete Image</asp:HyperLink>&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            </td>
                                                                        <td>
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>

</asp:Content>

