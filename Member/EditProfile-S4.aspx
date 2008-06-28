<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditProfile-S4.aspx.cs" Inherits="Member_EditProfile_S4" %>

<%@ Register Src="../WeBControls/MemberLeftPanel.ascx" TagName="MemberLeftPanel"
    TagPrefix="uc1" %>

<%@ Register Src="../WeBControls/Footer_M.ascx" TagName="Footer_M" TagPrefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Edit Profile Step 4</title>
<link href="../Resources/style.css" rel="stylesheet" type="text/css">
    <link href="../Resources/style.css" rel="stylesheet" type="text/css" />
    <link href="../Resources/style.css" rel="stylesheet" type="text/css" />
    
	<script type="text/javascript">
      <!--   -
        function displayALL()
         {
            displayBlockState();
            displayBlockI2();
            displayBlockI1();
            displayBlockReligion();
            displayBlockCaste();
            displayBlockEducation();
            displayBlockCountry();
            displayBlockOccupation();
            displayBlockEduDet();
        }
        -  -->
    </script>
    
	<script type="text/javascript">
      <!--   -
        function displayBlockState()
         {
          if (document.getElementById('CB_StatesInIndia').checked)
          {
            document.getElementById('DIV_States').style.display = "block";
           document.getElementById('TB_NonIndianState').style.display = "none";
          }
           else 
          {
             document.getElementById('DIV_States').style.display = "none";
            document.getElementById('TB_NonIndianState').style.display = "block";

          }
        }
        -  -->
    </script>
    <script type="text/javascript">
      <!--   -
        function displayBlockI2()
         {
          if (document.getElementById('CB_IndianX').checked)
          {
            document.getElementById('DIV_IndianX').style.display = "none";
          }
           else 
          {
            document.getElementById('DIV_IndianX').style.display = "block";
          }
        }
        -  -->
    </script>
    <script type="text/javascript">
      <!--   -
        function displayBlockI1()
         {
          if (document.getElementById('CB_Indian').checked)
          { 
            document.getElementById('DIV_Indian').style.display = "none";
            document.getElementById('CB_StatesInIndia').disabled = false;

          }
           else 
          {
            document.getElementById('DIV_Indian').style.display = "block";
            
            document.getElementById('DIV_States').style.display = "none";
            document.getElementById('TB_NonIndianState').style.display = "block";
            
            document.getElementById('CB_StatesInIndia').checked = false;
            document.getElementById('CB_StatesInIndia').disabled = true;

          }
        }
        -  -->
    </script>
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
    <script type="text/javascript">
      <!--
        function displayBlockEduDet()
         {
          if (document.getElementById('CB_EduDet').checked)
          {
            document.getElementById('Div_EduDet').style.display ="none";
          }
           else 
          {
           document.getElementById('Div_EduDet').style.display = "block";
          }
        }
        -->
    </script>
    
</head>
<body class="body" bgcolor="#cccccc" onload = displayALL();>
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
                                         <form name ="Edit4" runat ="server">
                        <table border="0" cellpadding="0" cellspacing="0" style="color: #000000" width="600">
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
                                                                    NavigateUrl="~/Member/EditProfile-S1.aspx" ToolTip="Go ToStep 1">Go ToStep 1</asp:HyperLink><asp:HyperLink ID="HL_Step_2"
                                                                        runat="server" ImageUrl="~/Resources/Step2_inAct.gif" NavigateUrl="~/Member/EditProfile-S2.aspx" ToolTip="Go ToStep 2">Go ToStep  2</asp:HyperLink><asp:HyperLink
                                                                            ID="HL_Step_3" runat="server" ImageUrl="~/Resources/Step3_inAct.gif" NavigateUrl="~/Member/EditProfile-S3.aspx" ToolTip="Go ToStep 3">Go ToStep 3</asp:HyperLink><asp:HyperLink
                                                                                ID="HL_Step_4" runat="server" ImageUrl="~/Resources/Step4_Act.gif" Enabled="False">Step 4 </asp:HyperLink></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td></tr>
                                                <tr >
                                                    <td align="right" class="smalltxt" colspan="2" style="text-align: center">
                                                        &nbsp; &nbsp; &nbsp; &nbsp;
                                                    </td>
                                                </tr>
                                                <%-- table block --%>
                                                <tr class="tabpadding">
                                                    <td class="grtxtbold1" colspan="2">
                                                        <div align="left">
                                                            <strong><span>Primary Preference</span></strong></div>
                                                    </td>
                                                </tr>
                                                <%-- table block --%>
                                                <tr>
                                                    <td class="grebg" colspan="2">
                                                        <img height="1" src="../Resources/trans.gif" /></td>
                                                </tr>
                                                <tr class="tabpadding">
                                                    <td class="grtxtbold1" style="width: 283px">
                                                        <div align="left">
                                                            <span style="color: #ff3300"><span class="style4">*</span> </span>Looking For
                                                        </div>
                                                    </td>
                                                    <td style="width: 482px">
                                                        <div align="left">
                                                            <asp:CheckBoxList ID="LB_MaritalStatus" runat="server" Height="28px" RepeatColumns="4"
                                                                Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                                Width="437px">
                                                            </asp:CheckBoxList>
                                                            &nbsp; &nbsp; &nbsp;
                                                        </div>
                                                    </td>
                                                </tr>
                                                <!-- -->
                                                <%-- table block --%>
                                                <tr>
                                                    <td class="grebg" colspan="2">
                                                        <img height="1" src="../Resources/trans.gif" /></td>
                                                </tr>
                                                <tr class="tabpadding">
                                                    <td class="grtxtbold1" style="width: 283px">
                                                        <div align="left">
                                                            <span style="color: #000000"><span style="color: #ff0000">*</span> </span>Age
                                                        </div>
                                                    </td>
                                                    <td style="width: 482px">
                                                        <div align="left">
                                                            From &nbsp;<asp:TextBox ID="TB_Age_min" runat="server" CssClass="forminput" MaxLength="2"
                                                                Width="24px"></asp:TextBox>
                                                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TB_Age_min"
                                                                ErrorMessage="*" MaximumValue="90" MinimumValue="18" Type="Integer"></asp:RangeValidator>
                                                            to&nbsp;
                                                            <asp:TextBox ID="TB_Age_Max" runat="server" CssClass="forminput" MaxLength="2" Width="24px"></asp:TextBox>
                                                            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TB_Age_Max"
                                                                ErrorMessage="*" MaximumValue="91" MinimumValue="19" Type="Integer"></asp:RangeValidator></div>
                                                    </td>
                                                </tr>
                                                <%-- table block --%>
                                                <%-- table block --%>
                                                <tr style="color: #000000">
                                                    <td class="grebg" colspan="2">
                                                        <img height="1" src="../Resources/trans.gif" /></td>
                                                </tr>
                                                <tr class="tabpadding" style="color: #000000">
                                                    <td class="grtxtbold1" style="width: 283px">
                                                        <div align="left">
                                                            &nbsp;&nbsp; Complexion</div>
                                                    </td>
                                                    <td style="width: 482px" >
                                                        <div align="left">
                                                            <span style="color: #ff0000">
                                                                </span>&nbsp;
                                                                <div id="Div1" runat="server" style="    BORDER-RIGHT: #dcdcdc 1px solid; BORDER-TOP: #dcdcdc 1px solid; OVERFLOW: auto; BORDER-LEFT: #dcdcdc 1px solid; WIDTH: 95%; BORDER-BOTTOM: #dcdcdc 1px solid; HEIGHT: 81px" >
                                                                <asp:CheckBoxList ID="LB_Complexion" runat="server" Height="60px" RepeatColumns="3"
                                                                    Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                                    Width="382px">
                                                                </asp:CheckBoxList></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <%-- table block --%>
                                                <%-- table block --%>
                                                <tr style="color: #ff0000">
                                                    <td class="grebg" colspan="2">
                                                        <img height="1" src="../Resources/trans.gif" /></td>
                                                </tr>
                                                <tr class="tabpadding" style="color: #ff0000">
                                                    <td class="grtxtbold1" style="width: 283px">
                                                        <div align="left">
                                                            &nbsp;&nbsp; Have Children</div>
                                                    </td>
                                                    <td style="width: 482px">
                                                        <div align="left">
                                                                <asp:RadioButton ID="RB_ChildrenDM" runat="server" CssClass="forminput" GroupName="Children" Text="Doesn't matter" />
                                                                <asp:RadioButton ID="RB_ChildrenNO" runat="server" CssClass="forminput" GroupName="Children" Text="No" />
                                                                <asp:RadioButton ID="RB_ChildrenYesLT" runat="server" CssClass="forminput" GroupName="Children" Text="Yes.Living Together." /><br />
                                                                <asp:RadioButton ID="RB_ChildrenYesNLT" runat="server" CssClass="forminput" GroupName="Children" Text="Yes.Not Living Together. " /></div>
                                                    </td>
                                                </tr>
                                                <%-- table block --%>
                                                <%-- table block --%>
                                                <tr>
                                                    <td class="grebg" colspan="2">
                                                        <img height="1" src="../Resources/trans.gif" /></td>
                                                </tr>
                                                <tr class="tabpadding">
                                                    <td class="grtxtbold1" style="width: 283px">
                                                        <div align="left">
                                                            &nbsp;&nbsp; Height</div>
                                                    </td>
                                                    <td style="width: 482px">
                                                        <div align="left">
                                                            <asp:DropDownList ID="DDL_Height_min" runat="server" Width="98px">
                                                            </asp:DropDownList> to 
                                                            <asp:DropDownList ID="DDL_Height_Max" runat="server" Width="98px">
                                                            </asp:DropDownList></div>
                                                    </td>
                                                </tr>
                                               <%-- table block --%>
                                                <tr>
                                                    <td class="grebg" colspan="2">
                                                        <img height="1" src="../Resources/trans.gif" /></td>
                                                </tr>
                                                <tr class="tabpadding">
                                                    <td class="grtxtbold1" style="text-align: left; width: 283px;">
                                                        &nbsp;&nbsp; Physical Status</td>
                                                    <td style="width: 482px">
                                                        <div align="left">
                                                            <asp:RadioButton ID="RB_phy_nor" runat="server" GroupName="Physical" Text="Normal " />
                                                            &nbsp;<asp:RadioButton ID="RB_phy_Dis" runat="server" GroupName="Physical" Text="Disabled" />
                                                            <asp:RadioButton ID="RB_phy_DMater" runat="server" GroupName="Physical" Text="Doesn't matter" /></div>
                                                    </td>
                                                </tr>
                                               <%-- table block --%>
                                                <tr style="font-weight: bold">
                                                    <td class="grebg" colspan="2">
                                                        <img height="1" src="../Resources/trans.gif" /></td>
                                                </tr>
                                                <tr class="tabpadding" >
                                                    <td class="grtxtbold1" style="width: 283px; height: 135px;">
                                                        <div align="left">
                                                            <span style="color: #ff0000">* </span>Mother Tongue</div>
                                                    </td>
                                                    <td style="width: 482px; height: 135px;">
                                                        <div align="left">
                                                            &nbsp;<div id="Div_MT" runat="server" style="    BORDER-RIGHT: #dcdcdc 1px solid; BORDER-TOP: #dcdcdc 1px solid; OVERFLOW: auto; BORDER-LEFT: #dcdcdc 1px solid; WIDTH: 95%; BORDER-BOTTOM: #dcdcdc 1px solid; HEIGHT: 110px" >
                                                                <asp:CheckBoxList ID="LB_MotherTongue" runat="server" Height="60px" RepeatColumns="3"
                                                                    Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                                    Width="382px">
                                                                </asp:CheckBoxList></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <%-- table block --%>
                                                <tr style="color: #000000">
                                                    <td class="grebg" colspan="2">
                                                        <img height="1" src="../Resources/trans.gif" /></td>
                                                </tr>
                                                <tr class="tabpadding" style="color: #000000">
                                                    <td class="grtxtbold1" style="width: 283px">
                                                        <div align="left">
                                                            <span style="color: #000000">&nbsp;<span style="color: #ff0000">*</span> </span>Expectations</div>
                                                    </td>
                                                    <td style="width: 482px">
                                                        <div align="left">
                                                            <asp:TextBox ID="TB_Expectations" runat="server" CssClass="forminput" Height="112px"
                                                                MaxLength="1000" TextMode="MultiLine" Width="382px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_Expectations"
                                                                ErrorMessage="*"></asp:RequiredFieldValidator><div style="padding-right: 10px">
                                                                    <font class="formcommentstxt"><span style="color: #000000">Use this space to talk about
                                                                        your partner preferences. Tell your prospective partner, what you would want see
                                                                        in him/her. Tell him/her you, your wants, your aspirations, your dreams and so on.
                                                                        <asp:TextBox ID="txtCount" runat="server" BorderColor="#E0E0E0" BorderStyle="None"
                                                                            BorderWidth="1px" ForeColor="Red" ReadOnly="True" Width="31px">1000</asp:TextBox></span></font></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <%-- table block --%>
                                                <tr style="color: #000000">
                                                    <td class="grebg" colspan="2" style="height: 1px">
                                                        <img height="1" src="../Resources/trans.gif" /></td>
                                                </tr>
                                              <%-- table block --%>
                                                <tr class="tabpadding">
                                                    <td class="grtxtbold1" colspan="2" style="text-align: left">
                                                        <strong>
                                                        Socio-Religious Preference</strong></td>
                                                </tr>
                                                <tr style="color: #a24f11; text-decoration: underline">
                                                    <td class="grebg" colspan="2" style="height: 1px">
                                                        <img height="1" src="../Resources/trans.gif" /></td>
                                                </tr>
                                              <%-- table block --%>
                                                <tr class="tabpadding" >
                                                    <td class="grtxtbold1" style="text-align: left; width: 283px;">
                                                        <span style="color: #000000"><span >*</span> </span>Religion</td>
                                                    <td style="text-align: left; width: 482px;">
                                                        <asp:CheckBox ID="CB_Religion_Any" runat="server" Checked="True" onclick="displayBlockReligion();"
                                                            Text="Any" /><div id="Div_Religion" runat="server" style="  display: none;  BORDER-RIGHT: #dcdcdc 1px solid; BORDER-TOP: #dcdcdc 1px solid; OVERFLOW: auto; BORDER-LEFT: #dcdcdc 1px solid; WIDTH: 91%; BORDER-BOTTOM: #dcdcdc 1px solid; HEIGHT: 110px" >
                                                                <asp:CheckBoxList ID="LB_Religion" runat="server" Height="71px" RepeatColumns="3"
                                                                    Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                                    Width="382px">
                                                                </asp:CheckBoxList></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="grebg" colspan="2" style="height: 1px">
                                                        <img height="1" src="../Resources/trans.gif" /></td>
                                                </tr>
                                                <%-- table block --%>
                                                <tr class="tabpadding">
                                                    <td class="grtxtbold1" style="text-align: left; width: 283px;">
                                                        <span style="color: #ff0000">* </span>Caste / Division</td>
                                                    <td style="text-align: left; width: 482px;">
                                                        <asp:CheckBox ID="CB_Caste_Any" runat="server" Checked="True" onclick="displayBlockCaste();"
                                                            Text="Any" />&nbsp;<div id="Div_Caste" runat="server" style=" display: none;   BORDER-RIGHT: #dcdcdc 1px solid; BORDER-TOP: #dcdcdc 1px solid; OVERFLOW: auto; BORDER-LEFT: #dcdcdc 1px solid; WIDTH: 91%; BORDER-BOTTOM: #dcdcdc 1px solid; HEIGHT: 110px" >
                                                                <asp:CheckBoxList ID="LB_Caste" runat="server" Height="71px" RepeatColumns="2" Style="font-weight: normal;
                                                                    font-size: 11px; color: black; font-family: Tahoma" Width="382px">
                                                                </asp:CheckBoxList></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="grebg" colspan="2" style="height: 1px">
                                                        <img height="1" src="../Resources/trans.gif" /></td>
                                                </tr>
                                                <tr class="tabpadding">
                                                    <td class="grtxtbold1" style="text-align: left; width: 283px;">
                                                        &nbsp;&nbsp; Chovva Dosham</td>
                                                    <td style="text-align: left; width: 482px;">
                                                        <asp:DropDownList ID="DDL_ChDosham" runat="server" Width="214px">
                                                        </asp:DropDownList></td>
                                                </tr>
                                                <tr>
                                                    <td class="grebg" colspan="2" style="height: 1px">
                                                        <img height="1" src="../Resources/trans.gif" /></td>
                                                </tr>
                                                <tr class="tabpadding">
                                                    <td class="grtxtbold1" style="text-align: left; width: 283px;">
                                                        &nbsp;&nbsp; Eating Habits&nbsp;</td>
                                                    <td class="formtxt" style="text-align: left; width: 482px;" valign="top">
                                                        <asp:DropDownList ID="DDL_EathingHabits" runat="server" Width="214px">
                                                        </asp:DropDownList>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="grebg" colspan="2" style="height: 1px">
                                                        <img height="1" src="../Resources/trans.gif" /></td>
                                                </tr>
                                                <%-- table block --%>
                                                <tr class="tabpadding">
                                                    <td class="grtxtbold1" colspan="2" style="height: 6px; text-align: left">
                                                        <strong><span style="color: black">Educational Preference</span></strong></td>
                                                </tr>
                                                <tr>
                                                    <td class="grebg" colspan="2" style="height: 1px">
                                                        <img height="1" src="../Resources/trans.gif" /></td>
                                                </tr>
                                               <%-- table block --%>
                                                <tr class="tabpadding">
                                                    <td class="grtxtbold1" style="text-align: left; width: 283px;">
                                                        <span style="color: #ff0000">* </span>Education</td>
                                                    <td style="text-align: left; width: 482px;">
                                                        <asp:CheckBox ID="CB_Education_Any" runat="server" Checked="True" onclick="displayBlockEducation();"
                                                            Text="Any" /><div runat="server" id="DIV_Education" style="display: none;    BORDER-RIGHT: #dcdcdc 1px solid; BORDER-TOP: #dcdcdc 1px solid; OVERFLOW: auto; BORDER-LEFT: #dcdcdc 1px solid; WIDTH: 91%; BORDER-BOTTOM: #dcdcdc 1px solid; HEIGHT: 110px">
                                                                <asp:CheckBoxList ID="LB_Education" runat="server" Height="71px" RepeatColumns="1"
                                                                    Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                                    Width="382px">
                                                                </asp:CheckBoxList></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="grebg" colspan="2" style="height: 1px">
                                                        <img height="1" src="../Resources/trans.gif" /></td>
                                                </tr>
                                                <tr class="tabpadding">
                                                    <td class="grtxtbold1" style="text-align: left; width: 283px;">
                                                        &nbsp;&nbsp; Edu Details
                                                    </td>
                                                    
                                                 
                                                    
                                                    <td class="formtxt" style="text-align: left; width: 482px;" valign="top">
                                                        <asp:CheckBox ID="CB_EduDet" runat="server" Checked="True" onclick="displayBlockEduDet();"
                                                            Text="Any" /><div runat="server" id="Div_EduDet" style=" display: none;   BORDER-RIGHT: #dcdcdc 1px solid; BORDER-TOP: #dcdcdc 1px solid; OVERFLOW: auto; BORDER-LEFT: #dcdcdc 1px solid; WIDTH: 91%; BORDER-BOTTOM: #dcdcdc 1px solid; HEIGHT: 110px">
                                                                <asp:CheckBoxList ID="LB_Edudetails" runat="server" Height="71px" RepeatColumns="1"
                                                                    Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                                    Width="382px">
                                                                </asp:CheckBoxList></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="grebg" colspan="2" style="height: 1px">
                                                        <img height="1" src="../Resources/trans.gif" /></td>
                                                </tr>
                                                <tr class="tabpadding">
                                                    <td class="grtxtbold1" style="text-align: left; width: 283px;">
                                                        &nbsp;&nbsp; Annual income
                                                    </td>
                                                    <td style="text-align: left; width: 482px;">
                                                        <asp:DropDownList ID="LB_AnnulIncome" runat="server" CssClass="forminput" Width="215px">
                                                        </asp:DropDownList></td>
                                                </tr>
                                                <tr>
                                                    <td class="grebg" colspan="2" style="height: 1px">
                                                        <img height="1" src="../Resources/trans.gif" /></td>
                                                </tr>
                                                <tr class="tabpadding">
                                                    <td class="grtxtbold1" style="text-align: left; width: 283px;">
                                                        &nbsp;&nbsp; Occupation
                                                    </td>
                                                    <td class="formtxt" style="text-align: left; width: 482px;" valign="top">
                                                        <asp:CheckBox ID="CB_Occupation_any" runat="server" Checked="True" onclick="displayBlockOccupation();"
                                                            Text="Any" /><div runat="server" id="DIV_Occupation" style="display: none;    BORDER-RIGHT: #dcdcdc 1px solid; BORDER-TOP: #dcdcdc 1px solid; OVERFLOW: auto; BORDER-LEFT: #dcdcdc 1px solid; WIDTH: 91%; BORDER-BOTTOM: #dcdcdc 1px solid; HEIGHT: 110px">
                                                                <asp:CheckBoxList ID="LB_Occupation" runat="server" Height="71px" RepeatColumns="1"
                                                                    Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                                    Width="382px">
                                                                </asp:CheckBoxList></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="grebg" colspan="2" style="height: 1px">
                                                        <img height="1" src="../Resources/trans.gif" /></td>
                                                </tr>
                                               <%-- table block --%>
                                                <tr class="tabpadding">
                                                    <td class="grtxtbold1" colspan="2" style="text-align: left">
                                                        <strong><span style="color: black">Location Preference</span></strong></td>
                                                </tr>
                                                <tr>
                                                    <td class="grebg" colspan="2" style="height: 1px">
                                                        <img height="1" src="../Resources/trans.gif" /></td>
                                                </tr>
                                                <%-- table block --%>
                                                <tr class="tabpadding">
                                                    <td class="grtxtbold1" style="text-align: left; width: 283px;">
                                                        <span style="color: #ff0000">* </span>Citizenship</td>
                                                    <td style="text-align: left; width: 482px;"><asp:CheckBox ID="CB_IndianX" runat="server" Checked="True" onclick="displayBlockI2();" /><asp:Label
                                                            ID="L_indianX" runat="server" Text="Only Indian"></asp:Label><div runat="server" id="DIV_IndianX" style="border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid;
                                                            display: none; overflow: auto; border-left: #dcdcdc 1px solid; width: 91%; border-bottom: #dcdcdc 1px solid;
                                                            height: 121px">
                                                            <asp:CheckBoxList ID="LB_Citizenship" runat="server" Height="71px" RepeatColumns="2"
                                                                Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                                Width="382px">
                                                            </asp:CheckBoxList></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="grebg" colspan="2" style="height: 1px">
                                                        <img height="1" src="../Resources/trans.gif" /></td>
                                                </tr>
                                                <tr class="tabpadding">
                                                    <td class="grtxtbold1" style="text-align: left; width: 283px;">
                                                        <span style="color: #ff0000">*</span>&nbsp; Country Living in</td>
                                                    <td class="formtxt" style="text-align: left; width: 482px;" valign="top">
                                                        <asp:CheckBox ID="CB_Indian" runat="server" Checked="True" onclick="displayBlockI1();" /><asp:Label
                                                            ID="L_Indian" runat="server" Text="Only Indian"></asp:Label>
                                                            <div runat="server" id="DIV_Indian" style="display: none;BORDER-RIGHT: #dcdcdc 1px solid; BORDER-TOP: #dcdcdc 1px solid; OVERFLOW: auto; BORDER-LEFT: #dcdcdc 1px solid; WIDTH: 91%; BORDER-BOTTOM: #dcdcdc 1px solid; HEIGHT: 110px">
                                                                <asp:CheckBoxList ID="LB_CountryLiving" runat="server" Height="71px" RepeatColumns="2"
                                                                    Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                                    Width="382px">
                                                                </asp:CheckBoxList></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="grebg" colspan="2" style="height: 1px">
                                                        <img height="1" src="../Resources/trans.gif" /></td>
                                                </tr>
                                                <tr class="tabpadding">
                                                    <td class="grtxtbold1" style="text-align: left; width: 283px;">
                                                        &nbsp;&nbsp; Residing State</td>
                                                    <td class="formtxt" style="text-align: left; width: 482px;" valign="top">
                                                        <asp:CheckBox ID="CB_StatesInIndia" runat="server" Checked="True" onclick="displayBlockState();" />
                                                        <asp:Label ID="L_ResidingInIndia" runat="server" Text="Residing In India"></asp:Label><br />
                                                        <div runat="server" id="DIV_States"  style="    BORDER-RIGHT: #dcdcdc 1px solid; BORDER-TOP: #dcdcdc 1px solid; OVERFLOW: auto; BORDER-LEFT: #dcdcdc 1px solid; WIDTH: 91%; BORDER-BOTTOM: #dcdcdc 1px solid; HEIGHT: 110px">
                                                            <asp:CheckBoxList ID="LB_Rasident_State" runat="server" Height="71px" RepeatColumns="2"
                                                                Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                                Width="379px">
                                                            </asp:CheckBoxList></div>
                                                        <asp:TextBox ID="TB_NonIndianState" runat="server" CssClass="forminput" Width="209px" style="display:none"></asp:TextBox>
                                                       
                                                    
                                                    
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="grebg" colspan="2" style="height: 1px">
                                                        <img height="1" src="../Resources/trans.gif" /></td>
                                                </tr>
                                                <tr class="tabpadding">
                                                    <td class="grtxtbold1" style="text-align: left; width: 283px;">
                                                        &nbsp;&nbsp; Resident Status</td>
                                                    <td class="formtxt" style="text-align: left; width: 482px;" valign="top">
                                                        <div id="Div2" runat="server" style="    BORDER-RIGHT: #dcdcdc 1px solid; BORDER-TOP: #dcdcdc 1px solid; OVERFLOW: auto; BORDER-LEFT: #dcdcdc 1px solid; WIDTH: 91%; BORDER-BOTTOM: #dcdcdc 1px solid; HEIGHT: 83px">
                                                            <asp:CheckBoxList ID="LB_Rasident_Status" runat="server" Height="60px" RepeatColumns="3"
                                                                Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                                Width="382px">
                                                            </asp:CheckBoxList></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="grebg" colspan="2" style="height: 1px">
                                                        <img height="1" src="../Resources/trans.gif" /></td>
                                                </tr>
                                                <tr class="tabpadding">
                                                    <td class="grtxtbold1" style="text-align: left; width: 283px;">
                                                        &nbsp;&nbsp;
                                                    </td>
                                                    <td class="formtxt" style="text-align: left; width: 482px;" valign="top">


                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="grebg" colspan="2" style="height: 1px">
                                                        <img height="1" src="../Resources/trans.gif" /></td>
                                                </tr>
                                           <%-- table block --%>
                                                <tr class="tabpadding">
                                                    <td colspan="3" height="7">
                                                        <div align="center">
                                                            <div align="center">
                                                                <asp:ImageButton ID="IB_Submit" runat="server" ImageUrl="~/Resources/button-Save.gif" />
                                                                &nbsp;
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
                                    <td class="grebg" colspan="3" valign="top">
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
