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

public partial class Member_MyBookMark : System.Web.UI.Page
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


            int intCount = MatrimonialProfileManager.GetBookMarkCount(strMatrimonialID);

            if (intCount > 0)
            {
                if (intCount < 10)
                {
                    LB_Next_1.Enabled = false;
                    LB_Next_2.Enabled = false;

                }
                HF_Start.Value = "0";
                HF_Count.Value = (intCount).ToString();

                LoadList(MatrimonialProfileManager.GetBookMarkList(0, strMatrimonialID));
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

        if (intCurrent < 10)
        {
            LB_Next_1.Enabled = false;
            LB_Next_2.Enabled = false;
        }
        //Update Start Pointer
        intStart += 10;
        HF_Start.Value = (intStart).ToString();
        //Getting SSList

        LoadList(MatrimonialProfileManager.GetBookMarkList(intStart, strMatrimonialID));
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
        }
        //Update Start Pointer
        HF_Start.Value = (intStart).ToString();
        //Getting SSList

        LoadList(MatrimonialProfileManager.GetBookMarkList(intStart, strMatrimonialID));



    }
    #endregion


    private void LoadList(string[] strAList)
    {
        if (strAList != null)
        {
            MatMember_1.Bind(strAList[0], true, true);
            MatMember_2.Bind(strAList[1], true, true);
            MatMember_3.Bind(strAList[2], true, true);
            MatMember_4.Bind(strAList[3], true, true);
            MatMember_5.Bind(strAList[4], true, true);
            MatMember_6.Bind(strAList[5], true, true);
            MatMember_7.Bind(strAList[6], true, true);
            MatMember_8.Bind(strAList[7], true, true);
            MatMember_9.Bind(strAList[8], true, true);
            MatMember_10.Bind(strAList[9], true, true);
        }



    }

}
