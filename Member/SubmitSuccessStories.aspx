<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SubmitSuccessStories.aspx.cs" Inherits="Member_SubmitSuccessStories" %>

<%@ Register Src="../WeBControls/SuccessPannel.ascx" TagName="SuccessPannel" TagPrefix="uc1" %>

<%@ Register Src="../WeBControls/MemberLeftPanel.ascx" TagName="MemberLeftPanel"
    TagPrefix="uc1" %>

<%@ Register Src="../WeBControls/Footer_M.ascx" TagName="Footer_M" TagPrefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Submit Sucess Story</title>
    <link href="../Resources/style.css" rel="stylesheet" type="text/css" />
    
   <script type="text/javascript" language="JavaScript">

    function updateDay(change,formName,yearName,monthName,dayName)
    {	
    	
	    var form = document.forms[formName];
	    var yearSelect = form[yearName];
	    var monthSelect = form[monthName];
	    var daySelect = form[dayName];
	    var year = yearSelect[yearSelect.selectedIndex].value;
	    var month = monthSelect[monthSelect.selectedIndex].value;
	    var day = daySelect[daySelect.selectedIndex].value;

	    if (change == 'month' || (change == 'year' && month == 2))
	    {
		    var i = 31;
		    var flag = true;
		    while(flag)
		    {
			    var date = new Date(year,month-1,i);
			    if (date.getMonth() == month - 1)
			    {
				    flag = false;
			    }
			    else
			    {
				    i = i - 1;
			    }
		    }

		    daySelect.length = 0;
		    daySelect.length = i;
		    var j = 0;
		    while(j < i)
		    {
			    daySelect[j] = new Option(j+1,j+1);
			    j = j + 1;
		    }
		    if (day <= i)
		    {
			    daySelect.selectedIndex = day - 1;
		    }
		    else
		    {
			    daySelect.selectedIndex = daySelect.length - 1;
		    }
	    }
    }

</script>


    <script type="text/javascript" language="JavaScript">
      <%--
        function displayBlock() {
          if (document.getElementById('CB_Del_acc').checked) {
            document.getElementById('IB_Delete').disabled = false;
          } else {
            document.getElementById('IB_Delete').disabled = true;
          }
        }
        --%>
      </script>
    
    <link href="../Resources/style.css" rel="stylesheet" type="text/css" />
    <link href="../Resources/style.css" rel="stylesheet" type="text/css" />
    
    
</head>
<body class="body" bgcolor="#cccccc">
<div align="center">
<table class="BlueTborder" align="center" border="0" cellpadding="0" cellspacing="0" width="780">
          <%--DWLayoutTable--%>
          <tbody>               
                    <tr>
                        <td bgcolor="#ffffff" height="76" style="text-align: left">
                            <img border="0" src="../Resources/logo.gif" />
                        </td>
                    </tr>
        
          <tr>
            <td colspan="2" style="height: 31px">		<%-- MEMBER LOGGED IN --%>
		<img src="../Resources/logintopmenu.jpg" usemap="#Map2" border="0" height="29" width="780">
		<%--------MyProfile Map will be added last-------%>
		<map name="Map2" id="Map2">
		<area shape="rect" coords="0,1,128,26"href="../Member/Profile.aspx"alt="My Matri">
		<area shape="rect" coords="134,1,262,26" href="../Member/membersearchoption.aspx" alt="My Search">
		<area shape="rect" coords="287,2,427,27" href="Interests.aspx" alt="My Interest">
		<area shape="rect" coords="448,2,538,25" href="Messages.aspx" alt="My Message">
		<area shape="rect" coords="567,2,678,25" href="membership.aspx" alt="My Membership">
		<area shape="rect" coords="696,4,763,24" href="logout.aspx" alt="Logout">
		
		</map>

</td>
          </tr>
          <tr bgcolor="#ffffff">
            <td colspan="2" valign="top">
			  

  
<%-- START LEFT PART --%>  
<div align="center">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tbody><tr>
<td bgcolor="#ffefed" height="303" valign="top" style="width: 180px">
    &nbsp;<br />
    <br />
    <uc1:MemberLeftPanel ID="MemberLeftPanel1" runat="server" />
    <br />
    <br />
    <br />
    <br />

<%-- ''''''''''''''NORMAL ''''''''''''''' --%>
</td>
<td valign="top"><br>
<form id="MatriForm"  runat="server" name="MatriForm">
  <asp:Panel ID="PN_SubMit" runat="server" Height="100%" Width="100%" Wrap="False">

        <table align="center" border="0" cellpadding="0" cellspacing="0" height="20" width="97%">
            <tbody>
                <tr>
                    <td background="../Resources/heading_bg.gif" width="37%">
                        <div align="left">
                            &nbsp; <span class="bodysg"><span class="bodysg">Submit Sucess Story</span></span></div>
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
                    <td>
                        
                            <table align="center" border="0" cellpadding="2" cellspacing="2" width="97%" style="height: 424px">
                                <tbody>
                                    <tr>
                                        <td colspan="2" style="height: 17px; text-align: left">
                                            <strong>caption </strong> </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 256px">
                                            &nbsp;</td>
                                        <td width="73%">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 256px; text-align: left;">
                                            <span style="color: #ff0000">
                                            <span class="style1">&nbsp; &nbsp;&nbsp; *</span> </span>Matrimony ID</td>
                                        <td style="text-align: left">
                                            <asp:Label ID="L_MatID" runat="server" CssClass="forminput" Text="MatID" Width="210px" Font-Bold="True"></asp:Label></td>
                                    </tr>                                   
                                     <tr>
                                        <td style="width: 256px; text-align: left;">
                                            <span class="style1" style="color: #ff0000">&nbsp; &nbsp;&nbsp; *</span> Name Of Bride&nbsp;</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="TB_Bride" runat="server" CssClass="forminput" MaxLength="50" Width="207px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TB_Bride"
                                                ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                    </tr>                                   
                                     <tr>
                                        <td style="width: 256px; text-align: left;">
                                            <span class="style1" style="color: #ff0000">&nbsp; &nbsp;&nbsp; *</span> Name Of Groom &nbsp;
                                        </td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="TB_Groom" runat="server" CssClass="forminput" MaxLength="50" Width="207px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TB_Groom"
                                                ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                    </tr>                                   
                                     <tr>
                                        <td style="width: 256px; text-align: left;">
                                            <span class="style1" style="color: #ff0000">&nbsp; &nbsp;&nbsp; *</span> Date Of Marriage&nbsp;</td>
                                        <td style="text-align: left">
                                            <asp:DropDownList ID="DDL_dobMonth" runat="server" CssClass="forminput" name="DDL_dobMonth" onchange="updateDay('month','MatriForm','DDL_dobYear','DDL_dobMonth','DDL_dobDay');">
                                                <asp:ListItem Selected="True">-Month-</asp:ListItem>
                                                <asp:ListItem Value="1">January</asp:ListItem>
                                                <asp:ListItem Value="2">February</asp:ListItem>
                                                <asp:ListItem Value="3">March</asp:ListItem>
                                                <asp:ListItem Value="4">April</asp:ListItem>
                                                <asp:ListItem Value="5">May</asp:ListItem>
                                                <asp:ListItem Value="6">June</asp:ListItem>
                                                <asp:ListItem Value="7">July</asp:ListItem>
                                                <asp:ListItem Value="8">August</asp:ListItem>
                                                <asp:ListItem Value="9">September</asp:ListItem>
                                                <asp:ListItem Value="10">October</asp:ListItem>
                                                <asp:ListItem Value="11">November</asp:ListItem>
                                                <asp:ListItem Value="12">December</asp:ListItem>
                                            </asp:DropDownList>&nbsp;
                                            
                                            <asp:DropDownList ID="DDL_dobDay" runat="server" class="forminput" name="DDL_dobDay">
                                                <asp:ListItem Selected="true" Value="">-Date-</asp:ListItem>
                                                <asp:ListItem Value="1">1</asp:ListItem>
                                                <asp:ListItem Value="2">2</asp:ListItem>
                                                <asp:ListItem Value="3">3</asp:ListItem>
                                                <asp:ListItem Value="4">4</asp:ListItem>
                                                <asp:ListItem Value="5">5</asp:ListItem>
                                                <asp:ListItem Value="6">6</asp:ListItem>
                                                <asp:ListItem Value="7">7</asp:ListItem>
                                                <asp:ListItem Value="8">8</asp:ListItem>
                                                <asp:ListItem Value="9">9</asp:ListItem>
                                                <asp:ListItem Value="10">10</asp:ListItem>
                                                <asp:ListItem Value="11">11</asp:ListItem>
                                                <asp:ListItem Value="12">12</asp:ListItem>
                                                <asp:ListItem Value="13">13</asp:ListItem>
                                                <asp:ListItem Value="14">14</asp:ListItem>
                                                <asp:ListItem Value="15">15</asp:ListItem>
                                                <asp:ListItem Value="16">16</asp:ListItem>
                                                <asp:ListItem Value="17">17</asp:ListItem>
                                                <asp:ListItem Value="18">18</asp:ListItem>
                                                <asp:ListItem Value="19">19</asp:ListItem>
                                                <asp:ListItem Value="20">20</asp:ListItem>
                                                <asp:ListItem Value="21">21</asp:ListItem>
                                                <asp:ListItem Value="22">22</asp:ListItem>
                                                <asp:ListItem Value="23">23</asp:ListItem>
                                                <asp:ListItem Value="24">24</asp:ListItem>
                                                <asp:ListItem Value="25">25</asp:ListItem>
                                                <asp:ListItem Value="26">26</asp:ListItem>
                                                <asp:ListItem Value="27">27</asp:ListItem>
                                                <asp:ListItem Value="28">28</asp:ListItem>
                                                <asp:ListItem Value="29">29</asp:ListItem>
                                                <asp:ListItem Value="30">30</asp:ListItem>
                                                <asp:ListItem Value="31">31</asp:ListItem>
                                                </asp:DropDownList>
                                            &nbsp;
                                            
                                            <asp:DropDownList ID="DDL_dobYear" runat="server" class="forminput" name="DDL_dobYear" onchange="updateDay('year','MatriForm','DDL_dobYear','DDL_dobMonth','DDL_dobDay');">
                                                <asp:ListItem Selected="True" Value="">-Year-</asp:ListItem>
                                            </asp:DropDownList>
                                            
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DDL_dobYear"
                                                ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                    </tr>
                                     <tr>
                                        <td style="width: 256px; text-align: left;">
                                            <span class="style1" style="color: #ff0000">&nbsp; &nbsp;&nbsp; *</span> Success Story &nbsp;</td>
                                        <td style="text-align: left">
                                            <asp:TextBox ID="TB_SucessStory" runat="server" CssClass="forminput" Height="164px" MaxLength="1000" TextMode="MultiLine" Width="405px"></asp:TextBox><br />
                                            <asp:TextBox ID="txtCount" runat="server" BorderColor="#E0E0E0" BorderStyle="None"
                                                BorderWidth="1px" ForeColor="Red" ReadOnly="True" Width="31px">1000</asp:TextBox>
                                            <span class="style1">You could enter details about you or a bried description your sucess
                                                story.(<span style="color: #ff0000"><span class="style2">Min 50</span> chas and </span>
                                                <span class="style2"><span style="color: #ff0000">Max 1000 chars</span>)</span>.<asp:RequiredFieldValidator
                                                    ID="RequiredFieldValidator5" runat="server" ControlToValidate="TB_SucessStory"
                                                    ErrorMessage="*"></asp:RequiredFieldValidator></span></td>
                                    </tr>
                                     <tr>
                                        <td style="width: 256px; text-align: left;">
                                            <span class="style1" style="color: #ff0000">&nbsp; &nbsp;&nbsp; *</span> Wedding Photo &nbsp;&nbsp;</td>
                                        <td style="text-align: left">
                                            <input id="File_Image" runat="server" class="forminput" type="file" style="width: 281px" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="File_Image"
                                                ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                    </tr>

                                    <tr>
                                        <td colspan="2"></td>
                                    </tr>
                                         <tr>
                                        <td style="width: 256px">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            <asp:ImageButton ID="IMB_Save" runat="server" ImageUrl="~/Resources/button-Save.gif" OnClick="IMB_Save_Click" /></td>
                                    </tr>
                                </tbody>
                            </table>
                                
                        
                    </td>
                </tr>
            </tbody>
        </table>
        
    </asp:Panel>
    <asp:Panel ID="PN_SStory" runat="server" Height="100%" Width="100%" Visible="False">
    <table align="center" border="0" cellpadding="0" cellspacing="0" height="20" width="96.5%">
        <tbody>
            <tr>
                <td background="../Resources/heading_bg.gif" width="37%">
                    <div align="left">
                        &nbsp; <span class="bodysg"><span class="bodysg">Manage SuccessStory</span></span></div>
                </td>
                <td width="63%">
                    &nbsp;</td>
            </tr>
        </tbody>
    </table>
          <table align="center" border="0" cellpadding="0" cellspacing="0" class="submenubox" width="96.5%">
            <tbody>
                <tr>
                    <td style="text-align: center; border-right: #ffffff 1px solid; border-top: #ffffff 1px solid; border-left: #ffffff 1px solid; border-bottom: #ffffff 1px solid;" valign ="middle">
                    <uc1:SuccessPannel ID="SuccessPannel1" runat="server" />
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: center" valign ="top">
                        <asp:CheckBox ID="CB_Del_acc" runat="server" onclick="displayBlock();" />Yes I Need
                        To delete My SuccessStory&nbsp;<asp:Button
                            ID="IB_Delete" runat="server" Enabled="False" Text="Delete" Width="63px" OnClick="IB_Delete_Click" /></td>
                </tr>
            </tbody>
          </table>
            
      </asp:Panel>
        <asp:HiddenField ID="HF_SSID" runat="server" />
  </form>

</td>
</tr>
</tbody></table>

</div>
<%-- END LEFT PART --%>	


		  
		    </td>
    </tr>
			
          <tr>
            <td style="height: 105px">
                <uc3:Footer_M ID="Footer_M1" runat="server" />
</td>
          </tr>
          <tr>
          
    </tr>
          <tr>
         
          </tr>
  </tbody></table>
  
</div>




</body>
</html>

