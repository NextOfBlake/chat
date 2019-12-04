#! C:/Perl/bin/perl -w

require "cgi-lib.pl";
MAIN:
{
    if (&ReadParse(*input))
    {
        open(INFO, "Information");

        print qq(Content-Type: text/html; charset=utf-8;\n\n
        <html><head><link rel="stylesheet" type="text/css" href="stylesheet.css"><meta charset="utf-8"></head><body style="grid-gap: 5px" class="aligncenter">);

        $/="\n";
        while($info = <INFO>){
            

            $info =~ /Company=([^;]+);/;
            $companyname = $1;
            $info =~ /Name=([^;]+);/;
            $clientname = $1;
            $talktoname = $input{'client'};

            $info =~ /Email=([^;]+);/;
            $clientemail = $1;
            $talktoemail = $input{'email'};

            $info =~ /Random=([^;]+)/;
            $rand = $1;

            print qq(<a href="comm.pl?company=$companyname&name=$talktoname&email=$talktoemail&random=$rand">);
            print("Company: $companyname");
            print("Name: $clientname");
            print("Email: $clientemail");
            print qq(</a><br>);
        }
        print qq(</body></html>);

        close(INFO);
    }
}
