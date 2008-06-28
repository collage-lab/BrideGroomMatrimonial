<%@ Page Language="C#" MasterPageFile="~/Guest/Guest.master" Title="Search Options" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        // Adding meta Discription
        HtmlMeta objMeta = new HtmlMeta();
        objMeta.Name = "Description";
        objMeta.Content = WebConfig.GetValues("MetaDiscription");
        this.Header.Controls.Add(objMeta);

        // Adding meta KeyWords
        objMeta = new HtmlMeta();
        objMeta.Name = "keywords";
        objMeta.Content = WebConfig.GetValues("MetaKeword");
        this.Header.Controls.Add(objMeta);
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="GuestContent" Runat="Server">
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
                                                    <strong><a class="bodylink" href="simplesearch.aspx">Simple Search</a></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#f0f0f0" width="25%">
                                                    <div align="center">
                                                        <img src="../Resources/searchlense.gif" /></div>
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
                                                    <strong><a class="bodylink" href="../Member/adv_search.aspx">Regular Search</a></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#f0f0f0" width="25%">
                                                    <div align="center">
                                                        <img src="../Resources/advsearchlense.gif" /></div>
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
                                                    <strong><a class="bodylink" href="../member/Searchprofile.aspx?id=keyword">Keyword Search</a></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#f0f0f0" width="25%">
                                                    <div align="center">
                                                        <img src="../Resources/keywordsearchlense.gif" /></div>
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
                                                    <strong><a class="bodylink" href="../member/Searchprofile.aspx?id=edu">Educational Search</a></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#f0f0f0" width="25%">
                                                    <div align="center">
                                                        <img src="../Resources/edu-search.gif" /></div>
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
                                                    <strong><a class="bodylink" href="../member/Searchprofile.aspx?id=occ">Occupational
                                                        Search </a></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#f0f0f0" width="25%">
                                                    <div align="center">
                                                        <img src="../Resources/Occ-search.gif" /></div>
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
                                                    <strong><a class="bodylink" href="../Member/ID_Search.aspx">Matrimony ID Search </a>
                                                    </strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#f0f0f0" width="25%">
                                                    <div align="center">
                                                        <img src="../Resources/idsearchlense.gif" /></div>
                                                </td>
                                                <td bgcolor="#f0f0f0" width="75%">
                                                    Enter Matrimony ID directly helps you to view the profile of a particular ID.</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
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
</asp:Content>

