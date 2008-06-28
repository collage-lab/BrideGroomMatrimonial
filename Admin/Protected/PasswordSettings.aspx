<%@ Page Language="C#" MasterPageFile="~/Admin/Protected/Admin.master" AutoEventWireup="true" CodeFile="PasswordSettings.aspx.cs" Inherits="Admin_Protected_PasswordSettings" Title="Password Settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript" src="../../Resources/PPPrimary.js"></script>
    <script type="text/javascript" src="../../Resources/pswdplc.js"></script>

<table id="content" border="0" cellpadding="1" cellspacing="1" height="0" width="100%">
                             <tbody>
                                 <tr>
                                     <td colspan="4" height="54" valign="middle">
                                         <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                             <tbody>
                                                 <tr>
                                                     <td style="width: 8%; height: 51px">
                                                         <img src="../../Resources/PasswordSettings32.gif" /></td>
                                                     <td class="headertext" width="97%" style="height: 51px">
                                                         &nbsp; &nbsp;&nbsp; <strong><span style="color: gray">PSSWORD SETTINGS</span></strong>
                                                     </td>
                                                 </tr>
                                             </tbody>
                                         </table>
                                     </td>
                                 </tr>
                                 <tr>
                                 <td>
                                     &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                 </td>
                                     <td class="HeadText1" colspan="4" valign="top">
                                             <table align="left" border="0" cellpadding="2" cellspacing="1" style="width: 617px">
                                                 <tbody>
                                                     <tr>
                                                         <td style="color: #000000; width: 441px;" colspan ="2">
                                                             &nbsp;<br />
                                                             Learn how to create a strong, memorable passwords<br />
                                                         </td>
                                                     </tr>                      
                                                       <tr>
                                                         <td style="color: #000000; width: 441px;" colspan ="2">
                                                             &nbsp;<asp:Label ID="L_Alert" runat="server" ForeColor="Red" Text="Password Updated.."
                                                                 Visible="False"></asp:Label></td>
                                                     </tr>
                                                     <tr>
                                                         <td class="Partext1" style="width: 210px">
                                                             Old Password <span style="color: #ff0000">*&nbsp;</span></td>
                                                         <td style="width: 441px">
                                                             <asp:TextBox ID="TB_OLD" runat="server" TextMode="Password" Width="183px" CssClass="forminput"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_OLD"
                                                                 ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                                     </tr>
                                                     <tr style="color: #000000">
                                                         <td class="Partext1" style="width: 210px">
                                                             New Password<span class="smalltextred">*</span></td>
                                                         <td style="width: 441px">
                                                             <asp:TextBox ID="TB_Password_New" runat="server" CssClass="forminput" onblur="javascript:SetPwdStrengthEx(document.forms[0],this.value);"
                                                                 onkeyup="javascript:SetPwdStrengthEx(document.forms[0],this.value);" onmouseout="javascript:SetPwdStrengthEx(document.forms[0],this.value);"
                                                                 TextMode="Password" Width="183px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                                                     runat="server" ControlToValidate="TB_Password_New" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                                     </tr>
                                                     <tr style="color: #000000">
                                                         <td class="Partext1" style="width: 210px">
                                                             Password Strength</td>
                                                         <td style="width: 441px">
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
                                                                           <table class="css0161" style="height: 17px; width: 190px;" cellpadding="0" cellspacing="0">
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
                                                     <tr style="color: #000000">
                                                         <td class="Partext1" style="width: 210px">
                                                             Conform Password <span class="smalltextred">*</span></td>
                                                         <td style="width: 441px">
                                                             <span class="smalltextred" style="color: #000000">
                                                                 <asp:TextBox ID="TB_Password_New_Conf" runat="server" TextMode="Password" Width="183px" CssClass="forminput"></asp:TextBox>
                                                                 <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TB_Password_New"
                                                                     ControlToValidate="TB_Password_New_Conf" ErrorMessage="Password Missmatch"></asp:CompareValidator></span></td>
                                                     </tr>
                                                     <tr style="color: #000000">
                                                         <td class="Partext1" style="width: 210px;">
                                                         </td>
                                                         <td style="width: 441px;">
                                                             &nbsp;<a href="#">Password 
																Choosing tips</a></td>
                                                     </tr>
                                                     <tr>
                                                         <td class="Partext1" style="width: 210px">
                                                         </td>
                                                         <td style="width: 441px; text-align: center;">
                                                             <asp:Button ID="B_Submit" runat="server" CssClass="green-button" Text="Save" Width="61px"/>
                                                             &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                         </td>
                                                     </tr>
                                                     <tr>
                                                         <td colspan="2" >
                                                             </td>
                                                         
                                                     </tr>

                                                 </tbody>
                                             </table>
                                       
                                     </td>
                                 </tr>
                             </tbody>
                         </table>
</asp:Content>

