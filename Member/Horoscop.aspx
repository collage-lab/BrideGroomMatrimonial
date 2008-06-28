<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Horoscop.aspx.cs" Inherits="Member_Horoscop" %>


<%@ Register Src="../WeBControls/MemberLeftPanel.ascx" TagName="MemberLeftPanel"
    TagPrefix="uc1" %>

<%@ Register Src="../WeBControls/Footer_M.ascx" TagName="Footer_M" TagPrefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Manage Horoscop</title>

<link href="../Resources/style.css" rel="stylesheet" type="text/css">
    <link href="../Resources/style.css" rel="stylesheet" type="text/css" />
    <link href="../Resources/style.css" rel="stylesheet" type="text/css" />
    
      <script language="javascript">
  <!--
    function displayBlockHoro() {
      if (document.getElementById('RB_H_Yes').checked) {
        document.getElementById('TB_Password').disabled = false;
        document.getElementById('TB_Password_C').disabled = false;
        document.getElementById('TB_Password').style.backgroundColor = "#FFFFFF" ;
        document.getElementById('TB_Password_C').style.backgroundColor = "#FFFFFF" ;

      } else {
        document.getElementById('TB_Password').disabled = true;
        document.getElementById('TB_Password_C').disabled = true;
        document.getElementById('TB_Password').style.backgroundColor = "#E0E0E0";
        document.getElementById('TB_Password_C').style.backgroundColor = "#E0E0E0";
      }
    }
    -->
 </script>

    <link href="../Resources/style.css" rel="stylesheet" type="text/css" />
</head>
<body class="body" bgcolor="#cccccc">
        <div align="center">
             <table class="BlueTborder" align="center" border="0" cellpadding="0" cellspacing="0" width="780">
                      <tbody>               
                            <tr>
                                <td bgcolor="#ffffff" height="76" style="text-align: left">
                                    <img border="0" src="../Resources/logo.gif" />
                                </td>
                            </tr>
                
                            <tr>
                                <td colspan="2" style="height: 31px">		<!-- MEMBER LOGGED IN -->
		                            <img src="../Resources/logintopmenu.jpg" usemap="#Map2" border="0" height="29" width="780">
		                                <map name="Map2" id="Map2">
		                                    <area shape="rect" coords="0,1,128,26"href="../Member/Profile.aspx"alt="My Matri">
		                                    <area shape="rect" coords="134,1,262,26" href="../Member/membersearchoption.aspx" alt="Partner Search Options">
		                                    <area shape="rect" coords="287,2,427,27" href="Interests.aspx" alt="My Interest">
		                                    <area shape="rect" coords="448,2,538,25" href="Messages.aspx" alt="My Message">
		                                    <area shape="rect" coords="567,2,678,25" href="Membership.aspx" alt="My Membership">
		                                    <area shape="rect" coords="696,4,763,24" href="logout.aspx" alt="Logout">
		                                </map>
                                 </td>
                              </tr>
                              <tr bgcolor="#ffffff">
                                <td colspan="2" valign="top">
                                 <%--START LEFT PART --%>
                                    <div align="center">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tbody><tr>
                                    <td bgcolor="#ffefed" height="303" valign="top" style="width: 180px">
                                        &nbsp;<br />
                                        <br />
                                        <uc1:MemberLeftPanel ID="MemberLeftPanel1" runat="server" />
                                        <br />
                                        <br />
                                        <br />

                               
                                    </td>
                                    <td valign="top"><br>
                                    
                                    
                                      <%--Content Starts--%>

                                        <table align="center" border="0" cellpadding="0" cellspacing="0" height="20" width="97%">
                                            <tbody>
                                                <tr>
                                                    <td background="../Resources/heading_bg.gif" width="37%">
                                                        <div align="left">
                                                            &nbsp; <span class="bodysg"><span class="bodysg">Submit Sucess Story</span></span></div>
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
                                                        <form id="form"  runat="server" name="form" onsubmit="return validate()">
                                                            <table align="center" border="0" cellpadding="2" cellspacing="2" width="97%">
                                                                <tbody>
                                                                    <tr>
                                                                        <td colspan="2" style="height: 17px; text-align: left">
                                                                            <asp:Label ID="L_State" runat="server" Font-Bold="True" ForeColor="#FF0066"></asp:Label></td>
                                                                    </tr>
                                                             <tr>
                                                                        <td colspan="2" style="height: 17px; text-align: justify; background-color: #fff2ff;">
                                                                            If you wish to protect your Horoscope and show it only to select members, you can
                                                                            use this feature. Only paid members can protect their horoscope.</td>
                                                                    </tr>
                                                                                                         <tr>
                                                                        <td style="width: 143px; text-align: left;">
                                                                            &nbsp; &nbsp; &nbsp; Protect Horoscope</td>
                                                                        <td style="text-align: left">
                                                                            &nbsp;<asp:RadioButton ID="RB_H_yes" runat="server" CssClass="forminput" GroupName="Horoscope"
                                                                                Text="Yes" Enabled="False" onclick="displayBlockHoro();" />&nbsp;
                                                                                <asp:RadioButton ID="RB_H_No" runat="server" Checked="True" CssClass="forminput"
                                                                                    GroupName="Horoscope" Text="No" onclick="displayBlockHoro();" /></td>
                                                                    </tr>
                                                                    
                                                                                                   <tr>
                                                                        <td colspan="2" style="height: 17px; text-align: justify; background-color: #fff2ff;">
                                                                            If yes, please enter a password. Your photo password must be different from your
                                                                            profile password.</td>
                                                                    </tr>                      
                                                                     <tr>
                                                                        <td style="width: 143px; text-align: left;">
                                                                            &nbsp; &nbsp; Password</td>
                                                                        <td style="text-align: left">
                                                                            <asp:TextBox ID="TB_Password" runat="server" CssClass="forminput" MaxLength="50" Width="221px" Enabled="False" BackColor="#E0E0E0" >This Sirvice is only for paid members</asp:TextBox></td>
                                                                    </tr>
                                                                     <tr>
                                                                        <td style="width: 143px; text-align: left;">
                                                                            <span class="style1" style="color: #ff0000">&nbsp; &nbsp;&nbsp;<span style="color: #000000">Conform Password</span></span></td>
                                                                        <td style="text-align: left">
                                                                            <asp:TextBox ID="TB_Password_C" runat="server" CssClass="forminput" Width="221px" Enabled="False" BackColor="#E0E0E0">This Sirvice is only for paid members</asp:TextBox>
                                                                            <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="TB_Password"
                                                                                ControlToValidate="TB_Password_C" ErrorMessage="*"></asp:CompareValidator></td>
                                                                    </tr>
                                                                     <tr>
                                                                        <td style="width: 143px; text-align: left;">
                                                                            <span class="style1" style="color: #ff0000">&nbsp;*</span> Horoscope
                                                                            &nbsp;&nbsp;</td>
                                                                        <td style="text-align: left">
                                                                            <input id="File_Image" runat="server" class="forminput" type="file" style="width: 295px; height: 22px;" />
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="File_Image"
                                                                                ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                                                    </tr>
                                                                    <tr>
                                                                    <td></td>
                                                                        <td style="text-align: left" >
                                                                            <asp:ImageButton ID="IMB_Search" runat="server" ImageUrl="~/Resources/button-Save.gif" />
                                                                            <asp:HyperLink ID="HL_Delete" runat="server" ImageUrl="~/Resources/delete-button.gif"
                                                                            onclick="window.open('DeletefromAlbum.aspx?image=5','Delete','scrollbars=no,width=600,height = 277')" 
                                                                                NavigateUrl="#" Visible="False">Delete Horoscope</asp:HyperLink></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            </td>
                                                                    </tr>
                                                                         <tr>
                                                                        <td style="width: 143px">
                                                                            &nbsp;</td>
                                                                        <td style="text-align: left">
                                                                            </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                   
   
                                    
                                       <%--Content Ends--%>
                                      
                                        <br />
                                    </td>
                                    </tr>
                                    </tbody></table>

                                    </div>
                                    <%--END LEFT PART--%> 	
		                        </td>
                        </tr>
                              <tr>
                                <td style="height: 105px">
                                    <uc3:Footer_M ID="Footer_M1" runat="server" />
                                 </td>
                              </tr>
                              <tr> </tr>
                              <tr></tr>
                    </tbody>
            </table>
        </div>
</body>
</html>
