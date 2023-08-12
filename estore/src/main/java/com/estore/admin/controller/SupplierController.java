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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.estore.entity.Supplier;

@Transactional
@Controller
@RequestMapping("admin/supplier")
public class SupplierController {
	@Autowired
	SessionFactory factory;
	
	@Autowired
	ServletContext app;
	
	@RequestMapping("index")
	public String index(ModelMap model) {
		Supplier supplier = new Supplier();
		model.addAttribute("model", supplier);
		model.addAttribute("list", getItems());
		return "admin/supplier/index";
	}
	
	@RequestMapping("insert")
	public String insert(ModelMap model, 
			@ModelAttribute("model") Supplier supplier,
			@RequestParam("upLogo") MultipartFile file) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			if(file.isEmpty()){
				supplier.setLogo("logo.png");
			}
			else{
				supplier.setLogo(System.currentTimeMillis()+file.getOriginalFilename());
				String path = app.getRealPath("/images/suppliers/"+supplier.getLogo());
				file.transferTo(new File(path));
			}
			session.save(supplier);
			t.commit();
			model.addAttribute("message", "Them moi thanh cong");
			model.addAttribute("model", new Supplier());
		} 
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Them moi that bai");
		}
		finally{
			session.close();
		}
		model.addAttribute("list", getItems());
		return "admin/supplier/index";
	}
	
	@RequestMapping("update")
	public String update(ModelMap model, 
			@ModelAttribute("model") Supplier supplier,
			@RequestParam("upLogo") MultipartFile file) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			if(!file.isEmpty()){
				supplier.setLogo(System.currentTimeMillis()+file.getOriginalFilename());
				String path = app.getRealPath("/images/suppliers/"+supplier.getLogo());
				file.transferTo(new File(path));
			}
			session.update(supplier);
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
		return "admin/supplier/index";
	}
	
	@RequestMapping("delete")
	public String delete(ModelMap model, 
			@ModelAttribute("model") Supplier supplier) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(supplier);
			t.commit();
			model.addAttribute("message", "Xoa thanh cong");
			model.addAttribute("model", new Supplier());
		} 
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Xoa that bai");
		}
		finally{
			session.close();
		}
		model.addAttribute("list", getItems());
		return "admin/supplier/index";
	}

	@RequestMapping("edit/{id}")
	public String edit(ModelMap model, 
			@PathVariable("id") String id) {
		Session session = factory.getCurrentSession();
		Supplier supplier = (Supplier) session.get(Supplier.class, id);
		model.addAttribute("model", supplier);
		model.addAttribute("list", getItems());
		return "admin/supplier/index";
	}
	
	public List<Supplier> getItems() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Supplier";
		Query query = session.createQuery(hql);
		List<Supplier> list = query.list();
		return list;
	}
}
