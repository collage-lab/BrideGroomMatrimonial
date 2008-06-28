<%@ Page Language="C#" AutoEventWireup="true" CodeFile="memberSearchOption_S.aspx.cs" Inherits="memberSearchOption" %>

<%@ Register Src="../WeBControls/MemberLeftPanel.ascx" TagName="MemberLeftPanel"
    TagPrefix="uc2" %>

<%@ Register Src="../WeBControls/Footer_M.ascx" TagName="Footer_M" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<title>Search Options</title>
<link href="../Resources/style.css" rel="stylesheet" type="text/css">
    <link href="../Resources/style.css" rel="stylesheet" type="text/css" />
    <link href="../Resources/style.css" rel="stylesheet" type="text/css" />
</head>
<body class="body" bgcolor="#cccccc">
<div align="center">
<table class="BlueTborder" align="center" border="0" cellpadding="0" cellspacing="0" width="780">
          <!--DWLayoutTable-->
          <tbody>               
                    <tr>
                        <td bgcolor="#ffffff" height="76" style="text-align: left">
                            <img border="0" src="../Resources/logo.gif" />
                        </td>
                    </tr>
        
          <tr>
            <td colspan="2" style="height: 31px">		<!-- MEMBER LOGGED IN -->
		<img src="../Resources/logintopmenu.jpg" usemap="#Map2" border="0" height="29" width="780">
		<!--------MyProfile Map will be added last------->
		<map name="Map2" id="Map2">
		<area shape="rect" coords="0,1,128,26"href="../Member/Profile.aspx"alt="My Matri">
		<area shape="rect" coords="134,1,262,26" href="../Member/membersearchoption.aspx" alt="My Search">
		<area shape="rect" coords="287,2,427,27" href="Interests.aspx" alt="My Interest">
		<area shape="rect" coords="448,2,538,25" href="Messages.aspx" alt="My Message">
		<area shape="rect" coords="567,2,678,25" href="mymembership.aspx" alt="My Membership">
		<area shape="rect" coords="696,4,763,24" href="logout.aspx" alt="Logout">
		
		</map>

</td>
          </tr>
          <tr bgcolor="#ffffff">
            <td colspan="2" valign="top">
			  

  
<!-- START LEFT PART -->  
<div align="center">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tbody><tr>
<td bgcolor="#ffcccc" height="303" valign="top" style="width: 180px">

<!-- ''''''''''''''NORMAL ''''''''''''''' -->
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <uc2:MemberLeftPanel ID="MemberLeftPanel1" runat="server" />
</td>
<td valign="top"><br>
    <p>
        <table align="center" border="0" cellpadding="0" cellspacing="0" height="20" width="97%">
            <tbody>
                <tr>
                    <td background="../Resources/heading_bg.gif" width="37%">
                        <div align="left">
                            &nbsp; <span class="bodysg">Search Options </span>
                        </div>
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
                        <table id="content" align="center" border="0" cellpadding="5" cellspacing="4" width="97%">
                            <tbody>
                                <tr>
                                    <td colspan="2">
                                        Our various search tools will make your partner search much faster and easier. Go
                                        ahead and enjoy your search.
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div align="center">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table border="0" class="afterloglightyellow1" width="100%">
                                            <tbody>
                                                <tr>
                                                    <td bgcolor="#dbdbdb" colspan="2" height="20">
                                                        <strong><a class="bodylink" href="Searchprofile.aspx?id=simple">Simple Search</a></strong>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#f0f0f0" width="25%">
                                                        <div align="center">
                                                            <img src="../Resources/searchlense.gif" />&nbsp;</div>
                                                    </td>
                                                    <td bgcolor="#f0f0f0" width="75%">
                                                        Search based on the Minimal important criteria that you would look for in a partner
                                                        fastest way.</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="0" class="afterloglightyellow1" width="100%">
                                            <tbody>
                                                <tr>
                                                    <td bgcolor="#dbdbdb" colspan="2" height="20">
                                                        <strong><a class="bodylink" href="adv_search.aspx">Regular Search</a></strong>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#f0f0f0" width="25%">
                                                        <div align="center">
                                                            <img src="../Resources/advsearchlense.gif" />&nbsp;</div>
                                                    </td>
                                                    <td bgcolor="#f0f0f0" width="75%">
                                                        The most comprehensive search that searches across all criteria.</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table border="0" class="afterloglightyellow1" width="100%">
                                            <tbody>
                                                <tr>
                                                    <td bgcolor="#dbdbdb" colspan="2" height="20">
                                                        <strong><a class="bodylink" href="Searchprofile.aspx?id=keyword">Keyword Search</a></strong>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#f0f0f0" width="25%">
                                                        <div align="center">
                                                            <img src="../Resources/keywordsearchlense.gif" />&nbsp;</div>
                                                    </td>
                                                    <td bgcolor="#f0f0f0" width="75%">
                                                        Enter a word related to your search. For e.g. enter<strong> Software Professional </strong>
                                                        .</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="0" class="afterloglightyellow1" width="100%">
                                            <tbody>
                                                <tr>
                                                    <td bgcolor="#dbdbdb" colspan="2" height="20">
                                                        <strong><a class="bodylink" href="Searchprofile.aspx?id=edu">Educational Search</a></strong>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#f0f0f0" width="25%">
                                                        <div align="center">
                                                            <img src="../Resources/edu-search.gif" />&nbsp;</div>
                                                    </td>
                                                    <td bgcolor="#f0f0f0" width="75%">
                                                        Search and locates members who are finished higher education that you would look
                                                        for in a partner.
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table border="0" class="afterloglightyellow1" width="100%">
                                            <tbody>
                                                <tr>
                                                    <td bgcolor="#dbdbdb" colspan="2" height="20">
                                                        <strong><a class="bodylink" href="Searchprofile.aspx?id=occ">Occupational Search </a></strong>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#f0f0f0" width="25%">
                                                        <div align="center">
                                                            <img src="../Resources/Occ-search.gif" />&nbsp;</div>
                                                    </td>
                                                    <td bgcolor="#f0f0f0" width="75%">
                                                        Search based on the Occupation criteria that you would look for in a partner.</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="0" class="afterloglightyellow1" width="100%">
                                            <tbody>
                                                <tr>
                                                    <td bgcolor="#dbdbdb" colspan="2" height="20">
                                                        <strong><a class="bodylink" href="ID_Search.aspx">Matrimony ID Search </a></strong>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#f0f0f0" width="25%">
                                                        <div align="center">
                                                            <img src="../Resources/idsearchlense.gif" />&nbsp;</div>
                                                    </td>
                                                    <td bgcolor="#f0f0f0" width="75%">
                                                        Enter Matrimony ID directly helps you to view the profile of a particular ID.</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td width="50%">
                                        &nbsp;</td>
                                    <td width="50%">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        &nbsp;</td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
    </p></td>
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
  </tbody></table>
  
</div>




</body>
</html>
