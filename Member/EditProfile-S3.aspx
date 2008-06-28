<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditProfile-S3.aspx.cs" Inherits="Member_EditProfile_S3" %>

<%@ Register Src="../WeBControls/MemberLeftPanel.ascx" TagName="MemberLeftPanel"
    TagPrefix="uc1" %>

<%@ Register Src="../WeBControls/Footer_M.ascx" TagName="Footer_M" TagPrefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Edit Profile Step 3</title>
<link href="../Resources/style.css" rel="stylesheet" type="text/css">
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

                               
                                    </td>
                                    <td valign="top"><br>
                                    
                                    
                                      <%--Content Starts--%>
                                      
                                       <form name ="Edit3" runat = "server" id="Form1">
        <table border="0" cellpadding="0" cellspacing="0" width="600">
            <tbody>
                <tr>
                    <td class="grebg" colspan="3" height="12" valign="top">
                        <img src="../Resources/trans.gif" /></td>
                </tr>
                <tr>
                    <td class="grebg" width="12">
                        <img height="1" src="../Resources/trans.gif" /></td>
                    <td class="lastnull" valign="top" width="722">
                        <table border="0" cellpadding="0" cellspacing="0" width="588">
                            <tbody>
                            <tr><td colspan="3"></td></tr>
                            <tr><td colspan="3">
                                <table border="0" cellpadding="0" cellspacing="0" width="588">
                                    <tbody>
                                        <tr height="28">
                                            <td align="left" colspan="3" style="text-align: center">
                                                &nbsp;<asp:HyperLink ID="HL_Step_1" runat="server" ImageUrl="~/Resources/Step1_inAct.gif"
                                                    NavigateUrl="~/Member/EditProfile-S1.aspx" ToolTip="Go To Step 1">Go To Step 1</asp:HyperLink><asp:HyperLink ID="HL_Step_2"
                                                        runat="server" ImageUrl="~/Resources/Step2_inAct.gif" NavigateUrl="~/Member/EditProfile-S2.aspx" ToolTip="Go To Step 2">Go To Step  2</asp:HyperLink><asp:HyperLink
                                                            ID="HL_Step_3" runat="server" Enabled="False" ImageUrl="~/Resources/Step3_Act.gif"></asp:HyperLink><asp:HyperLink
                                                                ID="HL_Step_4" runat="server" ImageUrl="~/Resources/Step4_inAct.gif" NavigateUrl="~/Member/EditProfile-S4.aspx" ToolTip="Go To Step 4">Go To Step  4 </asp:HyperLink></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td></tr>
                                <tr >
                                    <td align="right" class="smalltxt" colspan="2">

                                    </td>
                                </tr>
                                <%-- table block --%>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" colspan="2">
                                        <div align="left">
                                            <span class="bodysg">About Yourself </span>
                                        </div>
                                    </td>
                                </tr>
                                <%-- table block --%>
                                <tr>
                                    <td class="grebg" colspan="2">
                                    </td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" colspan="2">
                                        <div align="left">
                                            Profile
                                            <br />
                                            <asp:TextBox ID="TB_AboutME" runat="server" CssClass="forminput" Height="142px" MaxLength="1000"
                                                TextMode="MultiLine" Width="567px"></asp:TextBox>&nbsp;<br />
                                            <asp:TextBox ID="txtCount" runat="server" BorderColor="#E0E0E0" BorderStyle="None"
                                                BorderWidth="1px" ForeColor="Red" ReadOnly="True" Width="31px">1000</asp:TextBox>
                                            <span class="style1">You could enter details about you or a bried description about
                                                yourself.<br />
                                                <span class="style2">Min 50</span> chas and <span style="color: #ff0000"><span class="style2">
                                                    Max 1000 chars</span><span>. <span style="color: #000000">(</span></span></span><span style="color: #ff0000">If Profile contains ay details about your
                                                        <br />
                                                    contact information like e-mail,phone number,
                                                        ete. Your profile will be rejected</span>)</span></div>
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
                                            <span class="bodysg">Family Details </span>
                                        </div>
                                        <div align="left">
                                        </div>
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
                                            &nbsp;Family Details
                                        </div>
                                    </td>
                                    <td class="smalltxt" style="text-align: justify">
                                        <asp:TextBox ID="TB_FamilyDetails" runat="server" CssClass="forminput" Height="94px"
                                            TextMode="MultiLine" Width="215px"></asp:TextBox>
                                        <br />
                                        Use this space to talk about your parents, what do they do and what are their backgrounds.
                                        What do your siblings do? Do they live in the same city as your parents? Talk about
                                        others in your extended family and so on.</td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            &nbsp;Family Values
                                        </div>
                                    </td>
                                    <td class="smalltxt">
                                        <div align="left">
                                            <asp:DropDownList ID="DDL_FamilyValues" runat="server" CssClass="forminput" Width="222px">
                                            </asp:DropDownList>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            &nbsp;Family Type</div>
                                    </td>
                                    <td class="smalltxt">
                                        <div align="left">
                                            <asp:DropDownList ID="DDL_FamilyType" runat="server" CssClass="forminput" Width="222px">
                                            </asp:DropDownList>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" width="210">
                                        <div align="left">
                                            &nbsp;Family Status</div>
                                    </td>
                                    <td valign="top">
                                        <div align="left">
                                            <asp:DropDownList ID="DDL_FamilyStatus" runat="server" CssClass="forminput" Width="222px">
                                            </asp:DropDownList>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            &nbsp;Family Origin
                                        </div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:TextBox ID="TB_familyOrigin" runat="server" CssClass="forminput" Width="215px"></asp:TextBox>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            &nbsp;No of Brothers 
                                        </div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:Label ID="L_NoOfBrother" runat="server"></asp:Label>&nbsp; <strong>Married</strong>&nbsp;
                                            <asp:Label ID="L_BMarried" runat="server" Visible="False"></asp:Label>
                                            <asp:DropDownList ID="DDL_NoOfBrothersMarried" runat="server" CssClass="forminput"
                                                Width="80px">
                                                <asp:ListItem Value="0">-- Select --</asp:ListItem>
                                                <asp:ListItem>1</asp:ListItem>
                                                <asp:ListItem>2</asp:ListItem>
                                                <asp:ListItem>3</asp:ListItem>
                                                <asp:ListItem>4</asp:ListItem>
                                                <asp:ListItem>5</asp:ListItem>
                                                <asp:ListItem Value="7">No</asp:ListItem>
                                                <asp:ListItem Value="6">More than 5</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DDL_NoOfBrothersMarried"
                                                ErrorMessage="*"></asp:RequiredFieldValidator>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding" style="color: #000000">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            &nbsp;No of Sisters
                                        </div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:Label ID="L_NoOfSister" runat="server"></asp:Label>&nbsp; <strong>Married</strong>&nbsp;
                                            <asp:Label ID="L_SMarried" runat="server" Visible="False"></asp:Label>
                                            <asp:DropDownList ID="DDL_NoOFSistersMarried" runat="server" CssClass="forminput"
                                                Width="80px">
                                                <asp:ListItem Value="0">-- Select --</asp:ListItem>
                                                <asp:ListItem>1</asp:ListItem>
                                                <asp:ListItem>2</asp:ListItem>
                                                <asp:ListItem>3</asp:ListItem>
                                                <asp:ListItem>4</asp:ListItem>
                                                <asp:ListItem>5</asp:ListItem>
                                                <asp:ListItem Value="7">No</asp:ListItem>
                                                <asp:ListItem Value="6">More than 5</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DDL_NoOFSistersMarried"
                                                ErrorMessage="*"></asp:RequiredFieldValidator>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding" style="color: #000000">
                                    <td class="grtxtbold1" colspan="2">
                                        <div align="left">
                                            <span class="bodysg">Father's Detail </span>
                                        </div>
                                        <div align="left">
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
                                            &nbsp;Name:</div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:Label ID="L_FatherName" runat="server"></asp:Label>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding" style="color: #000000">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                        </div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:RadioButton ID="RB_Father_Alive" runat="server" GroupName="father" Text="Alive" />
                                            <asp:RadioButton ID="RB_Father_NAlive" runat="server" GroupName="father" Text="Not Alive" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            &nbsp;Occupation</div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:TextBox ID="TB_Father_Occ" runat="server" CssClass="forminput" Width="215px"></asp:TextBox>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td align="left" class="grtxtbold1" colspan="2">
                                        <div align="left" class="bodysg">
                                            Mother's Detail
                                        </div>
                                        <div align="left">
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
                                            &nbsp;Name:</div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:Label ID="L_MotherName" runat="server"></asp:Label>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                        </div>
                                    </td>
                                    <td class="smalltxt">
                                        <div align="left">
                                            <asp:RadioButton ID="RB_Mother_Alive" runat="server" GroupName="Mother" Text="Alive" />&nbsp;<asp:RadioButton
                                                ID="RB_Mother_NAlive" runat="server" GroupName="Mother" Text="Not Alive" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td align="left" class="grtxtbold1">
                                        <div align="left">
                                            &nbsp;Occupation</div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:TextBox ID="TB_Mother_Occ" runat="server" CssClass="forminput" Width="215px"></asp:TextBox>&nbsp;</div>
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
                                            <span class="bodysg">Hobbies and Interests </span>
                                        </div>
                                        <div align="left">
                                        </div>
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
                                            Hobbies</div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            <div id="Div9" runat="server" style="border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid;
                                                overflow: auto; border-left: #dcdcdc 1px solid; width: 100%; border-bottom: #dcdcdc 1px solid;
                                                height: 86px">
                                                <asp:CheckBoxList ID="LB_Hobbies" runat="server" Height="71px" RepeatColumns="2"
                                                    Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                    Width="380px">
                                                </asp:CheckBoxList></div>
                                        </div>
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
                                            Other Hobbies</div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:TextBox ID="TB_OtherHobbies" runat="server" CssClass="forminput" Width="215px"></asp:TextBox>&nbsp;</div>
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
                                            Interests</div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            <div id="Div1" runat="server" style="border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid;
                                                overflow: auto; border-left: #dcdcdc 1px solid; width: 100%; border-bottom: #dcdcdc 1px solid;
                                                height: 86px">
                                                <asp:CheckBoxList ID="LB_Interests" runat="server" Height="71px" RepeatColumns="2"
                                                    Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                    Width="380px">
                                                </asp:CheckBoxList></div>
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
                                            Other Interests</div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:TextBox ID="TB_OtherInterests" runat="server" CssClass="forminput" Width="215px"></asp:TextBox>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        &nbsp;</td>
                                    <td class="formtxt" valign="top" width="500">
                                        &nbsp;</td>
                                </tr>
                                <tr class="tabpadding">
                                    <td colspan="3" height="7">
                                        <div align="center">
                                            <div align="center">
                                                <asp:ImageButton ID="IB_Submit" runat="server" ImageUrl="~/Resources/button-Save.gif" />&nbsp;
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                    <td class="grebg" width="12">
                        <img height="1" src="../Resources/trans.gif" /></td>
                </tr>
                <tr>
                    <td class="grebg" colspan="3" style="height: 12px" valign="top">
                        <img height="12" src="../Resources/trans.gif" width="564" /></td>
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

