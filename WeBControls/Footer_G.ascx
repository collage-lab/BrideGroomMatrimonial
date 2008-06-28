<%@ Control Language="C#" ClassName="Footer_G" %>

<script runat="server">

</script>
<center>
<table border="0"  width="780" style="height: 103px">
    <tr><td style="height: 4px" bgcolor="#be4588"></td></tr>
    <tr>
        <td style="height: 32px; color: #ff9933;">
            <p align="center">
                    <a href="../Default.aspx" style="text-decoration: none;">Home </a> - 
                    <a href="../Extras/PrivacyPolicy.aspx"style="text-decoration: none;">Privacy Policy</a> - 
                    <a href="../Extras/Aboutus.aspx"style="text-decoration: none;">About Us</a> - 
                    <a href="../Extras/FeedBack.aspx"style="text-decoration: none;">Feed Back</a> - 
                    <a href="../Guest/SuccessStory.aspx"style="text-decoration: none;">Success Stories</a> - 
                    <a href="../Extras/Sitemap.aspx"style="text-decoration: none;">Sitemap </a>
                </p>
        </td>
    </tr>
    <tr>
        <td style="height: 47px">
          <div align="center">
              <span style="color: gray"><%Response.Write(WebConfig.GetValues("WebFooter")); %></span>
              <br />
              <br />
              <a href="#" style="text-decoration: none;" onclick="window.open('../Extras/terms_con.aspx','terms','scrollbars=yes,width=600')">
              User Agreement and Terms of Use </a>
              <br />
          </div>
        </td>
    </tr>
    <tr><td style="height: 7px"></td></tr>

</table>
</center>