<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MemberPannel.ascx.cs" Inherits="WeBControls_MemberPannel" %>


<table style="border-right: #ff00cc 1px solid; border-top: #ff00cc 1px solid; border-left: #ff00cc 1px solid; border-bottom: #ff00cc 1px solid; width: 425px; height: 198px;">
    <tr>
        <td style="height: 191px; background-color: #ffe8f2;">
            <table style="width:423px; height: 100%; background-color: #fff7fb;" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="border-right: #ff0099 1px solid;width: 139px;  text-align: center; background-color: white;" rowspan="6">
                        &nbsp;<asp:Image ID="IMG_Main" runat="server" BorderColor="Fuchsia" BorderStyle="Solid" BorderWidth="1px" ToolTip="Do you Like me" />
                        <br />
                        <br />
                        <asp:Label ID="L_MatID" runat="server" Font-Bold="True" ForeColor="Gray"></asp:Label></td>
                    <td style="width: 7px;" rowspan="6"></td>
                    <td >
                        <asp:Label ID="L_L_Name" runat="server" Font-Bold="True" Visible="False">Name</asp:Label></td>
                    <td style="width: 187px">
                        <asp:Label ID="L_Name" runat="server" Visible="False"></asp:Label></td>
                </tr>
                
                <tr>
                    <td style="width: 90px;">
                        <strong>Age</strong></td>
                    <td>
                        <asp:Label ID="L_Age" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 90px;">
                        <strong>Religion</strong></td>
                    <td>
                        <asp:Label ID="L_Religion" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 90px;">
                        <strong>Location</strong></td>
                    <td>
                        <asp:Label ID="L_Location" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td >
                        <strong>Matital status</strong></td>
                    <td>
                        <asp:Label ID="L_MS" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td >
                        <strong>Last Login</strong></td>
                    <td>
                        <asp:Label ID="L_LastLogIn" runat="server"></asp:Label></td>
                </tr>
                
                <tr>
                    <td bgcolor="#ffe8f2" style="vertical-align:middle; text-align: center;border-top: #ff0099 1px solid;">

                    <%Response.Write(IFrame()); %>

                    </td>

                    <td style="vertical-align:middle; text-align:center;border-top: #ff0099 1px solid;" bgcolor="#ffe8f2" colspan="4" >
                        &nbsp;<asp:HyperLink ID="HL_ViewProfile" runat="server" ImageUrl="~/Resources/View-Profile.gif" Target="_Blank">View Profile</asp:HyperLink></td>
                </tr>    

        </table>
        </td>
    </tr>
</table>
