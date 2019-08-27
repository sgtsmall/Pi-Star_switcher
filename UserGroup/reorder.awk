function trim(s)
{
    gsub(/^[ \t]+|[ \t]+$/,"",s);
    gsub(/"/,"",s);
    gsub(/,/," ",s);
    return s ;
}

BEGIN {
    T = ","
    S = " "
}
{
print trim($1) T trim($2) T trim($3) S trim($4) T trim($5) T trim($6) T T trim($7)
}
