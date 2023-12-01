select * from money_tbl_02;
select custno from money_tbl_02 group by custno;
select suctno,sum(price) from money_tbl_02 group by custno;

select custno,amount,sum(price) from money_tbl_02 group by custno;
select custno,amount,sum(price) from money_tbl_02 group by custno,amount;

select custno,sum(price) from money_tbl_02
group by custno
order by sum(price) desc;

select custno,sum(price) from moeny_tbl_02
group by custno
order by sum(price) desc;

select t1.custno, t2.custname, t2.grade, sum







select  t1.custno custno,t2.custname custname,
decode(t2.grade,'A','VIP','B','일반','C','직원')grade,
sum(t1.price) price
from money_tbl_02 t1,member_tbl_02 where t1.custno=t2.custno
group by custno
order by sum(price)desc;

select t1.custno, t2.grade, sum(t1.price)
from money_tbl_02 t1