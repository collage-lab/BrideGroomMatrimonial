<%@ Page Language="C#" MasterPageFile="~/Guest/Guest.master" Title="No record Found" %>
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
                                    <span style="color: gray">
                                    Our various search tools will make your partner search much faster and easier. Go
                                    ahead and enjoy your search. </span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div align="center">
                                        <table bgcolor="#dfea93" border="0" cellpadding="0" cellspacing="0" class="submenubox"
                                            width="100%">
                                            <tbody>
                                                <tr>
                                                    <td align="center" class="Alert">
                                                        <strong>
                                                            <img align="absMiddle" border="0" src="../Resources/warning.png" />
                                                            No Such Records Found</strong>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <ul class="Alert">
                                                            <li>There are no records matching records specified by you </li>
                                                            <li>We recommend that you search again by modifying your search criteria. </li>
                                                            <li>Try again our various search Option below. </li>
                                                            <li>OR Try Simple Search Option below. </li>
                                                        </ul>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
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
                                                    <strong><a class="bodylink" href="../Member/adv_search.aspx?">Regular Search</a></strong>
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
                                                    <strong><a class="bodylink" href="../Member/Searchprofile.aspx?id=keyword">Keyword Search</a></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#f0f0f0" width="25%">
                                                    <div align="center">
                                                        <img src="../Resources/keywordsearchlense.gif" />&nbsp;</div>
                                                </td>
                                                <td bgcolor="#f0f0f0" width="75%">
                                                    Enter a word related to your search. For e.g. enter<strong> Trivandrum </strong>
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
                                                    <strong><a class="bodylink" href="../Member/Searchprofile.aspx?id=edu">Educational Search</a></strong>
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
                                                    <strong><a class="bodylink" href="../Member/Searchprofile.aspx?id=occ">Occupational
                                                        Search </a></strong>
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
                                                    <strong><a class="bodylink" href="../Member/ID_Search.aspx">Matrimony ID Search </a>
                                                    </strong>
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