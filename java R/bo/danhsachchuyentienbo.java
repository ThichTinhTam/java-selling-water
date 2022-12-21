package bo;

import java.util.ArrayList;

import bean.danhsachchuyentienbean;
import bean.lichsumuahangbean;
import dao.danhsachchuyentiendao;
import dao.lichsumuahangdao;

public class danhsachchuyentienbo {
	danhsachchuyentiendao dsdao= new danhsachchuyentiendao();
	   ArrayList<danhsachchuyentienbean> ds;
	   public ArrayList<danhsachchuyentienbean> HienThiDS(){
		   return dsdao.HienThiDS();
	   }
	   public static void main(String[] args) {
		danhsachchuyentienbo dsbo = new danhsachchuyentienbo();
		System.out.println(dsbo.HienThiDS());
	}
}
