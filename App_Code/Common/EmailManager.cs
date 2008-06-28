using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Net.Mail;
//using System.Web.Mail;
//using System.Net.Mail;


/// <summary>
/// Summary description for Mail
/// </summary>
public class EmailManager
{
    public enum MailingType : int { Newstetter = 1, SupportMail = 2, NewProduct = 3, ToAll = 4, TOActiveMembers = 5, ToInActiveMembers = 6, TOPaidMembers = 7 }
    public EmailManager()
	{
	}

    public static bool SendMail(string TO, string From,string Subject,string Body)
    {
        try
        {

            MailAddress SendFrom = new MailAddress(From);
            MailAddress SendTo = new MailAddress(TO);
            //MailAddress SendCC = new MailAddress(txtCC.Text);
            //MailAddress SendBCC = new MailAddress(txtBCC.Text);

            MailMessage MyMessage = new MailMessage(SendFrom, SendTo);

            //MyMessage.CC.Add(SendCC);
            //MyMessage.Bcc.Add(SendBCC);

            MyMessage.Subject = Subject;
            MyMessage.Body = Body;

            SmtpClient emailClient = new SmtpClient(WebConfig.GetValues(WebConfig.ConfigurationItem.mailserver));
            emailClient.Send(MyMessage);
            return true;


        }
        catch (System.Web.HttpException HE)
        {
            ErrorLog.WriteErrorLog("EmailManager.SendMail", HE);
            return true;
        }
        catch (Exception Ex)
        {
            ErrorLog.WriteErrorLog("EmailManager.SendMail", Ex);
            return true;
        }
            
    }


    public static void SendBulkMail(MatrimonialMessanger.MailingType Type, string From, string[] MailList, string Subject, string Body)
    {
        if (MailList[0] != null)
        {
            try
            {
                MailAddress SendFrom = new MailAddress(From);
                MailAddress SendTo = new MailAddress(MailList[0]);
                //MailAddress SendCC = new MailAddress(CCAdd);
                MailMessage MyMessage = new MailMessage(SendFrom, SendTo);
                foreach (string eMailID in MailList)
                {
                    MailAddress SendBCC = new MailAddress(eMailID);
                    MyMessage.Bcc.Add(SendBCC);
                }
                //MyMessage.CC.Add(SendCC);

                MyMessage.Subject = Subject;
                MyMessage.Body = Body;

                SmtpClient emailClient = new SmtpClient(WebConfig.GetValues(WebConfig.ConfigurationItem.mailserver));
                emailClient.Send(MyMessage);
            }
            catch (System.Web.HttpException HE)
            {
                ErrorLog.WriteErrorLog("EmailManager.SendBulkMail", HE);
            }
            catch (Exception Ex)
            {
                ErrorLog.WriteErrorLog("EmailManager.SendBulkMail", Ex);
            }
        }
    
    }


}
