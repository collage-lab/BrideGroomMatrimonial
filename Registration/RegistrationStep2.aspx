<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegistrationStep2.aspx.cs" Inherits="RegistrationStep2" %>

<%@ Register Assembly="eWorld.UI" Namespace="eWorld.UI" TagPrefix="ew" %>

<%@ Register Src="../WeBControls/Footer_G.ascx" TagName="Footer_G" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Registration Step:2</title>
    <link href="../Resources/style.css" rel="stylesheet" type="text/css">
    <link href="../Resources/style.css" rel="stylesheet" type="text/css" />


</head>
<!-- Desabling mouse right click -->
<body onload="javascript:window.history.forward(1);" oncontextmenu="return false"  ondragstart="return false" leftmargin="0" topmargin="0" alink="#000000" bgcolor="#ffffff" link="#000000" text="#000000" vlink="#000000">

    
<form runat="server" onsubmit="return Validate()" name="Registration Form">
<div align="center">
  
  <table class="BlueTborder" border="0" cellpadding="0" cellspacing="0" width="780" bordercolorlight="#ff99cc">
    <!--DWLayoutTable-->
    <tbody>
    <tr>
      <td height="164" width="780">
	  
	
        <table class="Tborder" align="center" bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" width="780">
          <!--DWLayoutTable-->
          <tbody>
          <tr>
            <td colspan="2" height="37" style="text-align: left">
                &nbsp;<img src="../Resources/logo.gif" border="0"></td>
            </tr>
           
          <tr>            
          </tr>
                
          <tr valign="top">
            <td colspan="2" height="206">
               
                  <table align="center" border="0" width="100%">
                    <tbody><tr>
                      <td class="LgHeading" width="570">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											

					  </td>
                      <td width="200">Already Registered? 
                      <span class="h1dp">
                      <a href="../Guest/login.aspx">Login Now</a>
                      </span> 
                      </td>
                    </tr>
                    <tr>
                        <td colspan="5" bgcolor="#cccccc" height="1"></td>
                    </tr>
                  </tbody>
                  </table>
                  <table align="center" border="0" width="746">
                    <tbody>
                    <tr>
                      <td>
                      <div align="left">
                      <span class="LgHeading">Registration Continue  </span>
                      </div>
                     </td>
                    </tr>
                    <tr>
                      <td width="716">
                      <div align="left">All Fields marks <span class="bodysg">
                      <span class="Alert">*</span></span> are compulsory.<br>Please mention accurate information in this form or your profile may be declined.
                      </div>
                      </td>
                    </tr>
                </tbody>
                </table>
				  
				 
                  
                  <br>
                  <table align="center" border="0" cellpadding="0" cellspacing="0" width="746">
                    <tbody><tr>
                      <td class="grebg" colspan="3" height="12" valign="top"><img src="../Resources/trans.gif"></td>
                    </tr>
                    <tr>
                      <td class="grebg" width="12"><img src="../Resources/trans.gif" height="1"></td>
                      <td class="lastnull" valign="top" width="722"><table border="0" cellpadding="0" cellspacing="0" width="722">
                          <tbody><tr height="28">
                            <td class="smalltxt" colspan="2" align="right"><div align="left"></div></td>
                          </tr>
                          <!---- -->
                          <tr>
                            <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                          </tr>
                          <tr class="tabpadding">
                            <td colspan="2" class="grtxtbold1"><div align="left"><span class="bodysg">Education and Occupation </span></div></td>
                          </tr>
                          <!---- -->
                          <tr>
                            <td class="grebg" colspan="2"><img src="../Resources/blank1.htm" height="1"></td>
                          </tr>
                          <tr class="tabpadding">
                            <td class="grtxtbold1"><div align="left"><span class="Alert">* </span>Education</div></td>
                            <td width="500"><div align="left">
                                <asp:DropDownList ID="DDL_Education" runat="server" CssClass="forminput" Width="214px">
                                </asp:DropDownList>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                                    runat="server" ControlToValidate="DDL_Education" ErrorMessage="*" Font-Bold="True" InitialValue="0"></asp:RequiredFieldValidator></div></td>
                          </tr>
                          <!-- -->
                          <tr>
                            <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                          </tr>
                          <tr class="tabpadding">
                            <td class="grtxtbold1"><div align="left"><span class="Alert">* </span>Edu Details </div></td>
                            <td><div align="left">
                                <asp:DropDownList ID="DDL_EduDetails" runat="server" CssClass="forminput" Width="214px">
                                </asp:DropDownList>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                    runat="server" ControlToValidate="DDL_EduDetails" ErrorMessage="*" Font-Bold="True" InitialValue="0"></asp:RequiredFieldValidator></div></td>
                          </tr>
                          <!-- -->
                          <tr>
                            <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                          </tr>
                          <tr class="tabpadding">
                            <td class="grtxtbold1"><div align="left"><span class="Alert"> </span><span class="Alert"> </span><span class="bodysg">&nbsp;</span>&nbsp;Annual income </div></td>
                            <td class="smalltxt"><div align="left">
                                <asp:DropDownList ID="DDL_AnnualIncome" runat="server" CssClass="forminput" Width="214px">
                                </asp:DropDownList>&nbsp; in
                                <asp:DropDownList ID="DDL_Currency" runat="server" CssClass="forminput" Width="214px">
                                </asp:DropDownList>&nbsp;</div></td>
                          </tr>
                          <tr>
                            <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                          </tr>
                          <tr class="tabpadding">
                            <td class="grtxtbold1" valign="center"><div align="left"><span class="Alert">*</span> Occupation </div></td>
                            <td class="smalltxt"><div align="left">
                                <asp:DropDownList ID="DDL_Occupation" runat="server" CssClass="forminput" Width="214px">
                                </asp:DropDownList>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                    runat="server" ControlToValidate="DDL_Occupation" ErrorMessage="*" Font-Bold="True" InitialValue="0"></asp:RequiredFieldValidator></div></td>
                          </tr>
                          <tr>
                            <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                          </tr>
                          <tr class="tabpadding">
                            <td class="grtxtbold1" width="210"><div align="left"><span class="Alert">* </span>Employed in </div></td>
                            <td valign="top"><div align="left">
                                <asp:DropDownList ID="DDL_EmpIn" runat="server" CssClass="forminput" Width="214px">
                                </asp:DropDownList>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                                    runat="server" ControlToValidate="DDL_EmpIn" ErrorMessage="*" Font-Bold="True" InitialValue="0"></asp:RequiredFieldValidator></div></td>
                          </tr>
                          <tr>
                            <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                          </tr>
                          <tr class="tabpadding">
                            <td colspan="2" class="grtxtbold1"><div align="left"><span class="bodysg">Physical Attributes </span></div>                              <div align="left"></div></td>
                          </tr>
                          <tr>
                            <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                          </tr>
                          <tr class="tabpadding">
                            <td class="grtxtbold1"><div align="left"><span class="Alert">*</span> Height </div></td>
                            <td class="grtxt"><div align="left">
                                <asp:DropDownList ID="DDL_Height" runat="server" CssClass="forminput" Width="214px">
                                </asp:DropDownList>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                                    runat="server" ControlToValidate="DDL_Height" ErrorMessage="*" Font-Bold="True" InitialValue="-- Select --"></asp:RequiredFieldValidator></div></td>
                          </tr>
                          <tr>
                            <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                          </tr>
                          <tr class="tabpadding">
                            <td class="grtxtbold1"><div align="left"><span class="Alert">*</span> Weight </div></td>
                            <td class="grtxt"><div align="left">
                                <asp:DropDownList ID="DDL_Weight" runat="server" CssClass="forminput" Width="214px">
                                </asp:DropDownList>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                                    runat="server" ControlToValidate="DDL_Weight" ErrorMessage="*" Font-Bold="True" InitialValue="0"></asp:RequiredFieldValidator></div></td>
                          </tr>
                          <tr>
                            <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                          </tr>
                          <tr class="tabpadding">
                            <td class="grtxtbold1"><div align="left"><span class="Alert">* </span>Blood Group </div></td>
                            <td class="grtxt"><div align="left">
                                <asp:DropDownList ID="DDL_BGroup" runat="server" CssClass="forminput" Width="214px">
                                </asp:DropDownList>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7"
                                    runat="server" ControlToValidate="DDL_BGroup" ErrorMessage="*" Font-Bold="True" InitialValue="0"></asp:RequiredFieldValidator></div></td>
                          </tr>
                          <tr>
                            <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                          </tr>
                          <tr class="tabpadding">
                            <td class="grtxtbold1"><div align="left"><span class="Alert">*</span> Complexion</div></td>
                            <td class="grtxt"><div align="left">
                                <asp:DropDownList ID="DDL_Complexion" runat="server" CssClass="forminput" Width="214px">
                                </asp:DropDownList>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator8"
                                    runat="server" ControlToValidate="DDL_Complexion" ErrorMessage="*" Font-Bold="True" InitialValue="0"></asp:RequiredFieldValidator></div>
                                </td>
                          </tr>
                          <tr>
                            <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                          </tr>
                          <tr class="tabpadding">
                            <td class="grtxtbold1"><div align="left"><span class="bodysg">&nbsp;</span>&nbsp;Body type </div></td>
                            <td>
                            <div align="left">
                                <asp:RadioButton ID="RB_BType_Slim" runat="server" GroupName="RB_BType" />
                                Slim&nbsp;<asp:RadioButton ID="RB_BType_Avg" runat="server" CssClass="forminput" GroupName="RB_BType" />
                                &nbsp;Average&nbsp;<asp:RadioButton ID="RB_BType_Ath" runat="server" GroupName="RB_BType" />&nbsp;Athletic 
                                <asp:RadioButton ID="RB_BType_Heavy" runat="server" GroupName="RB_BType" />&nbsp;Heavy
                             </div>
                            </td>
                          </tr>
                         
						  <tr>
                            <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                          </tr>
                          <tr class="tabpadding">
                            <td class="grtxtbold1"><div align="left">
                                &nbsp; Diet</div></td>
                            <td class="grtxt"><div align="left"><asp:DropDownList ID="DDL_Diet" runat="server" CssClass="forminput" Width="214px">
                            </asp:DropDownList>&nbsp;</div></td>
                          </tr>
                          <tr>
                            <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                          </tr>
						  
                          <tr class="tabpadding">
                            <td class="grtxtbold1"><div align="left">
                                &nbsp; Smoke</div></td>
                            <td class="grtxt"><div align="left">
                                <asp:RadioButton ID="RB_Smoke_no" runat="server" GroupName="RB_Smoke" />&nbsp; No&nbsp;<asp:RadioButton
                                    ID="RB_Smoke_Yes" runat="server" GroupName="RB_Smoke" />
                                &nbsp; Yes&nbsp;<asp:RadioButton ID="RB_Smoke_Occ" runat="server" GroupName="RB_Smoke" />&nbsp;
Occasionally</div></td>
                          </tr>
						  
						   <tr>
                            <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                          </tr>
                          <tr class="tabpadding">
                            <td class="grtxtbold1"><div align="left">
                                &nbsp; Drink</div></td>
                            <td class="grtxt"><div align="left">
                                <asp:RadioButton ID="RB_Drink_No" runat="server" GroupName="RB_Drink" />&nbsp; No&nbsp;<asp:RadioButton
                                    ID="RB_Drink_Yes" runat="server" GroupName="RB_Drink" />
                                &nbsp; Yes&nbsp;<asp:RadioButton ID="RB_Drink_Occ" runat="server" GroupName="RB_Drink" />
Occasionally</div></td>
                          </tr>
						  
						  
						  
                          <tr>
                            <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                          </tr>
						  
                          <tr class="tabpadding">
                            <td colspan="2" class="grtxtbold1"><div align="left"><span class="bodysg">Contact Details </span></div>                              
                              <div align="left"></div></td>
                          </tr>
                          <tr>
                            <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                          </tr>
						  
                          <tr class="tabpadding">
                            <td class="grtxtbold1"><div align="left"><span class="Alert">*</span> Address </div></td>
                            <td class="grtxt"><div align="left">
                                <asp:TextBox ID="TB_Address" runat="server" CssClass="forminput" Height="112px" TextMode="MultiLine"
                                    Width="209px" MaxLength="250"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator9"
                                        runat="server" ControlToValidate="TB_Address" ErrorMessage="*"></asp:RequiredFieldValidator><br>
                              <span class="style2">The contact address is only for Official purpose and will not be discloded to others</span></div></td>
                          </tr>
                          <tr>
                            <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                          </tr>
						  
                          <tr class="tabpadding">
                            <td class="grtxtbold1"><div align="left"><span class="Alert">*</span> Country </div></td>
                            <td class="grtxt"><div align="left"><span class="formselect">
                                <asp:DropDownList ID="DDL_Country" runat="server" CssClass="forminput" Width="214px">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="DDL_Country"
                                    ErrorMessage="*" Font-Bold="True" InitialValue="0"></asp:RequiredFieldValidator></span></div></td>
                          </tr>
                          <tr>
                            <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                          </tr>
						  
                          <tr class="tabpadding">
                            <td class="grtxtbold1"><div align="left"><span class="Alert">* </span>State</div></td>
                            <td class="grtxt"><div align="left">
                                <asp:DropDownList ID="DDL_State" runat="server" CssClass="forminput" Width="214px">
                                </asp:DropDownList>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator11"
                                    runat="server" ControlToValidate="DDL_State" ErrorMessage="*" Font-Bold="True" InitialValue="0"></asp:RequiredFieldValidator></div></td>
                          </tr>
                          <tr>
                            <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                          </tr>
						  
                          <tr class="tabpadding">
                            <td class="grtxtbold1"><div align="left"><span class="Alert">*</span> City </div></td>
                            <td class="grtxt"><div align="left">
                                <asp:TextBox ID="TB_City" runat="server" CssClass="forminput" Width="206px"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator12" runat="server" ControlToValidate="TB_City" ErrorMessage="*"></asp:RequiredFieldValidator></div></td>
                          </tr>
                          <tr>
                            <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                          </tr>
						  
                          <tr class="tabpadding">
                            <td class="grtxtbold1"><div align="left"><span class="Alert">*</span> Phone</div></td>
                            <td class="grtxt"><div align="left">
                                <ew:NumericBox ID="TB_Phone_ISD" runat="server" CssClass="forminput" DollarSign="+"
                                    MaxLength="4" PositiveNumber="True" Width="29px">91</ew:NumericBox>
                                - &nbsp;<ew:NumericBox ID="TB_Phone_STD" runat="server" CssClass="forminput" MaxLength="5"
                                    PositiveNumber="True" Width="54px"></ew:NumericBox>
                                -
                                <ew:NumericBox ID="TB_Phone_NO" runat="server" CssClass="forminput" MaxLength="8"
                                    PositiveNumber="True" Width="80px"></ew:NumericBox>&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="TB_Phone_NO"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>&nbsp;
                            </div></td>
                          </tr>
                          <tr>
                            <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                          </tr>
						  
                          <tr class="tabpadding">
                            <td class="grtxtbold1"><div align="left">
                                &nbsp; Mobile </div></td>
                            <td class="grtxt"><div align="left">
                                <ew:NumericBox ID="TB_Phone_Mobile" runat="server" CssClass="forminput" MaxLength="12"
                                    PositiveNumber="True" Width="206px"></ew:NumericBox>&nbsp;</div></td>
                          </tr>
                          <tr>
                            <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                          </tr>
						  
                          <tr class="tabpadding">
                            <td class="grtxtbold1"><div align="left">
                                &nbsp; Residence in</div></td>
                            <td class="grtxt"><div align="left">
                                <asp:DropDownList ID="DDL_ResidenceIn" runat="server" CssClass="forminput" Width="214px">
                                </asp:DropDownList>&nbsp;</div></td>
                          </tr>
                          <tr>
                            <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                          </tr>
						  
                          <tr class="tabpadding">
                            <td class="grtxtbold1"><div align="left">
                                &nbsp; Residencial Status</div></td>
                            <td class="grtxt"><div align="left">
                                <asp:DropDownList ID="DDL_ResidentialStatus" runat="server" CssClass="forminput" Width="214px">
                                </asp:DropDownList>&nbsp;</div></td>
                          </tr>
                                                    <tr>
                            <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                          </tr>
						  
                          <tr class="tabpadding">
                            <td class="grtxtbold1"><div align="left">
                                &nbsp; Residencial City</div></td>
                            <td class="grtxt"><div align="left">
                                <asp:TextBox ID="TB_RCity" runat="server" CssClass="forminput" Width="206px"></asp:TextBox>&nbsp;</div></td>
                          </tr>
                          <tr>
                            <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                          </tr>
						  
                          <tr class="tabpadding">
                            <td colspan="2" class="grtxtbold1"><div align="left"></div>                              <div align="left"></div></td>
                          </tr>
                          
						
                          <tr class="tabpadding">
                            <td colspan="3" height="7"><div align="center">
                                <div align="center">
                                    &nbsp;
                                    <asp:ImageButton ID="IB_continue" runat="server" ImageUrl="~/Resources/continue.gif"/></div>
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
