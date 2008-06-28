<%@ Page Language="C#" MasterPageFile="~/Admin/Protected/Admin.master" AutoEventWireup="true" CodeFile="EditProfile1.aspx.cs" Inherits="Admin_Protected_EditProfile1" Title="Untitled Page" %>
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
                
                 <table border="0" cellpadding="0" cellspacing="0" width="588px">
                            <tbody>
                                <tr height="28">
                                    <td align="left" colspan="3">
                                        &nbsp;<asp:HyperLink ID="HL_Step_1" runat="server" Enabled="False" ImageUrl="~/Resources/Step1_Act.gif">Step 1</asp:HyperLink><asp:HyperLink
                                            ID="HL_Step_2" runat="server" ImageUrl="~/Resources/Step2_inAct.gif">Step 2</asp:HyperLink><asp:HyperLink
                                                ID="HL_Step_3" runat="server" ImageUrl="~/Resources/Step3_inAct.gif">Step 5</asp:HyperLink><asp:HyperLink
                                                    ID="HL_Step_4" runat="server" ImageUrl="~/Resources/Step4_inAct.gif">Step 4 </asp:HyperLink></td>
                                </tr>
                </tbody>
                </table>
                

                        <table border="0" cellpadding="0" cellspacing="0" width="650">
                            <tbody>
                                <tr height="28">
                                    <td align="right" class="smalltxt" colspan="3">
                                        <div align="left">
                                            &nbsp;</div>
                                    </td>
                                </tr>
                                <!---- -->
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" colspan="3" style="border-top: #3399cc thin solid; border-bottom: #3399cc thin solid; height: 13px; text-align: left" >
                                        <div align="left">
                                            <span class="bodysg" style="color: gray"><strong>
                                                <br />
                                                Basic Information 
                                                <br />
                                                <br />
                                            </strong></span>
                                        </div>
                                    </td>
                                </tr>
                                <!---- -->
                                <tr>
                                    <td class="grebg" colspan="3" >
                                    </td>
                                </tr>                                
                                <tr>
                                    <td class="grebg"  rowspan="25" style="text-align: left" width="8%">
                                        <div style="width:47px; height: 58px;"></div>
                                    </td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" style="width: 35%">
                                        <div align="left">
                                            Name</div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:Label ID="L_Name" runat="server"></asp:Label>&nbsp;</div>
                                    </td>
                                </tr>
                                <!-- -->
                                <tr >
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding" >
                                    <td class="grtxtbold1" style="width: 35%">
                                        <div align="left">
                                            Gender</div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:Label ID="L_Gender" runat="server"></asp:Label>&nbsp;</div>
                                    </td>
                                </tr>
                                <!-- -->
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" style="width: 35%">
                                        <div align="left">
                                            Date of Birth</div>
                                    </td>
                                    <td class="smalltxt">
                                        <div align="left">
                                            <asp:Label ID="L_Dob" runat="server"></asp:Label>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" style="width: 35%">
                                        <div align="left">
                                            Marital Status</div>
                                        </td>
                                    <td class="smalltxt" >
                                        <div align="left">
                                            <asp:Label ID="L_MaritalStatus" runat="server"></asp:Label>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" style="width: 35%">
                                        <div align="left">
                                            No. of Children</div>
                                    </td>
                                    <td valign="top">
                                        <div align="left">
                                            <asp:Label ID="L_NoOfChildren" runat="server"></asp:Label><span
                                                style="color: #a24f11; text-decoration: underline">&nbsp;</span></div>
                                    </td>
                                </tr>
                                <tr style="color: #a24f11; text-decoration: underline">
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding" >
                                    <td class="grtxtbold1" style="width: 35%">
                                        <div align="left">
                                            Children Living Status</div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:RadioButton ID="RB_LivingWithMe" runat="server" GroupName="Children" Text="Living with me" />
                                            &nbsp;<asp:RadioButton ID="RB_NotWithMe" runat="server" GroupName="Children" Text="Not living with me" />&nbsp;
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" style="width: 35%">
                                        <div align="left">
                                            Physical Status</div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:Label ID="L_PhysicalStatus" runat="server"></asp:Label>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" style="width: 35%">
                                        <div align="left">
                                            Mother tongue</div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:Label ID="L_MotherTongue" runat="server"></asp:Label><span style="color: #000000"> </span>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding" style="color: #000000">
                                    <td class="grtxtbold1" style="width: 35%">
                                        <div align="left">
                                            Religion</div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left" style="text-align: left">
                                            <asp:Label ID="L_Religion" runat="server"></asp:Label>
                                            &nbsp;&nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" style="width: 35%">
                                        <div align="left">
                                            Caste</div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:Label ID="L_Cast" runat="server"></asp:Label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" style="width: 35%">
                                        <div align="left">
                                            Sub Caste
                                        </div>
                                    </td>
                                    <td class="grtxt">
                                        <div align="left">
                                            <asp:TextBox ID="TB_Subcast" runat="server" CssClass="forminput" Height="15px" Width="197px"></asp:TextBox>&nbsp;</div>
                                    </td>
                                </tr>
                                <!---- -->
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <!-- -->
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" style="width: 35%">
                                        <div align="left">
                                            Profile Created by
                                        </div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:Label ID="L_ProfieCreated" runat="server"></asp:Label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <!-- -->
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                  <tr>
                                    <td class="grebg" colspan="3" >
                                    </td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" colspan="3" style="border-top: #3399cc thin solid; border-bottom: #3399cc thin solid; height: 13px; text-align: left">
                                        <div align="left">
                                            <span class="bodysg" style="color: gray"><strong>
                                                <br />
                                                Socio Religious Attributes </strong>
                                            </span>
                                        </div>
                                        <div align="left">
                                            <br />
                                            &nbsp;</div>
                                    </td>
                                </tr>
                               <tr>
                                    <td class="grebg" style="height: 4px; " rowspan="15">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <!-- -->
                                <!-- -->
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" style="width: 35%">
                                        <div align="left">
                                            Star(Nakshatra)</div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:DropDownList ID="DDL_Star" runat="server" Width="217px">
                                            </asp:DropDownList>&nbsp;</div>
                                    </td>
                                </tr>
                                <!-- -->
                                <!-- -->
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" style="width: 35%">
                                        <div align="left">
                                            Moonsign</div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:DropDownList ID="DDL_Moon" runat="server" Width="217px">
                                            </asp:DropDownList>&nbsp;</div>
                                    </td>
                                </tr>
                                <!-- -->
                                <!-- -->
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" style="width: 35%">
                                        <div align="left">
                                            Horoscope Match
                                        </div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:RadioButton ID="RB_Horoscope_NO" runat="server" GroupName="Horoscope" Text="No" />
                                            <asp:RadioButton ID="RB_Horoscope_Yes" runat="server" GroupName="Horoscope" Text="Yes" />
                                            <asp:RadioButton ID="RB_Horoscope_NoMatters" runat="server" GroupName="Horoscope"
                                                Text="Does not matter" /></div>
                                    </td>
                                </tr>
                                <!-- -->
                                <!-- -->
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" style="width: 35%">
                                        <div align="left">
                                            Chovva Dosham/Manglik</div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:RadioButton ID="RB_Manglik_No" runat="server" GroupName="Manglik" Text="No" />
                                            <asp:RadioButton ID="RB_Manglik_Yes" runat="server" GroupName="Manglik" Text="Yes" />
                                            <asp:RadioButton ID="RB_Manglik_DKnow" runat="server" GroupName="Manglik" Text="Do not know" />
                                            <asp:RadioButton ID="RB_Manglik_NA" runat="server" GroupName="Manglik" Text="Not applicable" /></div>
                                    </td>
                                </tr>
                                <!-- -->
                                <!-- -->
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" style="width: 35%">
                                        <div align="left">
                                            <span class="bodywk"> Place of Birth </span>
                                        </div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            <asp:TextBox ID="TB_POB" runat="server" CssClass="forminput" MaxLength="64"
                                                Width="211px"></asp:TextBox>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" style="width: 35%">
                                        <div align="left">
                                            <span class="bodywk"> Time of Birth </span>
                                        </div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            &nbsp;<asp:TextBox ID="TB_Time_H" runat="server" CssClass="forminput" MaxLength="2"
                                                Width="21px"></asp:TextBox><asp:RangeValidator ID="RangeValidator1" runat="server"
                                                    ControlToValidate="TB_Time_H" ErrorMessage="*" MaximumValue="12" MinimumValue="0"
                                                    SetFocusOnError="True" Type="Integer"></asp:RangeValidator>:<asp:TextBox ID="TB_Time_M"
                                                        runat="server" CssClass="forminput" MaxLength="2" Width="21px"></asp:TextBox><asp:RangeValidator
                                                            ID="RangeValidator2" runat="server" ControlToValidate="TB_Time_M" ErrorMessage="*"
                                                            MaximumValue="59" MinimumValue="0" SetFocusOnError="True"></asp:RangeValidator>-<asp:DropDownList
                                                                ID="DDL_Time" runat="server" CssClass="forminput">
                                                                <asp:ListItem Value="AM">AM</asp:ListItem>
                                                                <asp:ListItem Value="PM">PM</asp:ListItem>
                                                            </asp:DropDownList></div>
                                    </td>
                                </tr>
                                <!-- -->
                                <!-- -->
                                <tr>
                                    <td class="grebg" colspan="2">
                                        <img height="1" src="../../Resources/trans.gif" /></td>
                                </tr>
                                <!-- -->
                                <tr class="tabpadding">
                                    <td class="grtxtbold1" colspan="3">
                                        &nbsp;&nbsp;</td>
                                </tr>
                                <tr class="tabpadding">
                                    <td colspan="3" style="height: 13px; border-top: #3399cc thin solid; border-bottom: #3399cc thin solid; text-align: left;">
                                        <div align="center">
                                            <div align="center">
                                                <asp:ImageButton ID="IB_Submit" runat="server" ImageUrl="~/Resources/button-Save.gif" />
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

