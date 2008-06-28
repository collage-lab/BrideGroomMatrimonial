

<%@ Register Src="../WeBControls/MemberLeftPanel.ascx" TagName="MemberLeftPanel" TagPrefix="uc1" %>

<%@ Register Src="../WeBControls/Footer_M.ascx" TagName="Footer_M" TagPrefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Delete Matrimonial Account</title>

<link href="../Resources/style.css" rel="stylesheet" type="text/css">
<script language="javascript">  
  <!--
    function displayBlock() {
      if (document.getElementById('CB_Del_acc').checked) {
        document.getElementById('TB_Password_OLd').disabled = false;
        document.getElementById('TB_Password_OLd').style.backgroundColor = "#FFFFFF";
        document.getElementById('IB_Submit').disabled = false;
      } else {
        document.getElementById('TB_Password_OLd').disabled = true;
        document.getElementById('TB_Password_OLd').style.backgroundColor = "#E0E0E0";
        document.getElementById('IB_Submit').disabled = true;
      }
    }
    -->
  </script>

    <link href="../Resources/style.css" rel="stylesheet" type="text/css" />
    <link href="../Resources/style.css" rel="stylesheet" type="text/css" />
    <link href="../Resources/style.css" rel="stylesheet" type="text/css" />
    <link href="../Resources/style.css" rel="stylesheet" type="text/css" />
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
                                        <br />

                               
                                    </td>
                                    <td valign="top">
                                        <br />
                                        <br>
                                    
                                    
                                      <%--Content Starts--%>
   
                                            <table align="center" border="0" cellpadding="0" cellspacing="0" height="20" width="97%">
                                                <tbody>
                                                    <tr>
                                                        <td background="../Resources/heading_bg.gif" width="37%">
                                                            <div align="left">
                                                                &nbsp; <span class="bodysg"><span class="bodysg">Delete Matrimony ID </span></span></div>
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
                                                                                <strong> Matrimony ID :
                                                                                    <asp:Label ID="L_MatID" runat="server"></asp:Label></strong></td>
                                                                        </tr>
                                                                           <tr>
                                                                            <td colspan="2" style="height: 17px; text-align: left">
                                                                                &nbsp; &nbsp;&nbsp; <span style="background-color: #ffff00">
                                                                                Please read this carefully</span>
                                                                                &nbsp;&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 88px; text-align: center; height: 49px;">
                                                                                </td>
                                                                            <td style="text-align: justify; height: 49px; width: 419px;">
                                                                                You are trying to remove your Matrimonial account from
                                                                                <asp:Label ID="L_SiteName" runat="server" Font-Bold="True"></asp:Label>.
                                                                                If you delete your
                                                                                <asp:Label ID="L_SiteName2" runat="server" Font-Bold="True"></asp:Label>
                                                                                Account, then you will no longer be able to send, receive, or access Intrests,Message
                                                                                &amp; Partner Notifications.Your profile will be deleted.If you decide to become
                                                                                an
                                                                                <asp:Label ID="L_SiteName3" runat="server" Font-Bold="True"></asp:Label>
                                                                                member again in the future, you will need to recreate your profile.</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 88px; text-align: right;">
                                                                                <span class="style1">&nbsp;</span>&nbsp;</td>
                                                                            <td style="text-align: center; width: 419px;">
                                                                            <div style="width:100%; text-align: left;">
                                                                                <asp:Label ID="L_Check" runat="server" Text="Check the box to delete your account" ForeColor="Red" Visible="False"></asp:Label><asp:Label
                                                                                    ID="L_WrongPassword" runat="server" ForeColor="Red" Text="Wrong Password" Visible="False"></asp:Label></div>
                                                                                <br />
                                                                            
                                                                            
                                                                            <table>
                                                                            <tr>
                                                                            <td style="width: 54px; text-align: right;">
                                                                                &nbsp;</td>
                                                                            <td style="width: 12px"> </td>
                                                                            <td style="width: 348px; text-align: left;">
                                                                            <asp:CheckBox ID="CB_Del_acc" runat="server" onclick= "displayBlock();" Text="Yes I Need To delete My Account" /></td>
                                                                            </tr>
                                                                            <tr>
                                                                            <td style="width: 54px; height: 22px;">
                                                                            Password<br />
                                                                            </td>
                                                                            <td style="width: 12px; height: 22px;">
                                                                                :<br />
                                                                            </td>
                                                                            <td style="width: 348px; text-align: left; height: 22px;">
                                                                                &nbsp;<asp:TextBox ID="TB_Password_OLd" runat="server" CssClass="forminput"
                                                                                    Width="223px" Enabled="False" TextMode="Password" BackColor="#E0E0E0">Check the box to delete your account</asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_Password_OLd"
                                                                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                                                                                <asp:Button ID="IB_Submit" runat="server" Text="Delete" Enabled="False" Width="63px" /></td>
                                                                            </tr>
                                                                             <tr>
                                                                            <td style="width: 54px; text-align: right;">
                                                                                &nbsp;</td>
                                                                            <td style="width: 12px"> </td>
                                                                            <td style="width: 348px; text-align: left;">
                                                                            <asp:RequiredFieldValidator ID="RFV_Password" runat="server" ControlToValidate="TB_Password_OLd"
                                                                                    ErrorMessage="Password Required" Visible="False"></asp:RequiredFieldValidator></td>
                                                                            </tr>
                                                                            
                                                                            <tr>
                                                                            <td style="width: 54px">
                                                                            </td>
                                                                            <td style="width: 12px">
                                                                            </td>
                                                                            <td style="width: 348px">
                                                                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
                                                                                &nbsp; &nbsp;
                                                                            </td>
                                                                            </tr>
                                                                            </table>
                                                                            
                                                                            
                                                                            
                                                                                </td>
                                                                        </tr>

                                                                        <tr>
                                                                            <td colspan="2">
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
