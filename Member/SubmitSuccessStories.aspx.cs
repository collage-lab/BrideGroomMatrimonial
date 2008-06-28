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

using System.Data.SqlClient;
using System.IO;

public partial class Member_SubmitSuccessStories : System.Web.UI.Page
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

            try
            {

                HttpCookieCollection objHttpCookieCollection = Request.Cookies;
                HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");

                L_MatID.Text = Crypto.DeCrypto(objHttpCookie.Values["MatrimonialID"]);

                string strSSID = MatrimonialSuccessStoryManager.GetSuccessID(L_MatID.Text);

                if (strSSID != null)
                {
                    PN_SStory.Visible = true;
                    PN_SubMit.Visible = false;
                    SuccessPannel1.Bind(strSSID);
                }
                else
                {
                    PN_SStory.Visible = false;
                    PN_SubMit.Visible = true;

                    txtCount.Text = TB_SucessStory.MaxLength.ToString();

                    TB_SucessStory.Attributes.Add("onKeyUp", "javascript:document.getElementById('" + txtCount.ClientID +
                       "').setAttribute('value', (" + TB_SucessStory.MaxLength +
                       " - parseInt(document.getElementById('" + TB_SucessStory.ClientID +
                       "').getAttribute('value').length)));");

                    int intYear = DateTime.Now.Year - 2;

                    for (int i = 0; i <= 4; ++i)
                    {

                        DDL_dobYear.Items.Add((intYear + i).ToString());
                    }
                }

            }
            catch (Exception)
            { }


        }   //if

    }
    protected void IMB_Save_Click(object sender, ImageClickEventArgs e)
    {
        ///
        ///upload image 
        /// 

        FileInfo imageInfo = new FileInfo(File_Image.Value.Trim());

        if (!imageInfo.Exists)
            this.RegisterClientScriptBlock("alertMsg", "<script>alert('please select one image file.');</script>");
        else
        {
            bool redirectFlag = false;
            switch (imageInfo.Extension.ToUpper())
            {
                case ".JPG":
                    redirectFlag = this.UpLoadImageFile(imageInfo);
                    break;
                case ".GIF":
                    redirectFlag = this.UpLoadImageFile(imageInfo);
                    break;
                case ".PNG":
                    redirectFlag = this.UpLoadImageFile(imageInfo);
                    break;
                case ".BMP":
                    redirectFlag = this.UpLoadImageFile(imageInfo);
                    break;
                default:
                    this.RegisterClientScriptBlock("alertMsg", "<script>alert('Use either images suchus bmp,jpg,gif');</script>");
                    break;
            }
            if (redirectFlag)
            {
                LoadStory();
            }
            else
            {
                Response.Redirect("../Extras/ErrorReport.aspx");
            }

        }
    }

    private bool UpLoadImageFile(FileInfo info)
    {


        try
        {
            /// 
            /// striming image
            /// 
            byte[] byteContent = new byte[info.Length];
            FileStream objFileStream = info.OpenRead();
            objFileStream.Read(byteContent, 0, byteContent.Length);
            objFileStream.Close();

            /// 
            /// Processing image 
            /// 

            byteContent = EditImage.GetThumbNail(byteContent, 124, 90, true);



            byteContent = EditImage.SetWatermark(byteContent, WebConfig.GetValues("FName"), 50, true,36);

            /// 
            /// DataBase operation starts
            /// 
            HF_SSID.Value = getSucessID();
            //DateTime dateTemp = DateTime.Parse(DDL_dobMonth.SelectedIndex.ToString() + "/" + DDL_dobDay.SelectedValue + "/" + DDL_dobYear.SelectedValue);
            return MatrimonialSuccessStoryManager.AddSuccessStory(HF_SSID.Value, TB_SucessStory.Text, L_MatID.Text, TB_Bride.Text, TB_Groom.Text, DateTime.Parse(DDL_dobMonth.SelectedIndex.ToString() + "/" + DDL_dobDay.SelectedValue + "/" + DDL_dobYear.SelectedValue), byteContent);
         
        }
        catch (Exception ex)
        {
            return false;
        }
    }


    public int MaxLength
    {
        get { return TB_SucessStory.MaxLength; }
        set { TB_SucessStory.MaxLength = value; }
    }

    protected string getSucessID()
    {
        Random n = new Random(12354);
        return RandomString.GenerateStirng(3, false) + n.Next(10000, 99999);
    }

    private void LoadStory()
    {
        PN_SubMit.Visible = false;
        PN_SStory.Visible = true;
        SuccessPannel1.Bind(HF_SSID.Value);
    }

    protected void IB_Delete_Click(object sender, EventArgs e)
    {
        SuccessPannel1.DeleteMe();
        PN_SubMit.Visible = true;
        PN_SStory.Visible = false;
    }
}
