<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegistrationStep3.aspx.cs" Inherits="RegistrationStep3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
     <title>Free Registration Step: 3</title>
     <link href="../Resources/style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" language="JavaScript">
	<!--
	javascript:window.history.forward(1);
	//-->
	</script>

</head>

 <!----------------Desablig Right Click ----->
     <body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" leftmargin="0" topmargin="0" alink="#000000" bgcolor="#ffffff" link="#000000" text="#000000" vlink="#000000">





    <form runat = "server" name="RegistrationForm" id="RegistrationForm" onsubmit="return Validate()">
        <div align="center">
      
          <table class="BlueTborder" border="0" cellpadding="0" cellspacing="0" width="780">
            <!--DWLayoutTable-->
             <tbody>
             
             <tr>
          <td height="164" width="780">
    	  
    	
            <table class="Tborder" align="center" bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" width="780">
              <!--DWLayoutTable-->
              <tbody>
              <tr>            </tr>
              <tr>
                <td colspan="2" valign="top" style="text-align: left">
    						
    														
    							
			      <img src="../Resources/logo.gif" border="0"></td>
              </tr>
              
              <tr valign="top">
                <td colspan="2" height="206">
                   
                      <table align="center" border="0" width="100%">
                        <tbody><tr>
                          <td class="LgHeading" width="570">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    											

					      </td>
                          <td width="200">Already Registered? <span class="h1dp"><a href="../guest/login.aspx">Login Now</a></span> </td>
                        </tr>
                        <tr>
                            <td colspan="5" bgcolor="#cccccc" height="1"></td>
                        </tr>
                      </tbody></table>
                      <table align="center" border="0" width="746">
                        <tbody><tr>
                          <td><div align="left"><span class="LgHeading">Register Final </span></div></td>
                        </tr>
                        <tr>
                          <td width="719"><div align="left">All Fields marks <span class="bodysg"><span class="Alert">*</span></span> are compulsory.<br>
      Please mention accurate information in this form or your profile may be declined. </div></td>
                        </tr>
                    </tbody></table>
    				  
    				 
                      
                      <div align="center">
                        <br>
                        <table border="0" cellpadding="0" cellspacing="0" width="746">
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
                                <TR>
                                  <TD class=grebg colSpan=2><IMG height=1  src="../resources/trans.gif"></TD>
                                </TR>
                                <TR class=tabpadding>
                                  <TD colspan="2" class=grtxtbold1><div align="left"><span class="bodysg">About Yourself <span style="color: #ff0066">*&nbsp;</span></span></div></TD>
                                </TR>
                                <!---- -->
                                <tr>
                                  <td class="grebg" colspan="2"></td>
                                </tr>
                                <tr class="tabpadding">
                                  <td colspan="2" class="grtxtbold1">
                                  <div align="left">Profile 
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TB_AboutME"
                                          ErrorMessage="you are supposed to fill this box" Font-Bold="False" SetFocusOnError="True"></asp:RequiredFieldValidator><br>
                                  
                                  
                                  
                                  
                                      <asp:TextBox ID="TB_AboutME" runat="server" CssClass="forminput" Height="142px" TextMode="MultiLine"
                                          Width="699px" MaxLength="1000"></asp:TextBox>&nbsp;<br>
                                      <asp:TextBox ID="txtCount" runat="server" BorderColor="#E0E0E0" BorderStyle="None"
                                          BorderWidth="1px" ForeColor="Red" ReadOnly="True" Width="31px">1000</asp:TextBox>
                                        <span class="style1">You could enter details about you or a bried description about yourself.<br>
                                        <span class="style2">Min 50</span> chas and <span class="style2">Max 1000 chars</span>. (<span style="color: #ff0000">If Profile contains ay details about your <br>
    contact information like e-mail,phone number, ete. Your profile will be rejected</span>)</span></div></td>
                                </tr>
                                <!-- -->
                                <tr>
                                  <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                                </tr>
                                <tr class="tabpadding">
                                  <td colspan="2" class="grtxtbold1"><div align="left"><span class="bodysg">Family Details </span></div>                                <div align="left"></div></td>
                                </tr>
                                <!-- -->
                                <tr>
                                  <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                                </tr>
                                <tr class="tabpadding">
                                  <td class="grtxtbold1"><div align="left">
                                      &nbsp;&nbsp; Family Details </div></td>
                                  <td class="smalltxt" style="text-align: justify">
                                      <asp:TextBox ID="TB_FamilyDetails" runat="server" Height="94px" TextMode="MultiLine" Width="215px" CssClass="forminput" MaxLength="200"></asp:TextBox>
                                      <br />
                                          Use this space to talk about your parents, what do they do and what are their backgrounds.
                                          What do your siblings do? Do they live in the same city as your parents? Talk about
                                          others in your extended family and so on.</td>
                                </tr>
    							
    							
    							
    							
    							
							     <tr>
                                  <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                                </tr>
                                <tr class="tabpadding">
                                  <td class="grtxtbold1"><div align="left">
                                      &nbsp;&nbsp; Family Values </div></td>
                                  <td class="smalltxt"><div align="left">
                                      <asp:DropDownList ID="DDL_FamilyValues" runat="server" CssClass="forminput" Width="222px">
                                      </asp:DropDownList>&nbsp;</div></td>
                                </tr>
    							
                                <tr>
                                  <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                                </tr>
                                <tr class="tabpadding">
                                  <td class="grtxtbold1"><div align="left">&nbsp;&nbsp; Family Type</div></td>
                                  <td class="smalltxt"><div align="left">
                                      <asp:DropDownList ID="DDL_FamilyType" runat="server" CssClass="forminput" Width="222px">
                                      </asp:DropDownList>&nbsp;</div></td>
                                </tr>
                                <tr>
                                  <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                                </tr>
                                <tr class="tabpadding">
                                  <td class="grtxtbold1" width="210"><div align="left">&nbsp;&nbsp; Family Status</div></td>
                                  <td valign="top"><div align="left">
                                      <asp:DropDownList ID="DDL_FamilyStatus" runat="server" CssClass="forminput" Width="222px">
                                      </asp:DropDownList>&nbsp;</div></td>
                                </tr>
                                <tr>
                                  <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                                </tr>
                                <tr class="tabpadding">
                                  <td class="grtxtbold1"><div align="left">
                                      &nbsp;&nbsp; Family Origin </div></td>
                                  <td class="grtxt"><div align="left">
                                      <asp:TextBox ID="TB_familyOrigin" runat="server" CssClass="forminput" Width="215px" MaxLength="50"></asp:TextBox>&nbsp;</div></td>
                                </tr>
                                <tr>
                                  <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                                </tr>
                                <tr class="tabpadding">
                                  <td class="grtxtbold1"><div align="left">
                                      <span style="color: #ff0066">* </span>No of Brothers </div></td>
                                  <td class="grtxt">
                                  <div align="left">
                                      <asp:DropDownList ID="DDL_NoOfBrothers" runat="server" CssClass="forminput" Width="80px">
                                          <asp:ListItem Value="0">-- Select --</asp:ListItem>
                                          <asp:ListItem>1</asp:ListItem>
                                          <asp:ListItem>2</asp:ListItem>
                                          <asp:ListItem>3</asp:ListItem>
                                          <asp:ListItem>4</asp:ListItem>
                                          <asp:ListItem>5</asp:ListItem>
                                          <asp:ListItem Value="7">No</asp:ListItem>
                                          <asp:ListItem Value="6">More than 5</asp:ListItem>
                                      </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DDL_NoOfBrothers" ErrorMessage="*" InitialValue="0"></asp:RequiredFieldValidator>
                                      Married&nbsp;
                                      <asp:DropDownList ID="DDL_NoOfBrothersMarried" runat="server" CssClass="forminput" Width="80px">
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
                                          ErrorMessage="*" InitialValue="0"></asp:RequiredFieldValidator></div></td>
                                </tr>
                                <tr>
                                  <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                                </tr>
                                <tr class="tabpadding">
                                  <td class="grtxtbold1"><div align="left">
                                      <span style="color: #ff0066">* </span>No of Sisters </div></td>
                                  <td class="grtxt"><div align="left">
                                      <asp:DropDownList ID="DDL_NoOFSisters" runat="server" CssClass="forminput" Width="79px">
                                      <asp:ListItem Value="0">-- Select --</asp:ListItem>
                                          <asp:ListItem>1</asp:ListItem>
                                          <asp:ListItem>2</asp:ListItem>
                                          <asp:ListItem>3</asp:ListItem>
                                          <asp:ListItem>4</asp:ListItem>
                                          <asp:ListItem>5</asp:ListItem>
                                          <asp:ListItem Value="7">No</asp:ListItem>
                                          <asp:ListItem Value="6">More than 5</asp:ListItem>
                                      </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                                          runat="server" ControlToValidate="DDL_NoOFSisters" ErrorMessage="*" InitialValue="0"></asp:RequiredFieldValidator>
                                      Married&nbsp;
                                          <asp:DropDownList ID="DDL_NoOFSistersMarried" runat="server" CssClass="forminput" Width="80px">
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
                                          ErrorMessage="*" InitialValue="0"></asp:RequiredFieldValidator></div></td>
                                </tr>
                                <tr>
                                  <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                                </tr>
                                <tr class="tabpadding">
                                  <td colspan="2" class="grtxtbold1"><div align="left"><span class="bodysg">Father's Detail </span></div>                                <div align="left"></div></td>
                                </tr>
                                <tr>
                                  <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                                </tr>
                                <tr class="tabpadding">
                                  <td class="grtxtbold1"><div align="left">
                                      <span style="color: #ff0066">* </span>Name:</div></td>
                                  <td class="grtxt"><div align="left">
                                      <asp:TextBox ID="TB_Father_Name" runat="server" CssClass="forminput" Width="215px" MaxLength="50"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator
                                          ID="RequiredFieldValidator4" runat="server" ControlToValidate="TB_Father_Name"
                                          ErrorMessage="*"></asp:RequiredFieldValidator></div>
                                      </td>
                                </tr>
                                <tr>
                                  <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                                </tr>
                                <tr class="tabpadding">
                                  <td class="grtxtbold1"><div align="left"></div></td>
                                  <td><div align="left">
                                      <asp:RadioButton ID="RB_FLIve" runat="server" CssClass="forminput" GroupName="a" />
                                      <span class="h4p">Alive</span> &nbsp;&nbsp;<asp:RadioButton ID="RB_FNLive" runat="server"
                                          CssClass="forminput" GroupName="a" />
                                      <span class="h4p">Not Alive</span></div></td>
                                </tr>
                                <tr>
                                  <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                                </tr>
                                <tr class="tabpadding">
                                  <td class="grtxtbold1"><div align="left">
                                      &nbsp;Occupation</div></td>
                                  <td class="grtxt"><div align="left">
                                      <asp:TextBox ID="TB_Father_Occ" runat="server" CssClass="forminput" Width="215px" MaxLength="50"></asp:TextBox>&nbsp;</div></td>
                                </tr>
                                <tr>
                                  <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                                </tr>
                                <tr class="tabpadding">
                                  <td colspan="2" class="grtxtbold1" align="left"><div class="bodysg" align="left">Mother's Detail </div>
                                      <div align="left"></div></td>
                                </tr>
                                <tr>
                                  <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                                </tr>
                                <tr class="tabpadding">
                                  <td class="grtxtbold1"><div align="left">
                                      <span style="color: #ff0066">* </span>Name:</div></td>
                                  <td><div align="left">
                                      <asp:TextBox ID="TB_Mother_name" runat="server" CssClass="forminput" Width="215px" MaxLength="50"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator
                                          ID="RequiredFieldValidator6" runat="server" ControlToValidate="TB_Mother_name"
                                          ErrorMessage="*"></asp:RequiredFieldValidator></div></td>
                                </tr>
                                <tr>
                                  <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                                </tr>
                                <tr class="tabpadding">
                                  <td class="grtxtbold1"><div align="left"></div></td>
                                  <td class="smalltxt"><div align="left">
                                      <asp:RadioButton ID="RB_MLive" runat="server" CssClass="forminput" GroupName="b" />
                                      <span class="h4p">Alive</span>&nbsp;<asp:RadioButton ID="RB_MNLive" runat="server"
                                          CssClass="forminput" GroupName="b" />&nbsp;
                                    <span class="h4p">Not Alive</span></div></td>
                                </tr>
                                <tr>
                                  <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                                </tr>
                                <tr class="tabpadding">
                                  <td class="grtxtbold1" align="left"><div align="left">
                                      &nbsp;Occupation</div></td>
                                  <td><div align="left">
                                      <asp:TextBox ID="TB_Mother_Occ" runat="server" CssClass="forminput" Width="215px" MaxLength="50"></asp:TextBox>&nbsp;</div></td>
                                </tr>
                                
                                
                                <!-- -->
                                <!-- -->
                                
    							
    							
                                <!-- -->
                                <!-- -->
                                <tr>
                                  <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                                </tr>
    							
    							
    							
                                <tr class="tabpadding">
                                  <td colspan="2" class="grtxtbold1"><div align="left"><span class="bodysg">Hobbies and Interests </span></div>                                <div align="left"></div></td>
                                </tr>
                                <!-- -->
                                <!-- -->
                                <tr>
                                  <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                                </tr>
                                <tr class="tabpadding">
                                  <td class="grtxtbold1"><div align="left">
                                      &nbsp; Hobbies</div></td>
                                  <td><div align="left">
                                      <div id="Div7" runat="server" style="border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid;
                                          overflow: auto; border-left: #dcdcdc 1px solid; width: 98%; border-bottom: #dcdcdc 1px solid;
                                          height: 111px">
                                      <asp:CheckBoxList ID="LB_Hobbies" runat="server" Height="71px" RepeatColumns="2"
                                          Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                          Width="468px">
                                      </asp:CheckBoxList></div>
                                  </div></td>
                                </tr>
                                <!-- -->
                                <!-- -->
                                <tr>
                                  <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                                </tr>
                                <tr class="tabpadding">
                                  <td class="grtxtbold1"><div align="left">
                                      &nbsp; Other Hobbies</div></td>
                                  <td><div align="left">
                                      <asp:TextBox ID="TB_OtherHobbies" runat="server" CssClass="forminput" Width="215px" MaxLength="50"></asp:TextBox>&nbsp;</div></td>
                                </tr>
                                <!-- -->
    							
							    <tr>
                                  <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                                </tr>
                                <tr class="tabpadding">
                                  <td class="grtxtbold1"><div align="left">
                                      &nbsp; Interests</div></td>
                                  <td><div align="left">
                                      <div id="Div1" runat="server" style="border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid;
                                          overflow: auto; border-left: #dcdcdc 1px solid; width: 98%; border-bottom: #dcdcdc 1px solid;
                                          height: 115px">
                                      <asp:CheckBoxList ID="LB_Interests" runat="server" Height="71px" RepeatColumns="2"
                                          Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                          Width="468px">
                                      </asp:CheckBoxList></div>
                                      &nbsp;</div></td>
                                </tr>
    							
							    <tr>
                                  <td class="grebg" colspan="2"><img src="../Resources/trans.gif" height="1"></td>
                                </tr>
                                <tr class="tabpadding">
                                  <td class="grtxtbold1"><div align="left">
                                      &nbsp; Other Interests</div></td>
                                  <td><div align="left">
                                      <asp:TextBox ID="TB_OtherInterests" runat="server" CssClass="forminput" Width="215px" MaxLength="50"></asp:TextBox>&nbsp;</div></td>
                                </tr>
    							
    							
    							
                                <tr class="tabpadding">
                                  <td class="grtxtbold1" >&nbsp;</td>
                                  <td class="formtxt" valign="top" width="500">&nbsp;</td>
                                </tr>
                                <tr class="tabpadding">
                                  <td colspan="3" height="7"><div align="center">
                                      <div align="center">
                                          <asp:ImageButton ID="IB_Register" runat="server" ImageUrl="~/Resources/continue.gif" />&nbsp;
                                        </div>
                                  </div></td>
                                </tr>
                            </tbody></table></td>
                            <td class="grebg" width="12"><img src="../Resources/trans.gif" height="1"></td>
                          </tr>
                          <tr>
                            <td class="grebg" colspan="3" valign="top" style="height: 12px"><img src="../Resources/trans.gif" height="12" width="564"></td>
                          </tr>
                        </tbody></table>
                        <br>
                      </div>
                      </td>
              </tr>

<tr>
             





     
      

    
    </tr></tbody></table><table border="0" cellpadding="0" cellspacing="0" width="780">
      <tbody><tr>
        <td bgcolor="#b4447f" height="2"></td>
      </tr>
      <tr>
        <td bgcolor="#ffffff" height="50"><p align="center">
            &nbsp;</p>
            <div>
              <div align="center">
                <table border="0" cellpadding="0" cellspacing="0" height="30" width="100%">
                  <tbody><tr>
                    <td valign="middle"><div align="center">All Rights Reserved.© Copyright 2007 Bride &amp; Groom Matrimonial.<br />
                        <br />
                        <a href="#" onclick="window.open('../Extras/terms_con.aspx','terms','scrollbars=yes,width=500')">User   Agreement and Terms of Use</a><br>
                        
                      <br>
                    </div></td>
                  </tr>
                </tbody></table>
              </div>
            </div></td>
      </tr>
    </tbody></table>
     
    		 
                </td></tr>
              
            </tbody>
         
         
         
         
         
         
         <!--DWLayout Table Ends -->
         </table>
        </div>
        
        
        
    </form>
    </body>
</html>
