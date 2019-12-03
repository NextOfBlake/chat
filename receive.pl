#! C:/Perl/bin/perl -w
require "cgi-lib.pl";

MAIN:
{   if(&ReadParse(*input))
    {   open(COMM, ">>Communication");
        print COMM "Company=$input{'company'}; Name=$input{'name'}; Email=$input{'email'}; Random=$input{'random'}; Message=$input{'msg'}\n";
        close(COMM);
        print<<ABCDEF;
Content-type:text/html, charset=utf-8;


<html>
<head>
</head>
<body>
DONE
</body>
</html>
ABCDEF
    }
}