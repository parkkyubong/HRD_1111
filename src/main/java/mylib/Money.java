package mylib;

import java.sql.Date;

public class Money {
	int custno;
	int salenol;
	int pcost;
	int amonut;
	int price;
	String pcode;
	Date sdate;
public Money() {
	// TODO Auto-generated constructor stub
}
public Money(int custno, int salenol, int pcost, int amonut, int price, String pcode, Date sdate) {
	super();
	this.custno = custno;
	this.salenol = salenol;
	this.pcost = pcost;
	this.amonut = amonut;
	this.price = price;
	this.pcode = pcode;
	this.sdate = sdate;
}
public int getCustno() {
	return custno;
}
public void setCustno(int custno) {
	this.custno = custno;
}
public int getSalenol() {
	return salenol;
}
public void setSalenol(int salenol) {
	this.salenol = salenol;
}
public int getPcost() {
	return pcost;
}
public void setPcost(int pcost) {
	this.pcost = pcost;
}
public int getAmonut() {
	return amonut;
}
public void setAmonut(int amonut) {
	this.amonut = amonut;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public String getPcode() {
	return pcode;
}
public void setPcode(String pcode) {
	this.pcode = pcode;
}
public Date getSdate() {
	return sdate;
}
public void setSdate(Date sdate) {
	this.sdate = sdate;
}
@Override
public String toString() {
	return "Money [custno=" + custno + ", salenol=" + salenol + ", pcost=" + pcost + ", amonut=" + amonut + ", price="
			+ price + ", pcode=" + pcode + ", sdate=" + sdate + "]";
}

}
