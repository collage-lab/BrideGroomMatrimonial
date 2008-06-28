<%@ Control Language="C#" ClassName="Footer_M" %>

<script runat="server">

</script>

<table border="0"  width="780" style="height: 103px">
    <tr><td style="height: 4px" bgcolor="#be4588"></td></tr>
    <tr>
        <td style="height: 29px">
            <p align="center" >
                    <a style="TEXT-DECORATION: none"href="../Default.aspx">Home </a> - <a style="TEXT-DECORATION: none"href="../Extras/PrivacyPolicy.aspx">Privacy Policy</a> - 
                    <a style="TEXT-DECORATION: none"href="../Extras/Aboutus.aspx">About Us</a> - 
                    <a style="TEXT-DECORATION: none"href="../Extras/FeedBack.aspx">Feed Back</a> - 
                    <a style="TEXT-DECORATION: none"href="../Member/SubmitSuccessStories.aspx">Submit Success Stories</a> - 
                    <a style="TEXT-DECORATION: none"href="../Extras/Sitemap.aspx">Sitemap </a>
                </p>
        </td>
    </tr>
    <tr>
        <td style="height: 46px">
          <div align="center">
              <strong><span style="color: gray">
              <%  Response.Write(WebConfig.GetValues("WebFooter")); %>
              </span></strong>
              <br /><br />
              <a style="TEXT-DECORATION: none"href="#" onclick="window.open('../Extras/terms_con.aspx','terms','scrollbars=yes,width=600')">
              User Agreement and Terms of Use </a>
              <br />
          </div>
        </td>
    </tr>
    <tr><td style="height: 7px"></td></tr>

</table>
