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

public partial class Guest_SuccessStory : System.Web.UI.Page
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

            // <<<<<<<ForTesting>>>>>>>>>>>>>

            int intCount = MatrimonialSuccessStoryManager.GetSStoryCount();
            if (intCount > 0)
            {
                if (intCount < 7)
                {
                    LB_Next_1.Enabled = false;
                    LB_Next_2.Enabled = false;

                }
                HF_Start.Value = "0";
                HF_Count.Value = (intCount).ToString();

                string[] strAList = MatrimonialSuccessStoryManager.GetSuccessStoryList(0);

                if (strAList != null)
                {
                    SuccessPannel1.Bind(strAList[0]);
                    SuccessPannel2.Bind(strAList[1]);
                    SuccessPannel3.Bind(strAList[2]);
                    SuccessPannel4.Bind(strAList[3]);
                    SuccessPannel5.Bind(strAList[4]);
                    SuccessPannel6.Bind(strAList[5]);
                    SuccessPannel7.Bind(strAList[6]);
                }
            }
        }
    }




    protected void LB_Next_Click(object sender, EventArgs e)
    {
        //Previous Enabled
        LB_Previous_1.Enabled = true;
        LB_Previous_2.Enabled = true;
        //Getting values
        int intStart = int.Parse(HF_Start.Value);
        int intCount = int.Parse(HF_Count.Value);
        int intCurrent;
        intCurrent = intCount - (intStart + 7);

        if (intCurrent < 7)
        {
            LB_Next_1.Enabled = false;
            LB_Next_2.Enabled = false;
        }
        //Update Start Pointer
        intStart += 7;
        HF_Start.Value = (intStart).ToString();
        //Getting SSList

        string[] strAList = MatrimonialSuccessStoryManager.GetSuccessStoryList(intStart);
        //Fill Countrol
        if (strAList != null)
        {
            SuccessPannel1.Bind(strAList[0]);
            SuccessPannel2.Bind(strAList[1]);
            SuccessPannel3.Bind(strAList[2]);
            SuccessPannel4.Bind(strAList[3]);
            SuccessPannel5.Bind(strAList[4]);
            SuccessPannel6.Bind(strAList[5]);
            SuccessPannel7.Bind(strAList[6]);
        }
    }

    //Browsing the last 
    protected void LB_Previous_Click(object sender, EventArgs e)
    {
        LB_Next_1.Enabled = true;
        LB_Next_2.Enabled = true;

        //Getting values
        int intStart = int.Parse(HF_Start.Value);
        int intCount = int.Parse(HF_Count.Value);
        intStart -= 7;
        // End of record?
        if (intStart < 7)
        {
            LB_Previous_1.Enabled = false;
            LB_Previous_2.Enabled = false;
        }
        //Update Start Pointer
        HF_Start.Value = (intStart).ToString();
        //Getting SSList

        string[] strAList = MatrimonialSuccessStoryManager.GetSuccessStoryList(intStart);
        //Fill Countrol
        if (strAList != null)
        {
            SuccessPannel1.Bind(strAList[0]);
            SuccessPannel2.Bind(strAList[1]);
            SuccessPannel3.Bind(strAList[2]);
            SuccessPannel4.Bind(strAList[3]);
            SuccessPannel5.Bind(strAList[4]);
            SuccessPannel6.Bind(strAList[5]);
            SuccessPannel7.Bind(strAList[6]);
        }


    }
}
