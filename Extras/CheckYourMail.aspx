<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckYourMail.aspx.cs" Inherits="CheckYourMail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Check you mail for joinig link....</title>
    <link href="../Resources/style.css" rel="stylesheet" type="text/css">

</head>

<body>
    <form id="form2" runat="server">
    <div>
        <div align="center">
            <table align="center" border="0" cellpadding="0" cellspacing="0" class="BlueTborder"
                width="780" bordercolorlight="#ff33cc">
                <!--DWLayoutTable-->
                <tbody>
                              
                    <tr>
                        <td bgcolor="#ffffff" height="76" style="text-align: left">
                            <img border="0" src="../Resources/logo.gif" />
                        </td>
                    </tr>
        
                    <tr>
                        <td colspan="2">
                        
                        <!------------------- NEED TO INCLUDE  REFERANCE TO THE ANCHORE TAG-------->
                            <!-- FOR MEMBER NOT LOGGED IN   TOP MENU -->
                            <%Response.Write(GetMask("Guest", true)); %>
                            <img border="0" height="29" src="../Resources/guesttopmenu.jpg" usemap="#Map1"
                                width="780" />
                            <map id="Map1" name="Map1">
                                <area alt="Home" coords="4,2,58,25" href="#"shape="RECT" />
                                <area alt="Free Registration" coords="61,2,153,25" href="#" shape="RECT" />
                                <area alt="Member Login" coords="165,3,269,24" href="#" shape="RECT" />
                                <area alt="Free Search" coords="280,2,380,24" href="#" shape="RECT" />
                                <area alt="Membership Scheme" coords="393,2,476,24" href="#" shape="RECT" />
                                <area alt="Payment Option" coords="661,2,779,26" href="#"  shape="RECT" />
                                <area alt="Help" coords="493,2,530,25" href="#" shape="RECT" />
                                <area alt="Success Stories" coords="541,3,648,26" href="#" shape="RECT" />
                            </map>
                             <%Response.Write(GetMask("Guest",false)); %>
                            
                             <!--------For members------->
                             
                             <%Response.Write(GetMask("Member",true)); %>
                            <img src="../Resources/logintopmenu.jpg" usemap="#Map2" border="0" height="29" width="780">
		                   	<map name="Map2" id="Map2">
		                    <area shape="rect" coords="0,1,128,26"href="../Member/Profile.aspx"alt="My Matri">
		                    <area shape="rect" coords="134,1,262,26" href="../Member/membersearchoption.aspx" alt="My Search">
		                    <area shape="rect" coords="287,2,427,27" href="Interests.aspx" alt="My Interest">
		                    <area shape="rect" coords="448,2,538,25" href="Messages.aspx" alt="My Message">
		                    <area shape="rect" coords="567,2,678,25" href="mymembership.aspx" alt="My Membership">
		                    <area shape="rect" coords="696,4,763,24" href="logout.aspx" alt="Logout">
                    		
		                    </map>
                             <%Response.Write(GetMask("Member",false)); %>                        </td>
                    </tr>
                    <tr bgcolor="#ffffff">
                        <td colspan="2" valign="top">
                        
                        
                        
                            <!-- START LEFT PART -->
                            <div align="center">
                           
                            
                            
                               <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tbody>
                                        <tr>
                                            <td  height="303" valign="top" width="180">
                                                <!-- ''''''''''''''NORMAL ''''''''''''''' -->
                                                
                                                
                                                
                                                <table width="780" height="287">
                                                <tr>
                                                <td style="width: 26%">
                                                    &nbsp;</td>
                                                <td style="width: 59%">
                                                    <table>
                                                    <tr>
                                                    <td style="width: 434px; text-align: center">
                                                        We had send a conformation mail to the email address which you &nbsp;provided click
                                                        the Link in the mail to start your registration process.&nbsp;<br />
                                                        Thank you.&nbsp;</td></tr>
                                                    
                                                    </table>
                                                    
                                               
                                               
                                               
                                               
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                                </tr>
                                                
                                                </table>
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                              
                                            </td>
                                            
                                        </tr>
                                    </tbody>
                                </table>
                                
                                
                            </div>
                          
                            
                            <!-- END LEFT PART --></td>
                    </tr>
                    <tr>
                        <td>

  

       

                 

                            <table border="0" cellpadding="0" cellspacing="0" width="780">
                                <tbody>
                                    <tr>
                                        <td bgcolor="#b4447f" height="2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#ffffff" height="50">
                                             <div>
                                                <div align="center">
                                                    <table border="0" cellpadding="0" cellspacing="0" height="30" width="100%">
                                                        <tbody>
                                                            <tr>
                                                                <td valign="middle">
                                                                    <div align="center">
                                                                        All Rights Reserved.© Copyright 2007 Bride &amp; Groom Matimonials&nbsp;<br />
                                                                        <a href="#" onclick="window.open('../Extras/terms_con.aspx','terms','scrollbars=yes,width=500')">
                                                                            <span style="color: #a24f11">User Agreement and Terms of Use</span></a><br />
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                    </tr>
                </tbody>
            </table>
        </div>
    
    </div>
    </form>
</body>
</html>

