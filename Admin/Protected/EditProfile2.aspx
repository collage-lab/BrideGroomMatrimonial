<%@ Page Language="C#" MasterPageFile="~/Admin/Protected/Admin.master" AutoEventWireup="true" CodeFile="EditProfile2.aspx.cs" Inherits="Admin_Protected_EditProfile2" Title="Untitled Page" %>
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
                                        ID="L_MATID" runat="server" Font-Bold="True" ForeColor="Gray"></asp:Label></span></strong></td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 13%">
                </td>
               
                
                
                <td colspan="4" style="text-align: left" valign="top">
                
                 <table border="0" cellpadding="0" cellspacing="0" width="600">
                            <tbody>
                                <tr height="28">
                                    <td align="left" colspan="3" style="text-align: center">
                                        &nbsp;<asp:HyperLink ID="HL_Step_1" runat="server" ImageUrl="~/Resources/Step1_inAct.gif">Step 1</asp:HyperLink><asp:HyperLink
                                            ID="HL_Step_2" runat="server" ImageUrl="~/Resources/Step2_Act.gif" Enabled="False">Step 2</asp:HyperLink><asp:HyperLink
                                                ID="HL_Step_3" runat="server" ImageUrl="~/Resources/Step3_inAct.gif">Step 5</asp:HyperLink><asp:HyperLink
                                                    ID="HL_Step_4" runat="server" ImageUrl="~/Resources/Step4_inAct.gif">Step 4 </asp:HyperLink></td>
                                                          </tr>
                </tbody>
     </table>
      
 
                        <table border="0" cellpadding="0" cellspacing="0" width="97%">
                            <tbody>
                                <tr height="28">
                                    <td align="right" class="smalltxt" colspan="3">
                                    
                                    </td>
                                </tr>
                                <!---- -->
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" colspan="3" style="border-top: #3399cc thin solid; border-bottom: #3399cc thin solid; height: 13px; text-align: left">
                                        <div align="left">
                                            <span class="bodysg" style="color: gray"><strong>
                                                <br />
                                                Education and Occupation<br />
                                                <br />
                                            </strong></span>
                                        </div>
                                    </td>
                                </tr>
                                <!---- -->
                                <tr>
                                    <td class="grebg" colspan="3">
                                        </td>
                                </tr>                                <tr>
                                    <td class="grebg" rowspan="10" style="width: 36px" >
                                        <div style="width: 47px; height: 58px">
                                        </div>
                                        </td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            Education</div>
                                    </td>
                                    <td width="500">
                                        <div align="left">
                                            <asp:DropDownList ID="DDL_Education" runat="server"  Width="290px">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DDL_Education"
                                                ErrorMessage="*" InitialValue="0"></asp:RequiredFieldValidator></div>
                                    </td>
                                </tr>
                                <!-- -->
                                <tr style="font-weight: bold; color: #000000">
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding" style="color: #000000">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            Edu Details
                                        </div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:DropDownList ID="DDL_EduDetails" runat="server"  Width="215px">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DDL_EduDetails"
                                                ErrorMessage="*" InitialValue="0"></asp:RequiredFieldValidator></div>
                                    </td>
                                </tr>
                                <!-- -->
                                <tr style="font-size: 8pt; font-family: Arial">
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding" style="font-size: 8pt; font-family: Arial">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            Annual income
                                        </div>
                                    </td>
                                    <td class="smalltxt">
                                        <div align="left">
                                            <asp:DropDownList ID="DDL_AnnualIncome" runat="server"  Width="215px">
                                            </asp:DropDownList><span style="font-size: 8pt">&nbsp; in </span>
                                            <asp:DropDownList ID="DDL_Currency" runat="server"  Width="290px">
                                            </asp:DropDownList></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" valign="center">
                                        <div align="left">
                                            Occupation
                                        </div>
                                    </td>
                                    <td class="smalltxt">
                                        <div align="left">
                                            <asp:DropDownList ID="DDL_Occupation" runat="server"  Width="215px">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DDL_Occupation"
                                                ErrorMessage="*" InitialValue="0"></asp:RequiredFieldValidator></div>
                                    </td>
                                </tr>
                                <tr style="font-size: 9pt; font-family: Arial; color: #000000;">
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding" style="font-size: 9pt; font-family: Arial; color: #000000;">
                                    <td class="grtxtbold1" width="210">
                                        <div align="left">
                                            Employed in
                                        </div>
                                    </td>
                                    <td valign="top">
                                        <div align="left">
                                            <asp:DropDownList ID="DDL_EmpIn" runat="server"  Width="215px">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DDL_EmpIn"
                                                ErrorMessage="*" InitialValue="0"></asp:RequiredFieldValidator></div>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding" style="color: #000000">
                                    <td class="grtxtbold1" colspan="3" style="border-top: #3399cc thin solid; border-bottom: #3399cc thin solid; height: 13px; text-align: left">
                                        <div align="left">
                                            <span class="bodysg"><strong><span style="color: gray">
                                                <br />
                                                Physical Attributes</span></strong>
                                                <br />
                                                <br />
                                            </span>
                                        </div>
                                    </td>
                                </tr>
                                  <tr>
                                    <td class="grebg" rowspan="18" style="width: 36px" ></td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" style="font-size: 9pt">
                                        <div align="left">
                                            Height
                                        </div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:Label ID="L_Height" runat="server"></asp:Label>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding" style="color: #000000">
                                    <td class="grtxtbold1" style="font-size: 9pt">
                                        <div align="left">
                                            Weight
                                        </div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:DropDownList ID="DDL_Weight" runat="server"  Width="215px">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="DDL_Weight"
                                                ErrorMessage="*" InitialValue="0"></asp:RequiredFieldValidator></div>
                                    </td>
                                </tr>
                                <tr style="font-weight: bold; color: #000000">
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding" style="color: #000000" >
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            <span class="Alert"> </span>Blood Group
                                        </div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:DropDownList ID="DDL_BGroup" runat="server"  Width="215px">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="DDL_BGroup"
                                                ErrorMessage="*" InitialValue="0"></asp:RequiredFieldValidator></div>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding" style="color: #000000">
                                    <td class="grtxtbold1" style="height: 15px">
                                        <div align="left">Complexion</div>
                                    </td>
                                    <td class="grtxt" >
                                        <div align="left">
                                            <asp:Label ID="L_Complexion" runat="server" >
                                            </asp:Label>
                                            </div>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding" style="color: #000000">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            Body type
                                        </div>
                                    </td>
                                    <td >
                                        <div align="left">
                                            <asp:RadioButton ID="RB_BType_Slim" runat="server" GroupName="RB_BType" Text="Slim" />
                                            &nbsp;<asp:RadioButton ID="RB_BType_Avg" runat="server" 
                                                GroupName="RB_BType" Text="Average" />
                                            &nbsp;<asp:RadioButton ID="RB_BType_Ath" runat="server" GroupName="RB_BType" Text="Athletic" />
                                            <asp:RadioButton ID="RB_BType_Heavy" runat="server" GroupName="RB_BType" Text="Heavy " />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            Diet</div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:DropDownList ID="DDL_Diet" runat="server"  Width="215px">
                                            </asp:DropDownList>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            Smoke</div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:RadioButton ID="RB_Smoke_no" runat="server" GroupName="RB_Smoke" Text="NO" /> <asp:RadioButton
                                                ID="RB_Smoke_Yes" runat="server" GroupName="RB_Smoke" Text="Yes" />
                                            &nbsp; <asp:RadioButton ID="RB_Smoke_Occ" runat="server" GroupName="RB_Smoke" Text="Occasionally" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            Drink</div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:RadioButton ID="RB_Drink_No" runat="server" GroupName="RB_Drink" Text="No" />&nbsp; <asp:RadioButton
                                                ID="RB_Drink_Yes" runat="server" GroupName="RB_Drink" Text="Yes" />
                                            <asp:RadioButton ID="RB_Drink_Occ" runat="server" GroupName="RB_Drink" Text="Occasionally" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" colspan="3" style="border-top: #3399cc thin solid; border-bottom: #3399cc thin solid; height: 13px; text-align: left">
                                        <div align="left">
                                            <span class="bodysg" style="color: gray"><strong>
                                                <br />
                                                Contact Details </strong></span>
                                        </div>
                                        <div align="left">
                                            <br />
                                            &nbsp;</div>
                                    </td>
                                </tr>
                                  <tr>
                                    <td class="grebg" rowspan="20" style="width: 36px" ></td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            Address
                                        </div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:TextBox ID="TB_Address" runat="server"  Height="112px" MaxLength="250"
                                                TextMode="MultiLine" Width="313px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TB_Address"
                                                ErrorMessage="*"></asp:RequiredFieldValidator><br />
                                            <span class="style2">The contact address is only for Official purpose and will not be
                                                discloded to others</span></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            Country
                                        </div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <span class="formselect">
                                                <asp:DropDownList ID="DDL_Country" runat="server"  Width="215px">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="DDL_Country"
                                                    ErrorMessage="*" InitialValue="0"></asp:RequiredFieldValidator></span></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            State</div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:DropDownList ID="DDL_State" runat="server"  Width="215px">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="DDL_State"
                                                ErrorMessage="*" InitialValue="0"></asp:RequiredFieldValidator></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            City
                                        </div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:TextBox ID="TB_City" runat="server"  Width="207px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TB_City"
                                                ErrorMessage="*"></asp:RequiredFieldValidator></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            Phone</div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:TextBox ID="TB_Phone_ISD" runat="server"  MaxLength="4"
                                                Width="29px">+91</asp:TextBox>
                                            - &nbsp;<asp:TextBox ID="TB_Phone_STD" runat="server"  MaxLength="6"
                                                Width="45px"></asp:TextBox>
                                            -&nbsp;
                                            <asp:TextBox ID="TB_Phone_NO" runat="server"  Width="86px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="TB_Phone_NO"
                                                ErrorMessage="*"></asp:RequiredFieldValidator></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            Mobile
                                        </div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:TextBox ID="TB_Phone_Mobile" runat="server"  MaxLength="12"
                                                Width="207px"></asp:TextBox>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            Residence in</div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:DropDownList ID="DDL_ResidenceIn" runat="server"  Width="215px">
                                            </asp:DropDownList>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            Residencial Status</div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:DropDownList ID="DDL_ResidentialStatus" runat="server" 
                                                Width="215px">
                                            </asp:DropDownList>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1">
                                        <div align="left">
                                            Residencial City</div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:TextBox ID="TB_RCity" runat="server"  Width="206px"></asp:TextBox>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" colspan="3">
                                        <div align="left">
                                        </div>
                                        <div align="left">
                                        </div>
                                    </td>
                                </tr>
                                <tr class="tabpadding">
                                    <td colspan="3" height="7" style="border-top: #3399cc thin solid; border-bottom: #3399cc thin solid; height: 13px; text-align: left">
                                        <div align="center">
                                            <div align="center">
                                                &nbsp;
                                                <asp:ImageButton ID="IB_Submit_Step2" runat="server" ImageUrl="~/Resources/button-Save.gif" OnClick="IB_Submit_Step2_Click" /></div>
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

