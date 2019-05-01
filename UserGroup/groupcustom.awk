function trim(s)
{
    gsub(/^[ \t]+|[ \t]+$/,"",s);
    gsub(/,/," ",s);
    gsub(/"/,"",s);
    return s ;
}

BEGIN {
    T = ","
    S = " "
}
{
print trim($1) T trim($2) T T T T
}
