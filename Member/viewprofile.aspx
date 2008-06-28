<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewprofile.aspx.cs" Inherits="viewprofile" %>

<%@ Register Src="../WeBControls/MemberLeftPanel.ascx" TagName="MemberLeftPanel"
    TagPrefix="uc2" %>

<%@ Register Src="../WeBControls/Footer_M.ascx" TagName="Footer_M" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Profile</title>
<link href="../Resources/style.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">
<!--
	function displayDiv1() {
            document.getElementById('Layer1').style.visibility = 'visible';
            document.getElementById('Layer2').style.visibility = 'hidden';
            document.getElementById('Layer3').style.visibility = "hidden";
            document.getElementById('Layer4').style.visibility = "hidden";
            document.getElementById('Layer5').style.visibility = "hidden";
	}
	function displayDiv2() {
            document.getElementById('Layer1').style.visibility = "hidden";
            document.getElementById('Layer2').style.visibility = "visible";
            document.getElementById('Layer3').style.visibility = "hidden";
            document.getElementById('Layer4').style.visibility = "hidden";
            document.getElementById('Layer5').style.visibility = "hidden";
	}
	function displayDiv3() {
            document.getElementById('Layer1').style.visibility = "hidden";
            document.getElementById('Layer2').style.visibility = "hidden";
            document.getElementById('Layer3').style.visibility = "visible";
            document.getElementById('Layer4').style.visibility = "hidden";
            document.getElementById('Layer5').style.visibility = "hidden";
	}
	function displayDiv4() {
            document.getElementById('Layer1').style.visibility = "hidden";
            document.getElementById('Layer2').style.visibility = "hidden";
            document.getElementById('Layer3').style.visibility = "hidden";
            document.getElementById('Layer4').style.visibility = "visible";
            document.getElementById('Layer5').style.visibility = "hidden";
	}
	function displayDiv5() {
            document.getElementById('Layer1').style.visibility = "hidden";
            document.getElementById('Layer2').style.visibility = "hidden";
            document.getElementById('Layer3').style.visibility = "hidden";
            document.getElementById('Layer4').style.visibility = "hidden";
            document.getElementById('Layer5').style.visibility = "visible";
	}
	function HideAll() {
            document.getElementById('Layer1').style.visibility = "hidden";
            document.getElementById('Layer2').style.visibility = "hidden";
            document.getElementById('Layer3').style.visibility = "hidden";
            document.getElementById('Layer4').style.visibility = "hidden";
            document.getElementById('Layer5').style.visibility  = "hidden";
    }
//-->
</script>


    <link href="../Resources/style.css" rel="stylesheet" type="text/css" />
    <link href="../Resources/style.css" rel="stylesheet" type="text/css" />
    <link href="../Resources/style.css" rel="stylesheet" type="text/css" />
    <link href="../Resources/style.css" rel="stylesheet" type="text/css" />

</head>
<body class="body" bgcolor="#cccccc">

<%--Express Intrest--%>
<div id="Layer1"  style="visibility: hidden; position: absolute; left: 220px; top: 341px; width: 600px;  z-index: 1;">
	
	
	<table border="1" bordercolor="#b30044" cellpadding="0" cellspacing="0" height="100%" width="100%">
		<tbody><tr>
			<td align="center" bgcolor="maroon" style="text-align: right">
                <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="../Resources/srch-close-icon.gif" onclick="HideAll();"></asp:HyperLink>
                </td>
                </tr>
                <tr>
                <td align="center" bgcolor="#ffffff">
                       <center> <%Response.Write(IntrestFrame()); %></center>
                        
                </td>
		</tr>
	</tbody></table>

</div>
<%--Send Message--%>
<div id="Layer2"  style="visibility: hidden; position: absolute; left: 220px; top: 341px; width: 600px;  z-index: 1;">
	<table border="1" bordercolor="#b30044" cellpadding="0" cellspacing="0" height="100%" width="100%">
		<tbody><tr>
			<td align="center" bgcolor="maroon" style="text-align: right; height: 10px;">
                <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="../Resources/srch-close-icon.gif" onclick="HideAll();"></asp:HyperLink>
                </td>
                </tr>
                <tr>
                <td align="center" bgcolor="#ffffff">
                       <center> <%Response.Write(MessageFrame()); %></center>
                </td>
		</tr>
	</tbody></table>
</div>
<%--Photo Password--%>
<div id="Layer3"  style="visibility: hidden; position: absolute; left: 373px; top: 342px; width: 446px;  z-index: 1;">
	<table border="1" bordercolor="#b30044" cellpadding="0" cellspacing="0" height="100%" width="100%">
		<tbody><tr>
			<td align="center" bgcolor="maroon" style="text-align: right; height: 10px;">
                <asp:HyperLink ID="HyperLink3" runat="server" ImageUrl="../Resources/srch-close-icon.gif" onclick="HideAll();"></asp:HyperLink>
                </td>
                </tr>
                <tr>
                <td align="center" bgcolor="#ffffff">
                  <center><%Response.Write(PhotoFrame()); %></center>
                </td>
		</tr>
	</tbody>
 </table>

</div>
<%--Horo PAssword--%>
<div id="Layer4"  style="visibility: hidden; position: absolute; left: 372px; top: 344px; width: 445px; z-index: 1;">
	
	
	<table border="1" bordercolor="#b30044" cellpadding="0" cellspacing="0" height="100%" width="100%">
		<tbody><tr>
			<td align="center" bgcolor="maroon" style="text-align: right; height: 10px;">
                <asp:HyperLink ID="HyperLink4" runat="server" ImageUrl="../Resources/srch-close-icon.gif" onclick="HideAll();"></asp:HyperLink>
                </td>
                </tr>
                <tr>
                <td align="center" bgcolor="#ffffff">
                    <center> <%Response.Write(HoroFrame()); %></center>
                </td>
		    </tr>
	    </tbody>
	</table>
</div>
<%--Report abuse--%>
<div id="Layer5"  style="visibility: hidden; position: absolute; left: 221px; top: 343px; width: 599px; z-index: 1;">
	<table border="1" bordercolor="#b30044" cellpadding="0" cellspacing="0" height="100%" width="100%">
		<tbody>
		    <tr>
			    <td align="center" bgcolor="maroon" style="text-align: right; height: 10px;">
                    <asp:HyperLink ID="HyperLink5" runat="server" ImageUrl="../Resources/srch-close-icon.gif" onclick="HideAll();"></asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#ffffff">
                <center>
                        <%Response.Write(AbuseFrame()); %>
                        </center>
                </td>
		    </tr>
	    </tbody>
	</table>
</div>
<%--Main BDivision--%>
<div align="center">
<table class="BlueTborder" align="center" border="0" cellpadding="0" cellspacing="0" width="780">
          <tbody>               
                    <tr>
                        <td bgcolor="#ffffff" height="76" style="text-align: left">
                            <img border="0" src="../Resources/logo.gif" />
                        </td>
                    </tr>
        
          <tr>
            <td colspan="2">		<%-- MEMBER LOGGED IN--%>
		<img src="../Resources/logintopmenu.jpg" usemap="#Map2" border="0" height="29" width="780">
		<!--MyProfile Map will be added last-->
		<map name="Map2" id="Map2">
		<area shape="rect" coords="0,1,128,26"href="../Member/Profile.aspx"alt="My Matri">
		<area shape="rect" coords="134,1,262,26" href="../Member/memberSearchOption.aspx" alt="My Search">
		<area shape="rect" coords="287,2,427,27" href="../Member/Interests.aspx" alt="My Interest">
		<area shape="rect" coords="448,2,538,25" href="../Member/Messages.aspx" alt="My Message">
		<area shape="rect" coords="567,2,678,25" href="../Member/Membership.aspx" alt="My Membership">
		<area shape="rect" coords="696,4,763,24" href="../Member/logout.aspx" alt="Logout">
		
		</map>

</td>
          </tr>
          <tr bgcolor="#ffffff">
            <td colspan="2" >
			  

  
<!-- START LEFT PART -->  
<div align="center">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tbody><tr>
<td bgcolor="#ffefed"  height="303"  width="180" valign ="top"><div>
    &nbsp;<br />
    <br />
    <uc2:MemberLeftPanel ID="MemberLeftPanel1" runat="server" />
</div>

<!-- ''''''''''''''NORMAL ''''''''''''''' -->
</td>
<td >
    <br />
    <br>
   <table align="center" border="0" cellpadding="0" cellspacing="0" width="97%">
  <tbody><tr>
    <td><table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
            <tr>
                <td style="height: 237px">
                    <fieldset class="fieldset">
                        <legend class="bluetext"><strong><span style="color: #7e7d7d">&nbsp;Profile Informations</span></strong></legend>
                        <table border="0" cellspacing="0" width="100%">
                            <tbody>
                                <tr>
                                    <td style="width: 150px">
                                        <table align="center" border="0" class="submenubox" height="150" id="photo" width="150">
                                            <tbody>
                                                <tr>
                                                    <td >
                                                        <asp:HyperLink ID="HL_Photo" runat="server" ImageUrl="~/Resources/nophoto.gif" NavigateUrl="#"></asp:HyperLink></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td  width="409">
                                        <br />
                                        <table id="TABLE1" border="0" cellpadding="2" cellspacing="4" width="98%">
                                            <tbody>
                                                <tr>
                                                    <td style="width: 1px; height: 17px">
                                                    </td>
                                                    <td style="width: 222px; height: 17px; text-align: left">
                                                        <img id="Img_Name" name="Img_Name" height="7" src="../Resources/arrow-grn-4x7.gif" width="4" runat ="server" visible="false"/>
                                                        <asp:Label ID="L_L_Name" runat="server" Text="Name :" Visible="False"></asp:Label>&nbsp; <strong>
                                                            <asp:Label ID="L_Name" runat="server" Height="12px" Width="157px"></asp:Label>
                                                        </strong>
                                                    </td>
                                                    <td style="width: 164px; height: 17px; text-align: left"><img height="7" src="../Resources/arrow-grn-4x7.gif" width="4" />&nbsp;
                                                        <asp:HyperLink ID="HL_Abuse" runat="server" Enabled="False">Report Abuse</asp:HyperLink><a href="#" onclick="window.open('bookmark.aspx','terms','scrollbars=yes,width=500')"></a></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 1px; height: 16px">
                                                    </td>
                                                    <td style="width: 222px; height: 16px; text-align: left">
                                                        <img height="7" src="../Resources/arrow-grn-4x7.gif" width="4" />
                                                        Matri ID: <span class="style6"><strong>
                                                            <asp:Label ID="L_MID" runat="server" Height="12px" Width="149px"></asp:Label></strong></span></td>
                                                    <td style="width: 164px; height: 16px; text-align: left"><img height="7" src="../Resources/arrow-grn-4x7.gif" width="4" />&nbsp;
                                                        <asp:HyperLink ID="HL_Exp_Int" runat="server" Enabled="False" >Express Intrest</asp:HyperLink></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 1px; height: 15px">
                                                    </td>
                                                    <td style="width: 222px; height: 15px; text-align: left">
                                                        <img height="7" src="../Resources/arrow-grn-4x7.gif" width="4" />
                                                        <asp:Label ID="L_Sex" runat="server" Font-Bold="True" Height="12px" Width="37px"></asp:Label>
                                                        <strong>-</strong>
                                                        <asp:Label ID="L_MS" runat="server" Height="12px" Width="141px" Font-Bold="True"></asp:Label></td>
                                                    <td style="width: 164px; height: 15px; text-align: left">
                                                        <img height="7" src="../Resources/arrow-grn-4x7.gif" width="4" />&nbsp;
                                                        <asp:HyperLink ID="HL_SendMessage" runat="server" Enabled="False">SendMessage</asp:HyperLink><a href="#" onclick= "window.open('../Extras/terms_con.aspx','terms','scrollbars=yes,width=500')"></a></td>
                                                </tr>
                                                
                                                <tr>
                                                <td style="width: 1px">
                                                </td>
                                                <td style="width: 222px; text-align: left"><img height="7" src="../Resources/arrow-grn-4x7.gif" width="4" />
                                                    Location: <span class="style6"><strong>
                                                        <asp:Label ID="L_Location" runat="server" Height="12px" Width="149px"></asp:Label></strong></span></td>
                                                <td style="text-align: left"><img height="7" src="../Resources/arrow-grn-4x7.gif" width="4" />&nbsp;
                                                    <asp:HyperLink ID="HL_RequestPassword_P" runat="server" Enabled="False">Request Photo Password</asp:HyperLink></td>
                                                </tr>
                                                
                                                <tr>
                                                <td style="width: 1px">
                                                </td>
                                                <td style="width: 222px; text-align: left">
                                                        <img height="7" src="../Resources/arrow-grn-4x7.gif" width="4" />
                                                        Created by: <span class="Partext1">
                                                            <asp:Label ID="L_Created_by" runat="server" Height="12px" Width="133px" Font-Bold="True"></asp:Label>
                                                        </span>
                                                    </td>
                                                <td style="text-align: left"><img height="7" src="../Resources/arrow-grn-4x7.gif" width="4" />&nbsp;
                                                    <asp:HyperLink ID="HL_RequestPassword_H" runat="server" Enabled="False">Request Horo Password</asp:HyperLink></td>
                                                </tr>
                                                
                                                <tr>
                                                <td style="width: 1px">
                                                </td>
                                                <td style="width: 222px; text-align: left"><img height="7" src="../Resources/arrow-grn-4x7.gif" width="4" />
                                                        Last Login : <span class="Partext1">
                                                            <asp:Label ID="L_LogIn_last" runat="server" Height="12px" Width="137px" Font-Bold="True"></asp:Label>
                                                        </span>
                                                    </td>
                                                <td style="text-align: left">&nbsp;
                                                <%Response.Write(IFrame()); %>
                                                    </td>
                                                </tr>
                                                <tr><td colspan="3">
                                                    <asp:HyperLink ID="HL_Album" runat="server" ImageUrl="~/Resources/viewAlbum.gif"
                                                        NavigateUrl="#" Visible="False">View Album</asp:HyperLink>
                                                    <asp:HyperLink ID="HL_HoroScope" runat="server" ImageUrl="~/Resources/horoscope.gif"
                                                        NavigateUrl="#" Visible="False">Horoscope</asp:HyperLink>
                                                    <asp:HyperLink ID="HL_Print" runat="server" ImageUrl="~/Resources/printProfile.gif">PrintProfile</asp:HyperLink></td></tr>
                                                
                                                
                                            </tbody>
                                        </table>
                                        <!-- only paid members -->
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </fieldset>
                </td>
            </tr>
        </tbody>
    </table>
    <table>
    <tr>
    <td style="width: 20px">
        &nbsp; &nbsp;&nbsp;
    </td>
    <td style="width: 575px; text-align: left;">
        <table border="0" cellpadding="0" cellspacing="0" class="RedBox" style="width: 571px">
            <tbody>
                <tr class="viewrowbg">
                    <td class="normaltxt1" colspan="4" style="padding-right: 1px; padding-left: 5px;
                        padding-bottom: 5px; color: rgb(123,76,36); padding-top: 5px"  bgcolor="#ffe6ff">
                        <div style="float: left">
                            <b>Primary Information</b>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="ccoText" style="height: 21px">
                        Name:</td>
                    <td class="ccoTextX" style="height: 21px">
                        <asp:Label ID="L_MemberName" runat="server" CssClass="normaltxt1"></asp:Label></td>
                    <td class="normaltxt1" style="padding-left: 10px; padding-bottom: 3px; padding-top: 5px; text-align: left; height: 21px;"
                         width="130">
                        Age:</td>
                    <td class="ccoTextX" style="height: 21px"
                        >
                        <asp:Label ID="L_Age" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td class="eccoText"
                        >
                        Height:</td>
                    <td class="eccoTextX" style="TEXT-ALIGN: left"
                        >
                        <asp:Label ID="L_Height" runat="server" CssClass="normaltxt1"></asp:Label></td>
                    <td class="eccoText"
                        >
                        Weight:</td>
                    <td class="eccoTextX"
                        >
                        <asp:Label ID="L_Weight" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td class="ccoText"
                        >
                        Body Type:</td>
                    <td class="ccoTextX"
                        >
                        <asp:Label ID="L_BodyType" runat="server" CssClass="normaltxt1"></asp:Label></td>
                    <td class="normaltxt1" style="padding-left: 10px; padding-bottom: 3px; padding-top: 5px; text-align: left;"
                        >
                        Complexion:</td>
                    <td class="ccoTextX"
                        >
                        <asp:Label ID="L_Complexion" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td class="eccoText"
                        >
                        Blood Group :</td>
                    <td class="eccoTextX"
                        >
                        <asp:Label ID="L_BloodGroup" runat="server" CssClass="normaltxt1"></asp:Label></td>
                    <td class="eccoText"
                         width="110">
                        Mother Tongue:</td>
                    <td class="eccoTextX"
                        >
                        <asp:Label ID="L_MTongue" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td class="ccoText"
                        >
                        Physical Status:</td>
                    <td class="normaltxt1" colspan="4" style="padding-left: 0px; padding-bottom: 3px;
                        padding-top: 5px; text-align: left;"  width="200">
                        <asp:Label ID="L_PhyStatus" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
            </tbody>
        </table>
        </td>
    
    </tr>
    <tr><td colspan="2"></td></tr>
     <tr>
    <td style="width: 20px">
        &nbsp; &nbsp;
    </td>
    <td style="width: 575px; text-align: left;">
        <table border="0" cellpadding="0" cellspacing="0" class="RedBox" style="width: 571px">
            <tbody>
                <tr class="viewrowbg">
                    <td class="normaltxt1" colspan="4" style="padding-right: 1px; padding-left: 5px;
                        padding-bottom: 5px; color: rgb(123,76,36); padding-top: 5px"  bgcolor="#ffe6ff">
                        <div style="float: left">
                            <b>Socio-Religious Background</b>
                        </div>
                    </td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td class="ccoText">
                        Religion:</td>
                    <td class="ccoTextX" colspan="3" >
                        <asp:Label ID="L_Religion" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td class="eccoText"  >
                        Caste :</td>
                    <td class="eccoTextX"
                        >
                        <asp:Label ID="L_Cast" runat="server" CssClass="normaltxt1"></asp:Label></td>
                    <td class="eccoText" width="130">
                        Sub Caste:</td>
                    <td class="eccoTextX"
                        >
                        <asp:Label ID="L_Subcast" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td class="ccoText" 
                        >
                        Star :</td>
                    <td class="ccoTextX" >
                        <asp:Label ID="L_Star" runat="server" CssClass="normaltxt1"></asp:Label></td>
                    <td class="ccotext" style="padding-left: 10px; padding-bottom: 3px; padding-top: 5px; text-align: left;"
                        >
                        Raasi :</td>
                    <td class="ccoTextX" >
                        <asp:Label ID="L_MoonSign" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td class="eccoText" >
                        Horoscope Match :</td>
                    <td class="eccoTextX"
                        >
                        <asp:Label ID="L_HoroScope" runat="server" CssClass="normaltxt1"></asp:Label></td>
                    <td class="eccoText" >
                        Manglik :</td>
                    <td class="eccoTextX">
                        <asp:Label ID="L_CHova" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
                
                <tr bgcolor="#ffffff">
                    <td class="ccoText" >
                        Smoking habits :</td>
                    <td class="ccoTextX" >
                        <asp:Label ID="L_SHab" runat="server" CssClass="normaltxt1"></asp:Label></td>
                    <td class="ccotext" > Drinking habits :</td>
                    <td class="ccoTextX" >
                        
                            <asp:Label ID="L_DHa" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td class="eccoText"  >
                        Eating Habits :</td>
                    <td class="eccoTextX">
                        <asp:Label ID="L_EHab" runat="server" CssClass="normaltxt1"></asp:Label></td>
                    <td class="eccoText" 
                         width="120">
                        </td>
                    <td class="eccoTextX" 
                        >
                        </td>
                </tr>
            </tbody>
        </table>
        </td>
    
    </tr>
    <tr><td colspan="2"></td></tr>
     <tr>
    <td style="width: 20px"></td>
    <td style="width: 575px; text-align: left;">
        <table border="0" cellpadding="0" cellspacing="0" class="RedBox" style="text-align: left; width: 571px;">
            <tbody>
                <tr class="viewrowbg">
                    <td class="normaltxt1" colspan="4" style="padding-right: 1px; padding-left: 5px;
                        padding-bottom: 5px; color: rgb(123,76,36); padding-top: 5px"  bgcolor="#ffe6ff">
                        <div style="float: left">
                            <b>Location</b>
                        </div>
                    </td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td class="ccoText">
                        Citizenship :</td>
                    <td  class="ccoTextX" >
                        <asp:Label ID="L_Citizen" runat="server" CssClass="normaltxt1"></asp:Label></td>
                    <td class="ccoText" >
                        Country Living :</td>
                    <td class="ccoTextX" >
                        <asp:Label ID="L_CountryLiving" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
      
                <tr bgcolor="#ffffff">
                    <td class="eccoText" >
                        Residing State :</td>
                    <td  class="eccoTextX" >
                        <asp:Label ID="L_RState" runat="server" CssClass="normaltxt1"></asp:Label></td>
                    <td class="eccoText" > Residing City :</td>
                    <td class="eccoTextX"
                        >
                        <asp:Label ID="L_RCity" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
 
                <tr bgcolor="#ffffff">
                    <td class="ccoText">
                        City :</td>
                    <td  class="ccoTextX" >
                       <asp:Label ID="L_City" runat="server" CssClass="normaltxt1"></asp:Label></td>

                    <td class="ccoText">
                        Resident Status :</td>
                    <td  class="ccoTextX" >
                        <asp:Label ID="L_RSTatus" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
            </tbody>
        </table>
    </td>
    </tr>
    <tr><td colspan="2" style="height: 3px"></td></tr>
     <tr>
    <td style="width: 20px"></td>
    <td style="width: 575px; text-align: left;">
        <table border="0" cellpadding="0" cellspacing="0" class="RedBox" style="width: 569px">
            <tbody>
                <tr class="viewrowbg">
                    <td class="normaltxt1" colspan="4" style="padding-right: 1px; padding-left: 5px;
                        padding-bottom: 5px; color: rgb(123,76,36); padding-top: 5px"  bgcolor="#ffe6ff">
                        <div style="float: left">
                            <b>Educational &amp; Professional Information</b>
                        </div>
                    </td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td class="ccoText" style="width: 151px">Education :</td>
                    <td class="ccoTextX" style="width: 75%" >
                            <asp:Label ID="L_Edu" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
                <tr class="viewlineclr">

                <tr bgcolor="#ffffff">
                    <td class="eccoText"
                        >
                        Education in Detail :</td>
                    <td class="eccoTextX" style="width: 75%" >
                        <asp:Label ID="L_Edu_De" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>

                <tr bgcolor="#ffffff">
                    <td class="ccoText"
                        >
                        Employed in :</td>
                    <td class="ccoTextX" style="width: 75%">
                        <asp:Label ID="L_Empl" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>

                <tr bgcolor="#ffffff">
                    <td class="eccoText" >
                        Occupation :</td>
                    <td class="eccoTextX" style="width: 75%" >
                        <asp:Label ID="L_Occ" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>

                <tr bgcolor="#ffffff">
                    <td class="ccoText" style="width: 151px" >
                        Annual Income :</td>
                    <td class="ccoTextX" style="width: 75%" >
                        <asp:Label ID="L_AnIC" runat="server" CssClass="normaltxt1"></asp:Label>
                        <asp:Label ID="L_AnuIn" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>


                <tr class="viewlineclr">
                    <td colspan="4"  width="10">
                        </td>
                </tr>
            </tbody>
        </table>
        </td>
    
    </tr>
    <tr><td colspan="2"></td></tr>
     <tr>
    <td style="width: 15px; height: 79px;"></td>
    <td style="width: 575px; height: 79px; text-align: left;"><table border="0" cellpadding="0" cellspacing="0" class="RedBox" style="text-align: left; width: 567px;">
        <tbody>
            <tr class="viewrowbg">
                <td class="normaltxt1" colspan="4" style="padding-right: 1px; padding-left: 5px;
                        padding-bottom: 5px; color: rgb(123,76,36); padding-top: 5px"  bgcolor="#ffe6ff">
                    <div style="float: left">
                        <b>Family Details</b>&nbsp;</div>
                </td>
            </tr>
            <tr><td style="width: 132px" class="ccoText" >
                Family Details:</td><td colspan="3">
                                <asp:Label ID="L_FDetails" runat="server" CssClass="normaltxt1"></asp:Label></td></tr>
            <tr bgcolor="#ffffff">
                <td style="width: 132px" class="eccoText" >
                    Father :</td>
                <td style="width: 175px" class="eccoTextX" >
                    <asp:Label ID="L_Father" runat="server" CssClass="normaltxt1"></asp:Label>
                    <br />
                    <asp:Label ID="L_FIsLive" runat="server" CssClass="normaltxt1"></asp:Label></td>
                <td style="width: 111px" class="eccoText" >
                    Occupation :</td>
                <td class="eccoTextX" >
                    &nbsp;<asp:Label ID="L_FOcc" runat="server" CssClass="normaltxt1"></asp:Label></td>
            </tr>
 
            <tr bgcolor="#ffffff">
                <td style="width: 132px" class="ccoText" >
                    Mother :</td>
                <td style="width: 175px" class="ccoTextX" >
                    <asp:Label ID="L_Mother" runat="server" CssClass="normaltxt1"></asp:Label>
                    <br />
                    <asp:Label ID="L_MIsLive" runat="server" CssClass="normaltxt1"></asp:Label></td>
                <td style="width: 111px" class="ccoText" >
                    Occupation&nbsp;:</td>
                <td class="ccoTextX" >
                    <asp:Label ID="L_MOcc" runat="server" CssClass="normaltxt1"></asp:Label></td>
            </tr>
          <tr bgcolor="#ffffff">
                    <td class="eccoText"  >
                        Brother :</td>
                    <td class="eccoTextX">
                    <asp:Label ID="L_Brother" runat="server" CssClass="normaltxt1"></asp:Label></td>
                    <td class="eccoText" 
                         width="120">
                        Married</td>
                    <td class="eccoTextX" >
                        <asp:Label ID="L_BMarried" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>          
                <tr bgcolor="#ffffff">
                    <td class="ccoText"  >
                        Sister :</td>
                    <td class="ccoTextX">
                    <asp:Label ID="L_Sister" runat="server" CssClass="normaltxt1"></asp:Label></td>
                    <td class="ccoText" 
                         width="120">
                        Married</td>
                    <td class="ccoTextX" 
                        >
                        <asp:Label ID="L_SMarried" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
         <tr bgcolor="#ffffff">
                    <td class="eccoText"  >
                        Family Values  :</td>
                    <td class="eccoTextX">
                    <asp:Label ID="L_FamilyValues" runat="server" CssClass="normaltxt1"></asp:Label></td>
                    <td class="eccoText" 
                         width="120">
                        Family Type</td>
                    <td class="eccoTextX" >
                        <asp:Label ID="L_FamilyType" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr> 
                 <tr bgcolor="#ffffff">
                    <td class="ccoText"  >
                        Family Status :</td>
                    <td class="ccoTextX">
                    <asp:Label ID="L_FamilyStatus" runat="server" CssClass="normaltxt1"></asp:Label></td>
                    <td class="ccoText" width="120">Family Origin</td>
                    <td class="ccoTextX">
                        <asp:Label ID="L_FamilyOrigin" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
        </tbody>
    </table>
    </td>
    </tr>
    <tr><td colspan="2"></td></tr>
     <tr>
    <td style="width: 15px; height: 47px;"></td>
    <td style="width: 575px; height: 47px; text-align: left;">
        <table border="0" cellpadding="0" cellspacing="0" class="RedBox" bgcolor="#ffccff" style="width: 567px">
            <tbody>
                <tr class="viewrowbg">
                    <td class="normaltxt1" style="padding-right: 5px; padding-left: 5px; padding-bottom: 5px;
                        color: rgb(123,76,36); padding-top: 5px; text-align: justify"  bgcolor="#ffe6ff" colspan="2">
                        &nbsp;<div style="float: left">
                            <b>Hobbies &amp; Intrests</b>
                        </div>
                    </td>
                </tr>
                <tr bgcolor="#ffffff">
                 <td class="ccoText"
                        >
                     Hobbies :</td>
                    <td class="ccoTextX">
                        <asp:Label ID="L_Hobbies" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td class="eccoText"
                        >
                        Intrests :</td>
                    <td class="eccoTextX" style="width: 75%" >
                        <asp:Label ID="L_Intrests" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
            </tbody>
        </table>
        </td>
    
    </tr>
        
            <tr><td colspan="2"></td></tr>
     <tr>
    <td style="width: 15px; height: 47px;"></td>
    <td style="width: 575px; height: 47px; text-align: left;">
        <table border="0" cellpadding="0" cellspacing="0" class="RedBox" bgcolor="#ffccff" style="width: 567px">
            <tbody>
                <tr class="viewrowbg">
                    <td class="normaltxt1" style="padding-right: 5px; padding-left: 5px; padding-bottom: 5px;
                        color: rgb(123,76,36); padding-top: 5px; text-align: justify"  bgcolor="#ffe6ff">
                        <div style="float: left">
                            <b>About me</b>
                        </div>
                    </td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td class="normaltxt1" style="padding-right: 10px; padding-left: 10px; padding-bottom: 10px;
                        line-height: 15px; padding-top: 5px; text-align: justify" >
                        <asp:Label ID="L_AboutMe" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>

            </tbody>
        </table>
        </td>
    
    </tr>
    
        <tr><td colspan="2"></td></tr>
    <tr><td></td><td style="text-align: left">
            <asp:Panel ID="PN_Contact" runat="server" Height="100%" Width="100%">
                <table border="0" cellpadding="0" cellspacing="0" class="RedBox" style="width: 569px">
            <tbody>
                <tr class="viewrowbg">
                    <td class="normaltxt1" colspan="4" style="padding-right: 1px; padding-left: 5px;
                        padding-bottom: 5px; color: rgb(123,76,36); padding-top: 5px"  bgcolor="#ffe6ff">
                        <div style="float: left">
                            <b>Contact Details&nbsp;</b>
                        </div>
                    </td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td class="ccoText" style="width: 151px">
                        Address&nbsp; :</td>
                    <td class="ccoTextX" style="width: 75%" >
                        <asp:Label ID="L_Address" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>

                <tr bgcolor="#ffffff">
                    <td class="eccoText"
                        >
                        Phone :</td>
                    <td class="eccoTextX" style="width: 75%" >
                        <asp:Label ID="L_Phone" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>

                <tr bgcolor="#ffffff">
                    <td class="ccoText"
                        >
                        Mobile :</td>
                    <td class="ccoTextX" style="width: 75%">
                        <asp:Label ID="L_Cell" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
  

            </tbody>
        </table>
            </asp:Panel>
        </td></tr>
    
    </table>
        <br />
        <table style="width: 607px">
        <tr>
        <td style="width: 41px; height: 33px;"></td>
        <td style="width: 580px; height: 33px; text-align: left;"><table border="0" cellpadding="0" cellspacing="0" class="RedBox" style="text-align: left; width: 567px;">
            <tbody>
                <tr class="viewrowbg">
                    <td class="normaltxt1" colspan="2" style="padding-right: 1px; padding-left: 5px;
                        padding-bottom: 5px; color: rgb(123,76,36); padding-top: 5px"  bgcolor="#ffe6ff">
                            <div style="float: left">
                                <b>Partner Preferance</b>&nbsp;</div>
                    </td>
                </tr>
                <tr>
                    <td style="width: 25%" class="ccoText" >
                        Looking For:</td>
                    <td colspan="1">
                        <asp:Label ID="L_PP_LookingFor" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td style="width: 25%" class="eccoText" >
                        Age :</td>
                    <td style="width: 75%" class="eccoTextX" >
                        <asp:Label ID="L_PP_Age_min" runat="server" CssClass="normaltxt1"></asp:Label>
                        to
                        <asp:Label ID="L_PP_Age_max" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td style="width: 25%" class="ccoText" >
                        Complexion :</td>
                    <td style="width: 75%" class="ccoTextX" >
                        <asp:Label ID="L_PP_Complexion" runat="server" CssClass="normaltxt1"></asp:Label>
                    </td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td class="eccoText" style="width: 25%"  >
                        Have Children :</td>
                    <td class="eccoTextX" style="width: 75%">
                        <asp:Label ID="L_PP_Have_Children" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td class="ccoText" style="width: 25%"  >
                        Height :</td>
                    <td class="ccoTextX" style="width: 75%">
                        <asp:Label ID="L_PP_Height_Min" runat="server" CssClass="normaltxt1"></asp:Label>
                        to
                        <asp:Label ID="L_PP_Height_MAx" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td class="eccoText" style="width: 25%"  >
                        Physical Status :</td>
                    <td class="eccoTextX" style="width: 75%">
                        <asp:Label ID="L_PP_PhysicalStatus" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td class="ccoText" style="width: 25%"  >
                        Mother Tongue :</td>
                    <td class="ccoTextX" style="width: 75%">
                        <asp:Label ID="L_PP_MotherTongue" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td style="width: 25%" class="eccoText" >
                        Religion:</td>
                    <td style="width: 75%" class="eccoTextX" >
                        <asp:Label ID="L_PP_Religion" runat="server" CssClass="normaltxt1"></asp:Label>
                        </td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td style="width: 25%" class="ccoText" >
                        Caste / Division :</td>
                    <td style="width: 75%" class="ccoTextX" >
                        <asp:Label ID="L_PP_Caste_Division" runat="server" CssClass="normaltxt1"></asp:Label>
                    </td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td class="eccoText" style="width: 25%"  >
                        Chovva Dosham :</td>
                    <td class="eccoTextX" style="width: 75%">
                        <asp:Label ID="L_PP_ChovvaDosham" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td class="ccoText" style="width: 25%"  >
                        Eating Habits&nbsp; :</td>
                    <td class="ccoTextX" style="width: 75%">
                        <asp:Label ID="L_PP_EatingHabits" runat="server" CssClass="normaltxt1"></asp:Label>
                        </td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td class="eccoText" style="width: 25%"  >
                        Education :</td>
                    <td class="eccoTextX" style="width: 75%">
                        <asp:Label ID="L_PP_Education" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td class="ccoText" style="width: 25%"  >
                        Edu Details :</td>
                    <td class="ccoTextX" style="width: 75%">
                        <asp:Label ID="L_PP_EduDetails" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td style="width: 25%" class="eccoText" >
                        Annual income :</td>
                    <td style="width: 75%" class="eccoTextX" >
                        <asp:Label ID="L_PP_Annualincome" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td style="width: 25%" class="ccoText" >
                        Occupation :</td>
                    <td style="width: 75%" class="ccoTextX" >
                        <asp:Label ID="L_PP_Occupation" runat="server" CssClass="normaltxt1"></asp:Label>
                    </td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td class="eccoText" style="width: 25%"  >
                        Citizenship :</td>
                    <td class="eccoTextX" style="width: 75%">
                        <asp:Label ID="L_PP_Citizenship" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td class="ccoText" style="width: 25%"  >
                        Country Living in :</td>
                    <td class="ccoTextX" style="width: 75%">
                        <asp:Label ID="L_PP_LivingIN" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td class="eccoText" style="width: 25%"  >
                        Residing State :</td>
                    <td class="eccoTextX" style="width: 75%">
                        <asp:Label ID="L_PP_ResidingState" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td class="ccoText" style="width: 25%"  >
                        Resident Status :</td>
                    <td class="ccoTextX" style="width: 75%">
                        <asp:Label ID="L_PP_ResidentStatus" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
            </tbody>
        </table>
        </td>
        </tr>
        <tr>
        <td style="width: 41px"></td>
        <td style="width: 580px; text-align: center;">
        </td>
        </tr>
        <tr>
        <td style="width: 41px"></td>
        <td style="width: 580px; text-align: left;"><table border="0" cellpadding="0" cellspacing="0" class="RedBox" bgcolor="#ffccff" style="width: 567px">
            <tbody>
                <tr class="viewrowbg">
                    <td class="normaltxt1" style="padding-right: 5px; padding-left: 5px; padding-bottom: 5px;
                        color: rgb(123,76,36); padding-top: 5px; text-align: justify"  bgcolor="#ffe6ff">
                        <div style="float: left">
                            <b>My&nbsp; Expectations</b>&nbsp;</div>
                    </td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td class="normaltxt1" style="padding-right: 10px; padding-left: 10px; padding-bottom: 10px;
                        line-height: 15px; padding-top: 5px; text-align: justify" >
                        <asp:Label ID="L_MyExp" runat="server" CssClass="normaltxt1"></asp:Label></td>
                </tr>
            </tbody>
        </table>
        </td>
        </tr>
        <tr>
        <td style="width: 41px"></td>
        <td style="width: 580px"></td>
        </tr>
        </table>
        <br />
    </td>
    
  </tr>
  <tr><td>
      <br />
      <br />
      <br />
      <br />
      <br />
  
  </td></tr>
</tbody></table>
    <p>&nbsp;</p></td>
</tr>
</tbody></table>

</div>
<!-- END LEFT PART -->	


		  
		    </td>
    </tr>
			
          <tr>
            <td>
                <uc1:Footer_M ID="Footer_M1" runat="server" />
</td>
          </tr>
          <tr>
          
    </tr>
          <tr>
         
          </tr>
  </tbody>
  </table><div id="Div1"  style="visibility: hidden; position: absolute; left: 336px; top: 79%; width: 46%; z-index: 1; height: 131px; background-color: #a3006a;">
      <br />
      <br />
      <br />
      <span style="color: #ffffff">
      You need To Enable Jave Script To View This Form Success Fully</span></div>
  
</div>




</body>
</html>

