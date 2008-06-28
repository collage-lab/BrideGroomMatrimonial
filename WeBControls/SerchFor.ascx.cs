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

public partial class clt_SerchFor : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    public bool SearchingForGender
    {
        set {
            if (value)
            {
                L_Gender.Text = "Male";
            }
            else
            {
                L_Gender.Text = "Female";
            }
        }
    }

    public string SearchingForAgeMin
    {
        set {
            L_Age_min.Text = value;
        }
    }

    public string SearchingForAgeMax
    {
        set { L_Age_Max.Text = value; }
    }
    public string SearchingForReligion
    {
        set { L_Religion.Text = value; }
    }

    public string SearchingForCaste
    {
        set { 
            try
            {
                L_Cst.Text = value;
            }catch(Exception)
            {}
        }
    }

    public bool SearchingWithPhoto
    {
        set {
            if (value)
            {
                L_Photo.Text = "Profile With Photo";
            }
            else
            {
                L_Photo.Text = "Show All";
            }
        }

    }

    public int SearchingDepth
    {
        set {
            HL_Back.NavigateUrl = "javascript:history.go(-"+value.ToString()+");" ;
        }
    }

}
