package com.estore.admin.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.estore.dao.ProductDAO;
import com.estore.entity.Category;
import com.estore.entity.Product;
import com.estore.entity.Supplier;

@Transactional
@Controller("adminProductController")
@RequestMapping("admin/product")
public class ProductController {
	@Autowired
	SessionFactory factory;
	
	@Autowired
	ServletContext app;
	
	@Autowired
	ProductDAO dao;
	
	@RequestMapping("index")
	public String index(ModelMap model) {
		Product product = new Product();
		model.addAttribute("model", product);
		model.addAttribute("list", getItems());
		return "admin/product/index";
	}
	
	@RequestMapping("insert")
	public String insert(ModelMap model, 
			@ModelAttribute("model") Product product,
			@RequestParam("photo_file") MultipartFile file) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			if(file.isEmpty()){
				product.setImage("logo.png");
			}
			else{
				product.setImage(System.currentTimeMillis()+file.getOriginalFilename());
				String path = app.getRealPath("/static/images/products/"+product.getImage());
				file.transferTo(new File(path));
			}
			session.save(product);
			t.commit();
			model.addAttribute("message", "Them moi thanh cong");
			model.addAttribute("model", new Product());
		} 
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Them moi that bai");
		}
		finally{
			session.close();
		}
		model.addAttribute("list", getItems());
		return "admin/product/index";
	}
	
	@RequestMapping("update")
	public String update(ModelMap model, 
			@ModelAttribute("model") Product product,
			@RequestParam("photo_file") MultipartFile file) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			if(!file.isEmpty()){
				product.setImage(System.currentTimeMillis()+file.getOriginalFilename());
				String path = app.getRealPath("/static/images/products/"+product.getImage());
				file.transferTo(new File(path));
			}
			session.update(product);
			t.commit();
			model.addAttribute("message", "Cap nhat thanh cong");
		} 
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Cap nhat that bai");
		}
		finally{
			session.close();
		}
		model.addAttribute("list", getItems());
		return "admin/product/index";
	}
	
	@RequestMapping("delete")
	public String delete(ModelMap model, 
			@ModelAttribute("model") Product product) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(product);
			t.commit();
			model.addAttribute("message", "Xoa thanh cong");
			model.addAttribute("model", new Product());
		} 
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Xoa that bai");
		}
		finally{
			session.close();
		}
		model.addAttribute("list", getItems());
		return "admin/product/index";
	}

	@RequestMapping("edit/{id}")
	public String edit(ModelMap model, 
			@PathVariable("id") Integer id) {
		Session session = factory.getCurrentSession();
		Product product = (Product) session.get(Product.class, id);
		model.addAttribute("model", product);
		model.addAttribute("list", getItems());
		return "admin/product/index";
	}
	
	public List<Product> getItems() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		return list;
	}
	
	@ModelAttribute("categories")
	public List<Category> getCates() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Category";
		Query query = session.createQuery(hql);
		List<Category> list = query.list();
		return list;
	}
	
	@ModelAttribute("suppliers")
	public List<Supplier> getSuppliers() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Supplier";
		Query query = session.createQuery(hql);
		List<Supplier> list = query.list();
		return list;
	}
	
	//====================
	@RequestMapping("load")
	public String loadPage(ModelMap model,
			@RequestParam(value="pageNo",defaultValue="0") Integer pageNo,
			@RequestParam(value="pageSize",defaultValue="10") Integer pageSize) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product";
		Query query = session.createQuery(hql);
		query.setFirstResult(pageNo*pageSize);
		query.setMaxResults(pageSize);
		List<Product> list = query.list();
		
		model.addAttribute("list", list);
		return "ajax/product/table";
	}
	
	@ResponseBody
	@RequestMapping("count")
	public String getPageCount(@RequestParam(value="pageSize",defaultValue="10") Integer pageSize) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT COUNT(p) FROM Product p";
		Query query = session.createQuery(hql);
		Long count = (Long) query.uniqueResult();
		return String.valueOf(Math.ceil(1.0*count/pageSize));
	}
}
