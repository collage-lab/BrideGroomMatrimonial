<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProfileSettings.aspx.cs" Inherits="Member_ProfileSettings" %>

<%@ Register Src="../WeBControls/MemberLeftPanel.ascx" TagName="MemberLeftPanel"
    TagPrefix="uc1" %>

<%@ Register Src="../WeBControls/Footer_M.ascx" TagName="Footer_M" TagPrefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Profile Settings</title>
<link href="../Resources/style.css" rel="stylesheet" type="text/css">
    <link href="../Resources/style.css" rel="stylesheet" type="text/css" />
    
 <script language="javascript">
  <!--
    function displayBlockPhoto() {
      if (document.getElementById('RB_P_Yes').checked) {
        document.getElementById('TB_Photo_Password').disabled = false;
        document.getElementById('TB_Photo_Conform').disabled = false;
        document.getElementById('TB_Photo_Password').style.backgroundColor = "#FFFFFF" ;
        document.getElementById('TB_Photo_Conform').style.backgroundColor = "#FFFFFF" ;
        document.getElementById('IMB_Photo_save').disabled = false;
      } else {
        document.getElementById('TB_Photo_Password').disabled = true;
        document.getElementById('TB_Photo_Conform').disabled = true;
        document.getElementById('TB_Photo_Password').style.backgroundColor = "#E0E0E0";
        document.getElementById('TB_Photo_Conform').style.backgroundColor = "#E0E0E0";
        document.getElementById('IMB_Photo_save').disabled = true;
      }
    }
    -->
 </script>
 
  <script language="javascript">
  <!--
    function displayBlockHoro() {
      if (document.getElementById('RB_H_Yes').checked) {
        document.getElementById('TB_Horo_Password').disabled = false;
        document.getElementById('TB_Horoscope_Conform').disabled = false;
        document.getElementById('TB_Horo_Password').style.backgroundColor = "#FFFFFF" ;
        document.getElementById('TB_Horoscope_Conform').style.backgroundColor = "#FFFFFF" ;
        document.getElementById('IMB_Horoscope_save').disabled = false;

      } else {
        document.getElementById('TB_Horo_Password').disabled = true;
        document.getElementById('TB_Horoscope_Conform').disabled = true;
        document.getElementById('TB_Horo_Password').style.backgroundColor = "#E0E0E0";
        document.getElementById('TB_Horoscope_Conform').style.backgroundColor = "#E0E0E0";
        document.getElementById('IMB_Horoscope_save').disabled = true;
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

                               
                                    </td>
                                    <td valign="top"><br>
                                    
                                    <br>
                                    
                                      <%--Content Starts--%>
                                            <form id="form" runat="server" name="form" onsubmit="return validate()">


                                                <table align="center" border="0" cellpadding="0" cellspacing="0" height="20" width="97%">
                                                    <tbody>
                                                        <tr>
                                                            <td background="../Resources/heading_bg.gif" width="37%">
                                                                <div align="left">
                                                                    &nbsp;Mail Settings</div>
                                                            </td>
                                                            <td width="63%">&nbsp;
                                                                </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <font name ="Settings" runat ="server" id="Font1">
                                                <table align="center" border="0" cellpadding="0" cellspacing="0" class="submenubox"
                                                    width="97%">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                    <table align="center" border="0" cellpadding="2" cellspacing="2" style="width: 100%">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td colspan="2" style="height: 17px; text-align: left" bgcolor="#fff2ff">
                                                                                    As a 
                                                                                    <asp:Label ID="L_Matrimonial" runat="server" Text="BnG Matrimonial "></asp:Label>
                                                                                    Member you will receive the following e-mails.
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 93px; height: 21px; text-align: right;">
                                                                                    &nbsp;<asp:CheckBox ID="CB_Daly" runat="server" /></td>
                                                                                <td width="83%" style="text-align: left; height: 21px;">
                                                                                    Daily MatchWatch and weekly Photo MatchWatch</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 93px; text-align: right;">
                                                                                    <span class="style1">
                                                                                        <asp:CheckBox ID="CB_Special" runat="server" /></span></td>
                                                                                <td style="text-align: left">
                                                                                    Special promotional mailers</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 93px; text-align: right;">
                                                                                    <asp:CheckBox ID="CB_newProduct" runat="server" /></td>
                                                                                <td width="83%" style="text-align: left">
                                                                                    Product and new features launch mailers&nbsp;</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 93px; text-align: right;">
                                                                                    <span class="style1">
                                                                                        <asp:CheckBox ID="CB_Partner" runat="server" /></span></td>
                                                                                <td style="text-align: left">
                                                                                    Partner mailers from our group portals</td>
                                                                            </tr>
                                                                                                                <tr>
                                                                                <td style="width: 161px; text-align: right;">
                                                                                    <span class="style1"></span>
                                                                                </td>
                                                                                <td style="text-align: left">
                                                                                    <asp:Label ID="L_S_Updated" runat="server" ForeColor="Red" Text="Request Updated ..."
                                                                                        Visible="False"></asp:Label></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 93px">&nbsp;
                                                                                    </td>
                                                                                <td style="text-align: center">
                                                                                    <asp:ImageButton ID="IMB_Mail_save" runat="server" ImageUrl="~/Resources/button-Save.gif" OnClick="IMB_Mail_save_Click" /></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                </font>
                                              
                                               <br />

                                            
                                            <br>
                                             
                                                    <table align="center" border="0" cellpadding="0" cellspacing="0" height="20" width="97%">
                                                        <tbody>
                                                            <tr>
                                                                <td background="../Resources/heading_bg.gif" width="37%">
                                                                    <div align="left">
                                                                        &nbsp; Photo&nbsp; Settings</div>
                                                                </td>
                                                                <td width="63%">&nbsp;
                                                                    </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <table align="center" border="0" cellpadding="0" cellspacing="0" class="submenubox"
                                                    width="97%">
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <table align="center" border="0" cellpadding="2" cellspacing="2" style="width: 100%">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td colspan="2" style="height: 17px; text-align: left" bgcolor="#fff2ff">
                                                                                    If you wish to protect your photo and show it only to select members, you can use
                                                                                    this feature. Only paid members can protect their photo.
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style=" height: 29px; text-align: right; width: 161px;">
                                                                                    Protect Photo :<strong> </strong>&nbsp;</td>
                                                                                <td width="405"  style="text-align: left; height: 29px;">
                                                                                    <asp:RadioButton ID="RB_P_Yes" runat="server" CssClass="forminput" GroupName="Photo" Enabled="False" onclick="displayBlockPhoto();" Text="Yes" />
                                                                                    &nbsp;<asp:RadioButton ID="RB_P_No" runat="server" CssClass="forminput"
                                                                                            GroupName="Photo" Checked="True" Text="No" onclick="displayBlockPhoto();"/>
                                                                              </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="2" style="height: 17px; text-align: justify" bgcolor="#fff2ff">
                                                                                    If yes, please enter a password. Your photo password must be different from your
                                                                                    profile password. Remove Password</td>
                                                                            </tr>
                                                                            <tr >
                                                                                <td style="width: 161px; text-align: right;">
                                                                                    <span class="style1">&nbsp;Password : &nbsp;</span></td>
                                                                                <td style="text-align: left">
                                                                                    <asp:TextBox ID="TB_Photo_Password" runat="server" CssClass="forminput"
                                                                                        Width="223px" Enabled="False" BackColor="#E0E0E0" >This Servics is only for paid members</asp:TextBox></td>
                                                                            </tr>
                                                                            <tr >
                                                                                <td style="width: 161px; text-align: right;">
                                                                                    &nbsp;Confirm Password : &nbsp;
                                                                                </td>
                                                                                <td  style="text-align: left">
                                                                                    <asp:TextBox ID="TB_Photo_Conform" runat="server" CssClass="forminput"
                                                                                        Width="223px" Enabled="False" BackColor="#E0E0E0">This Servics is only for paid members</asp:TextBox>
                                                                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TB_Photo_Password"
                                                                                        ControlToValidate="TB_Photo_Conform" ErrorMessage="*"></asp:CompareValidator></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 161px; text-align: right;">
                                                                                    <span class="style1"></span>
                                                                                </td>
                                                                                <td style="text-align: left">
                                                                                    <asp:Label ID="L_P_Updated" runat="server" ForeColor="Red" Text="Request Updated ..."
                                                                                        Visible="False"></asp:Label></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 161px">&nbsp;
                                                                                    </td>
                                                                                <td style="text-align: center">
                                                                                    <asp:ImageButton ID="IMB_Photo_save" runat="server" ImageUrl="~/Resources/button-Save.gif" OnClick="IMB_Photo_save_Click" Visible="False" Enabled="False" />
                                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                
                                                <br />
                                                
                                                
                                                <br>

                                                    <table align="center" border="0" cellpadding="0" cellspacing="0" height="20" width="97%">
                                                        <tbody>
                                                            <tr>
                                                                <td background="../Resources/heading_bg.gif" width="37%">
                                                                    <div align="left">
                                                                        &nbsp; Horoscope Settings</div>
                                                                </td>
                                                                <td width="63%">&nbsp;
                                                                    </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <table align="center" border="0" cellpadding="0" cellspacing="0" class="submenubox"
                                                    width="97%">
                                                        <tbody>
                                                            <tr>
                                                                <td><table align="center" border="0" cellpadding="2" cellspacing="2" style="width: 100%">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td colspan="2" style="height: 17px; text-align: left" bgcolor="#fff2ff">
                                                                                If you wish to protect your Horoscope and show it only to select members, you can
                                                                                use this feature. Only paid members can protect their horoscope.
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style=" height: 29px; text-align: right; width: 161px;">
                                                                                Protect Horoscope <strong>: </strong>&nbsp;</td>
                                                                                <td width="405"  style="text-align: left; height: 29px;">
                                                                                    &nbsp;<asp:RadioButton ID="RB_H_yes" runat="server" CssClass="forminput" GroupName="Horoscope" Enabled="False" Text="Yes" onclick="displayBlockHoro();"/> &nbsp;<asp:RadioButton ID="RB_H_No" runat="server" CssClass="forminput"
                                                                                            GroupName="Horoscope" Checked="True" Text="No" onclick="displayBlockHoro();"/>
                                                                                </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2" style="height: 17px; text-align: justify" bgcolor="#fff2ff">
                                                                                If yes, please enter a password. Your photo password must be different from your
                                                                                profile password.</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 161px; text-align: right;">
                                                                                <span class="style1">Password : &nbsp;</span></td>
                                                                            <td style="text-align: left">
                                                                                    <asp:TextBox ID="TB_Horo_Password" runat="server" CssClass="forminput"
                                                                                        Width="227px" Enabled="False" BackColor="#E0E0E0">This Servics is only for paid members</asp:TextBox></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 161px; text-align: right;">
                                                                                &nbsp;Confirm Password : &nbsp;
                                                                            </td>
                                                                            <td  style="text-align: left">
                                                                                    <asp:TextBox ID="TB_Horoscope_Conform" runat="server" CssClass="forminput"
                                                                                        Width="227px" Enabled="False" BackColor="#E0E0E0">This Servics is only for paid members</asp:TextBox>
                                                                                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="TB_Horo_Password"
                                                                                        ControlToValidate="TB_Horoscope_Conform" ErrorMessage="*"></asp:CompareValidator></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 161px; text-align: right;">
                                                                                <span class="style1"></span>
                                                                            </td>
                                                                            <td style="text-align: left">
                                                                                <asp:Label ID="L_H_Updated" runat="server" ForeColor="Red" Text="Request Updated ..."
                                                                                    Visible="False"></asp:Label></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 161px">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td style="text-align: center">
                                                                                &nbsp; &nbsp;<asp:ImageButton ID="IMB_Horoscope_save" runat="server" ImageUrl="~/Resources/button-Save.gif" OnClick="IMB_Horoscope_save_Click" Visible="False" Enabled="False" />
                                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                             
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                               
                                         
                                            
                                          
                                            
                                            </form>
                                            
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
