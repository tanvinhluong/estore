package com.estore.admin.controller;

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

import com.estore.entity.security.Master;

@Transactional
@Controller
@RequestMapping("admin/master")
public class MasterController {
	@Autowired
	SessionFactory factory;
	
	@Autowired
	ServletContext app;
	
	@RequestMapping("index")
	public String index(ModelMap model) {
		Master master = new Master();
		model.addAttribute("model", master);
		model.addAttribute("list", getItems());
		return "admin/master/index";
	}
	
	@RequestMapping("insert")
	public String insert(ModelMap model, 
			@ModelAttribute("model") Master master) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(master);
			t.commit();
			model.addAttribute("message", "Them moi thanh cong");
			model.addAttribute("model", new Master());
		} 
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Them moi that bai");
		}
		finally{
			session.close();
		}
		model.addAttribute("list", getItems());
		return "admin/master/index";
	}
	
	@RequestMapping("update")
	public String update(ModelMap model, 
			@ModelAttribute("model") Master master) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(master);
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
		return "admin/master/index";
	}
	
	@RequestMapping("delete")
	public String delete(ModelMap model, 
			@ModelAttribute("model") Master master) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(master);
			t.commit();
			model.addAttribute("message", "Xoa thanh cong");
			model.addAttribute("model", new Master());
		} 
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Xoa that bai");
		}
		finally{
			session.close();
		}
		model.addAttribute("list", getItems());
		return "admin/master/index";
	}

	@RequestMapping("edit/{id}")
	public String edit(ModelMap model, 
			@PathVariable("id") String id) {
		Session session = factory.getCurrentSession();
		Master master = (Master) session.get(Master.class, id);
		model.addAttribute("model", master);
		model.addAttribute("list", getItems());
		return "admin/master/index";
	}
	
	public List<Master> getItems() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Master";
		Query query = session.createQuery(hql);
		List<Master> list = query.list();
		return list;
	}
}
