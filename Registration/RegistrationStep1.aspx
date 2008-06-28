<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegistrationStep1.aspx.cs" Inherits="RegistrationStep1" %>

<%@ Register Src="../WeBControls/Footer_G.ascx" TagName="Footer_G" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<link href="../Resources/style.css" rel="stylesheet" type="text/css">
    <link href="../Resources/style.css" rel="stylesheet" type="text/css" />
    <link href="../Resources/style_2.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../Resources/PPPrimary.js"></script>
    <script type="text/javascript" src="../Resources/pswdplc.js"></script>

	<script type="text/javascript" language="JavaScript">
	<!--
	javascript:window.history.forward(1);
	//-->
	</script>
	  
    <script type="text/javascript" language="JavaScript">

    function updateDay(change,formName,yearName,monthName,dayName)
    {	
    	
	    var form = document.forms[formName];
	    var yearSelect = form[yearName];
	    var monthSelect = form[monthName];
	    var daySelect = form[dayName];
	    var year = yearSelect[yearSelect.selectedIndex].value;
	    var month = monthSelect[monthSelect.selectedIndex].value;
	    var day = daySelect[daySelect.selectedIndex].value;

	    if (change == 'month' || (change == 'year' && month == 2))
	    {
		    var i = 31;
		    var flag = true;
		    while(flag)
		    {
			    var date = new Date(year,month-1,i);
			    if (date.getMonth() == month - 1)
			    {
				    flag = false;
			    }
			    else
			    {
				    i = i - 1;
			    }
		    }

		    daySelect.length = 0;
		    daySelect.length = i;
		    var j = 0;
		    while(j < i)
		    {
			    daySelect[j] = new Option(j+1,j+1);
			    j = j + 1;
		    }
		    if (day <= i)
		    {
			    daySelect.selectedIndex = day - 1;
		    }
		    else
		    {
			    daySelect.selectedIndex = daySelect.length - 1;
		    }
	    }
    }

</script>


    <link href="../Resources/style.css" rel="stylesheet" type="text/css" />
</head>

<body oncontextmenu="return false"  ondragstart="return false" leftmargin="0" topmargin="0" alink="#000000" bgcolor="#ffffff" link="#000000"  text="#000000" vlink="#000000">

<form id="MatriForm"  runat="server" name="MatriForm">
<div align="center">
  
  <table class="BlueTborder" bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" width="780">
    <!--DWLayoutTable-->
    <tbody><tr>
      <td height="164" width="780">
	  
	
        <table align="center" border="0" cellpadding="0" cellspacing="0" width="780">
          <!--DWLayoutTable-->
          <tbody>
          
          <tr>            </tr>
          <tr>
            <td colspan="2" height="17" valign="top" style="text-align: left">
						
									<!-- MEMBER NOT LOGGED IN -->
    <img src="../Resources/logo.gif"  border="0">&nbsp;<map name="Map1" id="Map1"><area shape="rect" coords="4,2,58,25" href="../guest/Home.aspx"alt="Home"><area shape="rect" coords="61,2,153,25" href="../guest/JoinNow.aspx" alt="Free Registration"><area shape="rect" coords="165,3,269,24" href="../guest/Login.aspx" alt="Member Login"><area shape="rect" coords="280,2,380,24" href="../guest/SearchOptions.aspx" alt="Free Search"><area shape="rect" coords="393,2,476,24" href="../Guest/Membership.aspx" alt="Membership Scheme"><area shape="rect" coords="661,2,779,26" href="../Extras/paymentasp:ListItems.aspx" alt="Payment Option"><area shape="rect" coords="493,2,530,25" href="../Extras/help.aspx" alt="Help"><area shape="rect" coords="541,3,648,26" href="../guest/SuccessStory.aspx" alt="Success Stories"></map></td>
          </tr>
          
          <tr valign="top">
            <td colspan="2" height="206">
               
                  <table align="center" border="0" width="100%">
                    <tbody><tr>
                      <td class="LgHeading" width="570">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                      <td width="200">Already Registered? <span class="h1dp"><a href="../guest/login.aspx">Login Now</a></span> </td>
                    </tr>
                    <tr>
                        <td colspan="5" bgcolor="#cccccc" height="1"></td>
                    </tr>
                  </tbody></table>
                  <table align="center" border="0" width="100%">
                    <tbody><tr>
                      <td>&nbsp;</td>
                      <td><div align="left">
                          &nbsp;</div></td>
                    </tr>
                    <tr>
                      <td width="51">&nbsp;</td>
                      <td width="719"><div align="left"><br>
                          <img src="../Resources/chklist-tick.gif" height="9" width="9"> Please mention accurate information in this form or your profile may be declined.<br>
                          <img src="../Resources/chklist-tick.gif" height="9" width="9"> Spend a Few minutes to create your Profilel to find a correct life partner.<br />
                          <asp:Label ID="LabelDisplay" runat="server" ForeColor="Red" Visible="False"></asp:Label></div></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                  </tbody></table>
				  
				 
                  
                  <div align="center"><br>
                      <table border="0" cellpadding="0" cellspacing="0" width="746">
                        <tbody><tr>
                          <td class="grebg" colspan="3" height="12" valign="top"><img src="../Resources/trans.gif"></td>
                        </tr>
                        <tr>
                          <td class="grebg" style="width: 12px"><img src="../Resources/trans.gif" height="1"></td>
                          <td class="lastnull" valign="top" width="722"><table border="0" cellpadding="0" cellspacing="0" width="722">
                              <tbody><tr height="28">
                                <td class="smalltxt" colspan="2" align="right"><div align="left" style="text-align: center">
                                    &nbsp;</div></td>
                              </tr>
							  
							  
							  <!---- -->			  
					<tr>
					<td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
					</tr>
					<tr class="tabpadding">
					  <td colspan="2" class="grtxtbold1"><div align="left"><span class="bodysg">Basic Information </span></div></td>
					  </tr>
				<!---- -->		
							  
							  
                              <tr>
                                <td class="grebg" colspan="2"></td>
                              </tr>
                              <tr class="tabpadding">
                                <td class="grtxtbold1"><div align="left"><span class="Alert">* </span>Name</div></td>
                                <td><div align="left">
                                    <asp:TextBox ID="TB_Name" runat="server" CssClass="forminput" MaxLength="64" Width="210px"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_Name" ErrorMessage="*"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div></td>
                              </tr>
							  
				
					
					<!-- -->		  
					<tr>
					<td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
					</tr>
					<tr class="tabpadding">
					<td class="grtxtbold1"><div align="left"><span class="Alert">* </span>Gender</div></td>
					<td><div align="left">
                        <asp:RadioButton ID="RB_Male" runat="server" GroupName="Gender" />
                        &nbsp;Male 
					&nbsp;&nbsp;<asp:RadioButton ID="RB_FMale" runat="server" GroupName="Gender" />
                        &nbsp;
					Female </div></td>
					</tr>
					<!-- -->
							  
							  
                              <tr>
                                <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                              </tr>
                              <tr class="tabpadding">
                                <td class="grtxtbold1"><div align="left"><span class="Alert">*</span> Date of Birth</div></td>
                                <td class="smalltxt"><div align="left">
                                            <asp:DropDownList ID="DDL_dobMonth" runat="server" CssClass="forminput" name="DDL_dobMonth" onchange="updateDay('month','MatriForm','DDL_dobYear','DDL_dobMonth','DDL_dobDay');">
                                                <asp:ListItem Selected="True">-Month-</asp:ListItem>
                                                <asp:ListItem Value="1">January</asp:ListItem>
                                                <asp:ListItem Value="2">February</asp:ListItem>
                                                <asp:ListItem Value="3">March</asp:ListItem>
                                                <asp:ListItem Value="4">April</asp:ListItem>
                                                <asp:ListItem Value="5">May</asp:ListItem>
                                                <asp:ListItem Value="6">June</asp:ListItem>
                                                <asp:ListItem Value="7">July</asp:ListItem>
                                                <asp:ListItem Value="8">August</asp:ListItem>
                                                <asp:ListItem Value="9">September</asp:ListItem>
                                                <asp:ListItem Value="10">October</asp:ListItem>
                                                <asp:ListItem Value="11">November</asp:ListItem>
                                                <asp:ListItem Value="12">December</asp:ListItem>
                                            </asp:DropDownList>&nbsp;
                                            
                                            <asp:DropDownList ID="DDL_dobDay" runat="server" class="forminput" name="DDL_dobDay">
                                                <asp:ListItem Selected="true" Value="">-Date-</asp:ListItem>
                                                <asp:ListItem Value="1">1</asp:ListItem>
                                                <asp:ListItem Value="2">2</asp:ListItem>
                                                <asp:ListItem Value="3">3</asp:ListItem>
                                                <asp:ListItem Value="4">4</asp:ListItem>
                                                <asp:ListItem Value="5">5</asp:ListItem>
                                                <asp:ListItem Value="6">6</asp:ListItem>
                                                <asp:ListItem Value="7">7</asp:ListItem>
                                                <asp:ListItem Value="8">8</asp:ListItem>
                                                <asp:ListItem Value="9">9</asp:ListItem>
                                                <asp:ListItem Value="10">10</asp:ListItem>
                                                <asp:ListItem Value="11">11</asp:ListItem>
                                                <asp:ListItem Value="12">12</asp:ListItem>
                                                <asp:ListItem Value="13">13</asp:ListItem>
                                                <asp:ListItem Value="14">14</asp:ListItem>
                                                <asp:ListItem Value="15">15</asp:ListItem>
                                                <asp:ListItem Value="16">16</asp:ListItem>
                                                <asp:ListItem Value="17">17</asp:ListItem>
                                                <asp:ListItem Value="18">18</asp:ListItem>
                                                <asp:ListItem Value="19">19</asp:ListItem>
                                                <asp:ListItem Value="20">20</asp:ListItem>
                                                <asp:ListItem Value="21">21</asp:ListItem>
                                                <asp:ListItem Value="22">22</asp:ListItem>
                                                <asp:ListItem Value="23">23</asp:ListItem>
                                                <asp:ListItem Value="24">24</asp:ListItem>
                                                <asp:ListItem Value="25">25</asp:ListItem>
                                                <asp:ListItem Value="26">26</asp:ListItem>
                                                <asp:ListItem Value="27">27</asp:ListItem>
                                                <asp:ListItem Value="28">28</asp:ListItem>
                                                <asp:ListItem Value="29">29</asp:ListItem>
                                                <asp:ListItem Value="30">30</asp:ListItem>
                                                <asp:ListItem Value="31">31</asp:ListItem>
                                                </asp:DropDownList>
                                            &nbsp;
                                            
                                            <asp:DropDownList ID="DDL_dobYear" runat="server" class="forminput" name="DDL_dobYear" onchange="updateDay('year','MatriForm','DDL_dobYear','DDL_dobMonth','DDL_dobDay');">
                                                <asp:ListItem Selected="True" Value="">-Year-</asp:ListItem>
                                            </asp:DropDownList>
                            
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="DDL_dobDay"
                                        ErrorMessage="*" InitialValue="0"></asp:RequiredFieldValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="DDL_dobMonth"
                                        ErrorMessage="*" InitialValue="0"></asp:RequiredFieldValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="DDL_dobYear"
                                        ErrorMessage="*" InitialValue="0"></asp:RequiredFieldValidator></div></td>
                              </tr>
                              <tr>
                                <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                              </tr>
                              <tr class="tabpadding">
                                <td class="grtxtbold1"><div align="left"><span class="Alert">* </span>Marital Status</div></td>
                                <td class="smalltxt"><div align="left">
                                    <asp:RadioButton ID="RB_MS_UM" runat="server" GroupName="MS" />
                                    &nbsp;Unmarried &nbsp;&nbsp;<asp:RadioButton ID="RB_MS_WW" runat="server" GroupName="MS" />&nbsp;
Widow/Widower &nbsp;&nbsp;<asp:RadioButton ID="RB_MS_Div" runat="server" GroupName="MS" />
                                    &nbsp;
Divorcee &nbsp;&nbsp;&nbsp;<asp:RadioButton ID="RB_MS_Sep" runat="server" GroupName="MS" />&nbsp;
Separated </div></td>
                              </tr>
                              <tr>
                                <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                              </tr>
                              <tr class="tabpadding">
                                <td class="grtxtbold1" width="210"><div align="left"><span class="Alert"> </span><span class="Alert"> </span><span class="bodysg">&nbsp;</span>&nbsp;No. of Children</div></td>
                                <td valign="top"><div align="left">
                                    <asp:DropDownList ID="DDL_NoOfChildren" runat="server" CssClass="forminput" Width="217px">
                                        <asp:ListItem Selected="True" Value="8">-- Select --</asp:ListItem>
                                        <asp:ListItem Value="0">No</asp:ListItem>
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                        <asp:ListItem Value="6">More than 5</asp:ListItem>
                                    </asp:DropDownList>&nbsp;</div></td>
                              </tr>
                              <tr>
                                <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                              </tr>
                              <tr class="tabpadding">
                                <td class="grtxtbold1"><div align="left"><span class="bodysg">&nbsp;&nbsp;</span>Children Living Status</div></td>
                                <td class="grtxt"><div align="left">
                                    <asp:RadioButton ID="RB_CH_LWM" runat="server" GroupName="Children" />
                                    Living with me&nbsp;<asp:RadioButton ID="RB_CH_NWM" runat="server" GroupName="Children" />
                                    &nbsp;
Not living with me </div></td>
                              </tr>
                              <tr>
                                <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                              </tr>
                              <tr class="tabpadding">
                                <td class="grtxtbold1"><div align="left"><span class="Alert">* </span>Physical Status</div></td>
                                
                                <td class="grtxt">
                                <div align="left">
                                
                                <asp:RadioButton ID="RB_phy_nor" runat="server" GroupName="Physical" />
                                  &nbsp;Normal&nbsp;
                                  <asp:RadioButton ID="RB_phy_Dis" runat="server" GroupName="Physical" />
                                  Disabled</div>
                                </td>
                              </tr>
                              
                              <tr>
                                <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                              </tr>
                              <tr class="tabpadding">
                                <td class="grtxtbold1"><div align="left"><span class="Alert">* </span>Mother tongue</div></td>
                                <td class="grtxt">
                                <div align="left">
                                    <asp:DropDownList ID="DDL_MotherTongue" runat="server" CssClass="forminput" Width="217px">
                                    </asp:DropDownList>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                        runat="server" ControlToValidate="DDL_MotherTongue" ErrorMessage="*" InitialValue="0"></asp:RequiredFieldValidator></div>
                                </td>
                              </tr>
                              
                              
                              <tr>
                                <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                              </tr>
                              <tr class="tabpadding">
                                <td class="grtxtbold1"><div align="left"><span class="Alert">* </span>Religion</div></td>
                                <td class="grtxt"><div align="left" style="text-align: left">
                                    <asp:DropDownList ID="DDL_Religion" runat="server" CssClass="forminput" Width="217px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DDL_Religion"
                                        ErrorMessage="*" InitialValue="0"></asp:RequiredFieldValidator></div></td>
                              </tr>
                              <tr>
                                <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                              </tr>
                              <tr class="tabpadding">
                                <td class="grtxtbold1"><div align="left"><span class="Alert">* </span>Caste</div></td>
                                <td class="grtxt"><div align="left">
                                    <asp:DropDownList ID="DDL_Cast" runat="server" CssClass="forminput" Width="217px">
                                    </asp:DropDownList>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                                        runat="server" ControlToValidate="DDL_Cast" ErrorMessage="*" InitialValue="0"></asp:RequiredFieldValidator></div></td>
                              </tr>
							  
							  
                              <tr>
                                <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                              </tr>
                              <tr class="tabpadding">
                                <td class="grtxtbold1"><div align="left"><span class="bodysg">&nbsp;&nbsp;</span>Sub Caste </div></td>
                                <td class="grtxt"><div align="left">
                                    <asp:TextBox ID="TB_SubCast" runat="server" CssClass="forminput" MaxLength="64" Width="210px"></asp:TextBox>&nbsp;</div>
                                </td>
                              </tr>
							  
			  
			  <!---- -->
			   <tr>
                                <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                              </tr>
                              
			  
			<!-- -->	  
							  
                              <tr>
                                <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                              </tr>
                              <tr class="tabpadding">
                                <td class="grtxtbold1"><div align="left"><span class="bodysg">&nbsp;&nbsp;</span>Profile Created by </div></td>
                                <td><div align="left">
                                    <asp:DropDownList ID="DDL_ProfieCreated" runat="server" CssClass="forminput" Width="217px">
                                    </asp:DropDownList>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                                        runat="server" ControlToValidate="DDL_ProfieCreated" ErrorMessage="*" InitialValue="0"></asp:RequiredFieldValidator></div></td>
                              </tr>
                              <tr>
                                <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                              </tr>
                              <tr class="tabpadding">
                                <td class="grtxtbold1"><div align="left"><span class="bodysg">&nbsp;&nbsp;</span>Reference by </div></td>
                                <td class="grtxt"><div align="left">
                                    <asp:DropDownList ID="DDL_Reference" runat="server" CssClass="forminput" Width="217px">
                                    </asp:DropDownList>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                                        runat="server" ControlToValidate="DDL_Reference" ErrorMessage="*" InitialValue="0"></asp:RequiredFieldValidator></div></td>
                              </tr>
                              <tr>
                                <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                              </tr>
                              <tr class="tabpadding">
                                <td colspan="2" class="grtxtbold1" align="left"><div class="bodysg" align="left">New Account Information </div>                                  </td>
                              </tr>
                              <tr>
                                <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                              </tr>
                              
                              <tr>
                                <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                              </tr>
                              
                              <tr>
                                <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                              </tr>
                              <tr class="tabpadding">
                                <td class="grtxtbold1" align="left"><div align="left"><span class="Alert">* </span>Password</div></td>
                                <td><div align="left">
                                            <asp:TextBox ID="TB_Password" runat="server" onkeyup="javascript:SetPwdStrengthEx(document.forms[0],this.value);" onmouseout="javascript:SetPwdStrengthEx(document.forms[0],this.value);" onblur="javascript:SetPwdStrengthEx(document.forms[0],this.value);" Width="208px" CssClass="forminput" TextMode="Password"></asp:TextBox>

                                
                                    &nbsp;<asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator7" runat="server" ControlToValidate="TB_Password" ErrorMessage="*"></asp:RequiredFieldValidator></div>
                                            </td>
                              </tr>
                              
                              
                              
                              
                                                            <tr>
                                <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                              </tr>
                              <tr class="tabpadding">
                                <td class="grtxtbold1" align="left"><div align="left">
                                    &nbsp;Password strength</div></td>
                                <td style="text-align: left">                   <script type="text/javascript">
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
                   <table class="css0161" style="height: 19px; width: 212px;" cellpadding="0" cellspacing="0">
                       <tbody>
                           <tr>
                               <td id="idSM1" class="css0162" align="center" width="33%"><span style="font-size: 1px;">&nbsp;</span><span id="idSMT1" style="display: none;">Weak</span></td> 
                               
                               <td id="idSM2" class="css0162" style="border-left: 1px solid rgb(255, 255, 255);" align="center" width="34%"><span style="font-size: 1px;">&nbsp;</span><span id="idSMT0" style="display: inline; font-weight: normal; color: rgb(102, 102, 102);">Not rated</span><span id="idSMT2" style="display: none;">Medium</span></td> 
                               <td id="idSM3" class="css0162" style="border-left: 1px solid rgb(255, 255, 255);" align="center" width="33%"><span style="font-size: 1px;">&nbsp;</span> <span id="idSMT3" style="display: none;"> Strong </span></td>
                           </tr>
                       </tbody>
                   </table>
                   
                   </td>
                    </tr>
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              <tr>
                                <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                              </tr>
                              <tr class="tabpadding">
                                <td class="grtxtbold1"><div align="left"><span class="Alert">*</span> Confirm Password</div></td>
                                <td class="grtxt"><div align="left">
                                    <asp:TextBox ID="TB_ConfirmPassword" runat="server" CssClass="forminput" MaxLength="30" TextMode="Password"
                                        Width="210px"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator8"
                                            runat="server" ControlToValidate="TB_ConfirmPassword" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TB_Password"
                                        ControlToValidate="TB_ConfirmPassword" ErrorMessage="Passwords Mismatching"></asp:CompareValidator></div></td>
                              </tr>
							  
                             
					<!-- -->		  
                                  <tr class="tabpadding">
                                      <td class="grtxtbold1" style="text-align: left">
                                          <span style="font-size: 9pt; color: #ff0000; font-family: Arial">*</span> Sequrity
                                          Question</td>
                                      <td class="grtxt" style="text-align: left">
                                          <asp:DropDownList ID="DDL_SEqt" runat="server" CssClass="forminput" Width="317px">
                                          </asp:DropDownList>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="DDL_SEqt"
                                              ErrorMessage="*" InitialValue="0"></asp:RequiredFieldValidator></td>
                                  </tr>
                                  <tr class="tabpadding">
                                      <td class="grtxtbold1" style="text-align: left">
                                          <span style="font-size: 9pt; color: #ff0000; font-family: Arial">*</span> Answer</td>
                                      <td class="grtxt" style="text-align: left">
                                          <asp:TextBox ID="TB_Answer" runat="server" CssClass="forminput" MaxLength="30"
                                              Width="210px"></asp:TextBox>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="TB_Answer"
                                              ErrorMessage="*" InitialValue="0"></asp:RequiredFieldValidator></td>
                                  </tr>
					<tr>
					<td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
					</tr>
					<tr class="tabpadding">
					<td colspan="2" class="grtxtbold1"><div align="left"><span class="bodysg">Socio Religious Attributes </span></div>					  <div align="left"></div></td>
					</tr>
					<!-- -->               
							  
							  
					<!-- -->		  
					<tr>
					<td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
					</tr>
					
					<!-- -->
					
					<!-- -->		  
					<tr>
					<td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
					</tr>
					<tr class="tabpadding">
					<td class="grtxtbold1"><div align="left">
                        &nbsp;Star(Nakshatra)</div></td>
					<td><div align="left"><asp:DropDownList ID="DDL_Star" runat="server"
                            CssClass="forminput" Width="217px">
                        </asp:DropDownList>&nbsp;</div></td>
					</tr>
					<!-- -->
					
					<!-- -->		  
					<tr>
					<td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
					</tr>
					<tr class="tabpadding">
					<td class="grtxtbold1"><div align="left">
                        &nbsp;Moonsign</div></td>
					<td><div align="left">
                        <asp:DropDownList ID="DDL_Moon" runat="server" CssClass="forminput" Width="217px">
                        </asp:DropDownList>&nbsp;</div></td>
					</tr>
					<!-- -->
					
					<!-- -->		  
					<tr>
					<td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
					</tr>
					<tr class="tabpadding">
					<td class="grtxtbold1"><div align="left">
                        &nbsp;Horoscope Match </div></td>
					<td><div align="left">
                        <asp:RadioButton ID="RB_Horoscope_NO" runat="server" GroupName="Horoscope" />
                        No
                        <asp:RadioButton ID="RB_Horoscope_Yes" runat="server" GroupName="Horoscope" />
                        &nbsp; Yes &nbsp;<asp:RadioButton ID="RB_Horoscope_NoMatters" runat="server" GroupName="Horoscope" />&nbsp;
Does not matter&nbsp;</div></td>
					</tr>
					<!-- -->
					
					<!-- -->		  
					<tr>
					<td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
					</tr>
					<tr class="tabpadding">
					<td class="grtxtbold1"><div align="left">
                        &nbsp;Chovva Dosham / Manglik</div></td>
					<td><div align="left">
                        <asp:RadioButton ID="RB_Manglik_No" runat="server" GroupName="Manglik" />
                        No<asp:RadioButton ID="RB_Manglik_Yes" runat="server" GroupName="Manglik" />
                        &nbsp;&nbsp; Yes &nbsp;<asp:RadioButton ID="RB_Manglik_DKnow" runat="server" GroupName="Manglik" />&nbsp;
Do not know &nbsp;&nbsp;&nbsp;<asp:RadioButton ID="RB_Manglik_NA" runat="server" GroupName="Manglik" />&nbsp;
Not applicable </div></td>
					</tr>
					<!-- -->
					
					<!-- -->		  
					<tr>
					<td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
					</tr>
					<tr class="tabpadding">
					<td class="grtxtbold1"><div align="left"><span class="bodywk">&nbsp;Place of Birth </span></div></td>
					<td><div align="left">
                        <asp:TextBox ID="TB_POB" runat="server" CssClass="forminput" MaxLength="64" Width="211px"></asp:TextBox>&nbsp;</div></td>
					</tr>
					<!-- -->
							  
							  
							  <!-- -->		  
					<tr>
					<td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
					</tr>
					<tr class="tabpadding">
					<td class="grtxtbold1"><div align="left"><span class="bodywk">&nbsp;Time of Birth </span></div></td>
					<td><div align="left">
                        <asp:TextBox ID="TB_Time_H" runat="server" CssClass="forminput" MaxLength="2" Width="21px"></asp:TextBox><asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TB_Time_H"
                            ErrorMessage="*" MaximumValue="12" MinimumValue="0" Type="Integer" SetFocusOnError="True"></asp:RangeValidator>:
                        <asp:TextBox ID="TB_Time_M" runat="server" CssClass="forminput" MaxLength="2" Width="21px"></asp:TextBox><asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TB_Time_M"
                            ErrorMessage="*" MaximumValue="59" MinimumValue="0" SetFocusOnError="True"></asp:RangeValidator>-
                        <asp:DropDownList ID="DDL_Time" runat="server" CssClass="forminput">
                            <asp:ListItem Value="AM">AM</asp:ListItem>
                            <asp:ListItem Value="PM">PM</asp:ListItem>
                        </asp:DropDownList>&nbsp;&nbsp;
                    </div>
					</td>
					</tr>
					<!-- -->
							  
							  
							  <!-- -->		  
					<tr>
					<td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
					</tr>
					<tr class="tabpadding">
					<td class="grtxtbold1"><div align="left"></div></td>
					<td><div align="left">
                        <asp:CheckBox ID="CB_Accept" runat="server" ValidationGroup="CB" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TB_ConfirmPassword"
                            ErrorMessage="*" ValidationGroup="CB"></asp:RequiredFieldValidator>
                        <a href="#" onclick="window.open('../Extras/terms_con.aspx','terms','scrollbars=yes,width=500')">I Accept the terms and Conditions </a></div></td>
					</tr>
					<!-- -->
							  
							  
							  
							  
                              <tr class="tabpadding">
                                <td class="grtxtbold1">&nbsp;</td>
                                <td class="formtxt" valign="top" width="500">&nbsp;</td>
                              </tr>
                              <tr class="tabpadding">
                                <td colspan="3" height="7"><div align="center">
                                  <div align="center">
                                      <asp:ImageButton ID="IB_Submit" runat="server" ImageUrl="~/Resources/continue.gif" />
                                      </div>
                                </div></td>
                              </tr>
                              
                          </tbody></table></td>
                          <td class="grebg" width="12"><img src="../Resources/trans.gif" height="1"></td>
                        </tr>
                        <tr>
                          <td class="grebg" colspan="3" valign="top"><img src="../Resources/trans.gif" height="12" width="564"></td>
                        </tr>
                      </tbody></table>
                      <br>
                      <asp:HiddenField ID="HF_UaerID" runat="server" />
                      <br>
                  </div>
              </td>
							
          </tr>
          
          <tr>







 
  


</tr></tbody></table>
          <uc1:Footer_G ID="Footer_G1" runat="server" />
            </td></tr>
        </tbody></table>
 

	  
    
  
</div>
</form>

</body>
</html>
