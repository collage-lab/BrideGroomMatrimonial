using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for PhotoHoroPassword
/// </summary>
public class PhotoHoroPassword
{
	public PhotoHoroPassword(string ID,string Password,bool IsPhoto)
	{
        this.strMatrimonialID = ID;
        this.strPassword = Password;
        this.boolType = ISPhoto;
	}

    private string strMatrimonialID;
    private string strPassword;
    private bool boolType;

    public string FromID
    {
        set { strMatrimonialID = value; }
        get { return strMatrimonialID; }
    }

    public string Password
    {
        set { strPassword = value; }
        get { return Crypto.EnCrypto(strPassword); }
    }
    public bool ISPhoto
    {
        set { boolType = value; }
        get { return boolType; }
    }
}

