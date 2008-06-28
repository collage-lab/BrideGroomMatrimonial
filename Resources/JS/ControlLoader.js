// JScript File

// JScript File

var js_randid; var version=0;
var action_path = "smart_search";

if(navigator.appVersion.indexOf("MSIE")!=-1) {
	temp = navigator.appVersion.split("MSIE");
	version = parseFloat(temp[1]);
}

if(((parseInt(version) < 5.5) && js_br=="I") || js_br=="N" || js_br=="O" || js_br=="S") {
	action_path = "dosearch";
}

function genNumbers() {
  var i, rannum;

  for(i = 1000000; i < 1000010; i++) {
    rannum = Math.random()*1000000;
    rannum = Math.round(rannum);
  }
  var rand_flag = "r"+rannum+"s";
  return rand_flag;
}

function IsEmpty(obj, obj_type)
{
	if (obj_type == "text")	
	{
		var objValue;
		objValue = obj.value.replace(/\s+$/,"");	
			if (objValue.length == 0) 
			{
			return true;
			}
			else {return false;}
	}
}

function InitArray()
	{
		this.length = InitArray.arguments.length
        for (var i = 0; i < this.length; i++)
        this[i+1] = InitArray.arguments[i]
    }





var NS4 = (navigator.appName == "Netscape" && parseInt(navigator.appVersion) < 5);

function addOption(theSel, theText, theValue)
{
	var newOpt = new Option(theText, theValue);
	var selLength = theSel.length;
	theSel.options[selLength] = newOpt;
}

function deleteOption(theSel, theIndex)
{	
	var selLength = theSel.length;
	if(selLength>0)
	{
		theSel.options[theIndex] = null;
	}
}

function moveOptions(theSelFrom, theSelTo)
{
	
	var selLength = theSelFrom.length;
	var selectedText = new Array();
	var selectedValues = new Array();
	var selectedCount = 0;
	
	var i;
	
	for(i=selLength-1; i>=0; i--)
	{
		if(theSelFrom.options[i].selected)
		{
			selectedText[selectedCount] = theSelFrom.options[i].text;
			selectedValues[selectedCount] = theSelFrom.options[i].value;
			deleteOption(theSelFrom, i);
			selectedCount++;
		}
	}
	
	for(i=selectedCount-1; i>=0; i--)
	{
		addOption(theSelTo, selectedText[i], selectedValues[i]);
	}
	
	if(NS4) history.go(0);
}

function removearry_left(obj)
{
	for (var i=0;i<obj.length;) {
		if (obj.options[i]) {
			obj.remove(i);
		}
		else {
			i++;
		};
	};	

}








