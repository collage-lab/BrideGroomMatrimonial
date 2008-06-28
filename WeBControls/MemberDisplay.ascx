<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MemberDisplay.ascx.cs" Inherits="WeBControls_MemberDisplay" %>

<link href="../Resources/style.css" rel="stylesheet" type="text/css" />

<!-- onmouseover="overlaychange('E816452_1');replace_image('E816452_D1',0);" onmouseout="overlayout('E816452_1');" -->

<table style="width: 294px; height: 165px; border-right: #ff0099 1px solid; border-top: #ff0099 1px solid; border-left: #ff0099 1px solid; border-bottom: #ff0099 1px solid;">
		  <tr>
		         <td style="height: 168px;">
	            	  <table  border="0" cellpadding="0" cellspacing="0" style="width: 290px; height: 100%">
                            <tbody>
                                   <tr>
                                    <td  align="center" valign ="middle" style=" width: 45%; border-right: #990066 1px solid;" bgcolor="#ffe6ff">
                                    <div id="div_Photo"   align="center">
                                          <br />
                                          <asp:Image ID="IMG_Main" runat="server" BorderColor="Fuchsia" BorderStyle="Solid"
                                              BorderWidth="1px" Height="98px" ImageUrl="~/Resources/nophoto.gif" Width="98px" /><br />
                                          <br />
                                          <asp:HyperLink ID="HF_ViewPF" style="text-decoration:none" runat="server" Target="_blank" Font-Bold="True" ForeColor="#990066">View Profile</asp:HyperLink>
                                           <%Response.Write(IFrame()); %>
                                          
                                         
                                          </div>
                                    </td>
                                    <td rowspan="2" style="width: 6%">
                                        &nbsp;</td>
                                    <td valign="top" width ="54%" style="left: 3px; position: relative; top: 1px">
                                        
                                            <asp:Label ID="L_Name" runat="server" Visible="False" Width="167px"></asp:Label>
                                        <asp:Label ID="L_Display" runat="server" Width="175px"></asp:Label>
                                            
                                               <b>Last Login:</b> <asp:Label ID="L_LastLogin" runat="server"></asp:Label>
                                               
                                                <br />
                                                </td>
                                  </tr>
                                  
                                  <tr bgcolor="#fbeed6" style="font-size: 12pt"><td colspan="3"   bgcolor="#993333" style="height: 0px"></td></tr>
                             </tbody>
                       </table>
                </td>
          </tr>
</table>