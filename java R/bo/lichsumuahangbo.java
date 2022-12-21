package bo;

import java.util.ArrayList;

import bean.lichsumuahangbean;
import bean.nuocbean;
import dao.lichsumuahangdao;


public class lichsumuahangbo {
	lichsumuahangdao lsdao= new lichsumuahangdao();
	   ArrayList<lichsumuahangbean> ds;
	   public ArrayList<lichsumuahangbean> HienThi(Long makh){
		   return lsdao.HienThi(makh);
	   }
	   public long SLnuocbanchaynhat() {
		   return lsdao.SLnuocbanchaynhat();
	   }
	   public String nuocbanchaynhat() {
		   return lsdao.nuocbanchaynhat();
	   }
	   public String Anhnuocbanchaynhat() {
		   return lsdao.Anhnuocbanchaynhat();
	   }
	   
//	   public static void main(String[] args) {
//		lichsumuahangbo lsbo = new lichsumuahangbo();
//		System.out.println(lsbo.HienThi((long)20));
//	}
}