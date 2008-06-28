<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newPassword.aspx.cs" Inherits="Guest_newPassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
       <title>Password Assistance</title>
        <link href="../Resources/style.css" rel="stylesheet" type="text/css">
 <link href="../Resources/style.css" rel="stylesheet" type="text/css" />
		<link rel="shortcut icon" href="../Resources/icon.ico">
		    <script type="text/javascript" src="../Resources/PPPrimary.js"></script>
    <script type="text/javascript" src="../Resources/pswdplc.js"></script>
</head>

<body class="body" bgcolor="#cccccc">
    <div align="center">
       <table align="center" border="0" cellpadding="0" cellspacing="0" width="780" id="TABLE1" language="javascript" onclick="return TABLE1_onclick()" style="border-right: #990066 1px solid; border-top: #990066 1px solid; border-left: #990066 1px solid; border-bottom: #990066 1px solid">
            <tbody>               
                  <tr>
                      <td bgcolor="#ffffff" height="76" style="text-align: left">
                                    <img border="0" src="../Resources/logo.gif" />
                       </td>
                  <tr><td style="height: 4px" bgcolor="#be4588"></td></tr>
                  <tr bgcolor="#ffffff">
                      <td colspan="2" valign="top">
                    <!-- START LEFT PART -->  
                    <div align="center">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tbody><tr>
                    <td bgcolor="#f5f5f5" valign="top" style="width: 180px; height: 382px;">
                        <br />
                        <br />

                    <!-- ''''''''''''''NORMAL ''''''''''''''' -->
                    </td>
                    <td style="width: 33px"> </td>
                    <td valign="top" style="height: 382px"><br>
                        <br />
                        
                       <form id="form2" runat="server">
                        
                       
                        
                         <table align="center" border="0" cellpadding="0" cellspacing="0" height="20" width="97%">
            <tbody>
                <tr>
                    <td background="../Resources/heading_bg.gif" style="width: 40%">
                        <div align="left">
                            &nbsp; <span class="bodysg"><span class="bodysg">New &nbsp;Password</span></span></div>
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
                            <table align="center" border="0" cellpadding="2" cellspacing="2" width="97%">
                                <tbody>
                                    <tr>
                                        <td colspan="2" style="height: 17px; text-align: left">
                                            Type your new password in the text box provided.</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 105px">
                                            &nbsp;</td>
                                        <td >
                                            <table height="100%" width="100%">
    
                                                <tr>
                                                    <td style=" width: 62px; text-align: right;">
                                                        <span style="color: #ff0099">*</span></td>
                                                    <td style=" text-align: left; width: 153px;">
                                                        <strong>  New Password</strong></td>
                                                    <td style=" text-align: left">
                                                        <asp:TextBox ID="TB_Password_New" runat="server" CssClass="forminput" onblur="javascript:SetPwdStrengthEx(document.forms[0],this.value);"
                                                            onkeyup="javascript:SetPwdStrengthEx(document.forms[0],this.value);" onmouseout="javascript:SetPwdStrengthEx(document.forms[0],this.value);" Width="185px" TextMode="Password"></asp:TextBox><br />
                                                        <span style="font-size: 7pt; color: gray">Six-character minimum</span></td>
                                                    <td style="height: 31px; text-align: left; width: 34px;">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TB_Password_New"
                                                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                                </tr>
                                                
                                                                                                <tr>
                                                    <td style=" width: 62px;">
                                                        <span style="color: #ff0099"></span>
                                                    </td>
                                                    <td style=" text-align: left; width: 153px;">
                                                        <strong>
                                                        Password strenght</strong></td>
                                                    <td style=" text-align: left">
                                                    
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
                                                    <td style="height: 31px; text-align: left; width: 34px;">
                                                        </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td style=" height: 36px; width: 62px; text-align: right;">
                                                        <span style="color: #ff0099">*</span></td>
                                                    <td class="forminput" style=" height: 36px; text-align: left; width: 153px;">
                                                        <strong>Conform Password</strong>&nbsp;</td>
                                                    <td style=" height: 36px; text-align: left">
                                                        <asp:TextBox ID="TB_Password_Conform" runat="server" CssClass="forminput"
                                                            Width="183px" TextMode="Password"></asp:TextBox>
                                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TB_Password_New"
                                                            ControlToValidate="TB_Password_Conform" ErrorMessage="Password Missmatch"></asp:CompareValidator></td>
                                                    <td style="width: 34px; height: 36px; text-align: left;">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TB_Password_Conform"
                                                            ErrorMessage="*"></asp:RequiredFieldValidator><br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style=" height: 17px; width: 62px;">
                                                    </td>
                                                    <td style=" height: 17px; width: 153px;">
                                                    </td>
                                                    <td style=" text-align: right; height: 17px;">
                                                        <asp:ImageButton ID="IB_Submit" runat="server" ImageUrl="~/Resources/Change.gif" /></td>
                                                </tr>
                                            </table>
                                            </td>
                                
                                    

                                </tbody>
                            </table>
                       
                    </td>
                </tr>
            </tbody>
        </table>
               
                        
                        <asp:HiddenField ID="HF_SeqtID" runat="server" />
                        
                        </form>
                    </td>
                    </tr>
                    </tbody></table>

                    </div>
                    <!-- END LEFT PART -->	
		            </td>
                  </tr>
        			
                  <tr>
                    <td>
                          <table border="0"  width="780" style="height: 103px">
                            <tr><td style="height: 4px" bgcolor="#be4588"></td></tr>
                            <tr>
                                <td style="height: 32px; color: #ff9933;">
                             
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 47px">
                                  <div align="center">
                                      <span style="color: gray"><%Response.Write(WebConfig.GetValues("WebFooter")); %></span>
                                      <br />
                                      <br />
                                      
                                      
                                  </div>
                                </td>
                            </tr>
                            <tr><td style="height: 7px"></td></tr>

                        </table>
                    </td>
                  </tr>
                  <tr></tr>
                  <tr></tr>
              </tbody>
      </table>
  
    </div>
</body>

</html>
