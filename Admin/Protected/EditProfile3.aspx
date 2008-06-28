<%@ Page Language="C#" MasterPageFile="~/Admin/Protected/Admin.master" AutoEventWireup="true" CodeFile="EditProfile3.aspx.cs" Inherits="Admin_Protected_EditProfile3" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <table id="contentx" border="0" cellpadding="1" cellspacing="1" height="0" width="100%">
        <tbody>
            <tr>
                <td colspan="4" style="height: 54px" valign="middle">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tbody>
                            <tr>
                                <td style="width: 8%; height: 51px">
                                    <asp:Image ID="Img_icon" runat="server" ImageUrl="~/Resources/Del-user.gif" /></td>
                                <td class="headertext" style="height: 51px" width="97%">
                                    &nbsp; &nbsp; &nbsp; <strong><span style="color: gray">&nbsp;EDIT MEMBER PROFILE:<asp:Label
                                        ID="L_MATID" runat="server" Font-Bold="True" ForeColor="Gray"></asp:Label>
                                        STEP</span></strong><asp:Label ID="L_Label" runat="server" Font-Bold="True" ForeColor="Gray"></asp:Label></td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 13%">
                </td>
               
                
                
                <td colspan="4" style="text-align: left" valign="top">

                  
                        <table border="0" cellpadding="0" cellspacing="0" width="97%">
                            <tbody>
                                <tr height="28">
                                    <td align="right" class="smalltxt" colspan="3" style="text-align: center">
                
                 <table border="0" cellpadding="0" cellspacing="0" width="588px">
                            <tbody>
                                <tr height="28">
                                    <td align="left" colspan="3" style="text-align: center">
                                      <asp:HyperLink ID="HL_Step_1" runat="server" ImageUrl="~/Resources/Step1_inAct.gif">Step 1</asp:HyperLink><asp:HyperLink
                                            ID="HL_Step_2" runat="server" ImageUrl="~/Resources/Step2_inAct.gif">Step 2</asp:HyperLink><asp:HyperLink
                                                ID="HL_Step_3" runat="server" ImageUrl="~/Resources/Step3_Act.gif" Enabled="False">Step 5</asp:HyperLink><asp:HyperLink
                                                    ID="HL_Step_4" runat="server" ImageUrl="~/Resources/Step4_inAct.gif">Step 4 </asp:HyperLink>
                                    </td>
                                </tr>
                </tbody>
                </table>
                                    </td>
                                </tr>
                                <!---- -->
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" colspan="3" style="border-top: #3399cc thin solid; border-bottom: #3399cc thin solid; height: 13px; text-align: left">
                                        <div align="left">
                                            <span class="bodysg"><strong><span style="color: gray">
                                                <br />
                                                About Yourself</span></strong>
                                                <br />
                                                <br />
                                            </span>
                                        </div>
                                    </td>
                                </tr>
                                <!---- -->
                                <tr>
                                    <td class="grebg" colspan="3">
                                    </td>
                                </tr>
                                 <tr>
                                    <td rowspan="2" style="width: 46px" >
                                        <div style="width: 47px; height: 58px">
                                        </div>
                                    </td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" colspan="2">
                                        <div align="left" style="text-align: justify">
                                            <asp:TextBox ID="TB_AboutME" runat="server" Height="142px" MaxLength="1000"
                                                TextMode="MultiLine" Width="600px"></asp:TextBox>
                                            <div style="width: 603px; height: 26px">
                                            <asp:TextBox ID="txtCount" runat="server" BorderColor="#E0E0E0" BorderStyle="None"
                                                BorderWidth="1px" ForeColor="Red" ReadOnly="True" Width="31px">1000</asp:TextBox><span
                                                    style="font-size: 7pt"><strong><span style="color: #808080">You could enter details about you or a bried description about
                                                yourself. </span>
                                                <span class="style2" style="color: #ff0000">Min 50</span><span style="color: #ff0000">
                                                    chas and </span><span><span><span style="color: gray">
                                                        <span class="style2"><span>
                                                        Max 1000 char</span>s</span><span>.<br />
                                                        </span></span></span></span><span><span style="color: gray"></span></span></strong>
                                                </span>
                                            </div>
                                            &nbsp;<br />
                                            <span
                                                    style="font-size: 7pt"> </span>
                                            <span class="style1"><strong><span style="font-size: 7pt"><span
                                                        style="color: gray"> </span>
                                                </span></strong></span></div>
                                    </td>
                                </tr>
                                    
                                <!-- -->
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" colspan="3" style="border-top: #3399cc thin solid; border-bottom: #3399cc thin solid; height: 13px; text-align: left">
                                        <div align="left">
                                            <span class="bodysg"><strong><span style="color: gray">
                                                <br />
                                                Family Details</span></strong>
                                                <br />
                                                <br />
                                            </span>
                                        </div>
                                    </td>
                                </tr>
                                <!-- -->
                                 <tr>
                                    <td rowspan="32" style="width: 46px" >
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" style="width: 169px">
                                        <div align="left">
                                            &nbsp;Family Details
                                        </div>
                                    </td>
                                    <td class="smalltxt" style="text-align: justify">
                                        <asp:TextBox ID="TB_FamilyDetails" runat="server" Height="94px"
                                            TextMode="MultiLine" Width="215px"></asp:TextBox>
                                        <br />
                                        <span style="font-size: 7pt; color: gray"></span>
                                    </td>
                                </tr>
                                <tr><td style="text-align: justify" colspan="2">
                                    <span style="font-size: 7pt; color: gray"><strong>&nbsp;&nbsp; Use this space to talk about your parents, what do they do and what are their backgrounds. What do your siblings do?&nbsp;<br />
                                        &nbsp; &nbsp;Do they live in the same city as your parents? Talk about others in your extended family and so on.</strong></span></td></tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" style="width: 169px">
                                        <div align="left">
                                            &nbsp;Family Values
                                        </div>
                                    </td>
                                    <td class="smalltxt">
                                        <div align="left">
                                            <asp:DropDownList ID="DDL_FamilyValues" runat="server" Width="222px">
                                            </asp:DropDownList>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" style="width: 169px">
                                        <div align="left">
                                            &nbsp;Family Type</div>
                                    </td>
                                    <td class="smalltxt">
                                        <div align="left">
                                            <asp:DropDownList ID="DDL_FamilyType" runat="server" Width="222px">
                                            </asp:DropDownList><strong>&nbsp;</strong></div>
                                    </td>
                                </tr>
                                <tr style="font-weight: bold">
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding" style="font-weight: bold">
                                    <td class="grtxtbold1" style="width: 169px">
                                        <div align="left">
                                            &nbsp;Family Status</div>
                                    </td>
                                    <td valign="top">
                                        <div align="left">
                                            <asp:DropDownList ID="DDL_FamilyStatus" runat="server" Width="222px">
                                            </asp:DropDownList>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" style="width: 169px">
                                        <div align="left">
                                            &nbsp;Family Origin
                                        </div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:TextBox ID="TB_familyOrigin" runat="server" CssClass="forminput" Width="215px"></asp:TextBox>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" style="width: 169px">
                                        <div align="left">
                                            <strong>&nbsp;No of Brothers </strong>
                                        </div>
                                    </td>
                                    <td class="grtxt" style="font-weight: bold">
                                        <div align="left">
                                            <asp:Label ID="L_NoOfBrother" runat="server" Font-Bold="False"></asp:Label>&nbsp; Married&nbsp;
                                            <asp:Label ID="L_BMarried" runat="server" Visible="False" Font-Bold="False"></asp:Label>
                                            <asp:DropDownList ID="DDL_NoOfBrothersMarried" runat="server" CssClass="forminput"
                                                Width="80px">
                                                <asp:ListItem Value="0">-- Select --</asp:ListItem>
                                                <asp:ListItem>1</asp:ListItem>
                                                <asp:ListItem>2</asp:ListItem>
                                                <asp:ListItem>3</asp:ListItem>
                                                <asp:ListItem>4</asp:ListItem>
                                                <asp:ListItem>5</asp:ListItem>
                                                <asp:ListItem Value="7">No</asp:ListItem>
                                                <asp:ListItem Value="6">More than 5</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="DDL_NoOfBrothersMarried"
                                                ErrorMessage="*"></asp:RequiredFieldValidator>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding" style="color: #000000">
                                    <td class="grtxtbold1" style="width: 169px">
                                        <div align="left">
                                            &nbsp;No of Sisters
                                        </div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:Label ID="L_NoOfSister" runat="server"></asp:Label>&nbsp; <strong>Married</strong>&nbsp;
                                            <asp:Label ID="L_SMarried" runat="server" Visible="False"></asp:Label>
                                            <asp:DropDownList ID="DDL_NoOFSistersMarried" runat="server" CssClass="forminput"
                                                Width="80px">
                                                <asp:ListItem Value="0">-- Select --</asp:ListItem>
                                                <asp:ListItem>1</asp:ListItem>
                                                <asp:ListItem>2</asp:ListItem>
                                                <asp:ListItem>3</asp:ListItem>
                                                <asp:ListItem>4</asp:ListItem>
                                                <asp:ListItem>5</asp:ListItem>
                                                <asp:ListItem Value="7">No</asp:ListItem>
                                                <asp:ListItem Value="6">More than 5</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="DDL_NoOFSistersMarried"
                                                ErrorMessage="*"></asp:RequiredFieldValidator>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding" style="color: #000000">
                                    <td class="grtxtbold1" colspan="2">
                                        <div align="left">
                                            <span class="bodysg"><strong>&nbsp;<br />
                                                &nbsp;Father's Detail </strong></span>
                                        </div>
                                        <div align="left">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" style="width: 169px">
                                        <div align="left">
                                            &nbsp;Name:</div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:Label ID="L_FatherName" runat="server"></asp:Label>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding" style="color: #000000">
                                    <td class="grtxtbold1" style="width: 169px">
                                        <div align="left">
                                        </div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:RadioButton ID="RB_Father_Alive" runat="server" GroupName="father" Text="Alive" />
                                            <asp:RadioButton ID="RB_Father_NAlive" runat="server" GroupName="father" Text="Not Alive" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" style="width: 169px">
                                        <div align="left">
                                            &nbsp;Occupation</div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:TextBox ID="TB_Father_Occ" runat="server" Width="215px"></asp:TextBox>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td align="left" class="grtxtbold1" colspan="2">
                                        <div align="left" class="bodysg">
                                            <strong>&nbsp;<br />
                                                &nbsp;Mother's Detail </strong>
                                        </div>
                                        <div align="left">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" style="width: 169px">
                                        <div align="left">
                                            &nbsp;Name:</div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:Label ID="L_MotherName" runat="server"></asp:Label>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" style="width: 169px">
                                        <div align="left">
                                        </div>
                                    </td>
                                    <td class="smalltxt">
                                        <div align="left">
                                            <asp:RadioButton ID="RB_Mother_Alive" runat="server" GroupName="Mother" Text="Alive" />&nbsp;<asp:RadioButton
                                                ID="RB_Mother_NAlive" runat="server" GroupName="Mother" Text="Not Alive" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td align="left" class="grtxtbold1" style="width: 169px">
                                        <div align="left">
                                            &nbsp;Occupation</div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:TextBox ID="TB_Mother_Occ" runat="server" Width="215px"></asp:TextBox>&nbsp;</div>
                                    </td>
                                </tr>
                                <!-- -->
                                <!-- -->
                                <!-- -->
                                <!-- -->
                                
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" colspan="3" style="border-top: #3399cc thin solid; border-bottom: #3399cc thin solid; height: 13px; text-align: left">
                                        <div align="left">
                                            <span class="bodysg" style="color: gray"><strong>
                                                <br />
                                                Hobbies and Interests<br />
                                                <br />
                                            </strong></span>
                                        </div>
                                    </td>
                                </tr>
                                <!-- -->
                                <!-- -->
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                     <tr>
                                    <td rowspan="8" style="width: 46px" >
                                    </td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" style="width: 169px">
                                        <div align="left">
                                            Hobbies</div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            <div id="Div7" runat="server" style="border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid;
                                                overflow: auto; border-left: #dcdcdc 1px solid; width: 97%; border-bottom: #dcdcdc 1px solid;
                                                height: 120px">
                                                <asp:CheckBoxList ID="LB_Hobbies" runat="server" Height="71px" RepeatColumns="2"
                                                    Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                    Width="395px">
                                                </asp:CheckBoxList></div>
                                        </div>
                                    </td>
                                </tr>
                                <!-- -->
                                <!-- -->
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" style="width: 169px">
                                        <div align="left">
                                            Other Hobbies</div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:TextBox ID="TB_OtherHobbies" runat="server" Width="215px"></asp:TextBox>&nbsp;</div>
                                    </td>
                                </tr>
                                <!-- -->
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" style="height: 119px; width: 169px;">
                                        <div align="left">
                                            Interests</div>
                                    </td>
                                    <td style="height: 119px">
                                        <div align="left">
                                            <div id="Div1" runat="server" style="border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid;
                                                overflow: auto; border-left: #dcdcdc 1px solid; width: 98%; border-bottom: #dcdcdc 1px solid;
                                                height: 115px">
                                                <asp:CheckBoxList ID="LB_Interests" runat="server" Height="71px" RepeatColumns="2"
                                                    Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                    Width="396px">
                                                </asp:CheckBoxList></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" style="width: 169px">
                                        <div align="left">
                                            Other Interests</div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:TextBox ID="TB_OtherInterests" runat="server" Width="215px"></asp:TextBox>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" colspan="3">
                                        &nbsp;&nbsp;</td>
                                </tr>
                                <tr class="tabpadding">
                                    <td colspan="3" height="7" style="border-top: #3399cc thin solid; border-bottom: #3399cc thin solid; height: 13px; text-align: left">
                                        <div align="center">
                                            <div align="center">
                                                <asp:ImageButton ID="IB_Submit_Step3" runat="server" ImageUrl="~/Resources/button-Save.gif" OnClick="IB_Submit_Step3_Click" />&nbsp;
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

               
                </td>
            </tr>
            <tr>
                <td colspan="5" style="text-align: center">
                    <asp:HiddenField ID="HF_MatID" runat="server" /><asp:HiddenField ID="HF_Seqt" runat="server" />
                </td>
            </tr>
        </tbody>
    </table>

</asp:Content>

