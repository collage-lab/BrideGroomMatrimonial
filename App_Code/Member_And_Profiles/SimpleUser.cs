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
public class SimpleUser
{
    public enum UserType : int { Guest = 1, RegistrationStep1 = 2, RegistrationStep2 = 3, RegistrationStep3 = 4, FreeMember = 5, PaidMember = 6, PowerUser=7, Administrator=8 };
    string _AppID;
    bool _Status;
    UserType _MemberShip;
    sbyte _User;
    string _UserName;
    string _MatID;
    string _MailID;

	public SimpleUser()
	{
      _AppID="";
      _MemberShip = UserType.Guest;
      _Status=false;
	}

    public string ApplicationID
    {
        set{ _AppID = value;}
        get{return _AppID; }
    }

    public bool AuthenticationStatus
    {
        set{_Status = value; }
        get{return _Status;}
    }

    public UserType Membership
    {
         get {
                 switch (_User)
                 {
                     case 1:
                         return UserType.Guest;
                     case 2:
                         return UserType.RegistrationStep1;
                     case 3:
                         return UserType.RegistrationStep2;
                     case 4:
                         return UserType.RegistrationStep3;
                     case 5:
                         return UserType.FreeMember;
                     case 6:
                         return UserType.PaidMember;
                     case 7:
                         return UserType.PowerUser;
                     case 8:
                         return UserType.Administrator;
                     default:
                         return UserType.Guest;
                 }          
             }
    }

    public sbyte TypeOfUser
    {
        set { _User = value; }
    }

    public string UserName
    {
        set
        { _UserName = value; }
        get { return _UserName; }
    }

    public string MatrimonialID
    {
        set { _MatID = value; }
        get { return _MatID; }
    }

    public string EmailID
    {
        set { _MailID = value; }
        get { return _MailID; }
    }




}
