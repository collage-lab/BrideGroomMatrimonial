<%@ Page Language="C#" MasterPageFile="~/Member/MemberMaster.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="Member_Profile" Title="My Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPH_Member" Runat="Server">


  <%--Content Starts--%>

               <table align="center" border="0" cellpadding="0" cellspacing="0" width="97%">
              <tbody><tr>
                <td><table align="center" border="0" cellpadding="0" cellspacing="0" width="97%">
                  
                  <tbody><tr>
                    <td colspan="2" width="2236" style="height: 247px"><table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                        
                        <tbody><tr>
                          <td style="height: 245px"><fieldset class="fieldset">
                            <legend class="bluetext"><img src="../Resources/myprofile-icontxt.gif" height="38" width="115"></legend>
                            <table border="0" cellspacing="0" width="100%">
                              <tbody><tr>
                                <td width="150">
            					
            					
                                <table class="submenubox" id="photo" align="center" border="0" height="150" width="150">
                                  <tbody><tr>
                                    <td><center>
                                        <asp:Image ID="Img_MyPhoto" runat="server" ImageUrl="../Resources/nophoto.gif" />
                                        </center>
                                    </td>
                                  </tr>
                                </tbody>
                                </table>					
                                </td>
                                <td valign="top" width="409">
                                    <br />
                                    <table border="0" cellpadding="2" cellspacing="4" width="98%" id="TABLE1">
                                  <tbody>
                                  
                                  <tr>
                                  <td style="width: 4px"></td>
                                    <td style="height: 32px; width: 204px; text-align: left;" colspan = "2">
                                    <img src="../Resources/arrow-grn-4x7.gif" height="7" width="4">
                                        Name : 
                                        <asp:Label ID="L_Name" runat="server" Font-Bold="True" Width="144px"></asp:Label>&nbsp;
                                     </td>
                                  </tr>
                                  
                                  <tr>
                                  <td style="width: 4px"></td>
                                    <td style="height: 32px; width: 184px; text-align: left;">
                                    <img src="../Resources/arrow-grn-4x7.gif" height="7" width="4">
                                        Matri ID :&nbsp;<strong>
                                         <asp:Label ID="L_MID" runat="server" Height="12px" Width="87px"></asp:Label></strong></td>
                                    <td style="height: 32px; text-align: left; width: 206px;">
                                    <img src="../Resources/arrow-grn-4x7.gif" height="7" width="4"> Membership :
                                        <asp:Label ID="L_Membership" runat="server" Height="12px" Width="87px" Font-Bold="True"></asp:Label></td>
                                  </tr>
                                  <tr>
                                  <td style="width: 4px"></td>
                                    <td style="height: 34px; width: 184px; text-align: left;"><img src="../Resources/arrow-grn-4x7.gif" height="7" width="4"> Created : 
                                        <asp:Label ID="L_LogIn_Created" runat="server" Height="12px" Width="101px" Font-Bold="True"></asp:Label></td>
                                    <td style="height: 34px; text-align: left; width: 206px;"> <span class="Partext1">
                                        <img src="../Resources/arrow-grn-4x7.gif" height="7" width="4"> Last Login : <span class="Partext1">
                                        <asp:Label ID="L_LogIn_last" runat="server" Height="12px" Width="89px" Font-Bold="True"></asp:Label>
                                    </span>
                                    </span></td>
                                  </tr>
                                  <tr>
                                  <td style="width: 4px"></td>
                                    <td style="height: 32px; width: 184px; text-align: left;"><img src="../Resources/arrow-grn-4x7.gif" height="7" width="4">
                                        Clicks &nbsp;:
                                        <asp:Label ID="L_Clicks" runat="server" Height="12px" Width="79px" Font-Bold="True"></asp:Label></td>
                                    <td style="height: 32px; text-align: left; width: 206px;"></td>
                                  </tr>
                                </tbody></table>
            					
            <!-- only paid members -->
            				  
            					  
                                  </td>
                              </tr>
                            </tbody></table>
                          </fieldset></td>
                        </tr>
                    </tbody></table>
            		
            		
                    </td>
                  </tr>
                  <tr>
                    <td colspan="2"><table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tbody><tr>
                          <td>
                          
                          <fieldset class="fieldset">
                          <legend class="bluetext">
                          <img height=32 src="../Resources/myvis-icontxt.gif" style="width: 110px" />
                          </legend>
                              <table cellSpacing=4 cellPadding=4 width="100%" align=center border=0>
                                  <tbody>
                                      <tr>
                                          <td><center>
                                                <asp:HyperLink ID="HyperLink1"  style=" text-decoration: none;" runat="server" target="_blank" Visible="False">Visitors</asp:HyperLink>&nbsp;
                                                <asp:HyperLink ID="HyperLink2" style=" text-decoration: none;"  runat="server" target="_blank"  Visible="False">Visitors</asp:HyperLink>&nbsp;
                                                <asp:HyperLink ID="HyperLink3" style=" text-decoration: none;"  runat="server" target="_blank"  Visible="False">Visitors</asp:HyperLink>&nbsp;
                                                <asp:HyperLink ID="HyperLink4" style=" text-decoration: none;"  runat="server" target="_blank"  Visible="False">Visitors</asp:HyperLink>&nbsp;
                                                <asp:HyperLink ID="HyperLink5" style=" text-decoration: none;"  runat="server" target="_blank"  Visible="False">Visitors</asp:HyperLink>&nbsp;
                                                <asp:HyperLink ID="HyperLink6"  style=" text-decoration: none;" runat="server" target="_blank"  Visible="False">Visitors</asp:HyperLink>&nbsp;
                                                <asp:HyperLink ID="HyperLink7" style=" text-decoration: none;"  runat="server" target="_blank"  Visible="False">Visitors</asp:HyperLink>
                                        </center>
                                        </td>
                                     </tr>
                                </tbody>
                            </table>
                        </fieldset>
                         
                         
                         
                          <fieldset>
                            <legend><img src="../Resources/chklist-icontxt.gif" height="32" width="118"></legend>
                            <table align="center" border="0" cellpadding="4" cellspacing="4" width="100%">
                              <tbody>
                              
                                <tr>
                                  <td width="12%" style="height: 20px">&nbsp;</td>
                                  <td width="22%"style=" text-align: right; height: 20px;">
                                      Photos in Album :</td>
                                  <td width="10%"style=" text-align: center; height: 20px;">
                                      <asp:Image ID="IMG_Photo" runat="server" ImageUrl="../Resources/chklist-cross.gif" /></td>
                                  <td width="32%" style=" text-align: right; height: 20px;">Horoscope Uploded :&nbsp;</td>
                                  <td width="10%"style=" text-align: center; height: 20px;">
                                      <asp:Image ID="IMG_Horoscope" runat="server" ImageUrl="../Resources/chklist-cross.gif" />
                                  </td>
                                  <td width="14%" style="height: 20px"></td>
                                </tr>
                                
                                <tr>
                                  <td style="height: 20px"><br></td>
                                  <td style="text-align: right; height: 20px;">
                                      Photo Protected :</td>
                                  <td style="text-align: center; height: 20px;">
                                      <asp:Image ID="IMG_PhotoPRotect" runat="server" ImageUrl="../Resources/chklist-cross.gif" /></td>
                                  <td style=" text-align: right; height: 20px;">
                                      Horoscope Protected : </td>
                                  <td valign="bottom" style="text-align: center; height: 20px;">
                                      <asp:Image ID="IMG_Horo_Protexted" runat="server" ImageUrl="../Resources/chklist-cross.gif" />
                                      </td>
                                      <td style="height: 20px"></td>
                                </tr>
                              </tbody>
                            </table>
                          </fieldset></td>
                        </tr>
                    </tbody></table></td>
                  </tr>
                  <tr>
                    <td colspan="2"><table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tbody><tr>
                          <td style="height: 394px">
            			  
            			   





             
              

















            <fieldset class="fieldset">
                            <legend class="bluetext"><img src="../Resources/myint-icontxt.gif" height="32"></legend>
                            <table align="center" border="0" cellpadding="4" cellspacing="4" width="100%">
                              <tbody>
                                <tr>
                                  <td height="18" width="12%">&nbsp;</td>
                                  <td width="40%"colspan="2" class="h3r" style="text-align: left"> Express Interest Received&nbsp;
                                  </td>
                                  <td width="40%"colspan="2" style="text-align: left"><span class="h3r">Express Interest Sent </span></td>
                                  <td width="8%">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td><br></td>
                                  <td colspan="2" style="text-align: left">
                                      &nbsp;
                                      <img src="../Resources/arrow-grn-4x7.gif" height="7" width="4">
                                      <a href="Interests.aspx?id=a&typ=i" style=" text-decoration: none;"> 
                                      Accepted </a>(<asp:Label ID="L_Int_R_A" runat="server"></asp:Label>)
                                  </td>
                                  <td colspan="2" style="text-align: left">
                                      &nbsp;
                                      <img src="../Resources/arrow-grn-4x7.gif" height="7" width="4"> 
                                      <a href="Interests.aspx?id=a&typ=o" style=" text-decoration: none;"> 
                                      Accepted</a> (<asp:Label ID="L_Int_S_A" runat="server"></asp:Label>)
                                  </td>
                                  <td>&nbsp;</td>
                                </tr>
                                <tr>
                                  <td>&nbsp;</td>
                                  <td colspan="2" style="text-align: left">
                                      &nbsp;
                                      <img src="../Resources/arrow-grn-4x7.gif" height="7" width="4">
                                      <a href="Interests.aspx?id=d&typ=i" style=" text-decoration: none;"> 
                                      Declined</a> (<asp:Label ID="L_Int_R_D" runat="server"></asp:Label>)
                                  </td>
                                  <td colspan="2" style="text-align: left">
                                      &nbsp;
                                      <img src="../Resources/arrow-grn-4x7.gif" height="7" width="4">
                                      <a href="Interests.aspx?id=d&typ=o" style=" text-decoration: none;">  
                                      Declined</a> (<asp:Label ID="L_Int_S_D" runat="server"></asp:Label>)
                                  </td>
                                  <td>&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="verdana"></td>
                                  <td colspan="2" class="verdana" style="text-align: left">
                                      &nbsp;
                                      <img src="../Resources/arrow-grn-4x7.gif" height="7" width="4">
                                      <a href="Interests.aspx?id=p&typ=i" style=" text-decoration: none;"> 
                                       Pending</a> (<asp:Label ID="L_Int_R_P" runat="server"></asp:Label>)
                                  </td>
                                  <td colspan="2" class="verdana" style="text-align: left">
                                      &nbsp;
                                      <img src="../Resources/arrow-grn-4x7.gif" height="7" width="4">
                                      <a href="Interests.aspx?id=p&typ=o" style=" text-decoration: none;"> 
                                      Pending</a> (<asp:Label ID="L_Int_S_P" runat="server"></asp:Label>)</td>
                                  <td class="verdana">&nbsp;</td>
                                </tr>
                              
                              </tbody>
                            </table>
                          </fieldset>			  





             
              
              
              
              
              
              <fieldset class="fieldset">
                            <legend class="bluetext">
                            <img src="../Resources/mymsg-icontxt.gif" height="32" width="146">
                            </legend>
                            <table align="center" border="0" cellpadding="4" cellspacing="4" width="100%">
                              <tbody>
                                
                                <tr>
                                  <td align="right" width="12%">&nbsp;</td>
                                  <td colspan="2" align="right" width="40%"><div align="left"><span class="h3r">Personalized Message</span></div></td>
                                  <td colspan="2" align="right" width="40%"><div align="left"><span class="h3r">Photo/Horoscope Password&nbsp; </span></div></td>
                                  <td align="right" width="8%">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td align="right">&nbsp;</td>
                                  <td colspan="2" align="right"><div align="left">
                                      &nbsp;
                                      <img src="../Resources/arrow-grn-4x7.gif" height="7" width="4">
                                      <a href="messages.aspx?id=1" style=" text-decoration: none;">Inbox</a>(<asp:Label
                                          ID="L_Mes_Inbox" runat="server"></asp:Label>)
                                  </div></td>
                                  <td colspan="2" align="right" style="text-align: left">
                                      &nbsp;
                                      <img src="../Resources/arrow-grn-4x7.gif" height="7" width="4">
                                      <a href="myPasswords.aspx?id=1" style=" text-decoration: none;">PassWord  Received</a>
                                      (<asp:Label ID="L_PW_Req" runat="server"></asp:Label>)
                                  </td>
                                  <td align="right">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td align="right">&nbsp;</td>
                                  <td colspan="2" align="right" style="text-align: left">
                                      &nbsp;
                                      <img src="../Resources/arrow-grn-4x7.gif" height="7" width="4">
                                      <asp:HyperLink ID="HL_Message_send" style=" text-decoration: none;" runat="server" NavigateUrl="messages.aspx?id=2" Enabled="False">Send</asp:HyperLink>(<asp:Label ID="L_Mes_OutBox" runat="server">0</asp:Label>) &nbsp;</td>
                                  <td colspan="2" align="right" style="text-align: left">
                                      &nbsp;
                                      <img src="../Resources/arrow-grn-4x7.gif" height="7" width="4">
                                      <asp:HyperLink ID="HL_Pass_Received"  style=" text-decoration: none;" runat="server" Enabled="False" NavigateUrl="myPasswords.aspx?id=2">Request Received</asp:HyperLink>
                                      (<asp:Label ID="L_PW_Rec" runat="server"></asp:Label>) &nbsp;</td>
                                  <td align="right">&nbsp;</td>
                                </tr>
                                
                               
                               
                              </tbody>
                            </table>
                          </fieldset>	
                          <fieldset class="fieldset">
                              <legend class="bluetext">
                                  <img src="../Resources/mylinks-icontxt.gif" height="32" style="width: 116px"></legend>
                              <table align="center" border="0" cellpadding="4" cellspacing="4" width="100%">
                                  <tbody>
                                      <tr>
                                          <td align="right" width="10%">
                                              &nbsp;</td>
                                          <td colspan="2" align="right" width="90%">
                                              <div align="left">
                                                  <span class="h3r">Book marks</span></div>
                                          </td>

                                      </tr>
                                      <tr>
                                          <td align="right">
                                              &nbsp;</td>
                                          <td colspan="2" align="right">
                                              <div align="left">
                                                  &nbsp;
                                                  <img src="../Resources/arrow-grn-4x7.gif" height="7" width="4"><a href ="mybookmark.aspx" style=" text-decoration: none;">
                                                  Links</a>(<asp:Label ID="L_BM_Links" runat="server"></asp:Label>)
                                              </div>
                                          </td>

                                      </tr>
                                    
                                  </tbody>
                              </table>
                          </fieldset>
                          </td>
                        </tr>
                    </tbody></table></td>
                  </tr>
                </tbody></table></td>
              </tr>
            </tbody></table>
                                                  
        <%--Content Ends--%>

</asp:Content>

