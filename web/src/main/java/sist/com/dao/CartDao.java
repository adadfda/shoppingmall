package sist.com.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import sist.com.bean.ProductBean;

public class CartDao extends SqlSessionDaoSupport{

	public void insertCart(ProductBean bean) {
		this.getSqlSession().insert("insertCart",bean);
	}
	
	public List<ProductBean> selectCart(String id){
		return this.getSqlSession().selectList("selectCart",id);
	}
	public List<ProductBean> allCart(){
		return this.getSqlSession().selectList("allCart");
	}
	public void deleteCart(int no) {
		this.getSqlSession().delete("deleteCart",no);
	}
	public List<ProductBean> modifyList(int no){
		return this.getSqlSession().selectList("modifyList",no);
	}
	public boolean adminSelect(String id , String pw) {
		String pass = this.getSqlSession().selectOne("adminSelect",id);
		if(pass.equals(pw)) {
			return true;
		}
		return false;
	}
	public boolean customSelect(String id, String pw) {
		String pass= this.getSqlSession().selectOne("customSelect", id);
		if(pass.equals(pw)) {
			return true;
		}
		return false;
	}
	public void modifyCart(ProductBean bean) {
		this.getSqlSession().update("modifyCart",bean);
	}
}
