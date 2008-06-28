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

public partial class Member_MyPasswords : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            HtmlMeta objMeta = new HtmlMeta();
            objMeta.Name = "Description";
            objMeta.Content = WebConfig.GetValues("MetaDiscription");
            this.Header.Controls.Add(objMeta);

            // Adding meta KeyWords
            objMeta = new HtmlMeta();
            objMeta.Name = "keywords";
            objMeta.Content = WebConfig.GetValues("MetaKeword");
            this.Header.Controls.Add(objMeta);

            bool IsRequest = false;
            switch (Request.QueryString["id"])
            {
                case "1":
                    L_Type.Text = "Grant";
                    HF_Type.Value = "2";
                    IsRequest = false;
                    break;
                case "2":
                    L_Type.Text = "Request";
                    HF_Type.Value = "1";
                    IsRequest = true;
                    break;
                default:
                    L_Type.Text = "Grant";
                    HF_Type.Value = "2";
                    IsRequest = false;
                    break;
            }

            // Getting User Information Fro Cookie
            HttpCookieCollection objHttpCookieCollection = Request.Cookies;
            HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");
            string strMatrimonialID = Crypto.DeCrypto(objHttpCookie.Values["MatrimonialID"]);

            // Count 
            int intCount = InternalMessage.GetPhotoHoroPasswordCount(strMatrimonialID, IsRequest);
            //Setting Count
            L_Last_2.Text = intCount.ToString();
            L_Last_1.Text = intCount.ToString();
            if (intCount > 0)
            {
                LoadList(InternalMessage.GetPasswordList(strMatrimonialID, 0, IsRequest), 0, IsRequest);

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

            }
            else
            {
                L_Current_1.Text = "0";
                L_Current_2.Text = "0";
            }


        }

    }


    private void LoadList(string[,] strAPassword, int index, bool IsRequest)
    {
        if (IsRequest)
        {
            if (strAPassword != null)
            {
                PasswordDisplay1.Bind(strAPassword[0, 0], strAPassword[0, 1], ++index);
                PasswordDisplay2.Bind(strAPassword[1, 0], strAPassword[1, 1], ++index);
                PasswordDisplay3.Bind(strAPassword[2, 0], strAPassword[2, 1], ++index);
                PasswordDisplay4.Bind(strAPassword[3, 0], strAPassword[3, 1], ++index);
                PasswordDisplay5.Bind(strAPassword[4, 0], strAPassword[4, 1], ++index);
                PasswordDisplay6.Bind(strAPassword[5, 0], strAPassword[5, 1], ++index);
                PasswordDisplay7.Bind(strAPassword[6, 0], strAPassword[6, 1], ++index);
                PasswordDisplay8.Bind(strAPassword[7, 0], strAPassword[7, 1], ++index);
                PasswordDisplay9.Bind(strAPassword[8, 0], strAPassword[8, 1], ++index);
                PasswordDisplay10.Bind(strAPassword[9, 0], strAPassword[9, 1], ++index);
            }
        }
        else
        {
            if (strAPassword != null)
            {
                PasswordDisplay1.Bind(strAPassword[0, 0], strAPassword[0, 1], strAPassword[0, 2], ++index);
                PasswordDisplay2.Bind(strAPassword[1, 0], strAPassword[1, 1], strAPassword[1, 2], ++index);
                PasswordDisplay3.Bind(strAPassword[2, 0], strAPassword[2, 1], strAPassword[2, 2], ++index);
                PasswordDisplay4.Bind(strAPassword[3, 0], strAPassword[3, 1], strAPassword[3, 2], ++index);
                PasswordDisplay5.Bind(strAPassword[4, 0], strAPassword[4, 1], strAPassword[4, 2], ++index);
                PasswordDisplay6.Bind(strAPassword[5, 0], strAPassword[5, 1], strAPassword[5, 2], ++index);
                PasswordDisplay7.Bind(strAPassword[6, 0], strAPassword[6, 1], strAPassword[6, 2], ++index);
                PasswordDisplay8.Bind(strAPassword[7, 0], strAPassword[7, 1], strAPassword[7, 2], ++index);
                PasswordDisplay9.Bind(strAPassword[8, 0], strAPassword[8, 1], strAPassword[8, 2], ++index);
                PasswordDisplay10.Bind(strAPassword[9, 0], strAPassword[9, 1], strAPassword[9, 2], ++index);
            }
        }


    }



    #region"Navigation"


    protected void LB_Next_Click(object sender, EventArgs e)
    {

        HttpCookieCollection objHttpCookieCollection = Request.Cookies;
        HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");
        string strMatrimonialID = Crypto.DeCrypto(objHttpCookie.Values["MatrimonialID"]);

        bool IsRequest = false;
        if (HF_Type.Value == "2")
        {
            IsRequest = true;
        }

        //Previous Enabled
        LB_Previous_1.Enabled = true;
        LB_Previous_2.Enabled = true;
        //Getting values
        int intStart = int.Parse(HF_Start.Value);
        int intCount = InternalMessage.GetPhotoHoroPasswordCount(strMatrimonialID, IsRequest);
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

        LoadList(InternalMessage.GetPasswordList(strMatrimonialID, 0, IsRequest), intStart, IsRequest);

    }

    //Browsing the last 
    protected void LB_Previous_Click(object sender, EventArgs e)
    {
        HttpCookieCollection objHttpCookieCollection = Request.Cookies;
        HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");
        string strMatrimonialID = Crypto.DeCrypto(objHttpCookie.Values["MatrimonialID"]);

        bool IsRequest = false;
        if (HF_Type.Value == "2")
        {
            IsRequest = true;
        }

        LB_Next_1.Enabled = true;
        LB_Next_2.Enabled = true;

        //Getting values
        int intStart = int.Parse(HF_Start.Value);
        int intCount = InternalMessage.GetPhotoHoroPasswordCount(strMatrimonialID, IsRequest);
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

        LoadList(InternalMessage.GetPasswordList(strMatrimonialID, 0, IsRequest), intStart, IsRequest);




    }
    #endregion


    protected void IB_Delete_Click(object sender, ImageClickEventArgs e)
    {
        PasswordDisplay1.Delete();
        PasswordDisplay2.Delete();
        PasswordDisplay3.Delete();
        PasswordDisplay4.Delete();
        PasswordDisplay5.Delete();
        PasswordDisplay6.Delete();
        PasswordDisplay7.Delete();
        PasswordDisplay8.Delete();
        PasswordDisplay9.Delete();
        PasswordDisplay10.Delete();
        Response.Redirect("../Member/MyPasswords.aspx");
    }

}
