open(INFO, "+<", "Information");        
$login = 1;
while(my $line = <INFO>) 
{
    @account = ();

    @split = split /;/ , $line;
    foreach(@split)
    {
        @value = split /=/ , $_;
        push(@account, (@value[1]));
    }
    $company = @account[0];
    $name = @account[1];
    $email = @account[2];
    $random = @account[3];

    if ($company eq "swagger420")
    {
        $login = 1;
        last;
    }
}

print $company;
print @account[0];