<%@ Page Language="C#" MasterPageFile="~/Admin/Protected/Admin.master" AutoEventWireup="true" CodeFile="MemberReport.aspx.cs" Inherits="Admin_MemberReport" Title="Member Report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<SCRIPT LANGUAGE="Javascript" SRC="../../Chart/MatrimonialChart.js"></SCRIPT>
    <table id="content" border="0" cellpadding="1" cellspacing="1" height="0" width="100%">
       <tbody>
             
             <tr>
                 <td colspan="4" style="height: 54px" valign="middle">
                     <table border="0" cellpadding="0" cellspacing="0" width="100%">
                         <tbody>
                             <tr>
                                 <td style="width: 8%; height: 51px">
                                     <asp:Image ID="Img_icon" runat="server" ImageUrl="~/Resources/User-active32.gif" /></td>
                                 <td class="headertext" style="height: 51px" width="97%">
                                     &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                     <asp:Label ID="L_Report" runat="server" Font-Bold="True"></asp:Label>&nbsp;</td>
                             </tr>
                         </tbody>
                     </table>
                 </td>
             </tr>
              <tr>
                 <td width="15%" rowspan="4">
                 </td>
                 <td class="HeadText1" valign="top" colspan="3">
                     <span style="color: gray">Some Captions</span></td>
             </tr>
             <tr>
                 <td rowspan="2" width="5%"></td>
                 <td class="HeadText1" colspan="2" valign="top" rowspan="">
                     </td>
             </tr> 
             <tr>
                 <td class="HeadText1" style="height: 173px; text-align: center;" valign="top" width="600">
                     <br />
                    <%=DrowChart()%>
                     
                  
                 </td>
             </tr>
             <tr>
             <td style="height: 21px; text-align: right" colspan="3">
                 <asp:HiddenField ID="HF_Type" runat="server" />
                 &nbsp;</td>
             
             </tr>
         </tbody>
    </table>
</asp:Content>

