<%-- -------------------------------------------MaTrimonial Home Page----------------------------------------- --%>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Guest_Home" %>
<%@ Register Assembly="eWorld.UI" Namespace="eWorld.UI" TagPrefix="ew" %>
<%@ Register Src="../WeBControls/Footer_G.ascx" TagName="Footer_G" TagPrefix="uc1" %>
<%-- ------------------------------------------------------------------------------------------------------- --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
        <title>Welcome to Bride n Groom matrimonial Services</title>
        <link href="../Resources/style.css" rel="stylesheet" type="text/css">
        <link rel="shortcut icon" href="guest.ico" />
        <script language="JavaScript">
                <%--
                  function caste_disable(obj){
                       document.getElementById('HF_Caste').innerText= "0";
	                    if(obj.options[obj.selectedIndex].text != 'Hindu' &&
		                    obj.options[obj.selectedIndex].text != 'Muslim' &&
		                    obj.options[obj.selectedIndex].text != 'Christian' &&
		                    obj.options[obj.selectedIndex].text != 'Jain' &&
		                    obj.options[obj.selectedIndex].text != 'Sikh'){
	                    document.MatriForm.caste.disabled = true;
	                    }
	                    else {
		                    document.MatriForm.caste.disabled = false;
		                    get_caste(obj.form.DDL_Religion,0);
	                    }
                    }
                    //--%>
            </script>
        <script language="javascript">
                <%--
                var caste=new Array();
                    caste["Hindu"] = ["Adi Dravida","Agarwal","Anavil Brahmin","Arora","Arya Vysya","Aryasamaj","Audichya Brahmin","Bahi","Balija Naidu","Bengali","Bengali Brahmin","Bhandari","Billava","Brahmin","Brahmin Bhumihar","Brahmin Goswami","Brahmin Kanada Madhva","Brahmin Kanyakubja","Brahmin Niyogi Nandavariki","Brahmin Saryuparin","Brahmin Tyagi","Bunt","Chaurasia","Chettiar","Coorgi","Davadnya Brahmin","Dawoodi Bhora","Deshastha Brahmin","Devanga","Dhaneshawat Vaish","Dhiman Brahmin","Digambar","Ezhava","Ezhuthachan","Garhwali Brahmins","Garhwali Rajput","Gomantak Maratha","Goswami","Gounder","Gour Brahmin","Gowd Saraswat Brahmin","Gowda","Gujarati","Gupta","Gurjar","Havyaka Brahmin","Iyengar","Iyer","Iyer Brahmin","Jaiswal","Jat","Kalar","Kalinga Vysya","Kamboj","Kamma","Kannada Mogaveera","Kapu","Kapu Naidu","Karhade Brahmin","Karuneekar","Kashmiri Pandit (Brahmin)","Kashyap","Kayastha","Khatri","Kokanastha Brahmin","Kongu Vellala Gounder","Kori","Koshti","Kshatriya","Kumaoni Brahmins","Kumaoni Rajput","Kumawat","Kumbara","Kunbi","Kurmi","Kuruba","Leva Patil","Lingayat","Lohana","Maithil Brahmin","Malayalee Namboodiri","Malayalee Variar","Mali","Maharashtrian","Maharashtrian Brahmin","Maheshwari","Maratha","Maruthuvar","Marvar","Marwari","Maurya","Menon","Mudaliar","Mudaliar Arcot","Mudaliar Saiva","Mudaliar Senguntha","Mukulathur","Nadar","Nagar Brahmin","Naidu","Nair","Nair Vaniya","Nambiar","Nepali","OBC (Barber-Naayee)","Padmashali","Patel Desai","Patel Kadva","Patel Leva","Perika","Pillai","Prajapati","Punjabi","Punjabi Brahmin","Rajput","Reddy","Saraswat Brahmins","Sahu","Scheduled Caste","Sepahia","Setti Balija","Sindhi","Somvanshi","Sonar","Sowrashtra","Sozhiya Vellalar","Sutar","Swarnakar","Tamil Yadava","Teli","Telugu","Telugu Brahmin","Thevar","Thiyya","Udayar","Vaidiki Brahmin","Vaishnav","Vaishnav Bhatia","Vaishnav Vania","Varshney","Vanniyakullak Shatriya","Vanniyar","Veerashaiva","Velethadathu Nair","Vellalar","Vellama","Vishwakarma","Viswabrahmin","Vokaliga","Vysya","Yadav"];
                    caste["Muslim"] = ["Bengali","Dawoodi Bohra","Ehle-Hadith","Memon","Rajput","Shia","Shia Imami Ismaili","Sunni"];
                    caste["Christian"] = ["Catholic","CMS","CSI","Evangelical","Jacobite","Marthoma","Nadar","Protestant","Syrian"];
                    caste["Jain"] = ["Digambar","Shewetamber","Vania"];
                    caste["Sikh"] = ["Clean Shaven","Gursikh","Jat","Kamboj","Kesadhari","Khatri","Ramgharia"];

	                function get_caste(obj,show_default)
	                {
		                var sel_caste = '';

		                var sel_DDL_Religion	= obj.options[obj.selectedIndex].text;
		                var caste_obj		= obj.form.elements["caste"];
		                //CLEAN CASTE SELECT BOX
		                while ( caste_obj.options.length ) caste_obj.options[0] = null;

		                //ADD FIRST SELECT OPTION
		                caste_obj.options[0]=new Option("Any","0",true);


		                //ADD CASTE OPTIONS FOR SELECTED DDL_Religion
		                //if(obj.selectedIndex>0){
			                for(j=0;j<caste[sel_DDL_Religion].length;j++)
			                {
				                //NOT TO INCLUDE OPTIONS HAVING NULL VALUES
				                if(caste[sel_DDL_Religion][j]!="")
				                {
					                var caste_val = caste[sel_DDL_Religion][j]=="Any"?"Any":caste[sel_DDL_Religion][j];
					                var def_sel   = (sel_caste == caste_val) ? true : false;
                                    caste_obj.options[j+1] = new Option(caste[sel_DDL_Religion][j], caste_val, true, def_sel);
				                }
			                }
		                //}
	               }
        	        //--%>

	        </script>
        <script language="JavaScript">
                <%--
	            function loadHF(obj){
                    document.getElementById('HF_Caste').innerText = document.getElementById('caste').selectedIndex;
                    }
                    //--%>
	            </script>
        <link href="../Resources/style.css" rel="stylesheet" type="text/css" />
</head>

<%--    BODY    --%>

    <body  class="body" background="../Resources/BodyBg.gif">
         <div align="center">
	         <table class="style2" align="center" cellpadding="0" cellspacing="0" width="780" style="border-right: #990000 1px solid; border-top: #990000 1px solid; border-left: #990000 1px solid; border-bottom: #990000 1px solid">
                  <tbody>
                    <tr>
                        <td colspan="2">
	                <%--  Logo Table Starts  --%>
	                           <table border="0" cellpadding="0" cellspacing="0" width="100%">
	                              <tbody>
	                                 <tr>
                                         <td colspan="2">
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                  <tbody>
                                                      <tr>
                                                        <td><img src="../Resources/logotop.jpg" alt="Bride & Groom Matrimonoals" height="100" width="780"/></td>
                                                      </tr>
                                                      
                                                      <tr>
                                                        <td style="height: 181px">
                                                        <img src="../Resources/layout_mid.jpg" usemap="#Map2" border="0" height="181" width="780"/></td>
                                                      </tr>
                                                </tbody>
	                                        </table>
                                        </td>
    	                             </tr>
    	                          </tbody> 
              	               </table>
    	                  </td>
    	             </tr>
                    <%-- Main Menu Table --%> 
                    <tr bgcolor="#ffffff">
                        <td colspan="2" height="0">
           	             <img src="../Resources/guesttopmenu.jpg" usemap="#Mapmenu" border="0" height="29" width="780"/>
                        </td>
       	            </tr>
       	    
                    <tr bgcolor="#ffffff">
                         <td colspan="2" height="194" valign="top">
                         
                         <%-- Form Starts  --%>
                          <form runat ="server" name="MatriForm" id="MatriForm" >
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                  <tbody>
                    <tr>
                    <td height="194" valign="top" width="33%">
                      <table border="0" cellpadding="3" cellspacing="2" width="100%">
                        <tbody>
                        
                        
                        <tr>
                          <td width="10%">&nbsp;</td>
                          <td rowspan="2" width="90%" colspan="2">
	                          <img src="../Resources/alreadymem.gif" height="30" width="180">
	                          <span class="textnormal">
	                          </span>
                          </td>
                        </tr>
                        
                        
                        <tr>
                          <td>&nbsp;</td>
                        </tr>
                        
                        
                    <%-- Login user controls --%>                    <tr>
                          <td>&nbsp;</td>
                          <td colspan="2"><font color="#9a440d">ID/E-mail :</font>&nbsp;
                              <asp:TextBox ID="TB_ID" runat="server" Width="135px" CssClass="forminput"></asp:TextBox>
                          </td>
                        </tr>
                        
                        
                        <tr>
                          <td>&nbsp;</td>
                          <td colspan="2">
                      	      <font color="#9a440d">Password :</font>&nbsp;
                              <asp:TextBox ID="TB_Password" runat="server" MaxLength="50" Width="135px" CssClass="forminput" TextMode="Password"></asp:TextBox></td>
                        </tr>
                        
                    <%-- Password Submit  --%>    
                          <tr>
                          <td>&nbsp;</td>
                          <td style="width: 140px">
                              &nbsp;<a class="txtsmall" href="GetPassword.aspx" title="Forgot Password?"><font
                                  color="#9a440d">Forgot Password?</font></a>
                          </td>
                             <td style=" text-align: left">
                               <asp:ImageButton ID="IB_LogIn" runat="server" ImageUrl="~/Resources/lgn-button.gif" OnClick="IB_LogIn_Click" />

                            </td>
                              <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="TB_ID"
                                  Display="Dynamic" ErrorMessage="Invalid email Id   " ValidationExpression="[\w-]+([\+\.][\w-]*)?@([\w-]+\.)+[\w-]+"></asp:RegularExpressionValidator></tr>
                        
                      </tbody>
                     </table>
                        <asp:HiddenField ID="HF_Caste" runat="server" Value="0" />
                        
                     </td>
                  
                  
                  <%--  How it works  --%>
                    <td valign="top" width="36%">
            	        <img src="../Resources/layout_how.jpg" usemap="#map3" alt="FREE Join" border="0" height="174" width="252"/>                </td>
                  
                    <td background="../Resources/layout_qs.jpg" width="275px">

				                <table align="center" border="0" cellpadding="0" cellspacing="4" height="162" width="224">
                                  <tbody>
                                  
                                    <tr>
                                      <td colspan="2" class="style" height="20">&nbsp;</td>
                                    </tr>
                                    
                                    
                                    
                                    <tr>
                                      <td class="bodyw" height="20" width="78">
                    	                  <div align="left">Looking  </div>
                                      </td>
                                      <td width="134">
	                                      <div align="left">
	                                      <asp:RadioButton ID="RB_Male" runat="server" Checked="True" GroupName="Looking" />
	                                      <span class="bodyw">Male
	                                      <asp:RadioButton ID="RB_FMale" runat="server" GroupName="Looking" />
	                                      </span>
	                                      <span class="bodyw">Female</span>
	                                      </div>
                                      </td>
                                    </tr>
                                    
                                    
                                    <tr>
                                      <td class="bodyw" style="height: 42px"><div align="left">Age</div></td>
                                      <td style="height: 42px">
                                      <div align="left">
                                      <span class="bodyw">From</span>&nbsp;
                                          <ew:NumericBox ID="TB_AgeMin" runat="server" CssClass="forminput" Width="18px">21</ew:NumericBox>
                                          &nbsp; <span class="bodyw">to
                                          <ew:NumericBox ID="TB_AgeMax" runat="server" CssClass="forminput" Width="18px">35</ew:NumericBox></span>&nbsp;
					                  </div>
					                 </td>
                                    </tr>
                                    
                                    
                                    <tr>
                                      <td class="bodyw" height="19"><div align="left">Religion</div></td>
                                      <td>
                                      <div align="left">
                                          <asp:DropDownList ID="DDL_Religion" runat="server" class="forminput" CssClass="forminput"
                                              onchange="return caste_disable(document.MatriForm.DDL_Religion)" Width="132px">
                                              <asp:ListItem Value="- Select -">- Select -</asp:ListItem>
                                              <asp:ListItem Value="Hindu">Hindu</asp:ListItem>
                                              <asp:ListItem Value="Christian">Christian</asp:ListItem>
                                              <asp:ListItem Value="Muslim">Muslim</asp:ListItem>
                                              <asp:ListItem Value="Sikh">Sikh</asp:ListItem>
                                              <asp:ListItem Value="Jain">Jain</asp:ListItem>
                                              <asp:ListItem Value="Parsi">Parsi</asp:ListItem>
                                              <asp:ListItem Value="Buddhist">Buddhist</asp:ListItem>
                                              <asp:ListItem Value="Bahai">Bahai</asp:ListItem>
                                              <asp:ListItem Value="Inter-DDL_Religion">Inter-DDL_Religion</asp:ListItem>
                                              <asp:ListItem Value="Others">Others</asp:ListItem>
                                          </asp:DropDownList>&nbsp;</div></td>
                                    </tr>
                                    <tr>
                                      <td class="bodyw" height="19"><div align="left">Caste</div></td>
                                      <td><div align="left">
                                          <select id="caste" runat="server" class="forminput" name="caste" onchange="loadHF(document.MatriForm.caste)"
                                              style="width: 132px">
                                              <option selected="selected" value="Any">- Select -</option>
                                          </select>
                                      </div></td>
                                    </tr>
                                    
                                    <tr>
                                      <td align="right" height="14" valign="bottom"><div align="left">
                                          <asp:ImageButton ID="IB_search" runat="server" ImageUrl="~/Resources/search-button.gif" OnClick="IB_search_Click"/>
                                      </div>
                                      </td>
                                      
                                      <td>
                                      <div align="left">
                                          &nbsp;<asp:CheckBox ID="CB_Photo" runat="server" Checked="True" />
                                          <span class="bodyw">Profiles with Photo</span>
                                      </div>
                                      </td>
                                      
                                    </tr>
                                  </tbody>
                                </table>
				                </td>
                              </tr>
                            </tbody>
                           </table>
                          </form>
                         <%-- Form Ends  --%>
                         </td>
                    </tr>
              
                    <tr bgcolor="#ffffff">
                       <td colspan="2" bgcolor="#ffffff" valign="top">
                          <%--  START LEFT PART  --%>  
                             <div align="left">
                                  <table align="center" border="0" cellpadding="0" cellspacing="0" width="98%">
                                    <tbody><tr>
                                      <td width="71%"><table align="left" border="0" cellpadding="3" cellspacing="2" width="488">
                                        <tbody><tr>
                                          <td colspan="2"><div align="left"><strong>Community   Search </strong> </div>
                                              <div></div></td>
                                        </tr>
                                        <tr>
                                          <td width="14%"><div>
                                              <div align="left">Religion:</div>
                                          </div></td>
                                          <%--   SEARCH ON RELIGION  --%>
                                          <td style="width: 415px">
                                          <div align="left">
                                          <a href="../Guest/Searchresults.aspx?g=True&ai=20&ax=30&r=1&c=0&ph=True" target="_blank" class="none style8">Hindu</a>&nbsp;
                                          <span class="style7">|</span>&nbsp;
                                          <a href="../Guest/Searchresults.aspx?g=True&ai=20&ax=30&r=2&c=0&ph=True" target="_blank" class="none style8">Muslim</a>&nbsp;
                                          <span class="style7">|</span>&nbsp;
                                          <a href="../Guest/Searchresults.aspx?g=True&ai=20&ax=30&r=3&c=0&ph=True" target="_blank" class="none style8">Christian</a>&nbsp;
                                          <span class="style7">|</span>&nbsp;
                                          <a href="../Guest/Searchresults.aspx?g=True&ai=20&ax=30&r=4&c=0&ph=True" target="_blank" class="none style8">Jain</a>&nbsp;
                                          <span class="style7">|</span>&nbsp;
                                          <a href="../Guest/Searchresults.aspx?g=True&ai=20&ax=30&r=5&c=0&ph=True" target="_blank" class="none style8">Sikh</a>&nbsp;
                                          <span class="style7">|</span>&nbsp;
                                          <a href="../Guest/SearchOptions.aspx" target="_blank" class="style8"><u>More...</u></a>
                                          </div>
                                          </td>
                                          
                                        </tr>
                                        
                                        <tr>
                                         <%--     SEARCH ON CAST --%>
                                          <td><div align="left">Caste:</div></td>
                                          <td style="width: 415px">
                                          <div align="left">
                                          <a href="#" target="_blank" class="none style8">Nair</a>
                                          <span class="style7">|</span>&nbsp;
                                          <a href="#" target="_blank" class="none style8">Catholic</a>&nbsp;
		                                  <span class="style7">|</span>&nbsp;
		                                  <a href="#" target="_blank" class="none style8">Brahmin</a>&nbsp;
		                                  <span class="style7">|</span>&nbsp;
		                                  <a href="#" target="_blank" class="none style8">Kshatriya</a>&nbsp;
		                                  <span class="style7">|</span>&nbsp;
		                                   <a href="../Guest/SearchOptions.aspx" title="Matrimonial" target="_blank" class="style8">More...</a>
		                                  </div>
		                                  </td>
                                        </tr>
                                        
                                        
                                        <tr>       
                                          <%--  SEARCH ON Education:--%>
                                          <td><div align="left">Education:</div></td>
                                          <td style="width: 415px"><div align="left">
                                          <a href="../Member/SearchResult.aspx?typ=2&g=True&ai=20&ax=30&r=0&c=&ph=True&cri=1" target="_blank" class="none style8">Bachelors</a>&nbsp;
                                          <span class="style7">|</span>&nbsp;
                                          <a href="../Member/SearchResult.aspx?typ=2&g=True&ai=20&ax=30&r=0&c=&ph=True&cri=2" target="_blank" class="none style8">Masters</a> 
                                          <span class="style7">|</span>&nbsp;
                                          <a href="../Member/SearchResult.aspx?typ=2&g=True&ai=20&ax=30&r=0&c=&ph=True&cri=6" target="_blank" class="none style8">Doctorate</a>&nbsp;
                                          <span class="style7">|</span>&nbsp;
                                          <a href="../Member/SearchResult.aspx?typ=2&g=True&ai=20&ax=30&r=0&c=&ph=True&cri=10" target="_blank" class="none style8">Diploma</a>&nbsp;
                                          <span class="style7">|</span>&nbsp;
                                           <a href="../Guest/SearchOptions.aspx" target="_blank" class="style8">More...</a>
                                          </div>
                                          </td>
                                        </tr>
                                        
                                         <%--   SEARCH ON cITY --%>
                                        <tr>
                                          <td><div align="left">City:</div></td>
                                          <td style="width: 415px">
                                          <div align="left">
                                          <a href="../member/Searchprofile.aspx?id=keyword&Cty=Delhi" target="_blank" class="none style8">Delhi</a>&nbsp;
                                          <span class="style7">|</span>&nbsp;
                                          <a href="../member/Searchprofile.aspx?id=keyword&Cty=Calcutta" target="_blank" class="none style8">Calcutta</a>&nbsp;
                                          <span class="style7">|</span>&nbsp;
                                          <a href="../member/Searchprofile.aspx?id=keyword&Cty=Mumbai" target="_blank" class="none style8">Mumbai</a>&nbsp;
                                          <span class="style7">|</span>&nbsp;
                                          <a href="../member/Searchprofile.aspx?id=keyword&Cty=Chennai" target="_blank" class="none style8">Chennai</a>
                                          <span class="style7"> |</span> 
                                           <a href="../Guest/SearchOptions.aspx" target="_blank" class="style8">More...</a>
                                          </div>
                                          </td>
                                        </tr>
                                        
                                        <tr>
                                          <td>&nbsp;</td>
                                          <td style="width: 415px">&nbsp;</td>
                                        </tr>
                                      </tbody></table></td>
                                      <td width="29%"><strong>
                                      <img src="../Resources/1star.gif" align="absmiddle" height="12" width="15"/>
                                          &nbsp; Create your Profile FREE<br/><br/>
                                      <img src="../Resources/1star.gif" align="absmiddle" height="12" width="15"/>
                                          &nbsp; Send Express Interest<br/><br/>
	                                  <img src="../Resources/1star.gif" align="absmiddle" height="12" width="15"/>
                                          &nbsp; Personalized Messages</strong><br/><br/>
                                       <img src="../Resources/1star.gif" align="absmiddle" height="12" width="15"/>
                                          &nbsp; <strong>Enjoy direct contact</strong> </td>
                                    </tr>
                                    <tr>
                                      <td colspan="2">&nbsp;</td>
                                    </tr>
                                    <%-- India's largest  brides and grooms  --%>
                                    <tr>
                                      
                                    </tr>
                                  </tbody>
                                </table>

                                </div>
                          <%--  END LEFT PART  --%>	
                          </td>
                     </tr>
    			
                    <tr>
                <td>
                    &nbsp;
                    <uc1:Footer_G ID="Footer_G1" runat="server" />
                    <%--  Foot Link --%>
    </td>
      </tr>
                </tbody>
            </table>
        </div>




         <div>
            <%--  Link Map To Register Aand Sign In --%>
                    <map name="Map2">
	                    <area shape="rect" coords="26,90,170,125" href="JoinNow.aspx" alt="FREE Join - Bride & Groom Matrimony"/>
	                    <area shape="rect" coords="185,92,316,125" href="SearchOptions.aspx" alt="View Profile - Indian Brides and Grooms"/>
                    </map>
                    
                     <map name="Map3">
	                    <area shape="rect" coords="87,142,182,172" href="JoinNow.aspx" alt="FREE Join - Bride & Groom Matrimony"/>
                </map>
            <%--  Link Map To Register Aand Sign In Ends --%>

            <%-- Link Map To Menu Items  --%>

                    <map name="Mapmenu" id="Mapmenu">
                        <%-- Index --%>
	                    <area shape="rect" coords="10,5,59,25" href="Home.aspx"/>
	                     <%-- registration --%>
	                    <area shape="rect" coords="74,3,156,24" href="JoinNow.aspx" title="registration."/>
	                    <%-- login --%>
	                    <area shape="rect" coords="172,6,268,24" href="login.aspx"/> 
	                    <%-- searchoption- --%>
	                    <area shape="rect" coords="282,5,378,22" href="SearchOptions.aspx"/>
	                    <%-- membership --%>
	                    <area shape="rect" coords="393,3,481,25" href="../Guest/Membership.aspx"/>
	                    <%-- help --%>
	                    <area shape="rect" coords="494,5,527,25" href="../Extras/Help.aspx"/>
	                    <%-- successstory --%>
	                    <area shape="rect" coords="541,4,650,24" href="successstory.aspx"/>
	                    <%-- paymentoptions --%>
	                    <area shape="rect" coords="659,4,776,21" href="../Extras/PaymentOptions.aspx"/>
                    </map>

            <%--  Link Map To Menu Items Ends--%>
      </DIV>
</body>
</html>

