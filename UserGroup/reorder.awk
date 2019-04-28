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
print trim($5) T trim($1) T trim($4) S trim($8) T trim($2) T trim($7) T trim($3)
}
