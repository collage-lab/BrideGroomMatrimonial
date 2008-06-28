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

public partial class WeBControls_PasswordDisplay : System.Web.UI.UserControl
{
    string Password;
    string pass;
    string FromID;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void Bind(PhotoHoroPassword Password, int Index, bool IsRequest)
    {
        L_No.Text = Index.ToString();

        HL_ViewProfile.Visible = true;
        HL_ViewProfile.Target = "_blank";
        HL_ViewProfile.NavigateUrl = "~/MyProfile/" + Password.FromID + ".aspx";

        if (Password.ISPhoto)
        {
            L_Type.Text = "Photo";
        }
        else
        {
            L_Type.Text = "Horoscope";
        }

        if (IsRequest)
        {
            HF_Type.Value = "1";
        }
        else
        {
            HF_Type.Value = "2";
        }
        L_RequestFrom_To.Text = Password.FromID.ToUpper();
        FromID = Password.FromID;
    }

    protected void IFrame()
    {
        switch (HF_Type.Value)
        {
            case "1":
                switch (L_Type.Text.ToLower())
                {
                    case "photo":
                        Response.Write("<iframe  frameborder=\"no\" marginheight=\"0\" marginwidth=\"0\" scrolling=\"no\" unselectable=\"off\" id=\"N1\" style=\"width: 110px; height: 17px\" src=\"Rframe.aspx?id=" + FromID + "&typ=photo\" ></iframe>");
                        break;
                    case "horoscope":
                        Response.Write("<iframe  frameborder=\"no\" marginheight=\"0\" marginwidth=\"0\" scrolling=\"no\" unselectable=\"off\" id=\"N1\" style=\"width: 110px; height: 17px\" src=\"Rframe.aspx?id=" + FromID + "&typ=horoscope\" ></iframe>");
                        break;
                    default: Response.Write(L_Type.Text); break;
                }
                break;
            case "2":
                switch (L_Type.Text.ToLower())
                {
                    case "photo":
                        HL_ViewAlbum.Visible = true;
                        HL_ViewAlbum.Attributes.Add("onclick", "newWindow('ProtectedAlbum.aspx?image=1&matid=" + FromID + "','ProtectedAlbum','250','250')");
                        HL_ViewAlbum.Attributes.Add(" style", "cursor: pointer;");
                        break;
                    case "horoscope":
                        HL_ViewAlbum.Visible = true;
                        HL_ViewAlbum.Attributes.Add("onclick", "newWindow('ProtectedAlbum.aspx?ps=5&matid=" + FromID + "','ProtectedAlbum','250','250')");
                        HL_ViewAlbum.Attributes.Add(" style", "cursor: pointer;");
                        break;
                    default: Response.Write(L_Type.Text); break;
                }
                break;
            default: this.Visible = false; break;
        }
    }

    public void Delete()
    {
        if (this.CB_Delete.Checked)
        {
            HttpCookieCollection objHttpCookieCollection = Request.Cookies;
            HttpCookie objHttpCookie = objHttpCookieCollection.Get("MatCookie5639sb");

            string strMatID = Crypto.DeCrypto(objHttpCookie.Values["MatrimonialID"]);

            switch (HF_Type.Value.ToLower())
            {
                case "photo":
                    InternalMessage.DeletePasswordRequest(L_RequestFrom_To.Text, strMatID, true);
                    break;
                case "horoscope":
                    InternalMessage.DeletePasswordRequest(L_RequestFrom_To.Text, strMatID,false);
                    break;

                default:
                    InternalMessage.DeletePasswordRequest(L_RequestFrom_To.Text, strMatID, true);
                    break;
            }

        }

    }

    //Request

    public void Bind(string ID, string Type, int Index)
    {
        try
        {
            // Loading Index
            L_No.Text = Index.ToString();
            //Setting ViewProfile
            HL_ViewProfile.Visible = true;
            HL_ViewProfile.Target = "_blank";
            HL_ViewProfile.NavigateUrl = "~/MyProfile/" + ID + ".aspx";
            // Does Photo / horo
            switch (Type.ToLower())
            {
                case "true":
                    L_Type.Text = "Photo";
                    break;
                case "false":
                    L_Type.Text = "Horoscope";
                    break;
            } 
            
            HF_Type.Value = "1";
            L_RequestFrom_To.Text = ID.ToUpper();
            FromID = ID.ToUpper();
            this.Visible = true;
        }
        catch (Exception)
        {
            this.Visible = false;
        }
    }

    //Grand
    public void Bind(string ID, string Type,string Password,int Index)
    {
        try
        {
            // Loading Index
            L_No.Text = Index.ToString();
            //Setting ViewProfile
            HL_ViewProfile.Visible = true;
            HL_ViewProfile.Target = "_blank";
            HL_ViewProfile.NavigateUrl = "~/MyProfile/" + ID + ".aspx";
            // Does Photo / horo
            switch (Type.ToLower())
            {
                case "true":
                    L_Type.Text = "Photo";
                    break;
                case "false":
                    L_Type.Text = "Horoscope";
                    break;
                default: L_Type.Text = Type;
                    break;
            }

                HF_Type.Value = "2";
               this.pass = Password;

               L_RequestFrom_To.Text = ID.ToUpper();
               FromID = ID.ToUpper();
            this.Visible = true;
        }
        catch (Exception)
        {
            this.Visible = false;
        }
    }


}
