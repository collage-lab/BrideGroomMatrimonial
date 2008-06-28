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
/// Summary description for MemberMessage
/// </summary>
public class MemberMessage
{
	public MemberMessage()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    private string strMessageFrom_To;
    private string strDate;
    private sbyte sbyteIndex;
    private string strMessage;

    private bool boolIsRead;

    public sbyte Index
    {
        set { sbyteIndex = value; }
        get { return sbyteIndex; }
    }
    public string Message
    {
        set { strMessage = value; }
        get { return strMessage; }
    }
    public string From_To
    {
        set { strMessageFrom_To = value; }
        get { return strMessageFrom_To; }
    }

    public string Date
    {
        get { return strDate; }
    }
    public DateTime SendingDate
    {
        set { strDate = value.Day.ToString() + "-" + value.Month.ToString() + "-" + value.Year.ToString(); }
    }

    public bool MessageReaded
    {
        set
        {
            boolIsRead = value;
        }
        get { return boolIsRead; }
    }

}
