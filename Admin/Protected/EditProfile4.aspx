<%@ Page Language="C#" MasterPageFile="~/Admin/Protected/Admin.master" AutoEventWireup="true" CodeFile="EditProfile4.aspx.cs" Inherits="Admin_Protected_EditProfile4" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--onload = displayALL();--%>

	<script type="text/javascript">
      <!--   -
        function displayALL()
         {
            displayBlockState();
            displayBlockI2();
            displayBlockI1();
            displayBlockReligion();
            displayBlockCaste();
            displayBlockEducation();
            displayBlockCountry();
            displayBlockOccupation();
            displayBlockEduDet();
        }
        -  -->
    </script>

	<script type="text/javascript">
      <!--   -
        function displayBlockState()
         {
          if (document.getElementById('CB_StatesInIndia').checked)
          {
            document.getElementById('DIV_States').style.display = "block";
           document.getElementById('TB_NonIndianState').style.display = "none";
          }
           else 
          {
             document.getElementById('DIV_States').style.display = "none";
            document.getElementById('TB_NonIndianState').style.display = "block";

          }
        }
        -  -->
    </script>
    <script type="text/javascript">
      <!--   -
        function displayBlockI2()
         {
          if (document.getElementById('CB_IndianX').checked)
          {
            document.getElementById('DIV_IndianX').style.display = "none";
          }
           else 
          {
            document.getElementById('DIV_IndianX').style.display = "block";
          }
        }
        -  -->
    </script>
    <script type="text/javascript">
      <!--   -
        function displayBlockI1()
         {
          if (document.getElementById('CB_Indian').checked)
          { 
            document.getElementById('DIV_Indian').style.display = "none";
            document.getElementById('CB_StatesInIndia').disabled = false;

          }
           else 
          {
            document.getElementById('DIV_Indian').style.display = "block";
            
            document.getElementById('DIV_States').style.display = "none";
            document.getElementById('TB_NonIndianState').style.display = "block";
            
            document.getElementById('CB_StatesInIndia').checked = false;
            document.getElementById('CB_StatesInIndia').disabled = true;

          }
        }
        -  -->
    </script>
    <script type="text/javascript">
      <!--
        function displayBlockReligion()
         {
          if (document.getElementById('CB_Religion_Any').checked)
          {
            document.getElementById('Div_Religion').style.display ="none";
          }
           else 
          {
           document.getElementById('Div_Religion').style.display = "block";
          }
        }
        -->
    </script>
    <script type="text/javascript">
      <!--
        function displayBlockCaste()
         {
          if (document.getElementById('CB_Caste_Any').checked)
          {
            document.getElementById('Div_Caste').style.display ="none";
          }
           else 
          {
           document.getElementById('Div_Caste').style.display = "block";
          }
        }
        -->
    </script>
    <script type="text/javascript">
      <!--
        function displayBlockEducation()
         {
          if (document.getElementById('CB_Education_Any').checked)
          {
            document.getElementById('Div_Education').style.display ="none";
          }
           else 
          {
           document.getElementById('Div_Education').style.display = "block";
          }
        }
        -->
    </script>
    <script type="text/javascript">
      <!--
        function displayBlockCountry()
         {
          if (document.getElementById('CB_Country_Any').checked)
          {
            document.getElementById('Div_Country').style.display ="none";
          }
           else 
          {
           document.getElementById('Div_Country').style.display = "block";
          }
        }
        -->
    </script>
    <script type="text/javascript">
      <!--
        function displayBlockOccupation()
         {
          if (document.getElementById('CB_Occupation_Any').checked)
          {
            document.getElementById('Div_Occupation').style.display ="none";
          }
           else 
          {
           document.getElementById('Div_Occupation').style.display = "block";
          }
        }
        -->
    </script>
    <script type="text/javascript">
      <!--
        function displayBlockEduDet()
         {
          if (document.getElementById('CB_EduDet').checked)
          {
            document.getElementById('Div_EduDet').style.display ="none";
          }
           else 
          {
           document.getElementById('Div_EduDet').style.display = "block";
          }
        }
        -->
    </script>


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
                
                 <table border="0" cellpadding="0" cellspacing="0" width="588px">
                            <tbody>
                                <tr height="28">
                                    <td align="left" colspan="3" style="text-align: center">
                                      <asp:HyperLink ID="HL_Step_1" runat="server" ImageUrl="~/Resources/Step1_inAct.gif">Step 1</asp:HyperLink><asp:HyperLink
                                            ID="HL_Step_2" runat="server" ImageUrl="~/Resources/Step2_inAct.gif">Step 2</asp:HyperLink><asp:HyperLink
                                                ID="HL_Step_3" runat="server" ImageUrl="~/Resources/Step3_inAct.gif">Step 5</asp:HyperLink><asp:HyperLink
                                                    ID="HL_Step_4" runat="server" ImageUrl="~/Resources/Step4_Act.gif" Enabled="False">Step 4 </asp:HyperLink>
                                    </td>
                                </tr>
                </tbody>
                </table>
                    <table border="0" cellpadding="0" cellspacing="0" width="650">
                        <tbody>
                            <tr>
                                <td align="right" class="smalltxt" colspan="3" style="text-align: left">
                                    <asp:Label ID="L_Success" runat="server" Font-Bold="True" ForeColor="#6699FF" Text="Profile Successfuly Updated"
                                        Visible="False"></asp:Label></td>
                            </tr>
                            <%-- table block --%>
                            <tr class="tabpadding">
                                <td class="grtxtbold1" colspan="3" style="border-top: #3399cc thin solid; border-bottom: #3399cc thin solid; height: 13px; text-align: left">
                                    <div align="left">
                                        <strong><span>
                                            <br />
                                            <span style="color: gray">Primary Preference<br />
                                                <br />
                                            </span></span></strong></div>
                                </td>
                            </tr>
                                                        <%-- table block --%>
                            <tr class="tabpadding">
                                <td class="grtxtbold1" rowspan="18" style="width: 174px" >
                                    
                                </td>
                                <td class="grtxtbold1" colspan="2" >
                                    
                                </td>
                            </tr>
                            <%-- table block --%>
                            <tr>
                                <td class="grebg" colspan="2">
                                    <img height="1" src="../../Resources/trans.gif" /></td>
                            </tr>
                            <tr class="tabpadding">
                                <td class="grtxtbold1" style="width: 283px">
                                    <div align="left">
                                        <span style="color: #ff3300"><span class="style4">*</span> </span>Looking For
                                    </div>
                                </td>
                                <td style="width: 482px">
                                    <div align="left">
                                        &nbsp; <span style="color: #ff0000">&nbsp;
                                        </span>
                                        <span style="color: #ff0000">&nbsp;<asp:CheckBoxList ID="LB_MaritalStatus" runat="server"
                                            Height="28px" RepeatColumns="4" Style="font-weight: normal; font-size: 11px;
                                            color: black; font-family: Tahoma" Width="452px">
                                        </asp:CheckBoxList>&nbsp;</span>
                                    </div>
                                </td>
                            </tr>
                            <!-- -->
                            <%-- table block --%>
                            <tr>
                                <td class="grebg" colspan="2">
                                    <img height="1" src="../../Resources/trans.gif" /></td>
                            </tr>
                            <tr class="tabpadding">
                                <td class="grtxtbold1" style="width: 283px">
                                    <div align="left">
                                        <span style="color: #000000"><span style="color: #ff0000">*</span><span >
                                        </span></span>Age
                                    </div>
                                </td>
                                <td style="width: 482px">
                                    <div align="left">
                                        From<strong> &nbsp;</strong><asp:TextBox ID="TB_Age_min" runat="server" CssClass="forminput"
                                            MaxLength="2" Width="24px"></asp:TextBox>
                                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TB_Age_min"
                                            ErrorMessage="*" MaximumValue="90" MinimumValue="18" Type="Integer"></asp:RangeValidator><span
                                                style="color: #000000"><strong> t</strong>o<strong>&nbsp; </strong></span>
                                        <asp:TextBox ID="TB_Age_Max" runat="server" CssClass="forminput" MaxLength="2" Width="24px"></asp:TextBox><span
                                            > </span>
                                        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TB_Age_Max"
                                            ErrorMessage="*" MaximumValue="91" MinimumValue="19" Type="Integer"></asp:RangeValidator></div>
                                </td>
                            </tr>
                            <%-- table block --%>
                            <%-- table block --%>
                            <tr style="color: #000000">
                                <td class="grebg" colspan="2">
                                    <img height="1" src="../../Resources/trans.gif" /></td>
                            </tr>
                            <tr class="tabpadding" style="color: #000000">
                                <td class="grtxtbold1" style="width: 283px">
                                    <div align="left">
                                        &nbsp;&nbsp; Complexion</div>
                                </td>
                                <td style="width: 482px">
                                    <div align="left">
                                        <span ></span><span style="color: #000000">&nbsp; </span>
                                        <div id="Div1" runat="server" style="border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid;
                                            overflow: auto; border-left: #dcdcdc 1px solid; width: 98%; color: #000000; border-bottom: #dcdcdc 1px solid;
                                            height: 81px">
                                            <asp:CheckBoxList ID="LB_Complexion" runat="server" Height="60px" RepeatColumns="3"
                                                Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                Width="382px">
                                            </asp:CheckBoxList></div>
                                    </div>
                                </td>
                            </tr>
                            <%-- table block --%>
                            <%-- table block --%>
                            <tr >
                                <td class="grebg" colspan="2">
                                    <img height="1" src="../../Resources/trans.gif" /></td>
                            </tr>
                            <tr class="tabpadding" >
                                <td class="grtxtbold1" style="width: 283px">
                                    <div align="left">
                                        &nbsp;&nbsp; Have Children</div>
                                </td>
                                <td style="width: 482px">
                                    <div align="left">
                                        <asp:RadioButton ID="RB_ChildrenDM" runat="server" CssClass="forminput" GroupName="Children"
                                            Text="Doesn't matter" /><span style="color: #000000"> </span>
                                        <asp:RadioButton ID="RB_ChildrenNO" runat="server" CssClass="forminput" GroupName="Children"
                                            Text="No" />
                                        <asp:RadioButton ID="RB_ChildrenYesLT" runat="server" CssClass="forminput" GroupName="Children"
                                            Text="Yes.Living Together." /><br />
                                        <asp:RadioButton ID="RB_ChildrenYesNLT" runat="server" CssClass="forminput" GroupName="Children"
                                            Text="Yes.Not Living Together. " /></div>
                                </td>
                            </tr>
                            <%-- table block --%>
                            <%-- table block --%>
                            <tr>
                                <td class="grebg" colspan="2">
                                    <img height="1" src="../../Resources/trans.gif" /></td>
                            </tr>
                            <tr class="tabpadding">
                                <td class="grtxtbold1" style="width: 283px">
                                    <div align="left">
                                        <span >&nbsp;&nbsp; Height</span></div>
                                </td>
                                <td style="width: 482px;">
                                    <div align="left">
                                        <asp:DropDownList ID="DDL_Height_min" runat="server" Width="98px">
                                        </asp:DropDownList>
                                        to
                                        <asp:DropDownList ID="DDL_Height_Max" runat="server" Width="98px">
                                        </asp:DropDownList></div>
                                </td>
                            </tr>
                            <%-- table block --%>
                            <tr>
                                <td class="grebg" colspan="2">
                                    <img height="1" src="../../Resources/trans.gif" /></td>
                            </tr>
                            <tr class="tabpadding">
                                <td class="grtxtbold1" style="width: 283px; text-align: left; height: 20px;">
                                    <strong>&nbsp;&nbsp; </strong>Physical Status</td>
                                <td style="font-weight: bold; width: 482px; height: 20px;">
                                    <div align="left">
                                        <asp:RadioButton ID="RB_phy_nor" runat="server" GroupName="Physical" Text="Normal " Font-Bold="False" />
                                        &nbsp;<asp:RadioButton ID="RB_phy_Dis" runat="server" GroupName="Physical" Text="Disabled" Font-Bold="False" />
                                        <asp:RadioButton ID="RB_phy_DMater" runat="server" GroupName="Physical" Text="Doesn't matter" Font-Bold="False" /></div>
                                </td>
                            </tr>
                            <%-- table block --%>
                            <tr style="font-weight: bold">
                                <td class="grebg" colspan="2">
                                    <img height="1" src="../../Resources/trans.gif" /></td>
                            </tr>
                            <tr class="tabpadding">
                                <td class="grtxtbold1" style="width: 283px">
                                    <div align="left">
                                        <span style="color: #000000"><strong><span style="color: #ff0033">*</span> </strong></span><span >
                                            Mother Tongue</span></div>
                                </td>
                                <td style="width: 482px; color: #ff0000">
                                    <div align="left">
                                        &nbsp;<div id="Div_MT" runat="server" style="border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid;
                                            overflow: auto; border-left: #dcdcdc 1px solid; width: 98%; border-bottom: #dcdcdc 1px solid;
                                            height: 116px">
                                            <asp:CheckBoxList ID="LB_MotherTongue" runat="server" Height="60px" RepeatColumns="3"
                                                Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                Width="382px">
                                            </asp:CheckBoxList></div>
                                    </div>
                                </td>
                            </tr>
                            <%-- table block --%>
                            <tr >
                                <td class="grebg" colspan="2">
                                    <img height="1" src="../../Resources/trans.gif" /></td>
                            </tr>
                            <tr class="tabpadding" >
                                <td class="grtxtbold1" style="width: 283px">
                                    <div align="left">
                                       <span style="color: #ff0000">*</span> 
                                        Expectations</div>
                                </td>
                                <td style="width: 482px">
                                    <div align="left">
                                        <asp:TextBox ID="TB_Expectations" runat="server" CssClass="forminput" Height="112px"
                                            MaxLength="1000" TextMode="MultiLine" Width="382px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_Expectations"
                                            ErrorMessage="*"></asp:RequiredFieldValidator><div style="padding-right: 10px">
                                                <font class="formcommentstxt"><span style="color: #000000">Use this space to talk about your partner preferences. Tell your prospective partner, what you would want see
                                                    in him/her. Tell him/her you, your wants, your aspirations, your dreams and so on.
                                                    &nbsp;&nbsp;<asp:TextBox ID="txtCount" runat="server" BorderColor="#E0E0E0" BorderStyle="None"
                                                        BorderWidth="1px" ForeColor="Red" ReadOnly="True" Width="31px">1000</asp:TextBox></span></font></div>
                                    </div>
                                </td>
                            </tr>
                            <%-- table block --%>
                            <tr style="color: #000000">
                                <td class="grebg" colspan="2" style="height: 1px">
                                    <img height="1" src="../../Resources/trans.gif" /></td>
                            </tr>
                            <%-- table block --%>
                            <tr class="tabpadding">
                                <td class="grtxtbold1" colspan="3" style="text-align: left; height: 13px; border-top: #3399cc thin solid; border-bottom: #3399cc thin solid;">
                                    <strong>
                                        <br />
                                        <span style="color: gray">Socio-Religious Preference<br />
                                            <br />
                                        </span></strong></td>
                            </tr>
                            <tr class="tabpadding">
                                <td class="grtxtbold1" colspan="1" rowspan="9" style="text-align: left">
                                </td>
                                <td class="grtxtbold1" colspan="2" style="text-align: left">
                                </td>
                            </tr>
                            <tr style="color: #a24f11; text-decoration: underline">
                                <td class="grebg" colspan="2" style="height: 1px">
                                    <img height="1" src="../../Resources/trans.gif" /></td>
                            </tr>
                            <%-- table block --%>
                            <tr class="tabpadding">
                                <td class="grtxtbold1" style="width: 283px; text-align: left">
                                    <span style="color: #000000"><span style="color: #ff0000">*</span> </span>Religion</td>
                                <td style="width: 482px; text-align: left">
                                    <asp:CheckBox ID="CB_Religion_Any" runat="server" Checked="True" onclick="displayBlockReligion();"
                                        Text="Any" /><div id="Div_Religion" runat="server" style="border-right: #dcdcdc 1px solid;
                                            border-top: #dcdcdc 1px solid; display: none; overflow: auto; border-left: #dcdcdc 1px solid;
                                            width: 98%; border-bottom: #dcdcdc 1px solid; height: 116px">
                                            <asp:CheckBoxList ID="LB_Religion" runat="server" Height="71px" RepeatColumns="3"
                                                Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                Width="382px">
                                            </asp:CheckBoxList></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="grebg" colspan="2" style="height: 1px">
                                    <img height="1" src="../../Resources/trans.gif" /></td>
                            </tr>
                            <%-- table block --%>
                            <tr class="tabpadding">
                                <td class="grtxtbold1" style="width: 283px; text-align: left">
                                    <span style="color: #ff0000">* </span>Caste / Division</td>
                                <td style="width: 482px; text-align: left">
                                    <asp:CheckBox ID="CB_Caste_Any" runat="server" Checked="True" onclick="displayBlockCaste();"
                                        Text="Any" />&nbsp;<div id="Div_Caste" style="border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid;
                                            display: none; overflow: auto; border-left: #dcdcdc 1px solid; width: 98%; border-bottom: #dcdcdc 1px solid;
                                            height: 118px">
                                            <asp:CheckBoxList ID="LB_Caste" runat="server" Height="71px" RepeatColumns="2" Style="font-weight: normal;
                                                font-size: 11px; color: black; font-family: Tahoma" Width="382px">
                                            </asp:CheckBoxList></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="grebg" colspan="2" style="height: 1px">
                                    <img height="1" src="../../Resources/trans.gif" /></td>
                            </tr>
                            <tr class="tabpadding">
                                <td class="grtxtbold1" style="width: 283px; text-align: left">
                                    &nbsp;&nbsp; Chovva Dosham</td>
                                <td style="width: 482px; text-align: left">
                                    <asp:DropDownList ID="DDL_ChDosham" runat="server" Width="214px">
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td class="grebg" colspan="2" style="height: 1px">
                                    <img height="1" src="../../Resources/trans.gif" /></td>
                            </tr>
                            <tr class="tabpadding">
                                <td class="grtxtbold1" style="width: 283px; text-align: left">
                                    &nbsp;&nbsp; Eating Habits&nbsp;</td>
                                <td class="formtxt" style="width: 482px; text-align: left" valign="top">
                                    <asp:DropDownList ID="DDL_EathingHabits" runat="server" Width="214px">
                                    </asp:DropDownList>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="grebg" colspan="2" style="height: 1px">
                                    <img height="1" src="../../Resources/trans.gif" /></td>
                            </tr>
                            <%-- table block --%>
                            <tr class="tabpadding">
                                <td class="grtxtbold1" colspan="3" style="height: 13px; text-align: left; border-top: #3399cc thin solid; border-bottom: #3399cc thin solid;">
                                    <strong><span style="color: black">
                                        <br />
                                        <span style="color: gray">
                                        Educational Preference<br />
                                        </span>
                                        <br />
                                    </span></strong></td>
                            </tr>
                            <tr class="tabpadding">
                                <td class="grtxtbold1" colspan="1" rowspan="10" style="width: 174px; height: 6px;
                                    text-align: left">
                                </td>
                                <td class="grtxtbold1" colspan="2" style="height: 6px; text-align: left">
                                </td>
                            </tr>
                            
                            <tr>
                                <td class="grebg" colspan="2" style="height: 1px">
                                    <img height="1" src="../../Resources/trans.gif" /></td>
                            </tr>
                            <%-- table block --%>
                            <tr class="tabpadding">
                                <td class="grtxtbold1" style="width: 283px; text-align: left">
                                    <span style="color: #ff0000">* </span>Education</td>
                                <td style="width: 482px; text-align: left">
                                    <asp:CheckBox ID="CB_Education_Any" runat="server" Checked="True" onclick="displayBlockEducation();"
                                        Text="Any" /><div id="DIV_Education" style="border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid;
                                            display: none; overflow: auto; border-left: #dcdcdc 1px solid; width: 98%; border-bottom: #dcdcdc 1px solid;
                                            height: 112px">
                                            <asp:CheckBoxList ID="LB_Education" runat="server" Height="71px" RepeatColumns="1"
                                                Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                Width="382px">
                                            </asp:CheckBoxList></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="grebg" colspan="2" style="height: 1px">
                                    <img height="1" src="../../Resources/trans.gif" /></td>
                            </tr>
                            <tr class="tabpadding">
                                <td class="grtxtbold1" style="width: 283px; text-align: left">
                                    &nbsp;&nbsp; Edu Details
                                </td>
                                <td class="formtxt" style="width: 482px; text-align: left" valign="top">
                                    <asp:CheckBox ID="CB_EduDet" runat="server" Checked="True" onclick="displayBlockEduDet();"
                                        Text="Any" /><div id="Div_EduDet" style="border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid;
                                            display: none; overflow: auto; border-left: #dcdcdc 1px solid; width: 98%; border-bottom: #dcdcdc 1px solid;
                                            height: 113px">
                                            <asp:CheckBoxList ID="LB_Edudetails" runat="server" Height="71px" RepeatColumns="1"
                                                Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                Width="382px">
                                            </asp:CheckBoxList></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="grebg" colspan="2" style="height: 1px">
                                    <img height="1" src="../../Resources/trans.gif" /></td>
                            </tr>
                            <tr class="tabpadding">
                                <td class="grtxtbold1" style="width: 283px; text-align: left">
                                    &nbsp;&nbsp; Annual income
                                </td>
                                <td style="width: 482px; text-align: left">
                                    <asp:DropDownList ID="LB_AnnulIncome" runat="server" Width="241px">
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td class="grebg" colspan="2" style="height: 1px">
                                    <img height="1" src="../../Resources/trans.gif" /></td>
                            </tr>
                            <tr class="tabpadding">
                                <td class="grtxtbold1" style="width: 283px; text-align: left">
                                    &nbsp;&nbsp; Occupation
                                </td>
                                <td class="formtxt" style="width: 482px; text-align: left" valign="top">
                                    <asp:CheckBox ID="CB_Occupation_any" runat="server" Checked="True" onclick="displayBlockOccupation();"
                                        Text="Any" /><div id="DIV_Occupation" style="border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid;
                                            display: none; overflow: auto; border-left: #dcdcdc 1px solid; width: 98%; border-bottom: #dcdcdc 1px solid;
                                            height: 113px">
                                            <asp:CheckBoxList ID="LB_Occupation" runat="server" Height="71px" RepeatColumns="1"
                                                Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                Width="382px">
                                            </asp:CheckBoxList></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="grebg" colspan="2" style="height: 1px">
                                    <img height="1" src="../../Resources/trans.gif" /></td>
                            </tr>
                            <%-- table block --%>
                            <tr class="tabpadding">
                                <td class="grtxtbold1" colspan="3" style="text-align: left; border-top: #3399cc thin solid; border-bottom: #3399cc thin solid; height: 13px;">
                                    <strong><span style="color: black">
                                        <br />
                                        <span style="color: gray">Location Preference<br />
                                            <br />
                                        </span></span></strong></td>
                            </tr>
                            <tr class="tabpadding">
                                <td class="grtxtbold1" colspan="1" rowspan="10" style="width: 174px; text-align: left">
                                </td>
                                <td class="grtxtbold1" colspan="3" style="text-align: left">
                                </td>
                            </tr>
                            <tr>
                                <td class="grebg" colspan="2" style="height: 1px">
                                    <img height="1" src="../../Resources/trans.gif" /></td>
                            </tr>
                            <%-- table block --%>
                            <tr class="tabpadding">
                                <td class="grtxtbold1" style="width: 283px; text-align: left">
                                    <span style="color: #ff0000">* </span>Citizenship</td>
                                <td style="width: 482px; text-align: left">
                                    <asp:CheckBox ID="CB_IndianX" runat="server" Checked="True" onclick="displayBlockI2();" /><asp:Label
                                        ID="L_indianX" runat="server" Text="Only Indian"></asp:Label><div id="DIV_IndianX"
                                            style="border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid; display: none;
                                            overflow: auto; border-left: #dcdcdc 1px solid; width: 98%; border-bottom: #dcdcdc 1px solid;
                                            height: 121px">
                                            <asp:CheckBoxList ID="LB_Citizenship" runat="server" Height="71px" RepeatColumns="2"
                                                Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                                Width="382px">
                                            </asp:CheckBoxList></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="grebg" colspan="2" style="height: 1px">
                                    <img height="1" src="../../Resources/trans.gif" /></td>
                            </tr>
                            <tr class="tabpadding">
                                <td class="grtxtbold1" style="width: 283px; text-align: left">
                                    <span style="color: #ff0000">*</span>&nbsp; Country Living in</td>
                                <td class="formtxt" style="width: 482px; text-align: left" valign="top">
                                    <asp:CheckBox ID="CB_Indian" runat="server" Checked="True" onclick="displayBlockI1();" /><asp:Label
                                        ID="L_Indian" runat="server" Text="Only Indian"></asp:Label>
                                    <div id="DIV_Indian" style="border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid;
                                        display: none; overflow: auto; border-left: #dcdcdc 1px solid; width: 98%; border-bottom: #dcdcdc 1px solid;
                                        height: 114px">
                                        <asp:CheckBoxList ID="LB_CountryLiving" runat="server" Height="71px" RepeatColumns="2"
                                            Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                            Width="382px">
                                        </asp:CheckBoxList></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="grebg" colspan="2" style="height: 1px">
                                    <img height="1" src="../../Resources/trans.gif" /></td>
                            </tr>
                            <tr class="tabpadding">
                                <td class="grtxtbold1" style="width: 283px; text-align: left">
                                    &nbsp;&nbsp; Residing State</td>
                                <td class="formtxt" style="width: 482px; text-align: left" valign="top">
                                    <asp:CheckBox ID="CB_StatesInIndia" runat="server" Checked="True" onclick="displayBlockState();" />
                                    <asp:Label ID="L_ResidingInIndia" runat="server" Text="Residing In India"></asp:Label><br />
                                    <div id="DIV_States" runat="server" style="border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid;
                                        overflow: auto; border-left: #dcdcdc 1px solid; width: 98%; border-bottom: #dcdcdc 1px solid;
                                        height: 118px">
                                        <asp:CheckBoxList ID="LB_Rasident_State" runat="server" Height="71px" RepeatColumns="2"
                                            Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                            Width="370px">
                                        </asp:CheckBoxList></div>
                                    <asp:TextBox ID="TB_NonIndianState" runat="server" CssClass="forminput" Style="display: none"
                                        Width="209px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="grebg" colspan="2" style="height: 1px">
                                    <img height="1" src="../../Resources/trans.gif" /></td>
                            </tr>
                            <tr class="tabpadding">
                                <td class="grtxtbold1" style="width: 283px; text-align: left">
                                    &nbsp;&nbsp; Resident Status</td>
                                <td class="formtxt" style="width: 482px; text-align: left" valign="top">
                                    <br />
                                    <div id="Div2" runat="server" style="border-right: #dcdcdc 1px solid; border-top: #dcdcdc 1px solid;
                                        overflow: auto; border-left: #dcdcdc 1px solid; width: 98%; border-bottom: #dcdcdc 1px solid;
                                        height: 83px">
                                        <asp:CheckBoxList ID="LB_Rasident_Status" runat="server" Height="60px" RepeatColumns="3"
                                            Style="font-weight: normal; font-size: 11px; color: black; font-family: Tahoma"
                                            Width="382px">
                                        </asp:CheckBoxList></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="grebg" colspan="2" style="height: 1px">
                                    <img height="1" src="../../Resources/trans.gif" /></td>
                            </tr>
                            <tr class="tabpadding">
                                <td class="grtxtbold1" colspan="3">
                                    &nbsp;&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="grebg" colspan="2" style="height: 1px">
                                    <img height="1" src="../../Resources/trans.gif" /></td>
                            </tr>
                            <%-- table block --%>
                            <tr class="tabpadding">
                                <td colspan="3" height="7" style="border-top: #3399cc thin solid; border-bottom: #3399cc thin solid; height: 13px; text-align: left">
                                    <div align="center">
                                        <div align="center">
                                            <asp:ImageButton ID="IB_Submit" runat="server" ImageUrl="~/Resources/button-Save.gif" />
                                            &nbsp;
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

