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

public partial class Member_Interests : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
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

            bool isInbox ;
            if (Request.QueryString["typ"] == "o") // Inbox
            {
                isInbox = false;
            }
            else
            {
                isInbox = true;
            }
            try
            {
                HttpCookieCollection objHttpCookieCollection = Request.Cookies;
                HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");

                string strMatrimonialID = Crypto.DeCrypto(objHttpCookie.Values["MatrimonialID"]);

                int intCount; // Which Type 
                switch (Request.QueryString["id"])
                {
                    case "p":
                        if (isInbox) // Inbox
                        {
                            L_Type.Text = "Pending [Inbox]";
                            intCount = InternalMessage.GetIntrestCount(strMatrimonialID, InternalMessage.IntrestStatus.Pending, InternalMessage.MailType.Inbox);
                        }
                        else //Out Box
                        {
                            L_Type.Text = "Pending [Outbox]";
                            intCount = InternalMessage.GetIntrestCount(strMatrimonialID, InternalMessage.IntrestStatus.Pending, InternalMessage.MailType.OutBox);
                        }
                        break;
                    case "a":
                        if (isInbox) // Inbox
                        {
                            L_Type.Text = "Accepted [Inbox]";
                            intCount = InternalMessage.GetIntrestCount(strMatrimonialID, InternalMessage.IntrestStatus.Accepted, InternalMessage.MailType.Inbox);
                        }
                        else//Out Box
                        {
                            L_Type.Text = "Accepted [Outbox]";
                            intCount = InternalMessage.GetIntrestCount(strMatrimonialID, InternalMessage.IntrestStatus.Accepted, InternalMessage.MailType.OutBox);
                        }
                        break;
                    case "d":
                        if (isInbox) // Inbox
                        {
                            L_Type.Text = "Declined [Inbox]";
                            intCount = InternalMessage.GetIntrestCount(strMatrimonialID, InternalMessage.IntrestStatus.Declined, InternalMessage.MailType.Inbox);
                        }
                        else//Out Box
                        {
                            L_Type.Text = "Declined [Outbox]";
                            intCount = InternalMessage.GetIntrestCount(strMatrimonialID, InternalMessage.IntrestStatus.Declined, InternalMessage.MailType.OutBox);
                        }
                        break;
                    default:
                        if (isInbox) // Inbox
                        {
                            L_Type.Text = "Pending [Inbox]";
                            intCount = InternalMessage.GetIntrestCount(strMatrimonialID, InternalMessage.IntrestStatus.Pending, InternalMessage.MailType.Inbox);
                        }
                        else//Out Box
                        {
                            L_Type.Text = "Pending [Outbox]";
                            intCount = InternalMessage.GetIntrestCount(strMatrimonialID, InternalMessage.IntrestStatus.Pending, InternalMessage.MailType.OutBox);
                        }
                        break;
                }
                // Loading Controls


                //Setting Count
                L_Last_1.Text = intCount.ToString();
                if (intCount > 0)
                {
                    if (intCount < 10)
                    {
                        LB_Next_1.Enabled = false;
                        L_Current_1.Text = intCount.ToString();
                    }
                    else
                    {
                        LB_Next_1.Enabled = true;
                        L_Current_1.Text = "10";
                    }
                    HF_Start.Value = "0";
                    switch (L_Type.Text)
                    {
                        case "Pending [Inbox]":
                            LoadList(0, InternalMessage.GetIntrestList(strMatrimonialID, true, 0, MemberIntrest.TypeOfIntrest.Pending));
                            break;
                        case "Pending [Outbox]":
                            LoadList(0, InternalMessage.GetIntrestList(strMatrimonialID, false, 0, MemberIntrest.TypeOfIntrest.Pending));
                            break;
                        case "Accepted [Inbox]":
                            LoadList(0, InternalMessage.GetIntrestList(strMatrimonialID, true, 0, MemberIntrest.TypeOfIntrest.Approved));
                            break;
                        case "Accepted [Outbox]":
                            LoadList(0, InternalMessage.GetIntrestList(strMatrimonialID, false, 0, MemberIntrest.TypeOfIntrest.Approved));
                            break;
                        case "Declined [Inbox]":
                            LoadList(0, InternalMessage.GetIntrestList(strMatrimonialID, true, 0, MemberIntrest.TypeOfIntrest.Declined));
                            break;
                        case "Declined [Outbox]":
                            LoadList(0, InternalMessage.GetIntrestList(strMatrimonialID, false, 0, MemberIntrest.TypeOfIntrest.Declined));
                            break;
                    }

                }
                else
                {
                    L_Current_1.Text = "0";
                }

            }
            catch (Exception EX)
            {
                ErrorLog.WriteErrorLog("Intrest : 403 OR Cookie", EX);
                Server.Transfer("~/Extras/ErrorReport.aspx?id=cookie");
            }


        }   //if
    }


    #region"Navigation"


    protected void LB_Next_Click(object sender, EventArgs e)
    {

        HttpCookieCollection objHttpCookieCollection = Request.Cookies;
        HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");
        string strMatrimonialID = Crypto.DeCrypto(objHttpCookie.Values["MatrimonialID"]);


        //Previous Enabled
        LB_Previous_1.Enabled = true;
        //Getting values
        int intStart = int.Parse(HF_Start.Value);
        int intCount =0;

        switch (L_Type.Text)
        {
            case "Pending [Inbox]":
                intCount = InternalMessage.GetIntrestCount(strMatrimonialID, InternalMessage.IntrestStatus.Pending, InternalMessage.MailType.Inbox);
                break;
            case "Pending [Outbox]":
                intCount = InternalMessage.GetIntrestCount(strMatrimonialID, InternalMessage.IntrestStatus.Pending, InternalMessage.MailType.OutBox);
                break;
            case "Accepted [Inbox]":
                intCount = InternalMessage.GetIntrestCount(strMatrimonialID, InternalMessage.IntrestStatus.Accepted, InternalMessage.MailType.Inbox);
                break;
            case "Accepted [Outbox]":
                intCount = InternalMessage.GetIntrestCount(strMatrimonialID, InternalMessage.IntrestStatus.Accepted, InternalMessage.MailType.OutBox);
                break;
            case "Declined [Inbox]":
                intCount = InternalMessage.GetIntrestCount(strMatrimonialID, InternalMessage.IntrestStatus.Declined, InternalMessage.MailType.Inbox);
                break;
            case "Declined [Outbox]":
                intCount = InternalMessage.GetIntrestCount(strMatrimonialID, InternalMessage.IntrestStatus.Declined, InternalMessage.MailType.OutBox);
                break;
        }

        int intCurrent;

        intCurrent = intCount - (intStart + 10);
        //Update Start Pointer
        intStart += 10;
        HF_Start.Value = (intStart).ToString();
        if (intCurrent < 10)
        {
            LB_Next_1.Enabled = false;
            L_Current_1.Text = (intStart + intCurrent).ToString();
        }
        else
        {
            L_Current_1.Text = (intStart + 10).ToString();
        }
        //Getting SSList

        switch (L_Type.Text)
        {
            case "Pending [Inbox]":
                LoadList(intStart, InternalMessage.GetIntrestList(strMatrimonialID, true, intStart, MemberIntrest.TypeOfIntrest.Pending));
                break;
            case "Pending [Outbox]":
                LoadList(intStart, InternalMessage.GetIntrestList(strMatrimonialID, false, intStart, MemberIntrest.TypeOfIntrest.Pending));
                break;
            case "Accepted [Inbox]":
                LoadList(intStart, InternalMessage.GetIntrestList(strMatrimonialID, true, intStart, MemberIntrest.TypeOfIntrest.Approved));
                break;
            case "Accepted [Outbox]":
                LoadList(intStart, InternalMessage.GetIntrestList(strMatrimonialID, false, intStart, MemberIntrest.TypeOfIntrest.Approved));
                break;
            case "Declined [Inbox]":
                LoadList(intStart, InternalMessage.GetIntrestList(strMatrimonialID, true, intStart, MemberIntrest.TypeOfIntrest.Declined));
                break;
            case "Declined [Outbox]":
                LoadList(intStart, InternalMessage.GetIntrestList(strMatrimonialID, false, intStart, MemberIntrest.TypeOfIntrest.Declined));
                break;
        }

    }

    //Browsing the last 
    protected void LB_Previous_Click(object sender, EventArgs e)
    {
        HttpCookieCollection objHttpCookieCollection = Request.Cookies;
        HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");
        string strMatrimonialID = Crypto.DeCrypto(objHttpCookie.Values["MatrimonialID"]);

        LB_Next_1.Enabled = true;

        //Getting values
        int intStart = int.Parse(HF_Start.Value);
        int intCount = 0;

        switch (L_Type.Text)
        {
            case "Pending [Inbox]":
                intCount = InternalMessage.GetIntrestCount(strMatrimonialID, InternalMessage.IntrestStatus.Pending, InternalMessage.MailType.Inbox);
                break;
            case "Pending [Outbox]":
                intCount = InternalMessage.GetIntrestCount(strMatrimonialID, InternalMessage.IntrestStatus.Pending, InternalMessage.MailType.OutBox);
                break;
            case "Accepted [Inbox]":
                intCount = InternalMessage.GetIntrestCount(strMatrimonialID, InternalMessage.IntrestStatus.Accepted, InternalMessage.MailType.Inbox);
                break;
            case "Accepted [Outbox]":
                intCount = InternalMessage.GetIntrestCount(strMatrimonialID, InternalMessage.IntrestStatus.Accepted, InternalMessage.MailType.OutBox);
                break;
            case "Declined [Inbox]":
                intCount = InternalMessage.GetIntrestCount(strMatrimonialID, InternalMessage.IntrestStatus.Declined, InternalMessage.MailType.Inbox);
                break;
            case "Declined [Outbox]":
                intCount = InternalMessage.GetIntrestCount(strMatrimonialID, InternalMessage.IntrestStatus.Declined, InternalMessage.MailType.OutBox);
                break;
        }

        intStart -= 10;
        // End of record?
        if (intStart < 10)
        {
            LB_Previous_1.Enabled = false;
            L_Current_1.Text = "10";

        }
        else
        {
            L_Current_1.Text = (intStart + 10).ToString();

        }
        //Update Start Pointer
        HF_Start.Value = (intStart).ToString();
        //Getting SSList

        switch (L_Type.Text)
        {
            case "Pending [Inbox]":
                LoadList(intStart, InternalMessage.GetIntrestList(strMatrimonialID, true, intStart, MemberIntrest.TypeOfIntrest.Pending));
                break;
            case "Pending [Outbox]":
                LoadList(intStart, InternalMessage.GetIntrestList(strMatrimonialID, false, intStart, MemberIntrest.TypeOfIntrest.Pending));
                break;
            case "Accepted [Inbox]":
                LoadList(intStart, InternalMessage.GetIntrestList(strMatrimonialID, true, intStart, MemberIntrest.TypeOfIntrest.Approved));
                break;
            case "Accepted [Outbox]":
                LoadList(intStart, InternalMessage.GetIntrestList(strMatrimonialID, false, intStart, MemberIntrest.TypeOfIntrest.Approved));
                break;
            case "Declined [Inbox]":
                LoadList(intStart, InternalMessage.GetIntrestList(strMatrimonialID, true, intStart, MemberIntrest.TypeOfIntrest.Declined));
                break;
            case "Declined [Outbox]":
                LoadList(intStart, InternalMessage.GetIntrestList(strMatrimonialID, false, intStart, MemberIntrest.TypeOfIntrest.Declined));
                break;
        }



    }
    #endregion

    private void LoadList(int Index, MemberIntrest[] memberIntrest)
    {
        if (memberIntrest[0] != null)
        {
            memberIntrest[0].Index = ++Index;
            Intrest_1.Bind(memberIntrest[0]);
        }
        else
        {
            Intrest_1.Visible = false;
        }
        if (memberIntrest[1] != null)
        {
            memberIntrest[1].Index = ++Index;
            Intrest_2.Bind(memberIntrest[1]);
        }
        else
        {
            Intrest_2.Visible = false;
        }
        if (memberIntrest[2] != null)
        {
            memberIntrest[2].Index = ++Index;
            Intrest_3.Bind(memberIntrest[2]);
        }
        else
        {
            Intrest_3.Visible = false;
        }
        if (memberIntrest[3] != null)
        {
            memberIntrest[3].Index = ++Index;
            Intrest_4.Bind(memberIntrest[3]);
        }
        else
        {
            Intrest_4.Visible = false;
        }
        if (memberIntrest[4] != null)
        {
            memberIntrest[4].Index = ++Index;
            Intrest_5.Bind(memberIntrest[4]);
        }
        else
        {
            Intrest_5.Visible = false;
        }
        if (memberIntrest[5] != null)
        {
            memberIntrest[5].Index = ++Index;
            Intrest_6.Bind(memberIntrest[5]);
        }
        else
        {
            Intrest_6.Visible = false;
        }
        if (memberIntrest[6] != null)
        {
            memberIntrest[6].Index = ++Index;
            Intrest_7.Bind(memberIntrest[6]);
        }
        else
        {
            Intrest_7.Visible = false;
        }
        if (memberIntrest[7] != null)
        {
            memberIntrest[7].Index = ++Index;
            Intrest_8.Bind(memberIntrest[7]);
        }
        else
        {
            Intrest_8.Visible = false;
        }
        if (memberIntrest[8] != null)
        {
            memberIntrest[8].Index = ++Index;
            Intrest_9.Bind(memberIntrest[8]);
        }
        else
        {
            Intrest_9.Visible = false;
        }
        if (memberIntrest[9] != null)
        {
            memberIntrest[9].Index = ++Index;
            Intrest_10.Bind(memberIntrest[9]);
        }
        else
        {
            Intrest_10.Visible = false;
        }

    }
}
