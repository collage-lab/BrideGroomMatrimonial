using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Data.SqlClient;

/// <summary>
/// Summary description for AccountHandiler
/// </summary>
public class AccountHandiler
{
	public AccountHandiler()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static string[] GetPaymentDetails(long Index)
    {
        string[] X = {"BnGMatrimonials","1500"};
        return X;
    }

    public static sbyte Transaction(string txtUserName, string  txtPassword, string txtCCNo, string Key ,String Amount)
    {
        if (txtUserName.ToLower() == "prasanth" && txtCCNo.ToLower() == "12345678987654321")
        {
            if (txtPassword == "123456")
            {
               return 1;
            }
            else
            {
               return 2;
            }
        
        }
        return 2;
    }
}
