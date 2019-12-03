#! C:/Perl/bin/perl -w

require "cgi-lib.pl";

MAIN:
{
    if(&ReadParse(*input)){
        open(COMM, ">>Communication");

        close(COMM);
        print<<ABCDEF;
Content-type: text/html; charset=utf8;


<html>
<head>
<link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>
<body>
    <script language=Javascript>
        if(window.XMLHttpRequest){
    request=new XMLHttpRequest();
} else {
    request=new ActiveXObject("Microsoft.XMLHTTP");
}   
setInterval(function(){
    request.open("GET", "getcomm.pl", true);
    request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    request.send("");
    request.onreadystatechange = function(){
        if(request.readyState == 4 ){
            document.form1.display.value = request.responseText.split('Company=')
            .filter(msg => msg.startsWith(document.form1.company.value))
            .map(msg => 'Company=' + msg).join('\\n');
        } else {
            // alert("Error" + request.status+ ": " + request.statustText);
        }
    }
}, 1000);

function trans(){  
    request.open("POST", "receive.pl", true);
    request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    request.send( "name=" + document.form1.name.value
        + "&company=" + document.form1.company.value
        + "&email=" + document.form1.email.value
        + "&random=" + document.form1.random.value
        + "&msg=" + document.form1.in.value);

request.onreadystatechange = function(){
    if(request.readyState == 4 ){
        document.form1.display.value+=document.form1.in.value;
        document.form1.in.value="";
    } else {
        //alert("Error "+request.status+": "+request.statusText);
    }
}
}
    </script>

    <form name=form1 align="center">
    <div style="font-size: larger; font-weight: bold;">Message Transcript:</div> 
    <input type=hidden name=name value="$input{'name'}">
    <input type=hidden name=company value="$input{'companyname'}">
    <input type=hidden name=email value="$input{'email'}">
    <input type=hidden name=random value="$input{'random'}">
    <textarea name=display rows=40 cols=70></textarea><br>
    <br><br>
    <textarea name=in rows=10 cols=70></textarea><br>
    Message to send:<br>
    <input type=button onclick="trans()" value="Send">
    </form>
</body>
</html>
ABCDEF
    }
}