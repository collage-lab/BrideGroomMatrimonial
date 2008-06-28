using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Guest_Verification : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        /// if check Link is working 
        /// redirect to registration
        /// else 
        /// alow use to register 
        /// 


        if (!IsPostBack)
        {
            string strUrl = Request.QueryString["Key"]; ;
            strUrl = Crypto.DeCrypto(strUrl);
            switch (Request.QueryString["id"].ToLower())
            {
                case "r"://Registration
                    if (strUrl != null)
                    {
                        sbyte sbyteIndex = (sbyte)strUrl.IndexOf('#');

                        string strTempDate = strUrl.Substring(0, sbyteIndex);

                        DateTime dateSendDate = DateTime.Parse(strTempDate);

                        TimeSpan TSDiff = (DateTime.Now - dateSendDate);
                        if (TSDiff.Days <= 2)
                        {
                            //Checks Does user present inside database
                            string strKey = Crypto.EnCrypto(strUrl.Substring(sbyteIndex + 1));
                            //Getting Application String
                            string strKeyAppId = MatrimonialMemberShip.GetApplicationID(strKey, true,true);
                            if (strKeyAppId == null)
                            {
                                FormsAuthentication.SetAuthCookie("Registar", false);
                                Server.Transfer("~/Registration/RegistrationStep1.aspx?key=" + Server.UrlEncode(strKey), true);
                            }
                            else
                            {
                                //user Present In database  // forTesting
                            }
                        }
                        else
                        {
                            // forTesting
                        }
                    }
                    else
                    {
                        // forTesting
                    }
                    break;



                case "p":// get Password

                    if (strUrl != null)
                    {
                        sbyte sbyteIndex = (sbyte)strUrl.IndexOf('$');

                        string strTempDate = strUrl.Substring(0, sbyteIndex);

                        DateTime dateSendDate = DateTime.Parse(strTempDate);

                        TimeSpan TSDiff = (DateTime.Now - dateSendDate);
                        if (TSDiff.Days <= 2)
                        {
                            //Checks Does user present inside database
                            string strKeyAppId = Crypto.EnCrypto(strUrl.Substring(sbyteIndex + 1));
                            //Getting Application String
                            strKeyAppId = MatrimonialMemberShip.GetApplicationID(strKeyAppId, true,false);
                            if (strKeyAppId!= null)
                            {
                                //Ok Now Change your password
                                string SeqtKey = RandomString.GenerateStirng(6, false);
                                Session.Add(SeqtKey, strKeyAppId);
                                Server.Transfer("~/Guest/newPassword.aspx?key=" + Server.UrlEncode(SeqtKey), true);
                            }
                            else
                            {
                                //The user is not in data base 
                                Response.Write("strKeyAppId");
                            }
                        }
                        else
                        {
                            //The link Expred
                            Response.Write("Day");
                        }
                    }
                    break;

                default:



                    break;

            }

        }
    }
}
