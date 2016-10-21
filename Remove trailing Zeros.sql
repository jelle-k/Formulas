local NumberVar n := {@DiscountPercentage};
NumberVar Zeros;
StringVar DecimalPortion;

DecimalPortion := ToText (n - (Truncate (n)), 10);

if DecimalPortion[12] <> "0" then Zeros := 10 
else if DecimalPortion[11] <> "0" then Zeros := 9 
else if DecimalPortion[10] <> "0" then Zeros := 8
else if DecimalPortion[9] <> "0" then Zeros := 7
else if DecimalPortion[8] <> "0" then Zeros := 6
else if DecimalPortion[7] <> "0" then Zeros := 5
else if DecimalPortion[6] <> "0" then Zeros := 4
else if DecimalPortion[5] <> "0" then Zeros := 3
else if DecimalPortion[4] <> "0" then Zeros := 2
else if DecimalPortion[3] <> "0" then Zeros := 1
else Zeros := 0;


if Zeros>2 then
totext(n,Zeros)
else
totext(n,2)