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
/// Summary description for Intrest
/// </summary>
public class MemberIntrest
{

    public enum TypeOfIntrest: int { Pending = 1, Approved = 2, Declined = 3 };

    public MemberIntrest()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private string strIntrestFrom;
    private sbyte sbyteIntrestStatus;
    private sbyte sbyteIntrestType;
    private string strDate;
    private int intIndex;
    private bool boolMailType;

    public int Index
    {
        set { intIndex = value; }
        get { return intIndex; }
    }
    public string IntrestFrom
    {
        set { strIntrestFrom = value; }
        get { return strIntrestFrom; }
    }
    public sbyte IntrestStatus
    {
        set { sbyteIntrestStatus = value; }
        get { return sbyteIntrestStatus; }
    }
    public sbyte IntrestType
    {
        set { sbyteIntrestType = value; }
        get { return sbyteIntrestType; }
    }
    public string Date
    {
        get { return strDate; }
    }

    public DateTime SendingDate
    {
        set { strDate = value.Day.ToString() + "-" + value.Month.ToString() + "-"+value.Year.ToString(); }
    }

    public InternalMessage.MailType mailBox
    {
        get
        {
            if (boolMailType)
            {
                return InternalMessage.MailType.Inbox;
            }
            else
            {
                return InternalMessage.MailType.OutBox;
            }
        }
    }

    public bool IsInBox
    {
        set { boolMailType = value; }
    }





}
