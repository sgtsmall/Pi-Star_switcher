function trim(s)
{
    gsub(/^[ \t]+|[ \t]+$/,"",s);
    gsub(/,/," ",s);
    gsub(/"/,"",s);
    return s ;
}

function trimtg(s)
{
    gsub(/^[ \t]+|[ \t]+$/,"",s);
    gsub(/,/," ",s);
    gsub(/"/,"",s);
    gsub(/\//,"\\\/",s);
    split(s,a ,"_TG");
    return a[1] ;
}


BEGIN {
    FS=";"
    T = ","
    S = " "
print "{"
}
{
NR>10
printf "    \"%s\": \"%s\",\n",trim($1), trimtg($3)
}
END {
print "}"
}
