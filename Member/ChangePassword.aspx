<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<%@ Register Src="../WeBControls/MemberLeftPanel.ascx" TagName="MemberLeftPanel"
    TagPrefix="uc3" %>
<%@ Register Src="../WeBControls/AdminLeftPanel.ascx" TagName="AdminLeftPanel" TagPrefix="uc1" %>
<%@ Register Src="../WeBControls/Footer_M.ascx" TagName="Footer_M" TagPrefix="uc2" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Src="../WeBControls/MemberLeftPanel.ascx" TagName="MemberLeftPanel"
    TagPrefix="uc1" %>

<%@ Register Src="../WeBControls/Footer_M.ascx" TagName="Footer_M" TagPrefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Change Password</title>

<link href="../Resources/style.css" rel="stylesheet" type="text/css">
    <link href="../Resources/style.css" rel="stylesheet" type="text/css" />
    <link href="../Resources/style_2.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../Resources/PPPrimary.js"></script>
    <script type="text/javascript" src="../Resources/pswdplc.js"></script>


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
		                            <!--------MyProfile Map will be added last------->
		                                <map name="Map2" id="Map2">
		                                    <area shape="rect" coords="0,1,128,26"href="../Member/Profile.aspx"alt="My Matri">
		                                    <area shape="rect" coords="134,1,262,26" href="../Member/memberSearchOption.aspx" alt="My Search">
		                                    <area shape="rect" coords="287,2,427,27" href="../Member/Interests.aspx" alt="My Interest">
		                                    <area shape="rect" coords="448,2,538,25" href="../Member/Messages.aspx" alt="My Message">
		                                    <area shape="rect" coords="567,2,678,25" href="../Member/Membership.aspx" alt="My Membership">
		                                    <area shape="rect" coords="696,4,763,24" href="../Member/logout.aspx" alt="Logout">
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
                                                            &nbsp; <span class="bodysg"><span class="bodysg">Change Password</span></span></div>
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
                                                    <td style="height: 262px">
                                                        <form id="form"  runat="server" name="form" onsubmit="return validate()">
                                                            <table align="center" border="0" cellpadding="2" cellspacing="2" width="97%">
                                                                <tbody>
                                                                    <tr>
                                                                        <td colspan="2" style="height: 17px; text-align: left">
                                                                            To reset your password, provide your current password.
                                                                            <br />
                                                                            <asp:Label ID="L_PasswordChanged" runat="server" ForeColor="Red" Text="Password Updated..." Visible="False" Font-Bold="True"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 105px">
                                                                            &nbsp;</td>
                                                                        <td >
                                                                            <table style="width: 406px; height: 45px">
                                                                                <tr>
                                                                                    <td style="width: 6px; height: 29px">
                                                                                        <span style="color: #ff0099">*</span></td>
                                                                                    <td style="width: 147px; height: 29px; text-align: left">
                                                                                        <strong>Old Password</strong></td>
                                                                                    <td style="width: 208px; height: 29px; text-align: left">
                                                                                        <asp:TextBox ID="TB_Password_OLd" runat="server" CssClass="forminput"
                                                                                            Width="183px" TextMode="Password"></asp:TextBox>
                                                                                        <asp:Label ID="L_WrongPassword" runat="server" ForeColor="Red" Text="Wrong Password" Visible="False"></asp:Label></td>
                                                                                    <td style="height: 29px; text-align: left;">
                                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_Password_OLd"
                                                                                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td style="width: 6px; height: 31px">
                                                                                        <span style="color: #ff0099">*</span></td>
                                                                                    <td style="width: 147px; height: 31px; text-align: left">
                                                                                        <strong>New Password</strong></td>
                                                                                    <td style="width: 208px; height: 31px; text-align: left">
                                                                                        <asp:TextBox ID="TB_Password_New" runat="server" CssClass="forminput" onblur="javascript:SetPwdStrengthEx(document.forms[0],this.value);"
                                                                                            onkeyup="javascript:SetPwdStrengthEx(document.forms[0],this.value);" onmouseout="javascript:SetPwdStrengthEx(document.forms[0],this.value);" Width="185px" TextMode="Password"></asp:TextBox><br />
                                                                                        <span style="font-size: 7pt; color: gray">Six-character minimum</span></td>
                                                                                    <td style="height: 31px; text-align: left;">
                                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TB_Password_New"
                                                                                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                                                                </tr>
                                                                                
                                                                                                                                <tr>
                                                                                    <td style="width: 6px; height: 31px">
                                                                                        <span style="color: #ff0099"></span>
                                                                                    </td>
                                                                                    <td style="width: 147px; height: 31px; text-align: left">
                                                                                        <strong>
                                                                                        Password strenght</strong></td>
                                                                                    <td style="width: 208px; height: 31px; text-align: left">
                                                                                    
                                                                                                       <script type="text/javascript">
                                                                                                                function DispPwdStrength(iN,sHL){
                                                                                                                 if(iN>3){iN=3;}
                                                                                                                 for(var i=0;i<4;i++){  
                                                                                                                    var sHCR="css0162";
                                                                                                                        if(i<=iN){
                                                                                                                            sHCR=sHL;
                                                                                                                            }
                                                                                                                            if(i>0)
                                                                                                                            {GEId("idSM"+i).className=sHCR;} 
                                                                                                                            GEId("idSMT"+i).style.display=((i==iN)?"inline":"none");
                                                                                                                   }
                                                                                                                }
                                                                                                           </script>
                                                                                                           <table class="css0161" style="height: 19px; width: 190px;" cellpadding="0" cellspacing="0">
                                                                                                               <tbody>
                                                                                                                   <tr>
                                                                                                                       <td id="idSM1" class="css0162" align="center" width="33%"><span style="font-size: 1px;">&nbsp;</span><span id="idSMT1" style="display: none;">Weak</span></td> 
                                                                                                                       
                                                                                                                       <td id="idSM2" class="css0162" style="border-left: 1px solid rgb(255, 255, 255);" align="center" width="34%"><span style="font-size: 1px;">&nbsp;</span><span id="idSMT0" style="display: inline; font-weight: normal; color: rgb(102, 102, 102);">Not rated</span><span id="idSMT2" style="display: none;">Medium</span></td> 
                                                                                                                       <td id="idSM3" class="css0162" style="border-left: 1px solid rgb(255, 255, 255);" align="center" width="33%"><span style="font-size: 1px;">&nbsp;</span> <span id="idSMT3" style="display: none;"> Strong </span></td>
                                                                                                                   </tr>
                                                                                                               </tbody>
                                                                                                           </table>
                                                                                    
                                                                                    
                                                                                    
                                                                                        </td>
                                                                                    <td style="height: 31px; text-align: left;">
                                                                                        </td>
                                                                                </tr>
                                                                                
                                                                                <tr>
                                                                                    <td style="width: 6px; height: 36px">
                                                                                        <span style="color: #ff0099">*</span></td>
                                                                                    <td class="forminput" style="width: 147px; height: 36px; text-align: left">
                                                                                        <strong> Conform Password</strong>&nbsp;</td>
                                                                                    <td style="width: 208px; height: 36px; text-align: left">
                                                                                        <asp:TextBox ID="TB_Password_Conform" runat="server" CssClass="forminput"
                                                                                            Width="183px" TextMode="Password"></asp:TextBox>
                                                                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TB_Password_New"
                                                                                            ControlToValidate="TB_Password_Conform" ErrorMessage="Password Missmatch"></asp:CompareValidator></td>
                                                                                    <td style="width: 63px; height: 36px; text-align: left;">
                                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TB_Password_Conform"
                                                                                            ErrorMessage="*"></asp:RequiredFieldValidator><br />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td style="width: 6px; height: 17px">
                                                                                    </td>
                                                                                    <td style="width: 147px; height: 17px">
                                                                                    </td>
                                                                                    <td style="width: 208px; text-align: right; height: 17px;">
                                                                                        <asp:ImageButton ID="IB_Submit" runat="server" ImageUrl="~/Resources/Change.gif" /></td>
                                                                                </tr>
                                                                            </table>
                                                                            </td>
                                                                
                                                                    

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
