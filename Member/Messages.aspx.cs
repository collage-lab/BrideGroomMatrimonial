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

public partial class Member_Messages : System.Web.UI.Page
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

            HttpCookieCollection objHttpCookieCollection = Request.Cookies;
            HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");

            string strMatrimonialID = Crypto.DeCrypto(objHttpCookie.Values["MatrimonialID"]);

            int intCount = 0;
            if (Request.QueryString["id"] == "2")
            {
                intCount = MatrimonialMessanger.GetMessageCount(strMatrimonialID, true);
                HF_In_Out.Value = "1";
            }
            else
            {
                intCount = MatrimonialMessanger.GetMessageCount(strMatrimonialID, false);
                HF_In_Out.Value = "0";
            }
            //Setting Count
            L_Last_2.Text = intCount.ToString();
            L_Last_1.Text = intCount.ToString();
            if (intCount > 0)
            {
                IB_Delete_1.Visible = true;
                IB_Delete_2.Visible = true;
                if (intCount < 10)
                {
                    LB_Next_1.Enabled = false;
                    LB_Next_2.Enabled = false;

                    L_Current_1.Text = intCount.ToString();
                    L_Current_2.Text = intCount.ToString();
                }
                else
                {
                    LB_Next_1.Enabled = true;
                    LB_Next_2.Enabled = true;

                    L_Current_1.Text = "10";
                    L_Current_2.Text = "10";
                }
                HF_Start.Value = "0";
                HF_Count.Value = (intCount).ToString();
                if (Request.QueryString["id"] == "2")
                {

                    LoadList(InternalMessage.MailType.OutBox, MatrimonialMessanger.GetMessageList(0, strMatrimonialID, true), 0, strMatrimonialID);
                }
                else
                {
                    LoadList(InternalMessage.MailType.Inbox,MatrimonialMessanger.GetMessageList(0, strMatrimonialID, false), 0, strMatrimonialID);
                }
            }
            else
            {
                L_Current_1.Text = "0";
                L_Current_2.Text = "0";
            }
        }
    }



    #region"Navigation"


    protected void LB_Next_Click(object sender, EventArgs e)
    {

        HttpCookieCollection objHttpCookieCollection = Request.Cookies;
        HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");
        string strMatrimonialID = Crypto.DeCrypto(objHttpCookie.Values["MatrimonialID"]);


        //Previous Enabled
        LB_Previous_1.Enabled = true;
        LB_Previous_2.Enabled = true;
        //Getting values
        int intStart = int.Parse(HF_Start.Value);
        int intCount = int.Parse(HF_Count.Value);
        int intCurrent;
        intCurrent = intCount - (intStart + 10);
        //Update Start Pointer
        intStart += 10;
        HF_Start.Value = (intStart).ToString();
        if (intCurrent < 10)
        {
            LB_Next_1.Enabled = false;
            LB_Next_2.Enabled = false;
            L_Current_1.Text = (intStart + intCurrent).ToString();
            L_Current_2.Text = (intStart + intCurrent).ToString();
        }
        else
        {
            L_Current_1.Text = (intStart + 10).ToString();
            L_Current_2.Text = (intStart + 10).ToString();
        }
        //Getting SSList
        if (HF_In_Out.Value == "1")
        {

            LoadList(InternalMessage.MailType.OutBox,MatrimonialMessanger.GetMessageList(intStart, strMatrimonialID, true), intStart, strMatrimonialID);
        }
        else
        {
            LoadList(InternalMessage.MailType.Inbox,MatrimonialMessanger.GetMessageList(intStart, strMatrimonialID, false), intStart, strMatrimonialID);
        }
    }

    //Browsing the last 
    protected void LB_Previous_Click(object sender, EventArgs e)
    {
        HttpCookieCollection objHttpCookieCollection = Request.Cookies;
        HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");
        string strMatrimonialID = Crypto.DeCrypto(objHttpCookie.Values["MatrimonialID"]);

        LB_Next_1.Enabled = true;
        LB_Next_2.Enabled = true;

        //Getting values
        int intStart = int.Parse(HF_Start.Value);
        int intCount = int.Parse(HF_Count.Value);
        intStart -= 10;
        // End of record?
        if (intStart < 10)
        {
            LB_Previous_1.Enabled = false;
            LB_Previous_2.Enabled = false;
            L_Current_1.Text = "10";
            L_Current_2.Text = "10";

        }
        else
        {
            L_Current_1.Text = (intStart + 10).ToString();
            L_Current_2.Text = (intStart + 10).ToString();

        }
        //Update Start Pointer
        HF_Start.Value = (intStart).ToString();
        //Getting SSList
        if (HF_In_Out.Value == "1")
        {
            LoadList(InternalMessage.MailType.OutBox,MatrimonialMessanger.GetMessageList(intStart, strMatrimonialID, true), intStart, strMatrimonialID);
        }
        else
        {
            LoadList(InternalMessage.MailType.Inbox,MatrimonialMessanger.GetMessageList(intStart, strMatrimonialID, false), intStart, strMatrimonialID);
        }



    }
    #endregion


    private void LoadList(InternalMessage.MailType MailBox ,int[] strAList, int Index, string strMatrimonialID)
    {
        if (strAList != null)
        {
            Messages_1.Bind(strMatrimonialID, strAList[0], (Index + 1), MailBox);
            Messages_2.Bind(strMatrimonialID, strAList[1], (Index + 2), MailBox);
            Messages_3.Bind(strMatrimonialID, strAList[2], (Index + 3), MailBox);
            Messages_4.Bind(strMatrimonialID, strAList[3], (Index + 4), MailBox);
            Messages_5.Bind(strMatrimonialID, strAList[4], (Index + 5), MailBox);
            Messages_6.Bind(strMatrimonialID, strAList[5], (Index + 6), MailBox);
            Messages_7.Bind(strMatrimonialID, strAList[6], (Index + 7), MailBox);
            Messages_8.Bind(strMatrimonialID, strAList[7], (Index + 8), MailBox);
            Messages_9.Bind(strMatrimonialID, strAList[8], (Index + 9), MailBox);
            Messages_10.Bind(strMatrimonialID, strAList[9], (Index + 10), MailBox);
        }
    }


    protected void IB_Delete_Click(object sender, ImageClickEventArgs e)
    {
        Messages_1.Delete();
        Messages_2.Delete();
        Messages_3.Delete();
        Messages_4.Delete();
        Messages_5.Delete();
        Messages_6.Delete();
        Messages_7.Delete();
        Messages_8.Delete();
        Messages_9.Delete();
        Messages_10.Delete();
        Response.Redirect("../Member/Messages.aspx");
    }
}
