
with a as (
  select pct, bnf_code, sum(items) as items
  from hscic.prescribing p
  INNER JOIN ebmdatalab.hscic.ccgs c ON p.pct = c.code AND c.org_type = "CCG"
  where month between '2017-06-01' and '2017-08-01'
  and substr(bnf_code, 1, 2) <= '15'
  group by pct, bnf_code
  ),

denoms as (
  select pct, substr(bnf_code, 1, 7) as subpara, sum(items) as denom
  from a
  group by pct, subpara)

select 
  a.pct,
  substr(bnf_code, 1, 9) as chemical,	
  subpara,	
  sum(items) as num,
  denom,	
  sum(items)/denom as ratio
from a
left join denoms d on substr(a.bnf_code, 1, 7) = d.subpara
                   and a.pct = d.pct
group by a.pct, chemical, subpara, denom
order by subpara, pct, chemical
