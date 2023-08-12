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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.estore.dao.CustomerDAO;
import com.estore.entity.Customer;

@Transactional
@Controller
@RequestMapping("admin/customer")
public class CustomerController {
	@Autowired
	SessionFactory factory;
	
	@Autowired
	ServletContext app;
	
	@Autowired
	CustomerDAO cdao;
	
	@RequestMapping("index")
	public String index(ModelMap model) {
		Customer customer = new Customer();
		model.addAttribute("model", customer);
		model.addAttribute("list", getItems());
		return "admin/customer/index";
	}
	
	@RequestMapping("insert")
	public String insert(ModelMap model, 
			@ModelAttribute("model") Customer customer,
			@RequestParam("photo_file") MultipartFile file) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			if(file.isEmpty()){
				customer.setPhoto("logo.png");
			}
			else{
				customer.setPhoto(System.currentTimeMillis()+file.getOriginalFilename());
				String path = app.getRealPath("/images/customers/"+customer.getPhoto());
				file.transferTo(new File(path));
			}
			session.save(customer);
			t.commit();
			model.addAttribute("message", "Them moi thanh cong");
			model.addAttribute("model", new Customer());
		} 
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Them moi that bai");
		}
		finally{
			session.close();
		}
		model.addAttribute("list", getItems());
		return "admin/customer/index";
	}
	
	@RequestMapping("update")
	public String update(ModelMap model, 
			@ModelAttribute("model") Customer customer,
			@RequestParam("photo_file") MultipartFile file) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			if(!file.isEmpty()){
				customer.setPhoto(System.currentTimeMillis()+file.getOriginalFilename());
				String path = app.getRealPath("/images/customers/"+customer.getPhoto());
				file.transferTo(new File(path));
			}
			session.update(customer);
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
		return "admin/customer/index";
	}
	
	@RequestMapping("delete")
	public String delete(ModelMap model, 
			@ModelAttribute("model") Customer customer) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(customer);
			t.commit();
			model.addAttribute("message", "Xoa thanh cong");
			model.addAttribute("model", new Customer());
		} 
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Xoa that bai");
		}
		finally{
			session.close();
		}
		model.addAttribute("list", getItems());
		return "admin/customer/index";
	}

	@RequestMapping("edit/{id}")
	public String edit(Model model, 
			@PathVariable("id") String id) {
		Customer entity = cdao.findById(id);
		
		model.addAttribute("model", entity);
		model.addAttribute("list", cdao.findAll());
		return "admin/customer/index";
	}
	
	
	
	public List<Customer> getItems() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Customer";
		Query query = session.createQuery(hql);
		List<Customer> list = query.list();
		return list;
	}
}
