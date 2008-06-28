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
/// Summary description for ShortMember
/// </summary>
public class ShortMember
{
    //Basic Informations
    private string _Name;
    private sbyte _Age;
    private bool _Gender;
    DateTime _DOB;
    private sbyte _MotherTongue;
    private sbyte _MaritialStatus;
    private sbyte _Religion;
    private sbyte _Cast;
    private string _Subcast;

    private bool _PhysicalStatus;
    private sbyte _CreatedBy;

    // Education 

    private sbyte _Education;
    private sbyte _EduDetails;
    private sbyte _Occupation;
    
    // Location 

    private sbyte _Country;
    private sbyte _State;
    private string _City;

    // Image

    private Image _Image;


	public ShortMember()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public string Name
    {
        set { _Name = value; }
        get { return _Name; }
    }

    public bool Gender
    {
        set
        { _Gender = value; }
        get { return _Gender; }
    }
    public DateTime DateOfBirth
    {
        set { _DOB = value; }
    }
    public sbyte MotherTongue
    {
        set
        { _MotherTongue = value; }
        get { return _MotherTongue; }
    }

    public sbyte CreatedBy
    {
        set
        { _CreatedBy = value; }
        get { return _CreatedBy; }
    }

    public bool PhysicalStatus
    {
        set
        { _PhysicalStatus = value; }
        get { return _PhysicalStatus; }
    }

    public sbyte Religion
    {
        set
        { _Religion = value; }
       
    }
    public sbyte Cast
    {
        set
        { _Cast = value; }
      
    }

    public string Subcast
    {
        set
        { _Subcast = value; }
        
    }



    public sbyte Education
    {
        set
        { _Education = value; }

    }
    public sbyte EducationDetails
    {
        set
        { _EduDetails = value; }

    }
    public sbyte Occupation
    {
        set
        { _Occupation = value; }

    }

    public sbyte Country
    {
        set
        { _Country = value; }

    }
    public sbyte State
    {
        set
        { _State = value; }

    }
    public string City
    {
        set
        { _City = value; }

    }


    public Image Photo
    { 
        set { _Image = value; }
        get { return _Image; }
    }




    public sbyte Age
    {
        get
        {
            //find age from DOB
            return _Age;
        }
    
    }
    public string ReligionInfo
    {
        get
        {
            return _Religion + ", " + _Cast + ", " + _Subcast;
        }
    }
}
