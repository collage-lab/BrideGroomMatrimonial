<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SmallMember.ascx.cs" Inherits="WeBControls_SmallMember" %>



<table style="border-right: #ff00cc 1px solid; border-top: #ff00cc 1px solid; border-left: #ff00cc 1px solid; border-bottom: #ff00cc 1px solid; width: 256px;">
    <tr>
        <td style=" background-color: #ffe8f2;">
            <table style="background-color: #fff7fb; width: 246px;" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="border-right: #ff0099 1px solid;text-align: center; background-color: white; width: 72px;" rowspan="6">
                       <center> <asp:Image ID="IMG_Main" runat="server" BorderColor="Fuchsia" BorderStyle="Solid" BorderWidth="1px" ToolTip="Do you Like me" ImageUrl="~/Resources/nophoto.gif" Height="104px" Width="99px" /><br />
                        <asp:Label ID="L_MatID" runat="server" Font-Bold="True" ForeColor="Gray"></asp:Label>
                        </center>
                        </td>
                    
                    <td style="width: 3px;" rowspan="6"></td>
    
                    <td style="width: 132px; height: 20px;" >
                        <asp:Label ID="L_Name" runat="server" Visible="False"></asp:Label></td>
                </tr>
                
                <tr>

                    <td style="width: 132px; height: 24px;">
                        <asp:Label ID="L_Age" runat="server"></asp:Label></td>
                </tr>
                <tr>

                    <td style="width: 132px; height: 22px;">
                        <asp:Label ID="L_Religion" runat="server"></asp:Label></td>
                </tr>
                <tr>

                    <td style="width: 132px; height: 22px;">
                        <asp:Label ID="L_Location" runat="server"></asp:Label></td>
                </tr>
                <tr>

                    <td style="width: 132px; height: 23px;">
                        <asp:Label ID="L_MS" runat="server" Font-Bold="True"></asp:Label></td>
                </tr>
                <tr>
                </tr>
                
                <tr>
                    <td bgcolor="#ffe8f2" style="vertical-align:middle; text-align: center;border-top: #ff0099 1px solid; width: 72px;">

                    <%Response.Write(IFrame()); %>

                    </td>

                    <td style="vertical-align:middle; text-align:center;border-top: #ff0099 1px solid;" bgcolor="#ffe8f2" colspan="4" >
                        &nbsp;<asp:HyperLink ID="HL_ViewProfile" runat="server" ImageUrl="~/Resources/View-Profile.gif">View Profile</asp:HyperLink></td>
                </tr>    

        </table>
        </td>
    </tr>
</table>
