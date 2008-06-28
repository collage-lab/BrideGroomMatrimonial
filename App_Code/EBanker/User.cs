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
/// Summary description for User
/// </summary>
public class User
{
    private string strUserName;
    private string strPassword;
    private string strBuyerAccount;
    private bool boolISTransactionSuccess;
	public User()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public string UserID
    {
        get
        {
            return strUserName;
        }
        set
        {
            strUserName = value;
        }
    }
    public string Password
    {
        get
        {
            return strPassword;
        }
        set
        {
            strPassword = value;
        }
    }


    public string BuyerAccount
    {
        get
        {
            return strBuyerAccount;
        }
        set
        {
            strBuyerAccount = value;
        }
    }
    public bool ISTransactionSuccess
    {
        get
        {
            return boolISTransactionSuccess;
        }
        set
        {
            boolISTransactionSuccess = value;
        }
    }


}
