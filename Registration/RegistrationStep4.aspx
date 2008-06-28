<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegistrationStep4.aspx.cs"
    Inherits="RegistrationStep4" %>

<%@ Register Assembly="eWorld.UI" Namespace="eWorld.UI" TagPrefix="ew" %>

<%@ Register Src="../WeBControls/Footer_G.ascx" TagName="Footer_G" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Step: 4 - Patner Preference..</title>
    <link href="../Resources/style.css" rel="stylesheet" type="text/css">
    <link href="../Resources/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" language="JavaScript">
	<!--   -
	javascript:window.history.forward(1);
	//-  -->
	
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
<body oncontextmenu="return false" ondragstart="return false"
    leftmargin="0" topmargin="0" alink="#000000" bgcolor="#ffffff" link="#000000"
    text="#000000" vlink="#000000">
    <form runat="server" name="MatriForm" id="MatriForm" onsubmit="return Validate()">
        <div align="center">
            <table border="1" cellpadding="0" cellspacing="0" width="780" bordercolorlight="#ff00ff">
                <!--   -DWLayoutTable-  -->
                <tbody>
                    <tr>
                        <td height="164" width="780">
                            <table class="Tborder" align="center" bgcolor="#ffffff" border="0" cellpadding="0"
                                cellspacing="0" width="780">
                                <!--   -DWLayoutTable-  -->
                                <tbody>
                                    <tr>
                                        <td colspan="2" height="37" style="text-align: left">
                                            &nbsp;<img src="../Resources/logo.gif" border="0" ></td>
                                    </tr>
                                    <tr>
                                    </tr>
                                    <tr>
                                        <td colspan="2" valign="top">
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td colspan="2" height="206">
                                            <table align="center" border="0" width="100%">
                                                <tbody>
                                                    <tr>
                                                        <td class="LgHeading" width="570">
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        </td>
                                                        <td width="200">
                                                            Already Registered? <span class="h1dp"><a href="../guest/login.aspx">Login Now</a></span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="5" bgcolor="#cccccc" height="1">
                                                            <spacer type="block" height="1">
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <table align="center" border="0" width="746">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <div align="left">
                                                                <span class="LgHeading">Patner Preference..</span></div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="719">
                                                            <div align="left">
                                                                All Fields marks <span class="bodysg"><span class="Alert">*</span></span> are compulsory.<br>
                                                                Please mention accurate information in this form or your profile may be declined.
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div align="center">
                                                <br>
                                                <table border="0" cellpadding="0" cellspacing="0" width="746" style="color: #000000">
                                                    <tbody>
                                                        <tr>
                                                            <td class="grebg" colspan="3" height="12" valign="top">
                                                                <img src="../Resources/trans.gif"></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="grebg" width="12">
                                                                <img src="../Resources/trans.gif" height="1"></td>
                                                            <td class="lastnull" valign="top" width="722">
                                                                <table border="0" cellpadding="0" cellspacing="0" width="722">
                                                                    <tbody>
                                                                        <tr height="28">
                                                                            <td class="smalltxt" colspan="2" align="right">
                                                                                <div align="left">
                                                                                    <strong>&nbsp;</strong>&nbsp;</div>
                                                                            </td>
                                                                        </tr>
                                                                        <!--   --- -  -->
                                                                        <!--   - -  -->
                                                                        <!--   - -  -->
                                                                        <!--   - -  -->
                                                                        <tr class="tabpadding">
                                                                            <td colspan="2" class="grtxtbold1">
                                                                                <div align="left">
                                                                                    <strong><span>Primary Preference</span></strong></div>
                                                                            </td>
                                                                        </tr>
                                                                        <!--   - -  -->
                                                                        <!--   - -  -->
                                                                        <tr>
                                                                            <td class="grebg" colspan="2">
                                                                                <img src="../Resources/trans.gif" height="1"></td>
                                                                        </tr>
                                                                        <tr class="tabpadding">
                                                                            <td class="grtxtbold1">
                                                                                <div align="left">
                                                                                    <span style="color: #ff3300"><span class="style4">*</span> </span>Looking For
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div align="left"><asp:CheckBoxList ID="LB_MaritalStatus" runat="server" Height="28px" RepeatColumns="4"
                                                                                            Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                                                            Width="496px">
                                                                                </asp:CheckBoxList>&nbsp;</div>
                                                                            </td>
                                                                        </tr>
                                                                        <!--   - -  -->
                                                                        <!--   - -  -->
                                                                        <tr>
                                                                            <td class="grebg" colspan="2">
                                                                                <img src="../Resources/trans.gif" height="1"></td>
                                                                        </tr>
                                                                        <tr class="tabpadding">
                                                                            <td class="grtxtbold1">
                                                                                <div align="left">
                                                                                    <span style="color: #ff0033">* </span>Age
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div align="left">
                                                                                    From 
                                                                                    <ew:NumericBox ID="TB_Age_min" runat="server" CssClass="forminput" MaxLength="2"
                                                                                        Width="24px"></ew:NumericBox>&nbsp;<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TB_Age_min"
                                                                                        ErrorMessage="*" MaximumValue="90" MinimumValue="18" Type="Integer"></asp:RangeValidator>
                                                                                    to&nbsp;<ew:NumericBox ID="TB_Age_Max" runat="server" CssClass="forminput" MaxLength="2"
                                                                                        Width="24px"></ew:NumericBox>&nbsp;<asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TB_Age_Max"
                                                                                        ErrorMessage="*" MaximumValue="91" MinimumValue="19" Type="Integer"></asp:RangeValidator></div>
                                                                            </td>
                                                                        </tr>
                                                                        <!--   - -  -->
                                                                        <!--   - -  -->
                                                                        <tr>
                                                                            <td class="grebg" colspan="2">
                                                                                <img src="../Resources/trans.gif" height="1"></td>
                                                                        </tr>
                                                                        <tr class="tabpadding">
                                                                            <td class="grtxtbold1">
                                                                                <div align="left">
                                                                                    &nbsp;&nbsp; Complexion</div>
                                                                            </td>
                                                                            <td style="text-align: left">
                                                                                <div id="Div10" runat="server" style="border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid;
                                                                                    overflow: auto; border-left: #dcdcdc 1px solid; width: 96%; border-bottom: #dcdcdc 1px solid;
                                                                                    height: 84px">
                                                                                
                                                                                    <asp:CheckBoxList ID="LB_Complexion" runat="server" Height="71px" RepeatColumns="3"
                                                                                        Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                                                        Width="456px">
                                                                                    </asp:CheckBoxList></div>
                                                                            </td>
                                                                        </tr>
                                                                        <!--   - -  -->
                                                                        <!--   - -  -->
                                                                        <tr>
                                                                            <td class="grebg" colspan="2">
                                                                                <img src="../Resources/trans.gif" height="1"></td>
                                                                        </tr>
                                                                        <tr class="tabpadding">
                                                                            <td class="grtxtbold1">
                                                                                <div align="left">
                                                                                    &nbsp;&nbsp; Have Children</div>
                                                                            </td>
                                                                            <td>
                                                                                <div align="left">
                                                                                    <span class="formselect">
                                                                                        <asp:RadioButton ID="RB_ChildrenDM" runat="server" CssClass="forminput" GroupName="Children" />&nbsp;<span style="color: #000000">Doesn't matter&nbsp;<asp:RadioButton ID="RB_ChildrenNO" runat="server" CssClass="forminput"
                                                                                            GroupName="Children" />
                                                                                        No&nbsp;<asp:RadioButton ID="RB_ChildrenYesLT" runat="server" CssClass="forminput"
                                                                                            GroupName="Children" />
                                                                                        Yes.Living Together.&nbsp;<asp:RadioButton ID="RB_ChildrenYesNLT" runat="server"
                                                                                            CssClass="forminput" GroupName="Children" />
                                                                                        Yes.Not Living Together. </span></span>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <!--   - -  -->
                                                                        <!--   - -  -->
                                                                        <tr>
                                                                            <td class="grebg" colspan="2">
                                                                                <img src="../Resources/trans.gif" height="1"></td>
                                                                        </tr>
                                                                        <tr class="tabpadding">
                                                                            <td class="grtxtbold1">
                                                                                <div align="left">
                                                                                    &nbsp;&nbsp; Height</div>
                                                                            </td>
                                                                            <td>
                                                                                <div align="left">
                                                                                    <asp:DropDownList ID="DDL_Height_min" runat="server" Width="98px">
                                                                                    </asp:DropDownList>
                                                                                    to
                                                                                    <asp:DropDownList ID="DDL_Height_Max" runat="server" Width="98px">
                                                                                    </asp:DropDownList></div>
                                                                            </td>
                                                                        </tr>
                                                                        <!--   - -  -->
                                                                        <!--   - -  -->
                                                                        <tr>
                                                                            <td class="grebg" colspan="2">
                                                                                <img src="../Resources/trans.gif" height="1"></td>
                                                                        </tr>
                                                                        <tr class="tabpadding">
                                                                            <td class="grtxtbold1" style="text-align: left">
                                                                                &nbsp;&nbsp; Physical Status</td>
                                                                            <td>
                                                                                <div align="left">
                                                                                    <asp:RadioButton ID="RB_phy_nor" runat="server" GroupName="Physical" />
                                                                                    &nbsp;Normal&nbsp;<asp:RadioButton ID="RB_phy_Dis" runat="server" GroupName="Physical" />
                                                                                    Disabled
                                                                                    <asp:RadioButton ID="RB_phy_DMater" runat="server" GroupName="Physical" />
                                                                                    Doesn't matter</div>
                                                                            </td>
                                                                        </tr>
                                                                        <!--   - -  -->
                                                                        <!--   - -  -->
                                                                        <tr>
                                                                            <td class="grebg" colspan="2">
                                                                                <img src="../Resources/trans.gif" height="1"></td>
                                                                        </tr>
                                                                        <tr class="tabpadding">
                                                                            <td class="grtxtbold1">
                                                                                <div align="left">
                                                                                    <span style="color: #ff0033">* </span>Mother Tongue</div>
                                                                            </td>
                                                                            <td>
                                                                                <div align="left">
                                                                                    &nbsp;<div id="DivMT" runat="server" style="border-right: #dcdcdc 1px solid;
                                                                                        border-top: #dcdcdc 1px solid; overflow: auto; border-left: #dcdcdc 1px solid;
                                                                                        width: 96%; border-bottom: #dcdcdc 1px solid; height: 110px">
                                                                                        <asp:CheckBoxList ID="LB_MotherTongue" runat="server" Height="71px" RepeatColumns="3"
                                                                                            Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                                                            Width="457px">
                                                                                        </asp:CheckBoxList></div>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <!--   - -  -->
                                                                        <!--   - -  -->
                                                                        <tr>
                                                                            <td class="grebg" colspan="2">
                                                                                <img src="../Resources/trans.gif" height="1"></td>
                                                                        </tr>
                                                                        <tr class="tabpadding">
                                                                            <td class="grtxtbold1">
                                                                                <div align="left">
                                                                                    <span style="color: #ff0000">&nbsp;* </span>Expectations</div>
                                                                            </td>
                                                                            <td>
                                                                                <div align="left">
                                                                                    <asp:TextBox ID="TB_Expectations" runat="server" CssClass="forminput" Height="112px"
                                                                                        MaxLength="1000" TextMode="MultiLine" Width="475px"></asp:TextBox>
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
                                                                        <!--   - -  -->
                                                                        <!--   - -  -->
                                                                        <tr style="color: #000000">
                                                                            <td class="grebg" colspan="2" style="height: 1px">
                                                                                <img src="../Resources/trans.gif" height="1"></td>
                                                                        </tr>
                                                                        <!--   - -  -->
                                                                        <!--   - -  -->
                                                                        <!--   - -  -->
                                                                        <!--   - -  -->
                                                                        <!--   - -  -->
                                                                        <!--   - -  -->
                                                                        <!--   - -  -->
                                                                        <!--   - -  -->
                                                                        <tr class="tabpadding" style="color: #000000">
                                                                            <td colspan="2" class="grtxtbold1" style="text-align: left">
                                                                                <strong><span>Socio-Religious Preference</span></strong></td>
                                                                        </tr>
                                                                        <tr style="color: #000000">
                                                                            <td class="grebg" colspan="2" style="height: 1px">
                                                                                <img src="../Resources/trans.gif" height="1"></td>
                                                                        </tr>
                                                                        <!--   - -  -->
                                                                        <!--   - -  -->
                                                                        <!--   - -  -->
                                                                        <!--   - -  -->
                                                                        <tr class="tabpadding" style="color: #000000">
                                                                            <td class="grtxtbold1" style="text-align: left">
                                                                                <span style="color: #ff0000">* </span>Religion</td>
                                                                            <td style="text-align: left">
                                                                                <asp:CheckBox ID="CB_Religion_Any" runat="server" Checked="True" onclick="displayBlockReligion();"
                                                                                    Text="Any" /><div id="Div_Religion" runat="server" style="border-right: #dcdcdc 1px solid;
                                                                                        border-top: #dcdcdc 1px solid; display: none; overflow: auto; border-left: #dcdcdc 1px solid;
                                                                                        width: 98%; border-bottom: #dcdcdc 1px solid; height: 110px">
                                                                                        <asp:CheckBoxList ID="LB_Religion" runat="server" Height="71px" RepeatColumns="3"
                                                                                            Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                                                            Width="443px">
                                                                                        </asp:CheckBoxList></div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="grebg" colspan="2" style="height: 1px">
                                                                                <img src="../Resources/trans.gif" height="1"></td>
                                                                        </tr>
                                                                        <!--   - -  -->
                                                                        <tr class="tabpadding">
                                                                            <td class="grtxtbold1" style="text-align: left">
                                                                                <span style="color: #ff0000">* </span>Caste / Division</td>
                                                                            <td style="text-align: left">
                                                                                <asp:CheckBox ID="CB_Caste_Any" runat="server" Checked="True" onclick="displayBlockCaste();"
                                                                                    Text="Any" /><div id="Div_Caste" style="border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid;
                                                                                        display: none; overflow: auto; border-left: #dcdcdc 1px solid; width: 98%; border-bottom: #dcdcdc 1px solid;
                                                                                        height: 110px">
                                                                                        <asp:CheckBoxList ID="LB_Caste" runat="server" Height="71px" RepeatColumns="2" Style="font-weight: normal;
                                                                                            font-size: 11px; color: black; font-family: Tahoma" Width="443px">
                                                                                        </asp:CheckBoxList></div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="grebg" colspan="2" style="height: 1px">
                                                                                <img src="../Resources/trans.gif" height="1"></td>
                                                                        </tr>
                                                                        <tr class="tabpadding">
                                                                            <td class="grtxtbold1" style="text-align: left">
                                                                                &nbsp;&nbsp; Chovva Dosham</td>
                                                                            <td style="text-align: left">
                                                                                <asp:DropDownList ID="DDL_ChDosham" runat="server" Width="215px" CssClass="forminput">
                                                                                </asp:DropDownList></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="grebg" colspan="2" style="height: 1px">
                                                                                <img src="../Resources/trans.gif" height="1"></td>
                                                                        </tr>
                                                                        <tr class="tabpadding">
                                                                            <td class="grtxtbold1" style="text-align: left">
                                                                                &nbsp;&nbsp; Eating Habits&nbsp;</td>
                                                                            <td class="formtxt" valign="top" width="500" style="text-align: left">
                                                                                <asp:DropDownList ID="DDL_EathingHabits" runat="server" Width="215px" CssClass="forminput">
                                                                                </asp:DropDownList>&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="grebg" colspan="2" style="height: 1px">
                                                                                <img src="../Resources/trans.gif" height="1"></td>
                                                                        </tr>
                                                                        <!--   -   ---------------------------------------  -->
                                                                        <tr class="tabpadding">
                                                                            <td colspan="2" class="grtxtbold1" style="text-align: left; height: 6px;">
                                                                                <strong><span style="color: black">Educational Preference</span></strong></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="grebg" colspan="2" style="height: 1px">
                                                                                <img src="../Resources/trans.gif" height="1"></td>
                                                                        </tr>
                                                                        <!--   -----------------------------------------  -->
                                                                        <tr class="tabpadding">
                                                                            <td class="grtxtbold1" style="text-align: left">
                                                                                <span style="color: #ff0000">* </span>Education</td>
                                                                            <td style="text-align: left">
                                                                                <asp:CheckBox ID="CB_Education_Any" runat="server" Checked="True" onclick="displayBlockEducation();"
                                                                                    Text="Any" /><div id="DIV_Education" style="border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid;
                                                                                        display: none; overflow: auto; border-left: #dcdcdc 1px solid; width: 98%; border-bottom: #dcdcdc 1px solid;
                                                                                        height: 110px">
                                                                                        <asp:CheckBoxList ID="LB_Education" runat="server" Height="71px" RepeatColumns="1"
                                                                                            Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                                                            Width="445px">
                                                                                        </asp:CheckBoxList></div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="grebg" colspan="2" style="height: 1px">
                                                                                <img src="../Resources/trans.gif" height="1"></td>
                                                                        </tr>
                                                                        <tr class="tabpadding">
                                                                            <td class="grtxtbold1" style="text-align: left">
                                                                                &nbsp;&nbsp; Edu Details
                                                                            </td>
                                                                            <td class="formtxt" valign="top" width="500" style="text-align: left">
                                                                                <asp:CheckBox ID="CB_EduDet" runat="server" Checked="True" onclick="displayBlockEduDet();"
                                                                                    Text="Any" /><div id="Div_EduDet" style="border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid;
                                                                                        display: none; overflow: auto; border-left: #dcdcdc 1px solid; width: 98%; border-bottom: #dcdcdc 1px solid;
                                                                                        height: 110px">
                                                                                        <asp:CheckBoxList ID="LB_Edudetails" runat="server" Height="71px" RepeatColumns="1"
                                                                                            Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                                                            Width="447px">
                                                                                        </asp:CheckBoxList></div>
                                                                                &nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="grebg" colspan="2" style="height: 1px">
                                                                                <img src="../Resources/trans.gif" height="1"></td>
                                                                        </tr>
                                                                        <tr class="tabpadding">
                                                                            <td class="grtxtbold1" style="text-align: left">
                                                                                &nbsp;&nbsp; Annual income in IRs</td>
                                                                            <td style="text-align: left"><asp:DropDownList ID="LB_AnnulIncome" runat="server" Width="215px" CssClass="forminput">
                                                                            </asp:DropDownList></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="grebg" colspan="2" style="height: 1px">
                                                                                <img src="../Resources/trans.gif" height="1"></td>
                                                                        </tr>
                                                                        <tr class="tabpadding">
                                                                            <td class="grtxtbold1" style="text-align: left">
                                                                                &nbsp;&nbsp; Occupation
                                                                            </td>
                                                                            <td class="formtxt" valign="top" width="500" style="text-align: left">
                                                                                <asp:CheckBox ID="CB_Occupation_any" runat="server" Checked="True" onclick="displayBlockOccupation();"
                                                                                    Text="Any" /><div id="DIV_Occupation" style="border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid;
                                                                                        display: none; overflow: auto; border-left: #dcdcdc 1px solid; width: 98%; border-bottom: #dcdcdc 1px solid;
                                                                                        height: 110px">
                                                                                        <asp:CheckBoxList ID="LB_Occupation" runat="server" Height="71px" RepeatColumns="1"
                                                                                            Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                                                            Width="453px">
                                                                                        </asp:CheckBoxList></div>
                                                                                &nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="grebg" colspan="2" style="height: 1px">
                                                                                <img src="../Resources/trans.gif" height="1"></td>
                                                                        </tr>

                                                                        <tr class="tabpadding">
                                                                            <td colspan="2" class="grtxtbold1" style="text-align: left">
                                                                                <strong><span style="color: black">Location Preference</span></strong></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="grebg" colspan="2" style="height: 1px">
                                                                                <img src="../Resources/trans.gif" height="1"></td>
                                                                        </tr>

                                                                        <tr class="tabpadding">
                                                                            <td class="grtxtbold1" style="text-align: left">
                                                                                <span style="color: #ff0000">* </span>Citizenship</td>
                                                                            <td style="text-align: left">
                                                                                <asp:CheckBox ID="CB_IndianX" runat="server" Checked="True" onclick="displayBlockI2();" /><asp:Label
                                                                                    ID="L_indianX" runat="server" Text="Only Indian"></asp:Label><div id="DIV_IndianX"
                                                                                        style="border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid; display: none;
                                                                                        overflow: auto; border-left: #dcdcdc 1px solid; width: 98%; border-bottom: #dcdcdc 1px solid;
                                                                                        height: 121px">
                                                                                        <asp:CheckBoxList ID="LB_Citizenship" runat="server" Height="71px" RepeatColumns="2"
                                                                                            Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                                                            Width="457px">
                                                                                        </asp:CheckBoxList></div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="grebg" colspan="2" style="height: 1px">
                                                                                <img src="../Resources/trans.gif" height="1"></td>
                                                                        </tr>
                                                                        <tr class="tabpadding">
                                                                            <td class="grtxtbold1" style="text-align: left">
                                                                                <span style="color: #ff0000">*</span>&nbsp; Country Living in</td>
                                                                            <td class="formtxt" valign="top" width="500" style="text-align: left">
                                                                                <asp:CheckBox ID="CB_Indian" runat="server" Checked="True" onclick="displayBlockI1();" /><asp:Label
                                                                                    ID="L_Indian" runat="server" Text="Only Indian"></asp:Label><div id="DIV_Indian"
                                                                                        style="border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid; display: none;
                                                                                        overflow: auto; border-left: #dcdcdc 1px solid; width: 98%; border-bottom: #dcdcdc 1px solid;
                                                                                        height: 110px">
                                                                                        <asp:CheckBoxList ID="LB_CountryLiving" runat="server" Height="71px" RepeatColumns="2"
                                                                                            Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                                                            Width="455px">
                                                                                        </asp:CheckBoxList></div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="grebg" colspan="2" style="height: 1px">
                                                                                <img src="../Resources/trans.gif" height="1"></td>
                                                                        </tr>
                                                                        <tr class="tabpadding">
                                                                            <td class="grtxtbold1" style="text-align: left">
                                                                                &nbsp;&nbsp; Residing State</td>
                                                                            <td class="formtxt" valign="top" width="500" style="text-align: left">
                                                                                <asp:CheckBox ID="CB_StatesInIndia" runat="server" Checked="True" onclick="displayBlockState();" />
                                                                                <asp:Label ID="L_ResidingInIndia" runat="server" Text="Residing In India"></asp:Label><br />
                                                                                <div id="DIV_States" runat="server" style="border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid;
                                                                                    overflow: auto; border-left: #dcdcdc 1px solid; width: 98%; border-bottom: #dcdcdc 1px solid;
                                                                                    height: 110px">
                                                                                    <asp:CheckBoxList ID="LB_Rasident_State" runat="server" Height="71px" RepeatColumns="3"
                                                                                        Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                                                        Width="457px">
                                                                                    </asp:CheckBoxList></div>
                                                                                <asp:TextBox ID="TB_NonIndianState" runat="server" CssClass="forminput" Width="209px" style="display:none"></asp:TextBox></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="grebg" colspan="2" style="height: 1px">
                                                                                <img src="../Resources/trans.gif" height="1"></td>
                                                                        </tr>
                                                                        <tr class="tabpadding">
                                                                            <td class="grtxtbold1" style="text-align: left">
                                                                                &nbsp;&nbsp; Resident Status</td>
                                                                            <td class="formtxt" valign="top" width="500" style="text-align: left">
                                                                                <div id="Div9" runat="server" style="border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid;
                                                                                    overflow: auto; border-left: #dcdcdc 1px solid; width: 98%; border-bottom: #dcdcdc 1px solid;
                                                                                    height: 86px">
                                                                                    <asp:CheckBoxList ID="LB_Rasident_Status" runat="server" Height="71px" RepeatColumns="3"
                                                                                        Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                                                        Width="457px">
                                                                                    </asp:CheckBoxList></div>
                                                                                &nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="grebg" colspan="2" style="height: 1px">
                                                                                <img src="../Resources/trans.gif" height="1"></td>
                                                                        </tr>
                                                                        <tr class="tabpadding">
                                                                            <td class="grtxtbold1" style="text-align: left">
                                                                                &nbsp;&nbsp;
                                                                            </td>
                                                                            <td class="formtxt" valign="top" width="500" style="text-align: left">
                                                                                <a href="#" onclick="window.open('UploadImage.aspx','Upload','scrollbars=yes,width=600,height=285')">
                                                                                    Yes I have an Image to upload</a>&nbsp;&nbsp; 
                                                                                    <a href="#" onclick="window.open('../Extras/AboutImage.aspx','Upload','scrollbars=no,width=735,height=420')">
                                                                                        ?</a>&nbsp;
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="grebg" colspan="2" style="height: 1px">
                                                                                <img src="../Resources/trans.gif" height="1"></td>
                                                                        </tr>
                                                                        <!--   -----------------------------------------  -->
                                                                        <tr class="tabpadding">
                                                                            <td colspan="3" height="7">
                                                                                <div align="center">
                                                                                    <div align="center">
                                                                                        <asp:ImageButton ID="IB_Submit" runat="server" ImageUrl="~/Resources/reg1.gif"
                                                                                            OnClick="IB_Submit_Click1" />
                                                                                        &nbsp;
                                                                                    </div>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                            <td class="grebg" width="12">
                                                                <img src="../Resources/trans.gif" height="1"></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="grebg" colspan="3" valign="top">
                                                                <img src="../Resources/trans.gif" height="12" width="564"></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                    </tr>
                                </tbody>
                            </table>
                            <uc1:Footer_G ID="Footer_G1" runat="server" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </form>
</body>
</html>
