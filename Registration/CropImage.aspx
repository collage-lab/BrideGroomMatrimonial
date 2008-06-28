<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CropImage.aspx.cs" Inherits="CropImage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Crop Image..</title>
<script type="text/javascript" src="cropper/lib/prototype.js" language="javascript"></script>
<script type="text/javascript" src="cropper/lib/scriptaculous.js?load=builder,dragdrop" language="javascript"></script>
<script type="text/javascript" src="cropper/cropper.js" language="javascript"></script> 
    <script type ="text/javascript" language="javascript">
    function onEndCrop( coords, dimensions ) {
    $( 'HiddenX').value = coords.x1;
    $( 'HiddenY').value = coords.y1;
    $( 'HiddenW').value = dimensions.width;
    $( 'HiddenH').value = dimensions.height;
    } 
</script>

<%--<script type="text/javascript" language="javascript">
    Event.observe( window, 'load', function() {
        new Cropper.Img(
            'ImageForCrop',
            { onEndCrop: onEndCrop }
        );
    } );
</script>--%> 

<!--  Fixed ration -->
<script type="text/javascript" language="javascript">
    Event.observe( window, 'load', function() {
        new Cropper.Img(
            'ImageForCrop',
            {
                ratioDim: {
                    x: 124,
                    y: 124
                },
                displayOnInit: true,
                onEndCrop: onEndCrop
            }
        );
    } );
</script>

<script type="text/javascript" language="JavaScript">
<!--
javascript:window.history.forward(1);
//-->
</script>

<script type="text/javascript" language="JavaScript">
<!--
function display(){
        window.history.forward(1);
        var height = document.getElementById('ImageForCrop').offsetHeight;
        var Width = document.getElementById('ImageForCrop').offsetWidth;
        height = height+170;
        Width = Width+90;
        window.resizeTo(Width,height);
    }
//-->
</script>

    
</head>



<body style="text-align: center" bottommargin="10" scroll="auto" topmargin="10" onload = display();>
    <form id="form1" runat="server">
    <div>
    <table>
    <tr>
    
       <td></td>
    
       <td>
       
       <!--   This control is supposed to bear the image to crop -->
         <asp:Image ID="ImageForCrop" runat="server" ImageUrl="~/Registration/image.aspx"/>
       </td>
    
        <td></td>
    
    </tr>
    
    <tr>
    <td></td>
    <td style="text-align: center">
        <asp:HiddenField ID="HiddenX" runat="server" />
        <asp:HiddenField ID="HiddenY" runat="server" />
        <asp:HiddenField ID="HiddenW" runat="server" />
        <asp:HiddenField ID="HiddenH" runat="server" />
    
    </td>
    <td></td>
    
    
    </tr>
    
    
    
    <tr>
    
    
    <td ></td>
    <td style="text-align: center">
       
        <asp:ImageButton ID="IB_Crop" runat="server" ImageUrl="~/Resources/crop.gif" OnClick="IB_Crop_Click" />
    </td>
    
    <td></td>
    
    </tr>
    </table>
    
    
    
    </div>
    </form>
</body>
</html>
