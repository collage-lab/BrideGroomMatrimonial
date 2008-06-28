<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintProfile.aspx.cs" Inherits="Member_PrintProfile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml" >


<head runat="server">
    <title>Print Profile</title>
    <!-- print Function -->
    <script>
        function hide(tag) {
	        if (document.getElementById) { //  Netscape, Mozilla, etc.
		        var state = document.getElementById(tag).style.display;
	        } else if (document.all) {     //  IE, Konqueror, etc.
		        var state = document.all[tag].style.display;
	        }
	        var newState = "";

	        if ( state == "block") {
		        newState = "none";
	        } else {
		        newState = "block";
	        }

	        if (document.getElementById) {
		        document.getElementById(tag).style.display = newState;
	        } else if (document.all) {
		        document.all[tag].style.display = newState;
	        }
        }

        function startPrinting() {
	        window.print();
	        location.reload();
        }
    </script>

    <link href="../Resources/style.css" rel="stylesheet" type="text/css" />
    <meta name="robots" content="noindex,noarchive,follow">
</head>

<body topmargin="0" leftmargin="0" alink="#000000"  bgcolor="#ffffff" link="#000000" marginheight="0" marginwidth="0" text="#000000" vlink="#000000">


<!-- Wesite Logo -->
<center>

    <div id="print-off2" style="display: block; text-align: center;">
        <strong><span style="font-size: 8pt; color: #ff6699">
        Plase Print the page only by ckicking the print button at he bottom of this page</span></strong>
        
    </div>
    <!-- Filling Top Space -->
    <div style="padding-top: 17px;">
    </div>
    <div style="width: 582px; background-color: rgb(255, 255, 255);">
	    <div>
		    <div style="padding: 4px 20px 4px 16px; width: 582px; text-align: left;">
		    <img src="../Resources/logo.gif" border="0"></div>
    </div>
    </div>
</center>
<!-- Wesite Logo ends-->

<!-- FIRST PART - START -->
<table align="center" border="0" cellpadding="0" cellspacing="0" width="582">
    <tbody>
    <tr>
<td bgcolor="#ffffff" valign="top">
		<!-- <div style="padding-left:0px;padding-top:5px;padding-bottom:5px;"><font class="leftmenuhead"><font color="#EF6F1F">View Profile</font></div> -->
    <fieldset class="fieldset">
        <legend class="bluetext"><strong><span style="color: #7e7d7d">&nbsp;Profile Informations</span></strong></legend>
        <table border="0" cellspacing="0" width="100%">
            <tbody>
                <tr>
                    <td width="150">
                        <table id="photo" align="center" border="0" class="submenubox" height="150" width="150">
                            <tbody>
                                <tr>
                                    <td style="text-align: center">
                                        <asp:HyperLink ID="HL_Photo" runat="server" ImageUrl="~/Resources/nophoto.gif" NavigateUrl="#">Click To See Album</asp:HyperLink></td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                    <td width="409">
                        <br />
                        <table id="TABLE1" border="0" cellpadding="2" cellspacing="4" width="98%">
                            <tbody>
                                <tr>
                                    <td style="width: 5%;" rowspan="6">
                                    </td>
                                    <td style=" text-align: left">
                                        <img height="7" src="../Resources/arrow-grn-4x7.gif" width="4" />
                                        <asp:Label ID="L_L_Name" runat="server" Text="Name :"></asp:Label>&nbsp;</td>
                                    <td style="text-align: left">
                                        <strong><asp:Label ID="L_Name" runat="server" Height="12px" Width="37px"></asp:Label></strong><a href="#" onclick="window.open('bookmark.aspx','terms','scrollbars=yes,width=500')"></a></td>
                                </tr>
                                <tr style="font-weight: bold;width : 40%">
                                        <td style=" text-align: left" width="30%">
                                        <img height="7" src="../Resources/arrow-grn-4x7.gif" width="4" />
                                            Matri ID: <span class="style6"></span></td>
                                    <td style=" text-align: left" width="65%">
                                            <asp:Label ID="L_MID" runat="server" Height="12px" Width="37px"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style=" text-align: left">
                                        <img height="7" src="../Resources/arrow-grn-4x7.gif" width="4" />
                                        <asp:Label ID="L_Sex" runat="server" Font-Bold="True" Height="12px" Width="37px"></asp:Label>
                                        </td>
                                    <td style=" text-align: left">
                                        <asp:Label ID="L_MS" runat="server" Font-Bold="True" Height="12px" Width="37px"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="text-align: left">
                                        <img height="7" src="../Resources/arrow-grn-4x7.gif" width="4" />
                                        Location: <span class="style6"></span></td>
                                    <td style="text-align: left; ">
                                            <asp:Label ID="L_Location" runat="server" Height="12px" Width="37px" Font-Bold="True"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style=" text-align: left">
                                        <img height="7" src="../Resources/arrow-grn-4x7.gif" width="4" />
                                        Created by:&nbsp;</td>
                                    <td style="text-align: left; ">
                                            <asp:Label ID="L_Created_by" runat="server" Font-Bold="True" Height="12px" Width="81px"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style=" text-align: left">
                                        <img height="7" src="../Resources/arrow-grn-4x7.gif" width="4" />
                                        Last Login :&nbsp;</td>
                                    <td style="text-align: left;" >
                                            <asp:Label ID="L_LogIn_last" runat="server" Font-Bold="True" Height="12px" Width="85px"></asp:Label></td>
                                </tr>
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

<!-- Section1 -->
<table align="center" border="0" cellpadding="0" cellspacing="0" width="582">
   <tbody>
   <tr><td>
       <br />
   </td></tr>
        <tr>
            <td bgcolor="#ffffff" valign="top" style="text-align: center">
                <table border="0" cellpadding="0" cellspacing="0" class="RedBox" style="width: 571px">
                    <tbody>
                        <tr class="viewrowbg">
                            <td bgcolor="#ffe6ff" class="normaltxt1" colspan="4" style="padding-right: 1px; padding-left: 5px;
                                padding-bottom: 5px; color: rgb(123,76,36); padding-top: 5px">
                                <div style="float: left">
                                    <b>Primary Information</b>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="ccoText">
                                Name:</td>
                            <td class="ccoTextX">
                                <asp:Label ID="L_MemberName" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            <td class="normaltxt1" style="padding-left: 10px; padding-bottom: 3px; padding-top: 5px;
                                text-align: left" width="130">
                                Age:</td>
                            <td class="ccoTextX">
                                <asp:Label ID="L_Age" runat="server" CssClass="normaltxt1"></asp:Label></td>
                        </tr>
                        <tr bgcolor="#ffffff">
                            <td class="eccoText">
                                Height:</td>
                            <td class="eccoTextX" style="text-align: left">
                                <asp:Label ID="L_Height" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            <td class="eccoText">
                                Weight:</td>
                            <td class="eccoTextX">
                                <asp:Label ID="L_Weight" runat="server" CssClass="normaltxt1"></asp:Label></td>
                        </tr>
                        <tr bgcolor="#ffffff">
                            <td class="ccoText">
                                Body Type:</td>
                            <td class="ccoTextX">
                                <asp:Label ID="L_BodyType" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            <td class="normaltxt1" style="padding-left: 10px; padding-bottom: 3px; padding-top: 5px;
                                text-align: left">
                                Complexion:</td>
                            <td class="ccoTextX">
                                <asp:Label ID="L_Complexion" runat="server" CssClass="normaltxt1"></asp:Label></td>
                        </tr>
                        <tr bgcolor="#ffffff">
                            <td class="eccoText">
                                Blood Group :</td>
                            <td class="eccoTextX">
                                <asp:Label ID="L_BloodGroup" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            <td class="eccoText" width="110">
                                Mother Tongue:</td>
                            <td class="eccoTextX">
                                <asp:Label ID="L_MTongue" runat="server" CssClass="normaltxt1"></asp:Label></td>
                        </tr>
                        <tr bgcolor="#ffffff">
                            <td class="ccoText">
                                Physical Status:</td>
                            <td class="normaltxt1" colspan="4" style="padding-left: 0px; padding-bottom: 3px;
                                padding-top: 5px; text-align: left" width="200">
                                <asp:Label ID="L_PhyStatus" runat="server" CssClass="normaltxt1"></asp:Label></td>
                        </tr>
                    </tbody>
                </table>
                
                </td></tr>
                <tr><td>
                    <br />
                </td></tr>
                
                <tr><td style="text-align: center">
                <table border="0" cellpadding="0" cellspacing="0" class="RedBox" style="width: 571px">
                    <tbody>
                        <tr class="viewrowbg">
                            <td bgcolor="#ffe6ff" class="normaltxt1" colspan="4" style="padding-right: 1px; padding-left: 5px;
                                padding-bottom: 5px; color: rgb(123,76,36); padding-top: 5px">
                                <div style="float: left">
                                    <b>Socio-Religious Background</b>
                                </div>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff">
                            <td class="ccoText">
                                Religion:</td>
                            <td class="ccoTextX" colspan="3">
                                <asp:Label ID="L_Religion" runat="server" CssClass="normaltxt1"></asp:Label></td>
                        </tr>
                        <tr bgcolor="#ffffff">
                            <td class="eccoText">
                                Caste :</td>
                            <td class="eccoTextX">
                                <asp:Label ID="L_Cast" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            <td class="eccoText" width="130">
                                Sub Caste:</td>
                            <td class="eccoTextX">
                                <asp:Label ID="L_Subcast" runat="server" CssClass="normaltxt1"></asp:Label></td>
                        </tr>
                        <tr bgcolor="#ffffff">
                            <td class="ccoText">
                                Star :</td>
                            <td class="ccoTextX">
                                <asp:Label ID="L_Star" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            <td class="ccotext" style="padding-left: 10px; padding-bottom: 3px; padding-top: 5px;
                                text-align: left">
                                Raasi :</td>
                            <td class="ccoTextX">
                                <asp:Label ID="L_MoonSign" runat="server" CssClass="normaltxt1"></asp:Label></td>
                        </tr>
                        <tr bgcolor="#ffffff">
                            <td class="eccoText">
                                Horoscope Match :</td>
                            <td class="eccoTextX">
                                <asp:Label ID="L_HoroScope" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            <td class="eccoText">
                                Manglik :</td>
                            <td class="eccoTextX">
                                <asp:Label ID="L_CHova" runat="server" CssClass="normaltxt1"></asp:Label></td>
                        </tr>
                        <tr bgcolor="#ffffff">
                            <td class="ccoText">
                                Smoking habits :</td>
                            <td class="ccoTextX">
                                <asp:Label ID="L_SHab" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            <td class="ccotext">
                                Drinking habits :</td>
                            <td class="ccoTextX">
                                <asp:Label ID="L_DHa" runat="server" CssClass="normaltxt1"></asp:Label></td>
                        </tr>
                        <tr bgcolor="#ffffff">
                            <td class="eccoText">
                                Eating Habits :</td>
                            <td class="eccoTextX">
                                <asp:Label ID="L_EHab" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            <td class="eccoText" width="120">
                            </td>
                            <td class="eccoTextX">
                            </td>
                        </tr>
                    </tbody>
                </table>
                </td></tr>
                <tr><td>
                    <br />
                </td></tr>
                
                <tr><td style="text-align: center">
                <table border="0" cellpadding="0" cellspacing="0" class="RedBox" style="width: 571px;
                    text-align: left">
                    <tbody>
                        <tr class="viewrowbg">
                            <td bgcolor="#ffe6ff" class="normaltxt1" colspan="4" style="padding-right: 1px; padding-left: 5px;
                                padding-bottom: 5px; color: rgb(123,76,36); padding-top: 5px">
                                <div style="float: left">
                                    <b>Location</b>
                                </div>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff">
                            <td class="ccoText">
                                Citizenship :</td>
                            <td class="ccoTextX">
                                <asp:Label ID="L_Citizen" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            <td class="ccoText">
                                Country Living :</td>
                            <td class="ccoTextX">
                                <asp:Label ID="L_CountryLiving" runat="server" CssClass="normaltxt1"></asp:Label></td>
                        </tr>
                        <tr bgcolor="#ffffff">
                            <td class="eccoText">
                                Residing State :</td>
                            <td class="eccoTextX">
                                <asp:Label ID="L_RState" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            <td class="eccoText">
                                Residing City :</td>
                            <td class="eccoTextX">
                                <asp:Label ID="L_RCity" runat="server" CssClass="normaltxt1"></asp:Label></td>
                        </tr>
                        <tr bgcolor="#ffffff">
                            <td class="ccoText">
                                City :</td>
                            <td class="ccoTextX">
                                <asp:Label ID="L_City" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            <td class="ccoText">
                                Resident Status :</td>
                            <td class="ccoTextX">
                                <asp:Label ID="L_RSTatus" runat="server" CssClass="normaltxt1"></asp:Label></td>
                        </tr>
                    </tbody>
                </table>
                </td>
                </tr>
                <tr><td>
                    <br />
                </td></tr>
                
                <tr>
                <td style="text-align: center">
                <table border="0" cellpadding="0" cellspacing="0" class="RedBox" style="width: 569px">
                    <tbody>
                        <tr class="viewrowbg">
                            <td bgcolor="#ffe6ff" class="normaltxt1" colspan="4" style="padding-right: 1px; padding-left: 5px;
                                padding-bottom: 5px; color: rgb(123,76,36); padding-top: 5px">
                                <div style="float: left">
                                    <b>Educational &amp; Professional Information</b>
                                </div>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff">
                            <td class="ccoText" style="width: 151px">
                                Education :</td>
                            <td class="ccoTextX" style="width: 75%">
                                <asp:Label ID="L_Edu" runat="server" CssClass="normaltxt1"></asp:Label></td>
                        </tr>
                        <tr class="viewlineclr">
                        </tr>
                        <tr bgcolor="#ffffff">
                            <td class="eccoText">
                                Education in Detail :</td>
                            <td class="eccoTextX" style="width: 75%">
                                <asp:Label ID="L_Edu_De" runat="server" CssClass="normaltxt1"></asp:Label></td>
                        </tr>
                        <tr bgcolor="#ffffff">
                            <td class="ccoText">
                                Employed in :</td>
                            <td class="ccoTextX" style="width: 75%">
                                <asp:Label ID="L_Empl" runat="server" CssClass="normaltxt1"></asp:Label></td>
                        </tr>
                        <tr bgcolor="#ffffff">
                            <td class="eccoText">
                                Occupation :</td>
                            <td class="eccoTextX" style="width: 75%">
                                <asp:Label ID="L_Occ" runat="server" CssClass="normaltxt1"></asp:Label></td>
                        </tr>
                        <tr bgcolor="#ffffff">
                            <td class="ccoText" style="width: 151px">
                                Annual Income :</td>
                            <td class="ccoTextX" style="width: 75%">
                                <asp:Label ID="L_AnIC" runat="server" CssClass="normaltxt1"></asp:Label>
                                <asp:Label ID="L_AnuIn" runat="server" CssClass="normaltxt1"></asp:Label></td>
                        </tr>
                        <tr class="viewlineclr">
                            <td colspan="4" width="10">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
                        <tr><td>
                            <br />
                            </td></tr>
   </tbody>
   
    
                
        
</table>

<center>
    <div id="prin-on2" style="display: block; text-align: center; height:45px; width: 583px;display: none;">
                <!-- Printing Part 2-->
    </div>
</center>

    <table align="center" border="0" cellpadding="0" cellspacing="0" width="582">
        <tbody>

            <tr>
                <td bgcolor="#ffffff" valign="top" style="width: 583px; text-align: center">
                    <table border="0" cellpadding="0" cellspacing="0" class="RedBox" style="width: 567px;
                        text-align: left">
                        <tbody>
                            <tr class="viewrowbg">
                                <td bgcolor="#ffe6ff" class="normaltxt1" colspan="4" style="padding-right: 1px; padding-left: 5px;
                                    padding-bottom: 5px; color: rgb(123,76,36); padding-top: 5px">
                                    <div style="float: left">
                                        <b>Family Details</b>&nbsp;</div>
                                </td>
                            </tr>
                            <tr>
                                <td class="ccoText" style="width: 132px">
                                    Family Details:</td>
                                <td colspan="3">
                                    <asp:Label ID="L_FDetails" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td class="eccoText" style="width: 132px">
                                    Father :</td>
                                <td class="eccoTextX" style="width: 175px">
                                    <asp:Label ID="L_Father" runat="server" CssClass="normaltxt1"></asp:Label>
                                    <br />
                                    <asp:Label ID="L_FIsLive" runat="server" CssClass="normaltxt1"></asp:Label></td>
                                <td class="eccoText" style="width: 111px">
                                    Occupation :</td>
                                <td class="eccoTextX">
                                    &nbsp;<asp:Label ID="L_FOcc" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td class="ccoText" style="width: 132px">
                                    Mother :</td>
                                <td class="ccoTextX" style="width: 175px">
                                    <asp:Label ID="L_Mother" runat="server" CssClass="normaltxt1"></asp:Label>
                                    <br />
                                    <asp:Label ID="L_MIsLive" runat="server" CssClass="normaltxt1"></asp:Label></td>
                                <td class="ccoText" style="width: 111px">
                                    Occupation :</td>
                                <td class="ccoTextX">
                                    <asp:Label ID="L_MOcc" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td class="eccoText">
                                    Brother :</td>
                                <td class="eccoTextX">
                                    <asp:Label ID="L_Brother" runat="server" CssClass="normaltxt1"></asp:Label></td>
                                <td class="eccoText" width="120">
                                    Married</td>
                                <td class="eccoTextX">
                                    <asp:Label ID="L_BMarried" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td class="ccoText">
                                    Sister :</td>
                                <td class="ccoTextX">
                                    <asp:Label ID="L_Sister" runat="server" CssClass="normaltxt1"></asp:Label></td>
                                <td class="ccoText" width="120">
                                    Married</td>
                                <td class="ccoTextX">
                                    <asp:Label ID="L_SMarried" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td class="eccoText">
                                    Family Values :</td>
                                <td class="eccoTextX">
                                    <asp:Label ID="L_FamilyValues" runat="server" CssClass="normaltxt1"></asp:Label></td>
                                <td class="eccoText" width="120">
                                    Family Type</td>
                                <td class="eccoTextX">
                                    <asp:Label ID="L_FamilyType" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td class="ccoText">
                                    Family Status :</td>
                                <td class="ccoTextX">
                                    <asp:Label ID="L_FamilyStatus" runat="server" CssClass="normaltxt1"></asp:Label></td>
                                <td class="ccoText" width="120">
                                    Family Origin</td>
                                <td class="ccoTextX">
                                    <asp:Label ID="L_FamilyOrigin" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            </tr>
                        </tbody>
                    </table>
                     </td></tr>
                <tr><td><br /></td></tr>
                
                <tr><td style="text-align: center">
                    <table bgcolor="#ffccff" border="0" cellpadding="0" cellspacing="0" class="RedBox"
                        style="width: 567px">
                        <tbody>
                            <tr class="viewrowbg">
                                <td bgcolor="#ffe6ff" class="normaltxt1" colspan="2" style="padding-right: 5px; padding-left: 5px;
                                    padding-bottom: 5px; color: rgb(123,76,36); padding-top: 5px; text-align: justify">
                                    &nbsp;<div style="float: left">
                                        <b>Hobbies &amp; Intrests</b>
                                    </div>
                                </td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td class="ccoText">
                                    Hobbies :</td>
                                <td class="ccoTextX">
                                    <asp:Label ID="L_Hobbies" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td class="eccoText">
                                    Intrests :</td>
                                <td class="eccoTextX" style="width: 75%">
                                    <asp:Label ID="L_Intrests" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            </tr>
                        </tbody>
                    </table>
                </td>
                </tr>
                
                <tr><td>
                    <br />
                       
                      </td>
                      </tr>
            <tr>
                <td style="height: 29px; text-align: center;">
                    <table bgcolor="#ffccff" border="0" cellpadding="0" cellspacing="0" class="RedBox"
                        style="width: 567px">
                        <tbody>
                            <tr class="viewrowbg">
                                <td bgcolor="#ffe6ff" class="normaltxt1" style="padding-right: 5px; padding-left: 5px;
                                    padding-bottom: 5px; color: rgb(123,76,36); padding-top: 5px; text-align: justify">
                                    <div style="float: left">
                                        <b>About me</b>
                                    </div>
                                </td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td class="normaltxt1" style="padding-right: 10px; padding-left: 10px; padding-bottom: 10px;
                                    line-height: 15px; padding-top: 5px; text-align: justify">
                                    <asp:Label ID="L_AboutMe" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="height: 29px">
                </td>
            </tr>



                
                <tr><td style="text-align: center">
                
                 <table border="0" id="Table_Contact" runat="server" cellpadding="0" cellspacing="0" class="RedBox" style="width: 569px">
                            <tbody>
                                <tr class="viewrowbg">
                                    <td bgcolor="#ffe6ff" class="normaltxt1" colspan="4" style="padding-right: 1px; padding-left: 5px;
                                        padding-bottom: 5px; color: rgb(123,76,36); padding-top: 5px">
                                        <div style="float: left">
                                            <b>Contact Details&nbsp;</b>
                                        </div>
                                    </td>
                                </tr>
                                <tr bgcolor="#ffffff">
                                    <td class="ccoText" style="width: 151px">
                                        Address&nbsp; :</td>
                                    <td class="ccoTextX" style="width: 75%">
                                        <asp:Label ID="L_Address" runat="server" CssClass="normaltxt1"></asp:Label></td>
                                </tr>
                                <tr bgcolor="#ffffff">
                                    <td class="eccoText">
                                        Phone :</td>
                                    <td class="eccoTextX" style="width: 75%">
                                        <asp:Label ID="L_Phone" runat="server" CssClass="normaltxt1"></asp:Label></td>
                                </tr>
                                <tr bgcolor="#ffffff">
                                    <td class="ccoText">
                                        Mobile :</td>
                                    <td class="ccoTextX" style="width: 75%">
                                        <asp:Label ID="L_Cell" runat="server" CssClass="normaltxt1"></asp:Label></td>
                                </tr>
                            </tbody>
                        </table>
                
                </td></tr>


                <tr><td><br /></td></tr>
                
                <tr><td style="text-align: center">
                    <table border="0" cellpadding="0" cellspacing="0" class="RedBox" style="width: 567px;
                        text-align: left">
                        <tbody>
                            <tr class="viewrowbg">
                                <td bgcolor="#ffe6ff" class="normaltxt1" colspan="2" style="padding-right: 1px; padding-left: 5px;
                                    padding-bottom: 5px; color: rgb(123,76,36); padding-top: 5px">
                                    <div style="float: left">
                                        <b>Partner Preferance</b>&nbsp;</div>
                                </td>
                            </tr>
                            <tr>
                                <td class="ccoText" style="width: 25%">
                                    Looking For:</td>
                                <td colspan="1">
                                    <asp:Label ID="L_PP_LookingFor" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td class="eccoText" style="width: 25%">
                                    Age :</td>
                                <td class="eccoTextX" style="width: 75%">
                                    <asp:Label ID="L_PP_Age_min" runat="server" CssClass="normaltxt1"></asp:Label>
                                    to
                                    <asp:Label ID="L_PP_Age_max" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td class="ccoText" style="width: 25%">
                                    Complexion :</td>
                                <td class="ccoTextX" style="width: 75%">
                                    <asp:Label ID="L_PP_Complexion" runat="server" CssClass="normaltxt1"></asp:Label>
                                </td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td class="eccoText" style="width: 25%">
                                    Have Children :</td>
                                <td class="eccoTextX" style="width: 75%">
                                    <asp:Label ID="L_PP_Have_Children" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td class="ccoText" style="width: 25%">
                                    Height :</td>
                                <td class="ccoTextX" style="width: 75%">
                                    <asp:Label ID="L_PP_Height_Min" runat="server" CssClass="normaltxt1"></asp:Label>
                                    to
                                    <asp:Label ID="L_PP_Height_MAx" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td class="eccoText" style="width: 25%">
                                    Physical Status :</td>
                                <td class="eccoTextX" style="width: 75%">
                                    <asp:Label ID="L_PP_PhysicalStatus" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td class="ccoText" style="width: 25%">
                                    Mother Tongue :</td>
                                <td class="ccoTextX" style="width: 75%">
                                    <asp:Label ID="L_PP_MotherTongue" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td class="eccoText" style="width: 25%">
                                    Religion:</td>
                                <td class="eccoTextX" style="width: 75%">
                                    <asp:Label ID="L_PP_Religion" runat="server" CssClass="normaltxt1"></asp:Label>
                                </td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td class="ccoText" style="width: 25%">
                                    Caste / Division :</td>
                                <td class="ccoTextX" style="width: 75%">
                                    <asp:Label ID="L_PP_Caste_Division" runat="server" CssClass="normaltxt1"></asp:Label>
                                </td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td class="eccoText" style="width: 25%">
                                    Chovva Dosham :</td>
                                <td class="eccoTextX" style="width: 75%">
                                    <asp:Label ID="L_PP_ChovvaDosham" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td class="ccoText" style="width: 25%">
                                    Eating Habits&nbsp; :</td>
                                <td class="ccoTextX" style="width: 75%">
                                    <asp:Label ID="L_PP_EatingHabits" runat="server" CssClass="normaltxt1"></asp:Label>
                                </td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td class="eccoText" style="width: 25%">
                                    Education :</td>
                                <td class="eccoTextX" style="width: 75%">
                                    <asp:Label ID="L_PP_Education" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td class="ccoText" style="width: 25%">
                                    Edu Details :</td>
                                <td class="ccoTextX" style="width: 75%">
                                    <asp:Label ID="L_PP_EduDetails" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td class="eccoText" style="width: 25%">
                                    Annual income :</td>
                                <td class="eccoTextX" style="width: 75%">
                                    <asp:Label ID="L_PP_Annualincome" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td class="ccoText" style="width: 25%">
                                    Occupation :</td>
                                <td class="ccoTextX" style="width: 75%">
                                    <asp:Label ID="L_PP_Occupation" runat="server" CssClass="normaltxt1"></asp:Label>
                                </td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td class="eccoText" style="width: 25%">
                                    Citizenship :</td>
                                <td class="eccoTextX" style="width: 75%">
                                    <asp:Label ID="L_PP_Citizenship" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td class="ccoText" style="width: 25%">
                                    Country Living in :</td>
                                <td class="ccoTextX" style="width: 75%">
                                    <asp:Label ID="L_PP_LivingIN" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td class="eccoText" style="width: 25%">
                                    Residing State :</td>
                                <td class="eccoTextX" style="width: 75%">
                                    <asp:Label ID="L_PP_ResidingState" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td class="ccoText" style="width: 25%">
                                    Resident Status :</td>
                                <td class="ccoTextX" style="width: 75%">
                                    <asp:Label ID="L_PP_ResidentStatus" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            </tr>
                        </tbody>
                    </table>
                 </td>
                 </tr>
                <tr><td><br /></td></tr>
                
                <tr><td style="text-align: center">
                    <table bgcolor="#ffccff" border="0" cellpadding="0" cellspacing="0" class="RedBox"
                        style="width: 567px">
                        <tbody>
                            <tr class="viewrowbg">
                                <td bgcolor="#ffe6ff" class="normaltxt1" style="padding-right: 5px; padding-left: 5px;
                                    padding-bottom: 5px; color: rgb(123,76,36); padding-top: 5px; text-align: justify">
                                    <div style="float: left">
                                        <b>About me</b>
                                    </div>
                                </td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td class="normaltxt1" style="padding-right: 10px; padding-left: 10px; padding-bottom: 10px;
                                    line-height: 15px; padding-top: 5px; text-align: justify">
                                    <asp:Label ID="L_MyExp" runat="server" CssClass="normaltxt1"></asp:Label></td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>

    <table align="center" border="0" cellpadding="0" cellspacing="0" width="582">
        <tbody>
            <tr>
                <td bgcolor="#ffffff" valign="top">
                    &nbsp;</td>
        </tr>
</tbody>
</table>




 
 <!-- Printer Settings -->
	    <table align="center" border="0" cellpadding="0" cellspacing="0" width="525">
		    <tbody>
		        <tr>
		          <td colspan="4" align="center">
		            <!-- Hides When Printer Starts printing -->
                    <div id="prin-off" style="display: block; text-align: center;">
                        <br />
                        <a href="javascript:hide('print-off2');hide('prin-on2');hide('prin-off');hide('prin-on');startPrinting()" class="text"><img src="../Resources/print.gif" border="0"></a>
                    </div>
                    <!-- Displays When Printer Starts printing -->
                    <div id="prin-on" style="display: none;">
                    <font color="#ffffff"></font>
                    </div>
		        </td>
			</tr>
		</tbody>
	</table>
<!--    View Profile Template Ends - here  --></body>
</html>
