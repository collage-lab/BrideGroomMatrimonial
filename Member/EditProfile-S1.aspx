<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditProfile-S1.aspx.cs" Inherits="Member_EditProfile_S1" %>



<%@ Register Src="../WeBControls/MemberLeftPanel.ascx" TagName="MemberLeftPanel"
    TagPrefix="uc1" %>

<%@ Register Src="../WeBControls/Footer_M.ascx" TagName="Footer_M" TagPrefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Edit Profile Step 1</title>
<link href="../Resources/style.css" rel="stylesheet" type="text/css">
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
                                        <br />
                                        <br />
                                        <br />

                               
                                    </td>
                                    <td valign="top"><br>
                                    
                                    
                                      <%--Content Starts--%>
                                    
                                    


                                        <table border="0" cellpadding="0" cellspacing="0" style="width: 600px">
            <tbody>
                <tr>
                    <td class="grebg" colspan="3" height="12" valign="top">
                        <img src="../Resources/trans.gif" /></td>
                </tr>
                <tr>
                    <td class="grebg" style="width: 12px">
                        <img height="1" src="../Resources/trans.gif" /></td>
                    <td class="lastnull" valign="top" width="722">
                    <form name = "Edit1" runat = "server">
                        <table border="0" cellpadding="0" cellspacing="0" width="588px">
                            <tbody>
                                <tr height="28">
                                    <td align="right" class="smalltxt" colspan="2">
                                        <div align="left">
                                            <table border="0" cellpadding="0" cellspacing="0" width="588">
                                                <tbody>
                                                    <tr height="28">
                                                        <td align="left" colspan="3" style="text-align: center">
                                                            &nbsp;<asp:HyperLink ID="HL_Step_1" runat="server" Enabled="False" ImageUrl="~/Resources/Step1_Act.gif">Step 1</asp:HyperLink><asp:HyperLink
                                                                ID="HL_Step_2" runat="server" ImageUrl="~/Resources/Step2_inAct.gif" NavigateUrl="~/Member/EditProfile-S2.aspx" ToolTip="Go To Step 2">Go To Step  2</asp:HyperLink><asp:HyperLink
                                                                    ID="HL_Step_3" runat="server" ImageUrl="~/Resources/Step3_inAct.gif" NavigateUrl="~/Member/EditProfile-S3.aspx" ToolTip="Go To Step 3">Go To Step 3</asp:HyperLink><asp:HyperLink
                                                                        ID="HL_Step_4" runat="server" ImageUrl="~/Resources/Step4_inAct.gif" NavigateUrl="~/Member/EditProfile-S4.aspx" ToolTip="Go To Step 4">Go To Step  4 </asp:HyperLink></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                                <%-- table block --%>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" colspan="2">
                                        <div align="left">
                                            <span class="bodysg">Basic Information </span>
                                        </div>
                                    </td>
                                </tr>
                                <%-- table block --%>
                                <tr>
                                    <td class="grebg" colspan="2" style="height: 4px">
                                    </td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            <span class="Alert">&nbsp;&nbsp; </span>Name</div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:Label ID="L_Name" runat="server" CssClass="forminput"></asp:Label>&nbsp;</div>
                                    </td>
                                </tr>
                                <%-- table block --%>
                                <tr style="font-size: 9pt; color: #ff0000; font-family: Arial">
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding" style="font-size: 9pt; color: #ff0000; font-family: Arial">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            &nbsp;
                                            
                                            Gender</div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:Label ID="L_Gender" runat="server" CssClass="forminput"></asp:Label>&nbsp;</div>
                                    </td>
                                </tr>
                                <%-- table block --%>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            &nbsp;
                                            Date of Birth</div>
                                    </td>
                                    <td class="smalltxt">
                                        <div align="left">
                                            <asp:Label ID="L_Dob" runat="server" CssClass="forminput"></asp:Label>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            <span class="Alert" style="font-size: 8pt; color: #000000; font-family: Verdana">
                                            &nbsp; Marital Status</div>
                                    </td>
                                    <td class="smalltxt" style="font-size: 9pt; color: #ff0000; font-family: Arial">
                                        <div align="left">
                                            <asp:Label ID="L_MaritalStatus" runat="server" CssClass="forminput"></asp:Label>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" width="210">
                                        <div align="left">
                                            <span class="Alert"></span><span class="Alert"></span><span class="bodysg">&nbsp;</span>
                                            No. of Children</div>
                                    </td>
                                    <td valign="top">
                                        <div align="left">
                                            <asp:Label ID="L_NoOfChildren" runat="server" CssClass="forminput"></asp:Label>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            <span class="bodysg">&nbsp; </span>Children Living Status</div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:RadioButton ID="RB_LivingWithMe" runat="server" GroupName="Children" Text="Living with me" />
                                            &nbsp;<asp:RadioButton ID="RB_NotWithMe" runat="server" GroupName="Children" Text="Not living with me" />&nbsp; 
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            &nbsp;
                                            
                                            Physical Status</div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:Label ID="L_PhysicalStatus" runat="server" CssClass="forminput"></asp:Label>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            &nbsp;
                                            
                                            Mother tongue</div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:Label ID="L_MotherTongue" runat="server" CssClass="forminput" >
                                            </asp:Label><span style="color: #a24f11; text-decoration: underline"> </span>
                                            </div>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding" style="color: #000000">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            &nbsp;
                                            Religion</div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left" style="text-align: left">
                                            <asp:Label ID="L_Religion" runat="server" CssClass="forminput" >
                                            </asp:Label>
                                            &nbsp;&nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            <span class="Alert">&nbsp;&nbsp; </span>Caste</div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:Label ID="L_Cast" runat="server" CssClass="forminput" >
                                            </asp:Label>
                                            </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            <span class="bodysg">&nbsp; </span>Sub Caste
                                        </div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:TextBox ID="TB_Subcast" runat="server" CssClass="forminput" Height="15px" Width="197px"></asp:TextBox>&nbsp;</div>
                                    </td>
                                </tr>
                                <%-- table block --%>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <%-- table block --%>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            <span class="bodysg">&nbsp; </span>Profile Created by
                                        </div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:Label ID="L_ProfieCreated" runat="server" CssClass="forminput" >
                                            </asp:Label>
                                            </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>

                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                
                                <%-- table block --%>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" colspan="2">
                                        <div align="left">
                                            <span class="bodysg">Socio Religious Attributes </span>
                                        </div>
                                        <div align="left">
                                        </div>
                                    </td>
                                </tr>
                                <%-- table block --%>
                                <%-- table block --%>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <%-- table block --%>
                                <%-- table block --%>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" >
                                        <div align="left">
                                            &nbsp;Star(Nakshatra)</div>
                                    </td>
                                    <td >
                                        <div align="left">
                                            <asp:DropDownList ID="DDL_Star" runat="server" CssClass="forminput" Width="217px">
                                            </asp:DropDownList>&nbsp;</div>
                                    </td>
                                </tr>
                                <%-- table block --%>
                                <%-- table block --%>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            &nbsp;Moonsign</div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:DropDownList ID="DDL_Moon" runat="server" CssClass="forminput" Width="217px">
                                            </asp:DropDownList>&nbsp;</div>
                                    </td>
                                </tr>
                                <%-- table block --%>
                                <%-- table block --%>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            &nbsp;Horoscope Match
                                        </div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:RadioButton ID="RB_Horoscope_NO" runat="server" GroupName="Horoscope" Text="No" />
                                            <asp:RadioButton ID="RB_Horoscope_Yes" runat="server" GroupName="Horoscope" Text="Yes" />
                                            <asp:RadioButton ID="RB_Horoscope_NoMatters" runat="server" GroupName="Horoscope" Text="Does not matter" /></div>
                                    </td>
                                </tr>
                                <%-- table block --%>
                                <%-- table block --%>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            &nbsp;Chovva Dosham/Manglik</div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:RadioButton ID="RB_Manglik_No" runat="server" GroupName="Manglik" Text="No" />
                                            <asp:RadioButton ID="RB_Manglik_Yes" runat="server" GroupName="Manglik" Text="Yes" />
                                            <asp:RadioButton ID="RB_Manglik_DKnow" runat="server" GroupName="Manglik" Text="Do not know" />
                                            <asp:RadioButton ID="RB_Manglik_NA" runat="server" GroupName="Manglik" Text="Not applicable" /></div>
                                    </td>
                                </tr>
                                <%-- table block --%>
                                <%-- table block --%>
      
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            <span class="bodywk">&nbsp; Place of Birth </span>
                                        </div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            &nbsp;<asp:TextBox ID="TB_POB" runat="server" CssClass="forminput" MaxLength="64"
                                                Width="211px"></asp:TextBox></div>
                                    </td>
                                </tr>
                                                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            <span class="bodywk">&nbsp; Time of Birth </span>
                                        </div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            &nbsp;<asp:TextBox ID="TB_Time_H" runat="server" CssClass="forminput" MaxLength="2"
                                                Width="21px"></asp:TextBox><asp:RangeValidator ID="RangeValidator1" runat="server"
                                                    ControlToValidate="TB_Time_H" ErrorMessage="*" MaximumValue="12" MinimumValue="0"
                                                    SetFocusOnError="True" Type="Integer"></asp:RangeValidator>:<asp:TextBox ID="TB_Time_M"
                                                        runat="server" CssClass="forminput" MaxLength="2" Width="21px"></asp:TextBox><asp:RangeValidator
                                                            ID="RangeValidator2" runat="server" ControlToValidate="TB_Time_M" ErrorMessage="*"
                                                            MaximumValue="59" MinimumValue="0" SetFocusOnError="True"></asp:RangeValidator>-<asp:DropDownList
                                                                ID="DDL_Time" runat="server" CssClass="forminput">
                                                                <asp:ListItem Value="AM">AM</asp:ListItem>
                                                                <asp:ListItem Value="PM">PM</asp:ListItem>
                                                            </asp:DropDownList></div>
                                    </td>
                                </tr>

                                <%-- table block --%>
                                <%-- table block --%>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>

                                <%-- table block --%>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        &nbsp;</td>
                                    <td class="formtxt" valign="top" width="500">
                                        &nbsp;</td>
                                </tr>
                                <tr class="tabpadding">
                                    <td colspan="3" style="height: 7px">
                                        <div align="center">
                                            <div align="center">
                                                <asp:ImageButton ID="IB_Submit" runat="server" ImageUrl="~/Resources/button-Save.gif" />
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        </form>
                    </td>
                    <td class="grebg" width="12">
                        <img height="1" src="../Resources/trans.gif" /></td>
                </tr>
                <tr>
                    <td class="grebg" colspan="3" valign="top">
                        <img height="12" src="../Resources/trans.gif" width="564" /></td>
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

