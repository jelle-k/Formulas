select t0."ItemCode", t1."ItemName", "DistNumber" "Batchnum"  , t3."WhsCode"
  , "StockQty" "StockQuantity", t0."CreateDate", "ExpDate" 
,   "CostTotal" / t0."Quantity"   *1000  "CostPricePer1000"
from OBTN t0 
inner join OITM t1 on t0."ItemCode" = t1."ItemCode"
inner join (
select t1."ItemCode" , t1."LocCode" "WhsCode", t2."SysNumber" , sum("Quantity") "StockQty"
from OITL t1
inner join  ITL1 t2 on t1."LogEntry" = t2."LogEntry"
group by t1."ItemCode" , t1."LocCode" , t2."SysNumber"
having sum("Quantity")<>0
) t3 on t0."ItemCode" =t3."ItemCode" and t0."SysNumber" = t3."SysNumber"
where not  "StockQty"=0  
order by 1,3,4