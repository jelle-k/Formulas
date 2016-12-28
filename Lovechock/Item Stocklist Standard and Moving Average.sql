select t0."ItemCode", "ItemName",  "EvalSystem", t1."WhsCode", t1."OnHand", t0."AvgPrice"
from OITM t0
inner join OITW t1 on t0."ItemCode" = t1."ItemCode"
where  t1."OnHand" !=0 and t0."EvalSystem" != 'B'
order by 1