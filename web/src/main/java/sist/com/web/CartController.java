package sist.com.web;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import sist.com.bean.ProductBean;
import sist.com.dao.CartDao;

@Controller
public class CartController {
	@Inject
	CartDao dao;
	String upPath="E:\\spring2\\web\\src\\main\\webapp\\cartUp\\";
	
	@RequestMapping(value = "adminLogin.do")
	public String loginAdmin(String id, String pw, HttpSession session) {
		if (dao.adminSelect(id, pw)) {
			session.setAttribute("id", id);
			/*session.setMaxInactiveInterval(60);*/
			return "redirect:productList.do";
		}
		return "redirect:/project/login.jsp";
	}
	@RequestMapping(value="customerLogin.do")
	public String loginCustomer(String cid, String cpw, HttpSession session) {
		if(dao.customSelect(cid, cpw)) {
			session.setAttribute("id", cid);
			return "redirect:allList.do";
		}
		return "redirect:/project/login.jsp";
	}
	@RequestMapping(value="allList.do")
	public ModelAndView allProductList(HttpSession session) {
		/*String id = (String) session.getAttribute("id");*/
		ModelAndView mv=new ModelAndView();
		mv.addObject("allList",dao.allCart());
		mv.setViewName("project/mainPage");
		return mv;
	}
	
	@RequestMapping(value = "productList.do")
	public ModelAndView selectAdminProductList(HttpSession session) {
		String id = (String) session.getAttribute("id");
		ModelAndView mv = new ModelAndView();
		mv.addObject("pList", dao.selectCart(id));
		mv.setViewName("cart/productAdd");
		return mv;
	}
	public void streamUpdate(ProductBean bean, MultipartFile file) {
		bean.setFileName(file.getOriginalFilename());
		FileOutputStream fos=null;
		File f=null;
		try {
			fos=new FileOutputStream(f=new File(upPath+bean.getFileName()));
			fos.write(file.getBytes());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	@RequestMapping(value = "productInsert.do")
	public String productInsertPro(ProductBean bean, MultipartFile file) {
		if(file.getOriginalFilename().length()>0) {
			streamUpdate(bean, file);
		}
		dao.insertCart(bean);
		return "redirect:productList.do";
	}
	
	@RequestMapping(value = "deleteCart.do")
	public String deleteCart(int no) {
		dao.deleteCart(no);
		return "redirect:productList.do";
	}
	
	@RequestMapping(value = "modifyCart.do")
	@ResponseBody
	public List<ProductBean> modifyCart(String job, String no) {
		int nno = Integer.parseInt(no);
		List<ProductBean>list = dao.modifyList(nno);
		return list;
	}
	
	@RequestMapping(value="modifyGO.do")
	public String modifyGO(ProductBean bean, MultipartFile file,String nno) {
		int no =Integer.parseInt(nno);
		bean.setNo(no);
		if(file.getOriginalFilename().length()>0) {
			streamUpdate(bean, file);
		}
		dao.modifyCart(bean);
		return "redirect:productList.do";
	}
	@RequestMapping(value="ajaxChart.do")
	public String ajaxChartPro(Model model, String id) {
		model.addAttribute("cList","testChart");
		System.out.println(id);
		return "cart/ajaxChart";
	}
	
}
