<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adv_search.aspx.cs" Inherits="adv_search" %>

<%@ Register Src="../WeBControls/MemberLeftPanel.ascx" TagName="MemberLeftPanel"
    TagPrefix="uc1" %>

<%@ Register Src="../WeBControls/Footer_M.ascx" TagName="Footer_M" TagPrefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
  <title>Advanced Search - Bride & Groom Matrimonial</title>
    <script language="javascript" src="../Resources/js/ControlLoader.js"></script>
    <link href="../Resources/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
      <!--
        function displayBlockReligion()
         {
          if (document.getElementById('CB_Religion_Any').checked)
          {
            document.getElementById('Div_Religion').style.display ="none";
          }
           else 
          {
           document.getElementById('Div_Religion').style.display = "block";
          }
        }
        -->
    </script>
       <script type="text/javascript">
      <!--
        function displayBlockCaste()
         {
          if (document.getElementById('CB_Caste_Any').checked)
          {
            document.getElementById('Div_Caste').style.display ="none";
          }
           else 
          {
           document.getElementById('Div_Caste').style.display = "block";
          }
        }
        -->
    </script>
       <script type="text/javascript">
      <!--
        function displayBlockEducation()
         {
          if (document.getElementById('CB_Education_Any').checked)
          {
            document.getElementById('Div_Education').style.display ="none";
          }
           else 
          {
           document.getElementById('Div_Education').style.display = "block";
          }
        }
        -->
    </script>
       <script type="text/javascript">
      <!--
        function displayBlockCountry()
         {
          if (document.getElementById('CB_Country_Any').checked)
          {
            document.getElementById('Div_Country').style.display ="none";
          }
           else 
          {
           document.getElementById('Div_Country').style.display = "block";
          }
        }
        -->
    </script>
           <script type="text/javascript">
      <!--
        function displayBlockOccupation()
         {
          if (document.getElementById('CB_Occupation_Any').checked)
          {
            document.getElementById('Div_Occupation').style.display ="none";
          }
           else 
          {
           document.getElementById('Div_Occupation').style.display = "block";
          }
        }
        -->
    </script>
</head>
<body class="body" bgcolor="#cccccc">
<div align="center">
<table class="BlueTborder" align="center" border="0" cellpadding="0" cellspacing="0" width="780">
          <!--DWLayoutTable-->
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
			  

  
<!-- START LEFT PART -->  
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

<!-- ''''''''''''''NORMAL ''''''''''''''' -->
</td>
<td valign="top"><br>
        <table align="center" border="0" cellpadding="0" cellspacing="0" height="20" width="97%">
            <tbody>
                <tr>
                    <td background="../Resources/heading_bg.gif" width="37%">
                        <div align="left">
                            &nbsp; <span class="bodysg">Regilar Search </span>
                        </div>
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
                        <table id="content" align="center" border="0" cellpadding="5" cellspacing="4" width="97%">
                            <tbody>
                                <tr>
                                    <td colspan="2">
                                        <p align="justify">
                                            <img align="left" height="28" src="../Resources/searchicon.gif" width="28" />
                                            Search based on a few basic criteria one would look for in a partner. If you like
                                            a profile you can Express Interest or Send Mail.</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <form id="MatriForm" runat = "server" name="MatriForm">
                                            <table border="0" cellpadding="3" cellspacing="2" width="100%">
                                                <tbody>
                                                    <tr>
                                                        <td colspan="2" height="20">
                                                            <div align="right" style="text-align: justify">
                                                                Note: All fields marked <span class="Alert" style="color: #ff0099">*</span> are
                                                                Optional</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="22%">
                                                            <div align="left">
                                                                Looking for
                                                            </div>
                                                        </td>
                                                        <td width="78%">
                                                            <div align="left">
                                                                <asp:RadioButton ID="RB_Looking_male" runat="server" GroupName="Looking" Text="Male " />
                                                                &nbsp;&nbsp;<asp:RadioButton ID="RB_Looking_Fmale" runat="server" GroupName="Looking" Text="Female" Checked="True" /></div>
                                                        </td>
                                                    </tr>
                                                    <tr style="color: #ff0066">
                                                        <td style="text-align: left">
                                                            Marital Status
                                                        </td>
                                                        <td style="text-align: left">
                                                            <asp:CheckBox ID="CB_MaritalStatus_UM" runat="server" Checked="True" Text="Unmarried" />
                                                            &nbsp;<asp:CheckBox ID="CB_MaritalStatus_WW" runat="server" Text="Widow/Widower" /><span
                                                                style="color: #000000"> &nbsp;</span><asp:CheckBox ID="CB_MaritalStatus_Div" runat="server" Text="Divorcee" />
                                                            &nbsp;<asp:CheckBox ID="CB_MaritalStatus_Sep" runat="server" Text="Separated" /><span
                                                                style="color: #ff0066">&nbsp; </span>
                                                        </td>
                                                    </tr>
                                                    <tr style="color: #ff0066">
                                                        <td>
                                                            <div align="left">
                                                                Age</div>
                                                        </td>
                                                        <td>
                                                            <div align="left">
                                                                From &nbsp;<asp:TextBox ID="TB_Age_Min" runat="server" CssClass="forminput" Width="25px">21</asp:TextBox>&nbsp;
                                                                to &nbsp;
                                                                <asp:TextBox ID="TB_Age_Max" runat="server" CssClass="forminput" Width="25px">35</asp:TextBox>
                                                                years
                                                                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="TB_Age_Min"
                                                                    ControlToValidate="TB_Age_Max" ErrorMessage="Error" Operator="GreaterThan"></asp:CompareValidator></div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left">
                                                            Height<span style="color: #ff0066">*</span></td>
                                                        <td style="text-align: left; color: #000000;">
                                                            From &nbsp;<asp:DropDownList ID="DDL_Height_Min" runat="server" Width="95px" CssClass="forminput">
                                                            </asp:DropDownList>&nbsp; to &nbsp;
                                                            <asp:DropDownList ID="DDL_Height_Max" runat="server" CssClass="forminput" Width="107px">
                                                            </asp:DropDownList>
                                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="DDL_Height_Min"
                                                                ControlToValidate="DDL_Height_Max" ErrorMessage="Error" Operator="LessThan"></asp:CompareValidator></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="bodysmall" colspan="2" style="text-align: center">
                                                            <span style="color: gray">
                                                            To make a selection, click on it and click on the "Add" button. Repeat for multiple
                                                            selections. To remove a selection, click on it and click on the "Remove" button.</span></td>
                                                    </tr>
                                                    <tr style="font-size: 9pt; color: #ff0099; font-family: Arial">
                                                        <td>
                                                            <div align="left">
                                                                Religion</div>
                                                        </td>
                                                        <td>
                                                            <div align="left">
                                                                <div>
                                                                    &nbsp;<asp:CheckBox ID="CB_Religion_Any" runat="server" Text="Any" onclick="displayBlockReligion();" Checked="True" />&nbsp;</div>
                                                                <div id="Div_Religion" runat="server" style="display: none; border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid; overflow: auto;
                                                                    border-left: #dcdcdc 1px solid; width: 100%; border-bottom: #dcdcdc 1px solid;
                                                                    height: 121px">
                                                                    <asp:CheckBoxList ID="LB_Religion" runat="server" Height="71px" RepeatColumns="3"
                                                                        Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                                        Width="392px">
                                                                   
                                                                    </asp:CheckBoxList></div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div align="left">
                                                                Caste</div>
                                                        </td>
                                                        <td>
                                                            <div align="left">
                                                                <div>
                                                                    &nbsp;<asp:CheckBox ID="CB_Caste_Any" runat="server" Text="Any" onclick="displayBlockCaste();" Checked="True"/>&nbsp;</div>
                                                                <div style="display: none;border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid; overflow: auto;
                                                                    border-left: #dcdcdc 1px solid; width: 100%; border-bottom: #dcdcdc 1px solid;
                                                                    height: 121px" id="Div_Caste">
                                                                <asp:CheckBoxList ID="LB_Caste" runat="server" Height="71px" RepeatColumns="2"
                                                                        Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                                        Width="392px">
                                                                </asp:CheckBoxList></div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: justify">
                                                            Sub caste <span class="Alert" style="color: #ff0066; font-size: 8pt; font-family: Verdana;">*</span></td>
                                                        <td style="color: #000000; text-align: justify; font-size: 8pt; font-family: Verdana;">
                                                            &nbsp;<asp:TextBox ID="TB_Subcast" runat="server" CssClass="forminput" Width="227px"></asp:TextBox>
                                                            (Eg: Brahmin) 
                                                        </td>
                                                    </tr>
                                                    <tr style="font-size: 9pt; color: #ff0099; font-family: Arial">
                                                        <td style="text-align: justify">
                                                            Education<span style="color: #ff0066">*</span></td>
                                                        <td>
                                                            <div align="left">
                                                                                    &nbsp;<asp:CheckBox ID="CB_Education_Any" runat="server" Text="Any" onclick="displayBlockEducation();" Checked="True"/>
                                                                                    <div style="display: none;border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid; overflow: auto;
                                                                    border-left: #dcdcdc 1px solid; width: 100%; border-bottom: #dcdcdc 1px solid;
                                                                    height: 121px" id="DIV_Education">
                                                                                        <asp:CheckBoxList ID="LB_Education" runat="server" Height="71px" RepeatColumns="1"
                                                                        Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                                        Width="392px">
                                                                                        </asp:CheckBoxList></div>
                                                                &nbsp;&nbsp;</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left">
                                                            Occupation<span style="color: #ff0066">*</span></td>
                                                        <td>
                                                            <div style="text-align: left">
                                                                &nbsp;<asp:CheckBox ID="CB_Occupation_any" runat="server" Text="Any" onclick="displayBlockOccupation();" Checked="True"/><div style="display: none;border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid; overflow: auto;
                                                                    border-left: #dcdcdc 1px solid; width: 100%; border-bottom: #dcdcdc 1px solid;
                                                                    height: 121px" id="DIV_Occupation">
                                                                    <asp:CheckBoxList ID="LB_Occupation" runat="server" Height="71px" RepeatColumns="1"
                                                                        Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                                        Width="392px">
                                                                    </asp:CheckBoxList></div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left">
                                                            Country<span style="color: #ff0066">*</span></td>
                                                        <td>
                                                            <div style="text-align: left">
                                                                &nbsp;<asp:CheckBox ID="CB_Country_Any" runat="server" Text="Any" onclick="displayBlockCountry();" Checked="True"/><div style="display: none;border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid; overflow: auto;
                                                                    border-left: #dcdcdc 1px solid; width: 100%; border-bottom: #dcdcdc 1px solid;
                                                                    height: 121px" id="DIV_Country">
                                                                    <asp:CheckBoxList ID="LB_Country" runat="server" Height="71px" RepeatColumns="2"
                                                                        Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                                        Width="392px">
                                                                    </asp:CheckBoxList></div>
                                                                &nbsp;</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div align="left" style="text-align: left">
                                                                Show <span class="Alert" style="color: #ff0099">*</span></div>
                                                        </td>
                                                        <td style="color: #000000">
                                                            <div align="left">
                                                                &nbsp;<asp:CheckBox ID="CB_needPhoto" runat="server" Text="Profiles with Photo" /></div>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>
                                                            <div align="left">
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div align="left" style="text-align: center">
                                                                &nbsp;
                                                                <asp:ImageButton ID="IMB_Search" runat="server" ImageUrl="~/Resources/search-button.gif" /></div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </form>
                                    </td>
                                </tr>
       
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>

    <br />
</td>
</tr>
</tbody></table>

</div>
<!-- END LEFT PART -->	


		  
		    </td>
    </tr>
			
          <tr>
            <td style="height: 105px">
                <uc3:Footer_M ID="Footer_M1" runat="server" />
</td>
          </tr>
          <tr>
          
    </tr>
          <tr>
         
          </tr>
  </tbody></table>
  
</div>




</body>
</html>


