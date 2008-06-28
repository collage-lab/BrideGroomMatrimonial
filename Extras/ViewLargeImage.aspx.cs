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

public partial class Extras_ViewLargeImage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Page Loads
        if (!IsPostBack)
        {
            //does It have imageid and matid
            if ((Request.QueryString["image"] != null) && (Request.QueryString["matid"] != null))
            {
                //Setting Controls
                HF_Type.Value = Request.QueryString["image"];
                Img_image.ImageUrl = "~/Extras/imagecon.aspx?matid=" + Request.QueryString["matid"] + "&id=" + HF_Type.Value;
                L_MatID.Text = Request.QueryString["matid"];
                HF_ID.Value = Request.QueryString["matid"];
                //Which Album
                switch (HF_Type.Value)
                {
                    case "1":
                        L_PhotoID.Text = "Photo";
                        IB_Pre.Visible = false;    
                        break;
                    case "2":
                        L_PhotoID.Text = "Album - 1";
                        break;
                    case "3":
                        L_PhotoID.Text = "Album - 2";
                        break;
                    case "4":
                        L_PhotoID.Text = "Album - 3";
                        IB_Next.Visible = false;
                        break;
                    case "5":
                        L_PhotoID.Text = "Horoscope";
                        IB_Next.Visible = false;
                        IB_Pre.Visible = false; 
                        break;
                    default:
                        break;
                }

            }
            else
            {
                Server.Transfer("../Extras/errorreport.aspx?id=405");
            }
        }
    }

    protected void IB_Pre_Click(object sender, ImageClickEventArgs e)
    {
        IB_Next.Visible = true;
        // Show Mehe previous image
        switch (HF_Type.Value)
        {
            case "2":
                Img_image.ImageUrl = "../Extras/imagecon.aspx?matid=" + HF_ID.Value + "&id=1";
                L_PhotoID.Text = "Photo";
                HF_Type.Value = "1";
                IB_Pre.Visible = false;
                break;
            case "3":
                Img_image.ImageUrl = "../Extras/imagecon.aspx?matid=" + HF_ID.Value + "&id=2";
                L_PhotoID.Text = "Album - 1";
                HF_Type.Value = "2";
                break;
            case "4":
                Img_image.ImageUrl = "../Extras/imagecon.aspx?matid=" + HF_ID.Value + "&id=3";
                L_PhotoID.Text = "Album - 2";
                HF_Type.Value = "3";
                break;
            default:
                break;
        
        }
    }
    protected void IB_Next_Click(object sender, ImageClickEventArgs e)
    {
        IB_Pre.Visible = true;
        //Show me the next image
        switch (HF_Type.Value)
        {
            case "1":
                Img_image.ImageUrl = "../Extras/imagecon.aspx?matid=" + HF_ID.Value + "&id=2";
                L_PhotoID.Text = "Album - 1";
                HF_Type.Value = "2";
                break;
            case "2":
                Img_image.ImageUrl = "../Extras/imagecon.aspx?matid=" + HF_ID.Value + "&id=3";
                L_PhotoID.Text = "Album - 2";
                HF_Type.Value = "3";
                break;
            case "3":
                Img_image.ImageUrl = "../Extras/imagecon.aspx?matid=" + HF_ID.Value + "&id=4";
                L_PhotoID.Text = "Album - 3";
                HF_Type.Value = "4";
                IB_Next.Visible = false;
                break;
            default:
                break;

        }
    }
}
