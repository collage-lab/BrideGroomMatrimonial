<%@ Page Language="C#" MasterPageFile="~/Member/MemberMaster.master" AutoEventWireup="true" CodeFile="SearchProfile.aspx.cs" Inherits="Member_SearchProfile" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPH_Member" Runat="Server">

    		
    <script language="JavaScript" type="text/jscript">
            <!--
              function caste_disable(obj,ObjHf,ObjCst){
                  ObjHf.innerText= "0";
	                if(obj.options[obj.selectedIndex].text != 'Hindu' &&
		                obj.options[obj.selectedIndex].text != 'Muslim' &&
		                obj.options[obj.selectedIndex].text != 'Christian' &&
		                obj.options[obj.selectedIndex].text != 'Jain' &&
		                obj.options[obj.selectedIndex].text != 'Sikh')
		            {
	                    ObjCst.options[0]=new Option("Not Applicable","1",true);
	                    ObjCst.selectedIndex = 0;
                        ObjCst.disabled = true;
                        ObjHf.innerText = 0;
	                }
	                else 
	                {
		                ObjCst.disabled = false;
		                get_caste(obj,ObjCst,0);
	                }
                }
                //-->
    </script>

    <script language="javascript" type="text/jscript">
            <!--
            var caste=new Array();
                caste["Hindu"] = ["Adi Dravida","Agarwal","Anavil Brahmin","Arora","Arya Vysya","Aryasamaj","Audichya Brahmin","Bahi","Balija Naidu","Bengali","Bengali Brahmin","Bhandari","Billava","Brahmin","Brahmin Bhumihar","Brahmin Goswami","Brahmin Kanada Madhva","Brahmin Kanyakubja","Brahmin Niyogi Nandavariki","Brahmin Saryuparin","Brahmin Tyagi","Bunt","Chaurasia","Chettiar","Coorgi","Davadnya Brahmin","Dawoodi Bhora","Deshastha Brahmin","Devanga","Dhaneshawat Vaish","Dhiman Brahmin","Digambar","Ezhava","Ezhuthachan","Garhwali Brahmins","Garhwali Rajput","Gomantak Maratha","Goswami","Gounder","Gour Brahmin","Gowd Saraswat Brahmin","Gowda","Gujarati","Gupta","Gurjar","Havyaka Brahmin","Iyengar","Iyer","Iyer Brahmin","Jaiswal","Jat","Kalar","Kalinga Vysya","Kamboj","Kamma","Kannada Mogaveera","Kapu","Kapu Naidu","Karhade Brahmin","Karuneekar","Kashmiri Pandit (Brahmin)","Kashyap","Kayastha","Khatri","Kokanastha Brahmin","Kongu Vellala Gounder","Kori","Koshti","Kshatriya","Kumaoni Brahmins","Kumaoni Rajput","Kumawat","Kumbara","Kunbi","Kurmi","Kuruba","Leva Patil","Lingayat","Lohana","Maithil Brahmin","Malayalee Namboodiri","Malayalee Variar","Mali","Maharashtrian","Maharashtrian Brahmin","Maheshwari","Maratha","Maruthuvar","Marvar","Marwari","Maurya","Menon","Mudaliar","Mudaliar Arcot","Mudaliar Saiva","Mudaliar Senguntha","Mukulathur","Nadar","Nagar Brahmin","Naidu","Nair","Nair Vaniya","Nambiar","Nepali","OBC (Barber-Naayee)","Padmashali","Patel Desai","Patel Kadva","Patel Leva","Perika","Pillai","Prajapati","Punjabi","Punjabi Brahmin","Rajput","Reddy","Saraswat Brahmins","Sahu","Scheduled Caste","Sepahia","Setti Balija","Sindhi","Somvanshi","Sonar","Sowrashtra","Sozhiya Vellalar","Sutar","Swarnakar","Tamil Yadava","Teli","Telugu","Telugu Brahmin","Thevar","Thiyya","Udayar","Vaidiki Brahmin","Vaishnav","Vaishnav Bhatia","Vaishnav Vania","Varshney","Vanniyakullak Shatriya","Vanniyar","Veerashaiva","Velethadathu Nair","Vellalar","Vellama","Vishwakarma","Viswabrahmin","Vokaliga","Vysya","Yadav"];
                caste["Muslim"] = ["Bengali","Dawoodi Bohra","Ehle-Hadith","Memon","Rajput","Shia","Shia Imami Ismaili","Sunni"];
                caste["Christian"] = ["Catholic","CMS","CSI","Evangelical","Jacobite","Marthoma","Nadar","Protestant","Syrian"];
                caste["Jain"] = ["Digambar","Shewetamber","Vania"];
                caste["Sikh"] = ["Clean Shaven","Gursikh","Jat","Kamboj","Kesadhari","Khatri","Ramgharia"];

	            function get_caste(obj,ojCst,show_default)
	            {

		            var sel_caste = '';

		            var sel_DDL_Religion	= obj.options[obj.selectedIndex].text;

		            var caste_obj		= ojCst;

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
        	    //-->

    </script>
        	
    <script language="JavaScript" type="text/jscript">
            <!--
	        function loadHF(ObjCst,ObjHf){
                ObjHf.innerText = ObjCst.selectedIndex;
                }
                //-->
    </script>
    <script language="JavaScript" type="text/jscript">
            <!--
	        function PageLoad(Obj){
                ObjCst.selectedIndex = 1;
                }
                //-->
    </script>
    <table align="center" border="0" cellpadding="0" cellspacing="0" height="20" width="97%">
                <tbody>
                    <tr>
                        <td background="../Resources/heading_bg.gif" width="37%">
                            <div align="left">
                                &nbsp; <span class="bodysg">
                                    <asp:Label ID="L_SearchType" runat="server" Text="Simple Search"></asp:Label>
                                </span>
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
                        <td style="height: 334px">
                            <table id="content" align="center" border="0" cellpadding="5" cellspacing="4" width="97%">
                                <tbody>
                                    <tr>
                                        <td colspan="2">
                                            <p align="justify">
                                                <img align="left" height="28" src="../Resources/searchicon.gif" width="28" />
                                                Search based on a 
                                                <asp:Label ID="L_criteria" runat="server" Text="Simple"></asp:Label>
                                                criteria one would look for in a partner. Results can be
                                                viewed as Thumbnail View, Full View. If you like a profile you can Express Interest
                                                or Send Mail.</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                                <table border="0" cellpadding="3" cellspacing="2" width="100%">
                                                    <tbody>
                                                        <tr>
                                                            <td colspan="2" height="20" style="text-align: left">
                                                                <strong><a href="#"><span style="color: #0000ff">Reach out to your spouse with a click
                                                                    of the mouse</span></a></strong></td>
                                                        </tr>
                                                        <tr style="color: #0000ff">
                                                            <td width="25%">
                                                                <div align="left">
                                                                    Looking for
                                                                </div>
                                                            </td>
                                                            <td width="75%">
                                                                <div align="left">
                                                                    &nbsp;<asp:RadioButton ID="RB_Male" runat="server" Checked="True" GroupName="lookingfor" Text="Male" />&nbsp;<asp:RadioButton
                                                                        ID="RB_Fmale" runat="server" GroupName="lookingfor" Text="Female" />
                                                                    &nbsp; &nbsp;&nbsp;
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr id ="TR_Age" runat ="server" visible ="false">
                                                            <td>
                                                                <div align="left">
                                                                    Age</div>
                                                            </td>
                                                            <td>
                                                                <div align="left">
                                                                    From &nbsp;<asp:TextBox ID="TB_AgeMin" runat="server" CssClass="forminput" Width="20px">20</asp:TextBox><asp:RequiredFieldValidator
                                                                        ID="RequiredFieldValidator2" runat="server" ControlToValidate="TB_AgeMin" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                                    to &nbsp;<asp:TextBox ID="TB_AgeMax" runat="server" CssClass="forminput" Width="20px">30</asp:TextBox><asp:RequiredFieldValidator
                                                                        ID="RequiredFieldValidator5" runat="server" ControlToValidate="TB_AgeMax" ErrorMessage="*"></asp:RequiredFieldValidator>&nbsp;
                                                                    years&nbsp;
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        
                                                          <tr id ="TR_Relegion" runat ="server" visible = "false">
                                                            <td>
                                                                <div align="left">
                                                                    Religion</div>
                                                            </td>
                                                            <td>
                                                                <div align="left">
                                                                    <asp:DropDownList ID="DDL_Religion" runat="server" CssClass="forminput" Width="179px">
                                                                    </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                                        ControlToValidate="DDL_Religion" ErrorMessage="*" InitialValue="0" Visible="False"></asp:RequiredFieldValidator>&nbsp;</div>
                                                            </td>
                                                        </tr>
                                                        <tr id="TR_Caste" runat ="server" visible = "false">
                                                            <td>
                                                                <div align="left">
                                                                    Caste</div>
                                                            </td>
                                                            <td>
                                                                <div align="left">
                                                                    <select id="S_Caste" runat="server" class="forminput" name="caste" style="width: 179px">
                                                                        <option selected="selected" value="Any">-- Select --</option>
                                                                    </select>
                                                                    &nbsp;</div>
                                                            </td>
                                                        </tr>
                                                        <tr id = "TR_Cat" runat ="server" visible = "false">
                                                            <td>
                                                                <div align="left">
                                                                    <asp:Label ID="L_Cato_1" runat="server" Text="E/O/K"></asp:Label>&nbsp;</div>
                                                            </td>
                                                            <td>
                                                                <div align="left">
                                                                    <asp:DropDownList ID="DDL_Cat_1" runat="server" CssClass="forminput" Width="333px">
                                                                    </asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="RFV_CAT1" runat="server" ControlToValidate="DDL_Cat_1"
                                                                        ErrorMessage="*" InitialValue="0" Visible="False"></asp:RequiredFieldValidator>
                                                                    <asp:TextBox ID="TB_Keyword" runat="server" CssClass="forminput"
                                                                        Visible="False" Width="204px"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RFV_KeyWord" runat="server"
                                                                            ControlToValidate="TB_Keyword" ErrorMessage="*" Visible="False"></asp:RequiredFieldValidator></div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div align="left">
                                                                    Show</div>
                                                            </td>
                                                            <td>
                                                                <div align="left">
                                                                    <asp:CheckBox ID="CB_needPhoto" runat="server" Checked="True" />Profiles with
                                                                    Photo
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div align="left">
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div align="left">
                                                                    &nbsp;<asp:ImageButton ID="IMB_Search" runat="server" ImageUrl="~/Resources/search-button.gif" /></div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:HiddenField ID="HF_Cast" runat="server" /><asp:HiddenField ID="HF_Type" runat="server" />
                                            &nbsp;&nbsp;</td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>

</asp:Content>

