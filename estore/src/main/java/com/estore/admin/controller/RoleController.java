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

import com.estore.entity.security.Role;

@Transactional
@Controller
@RequestMapping("admin/role")
public class RoleController {
	@Autowired
	SessionFactory factory;
	
	@Autowired
	ServletContext app;
	
	@RequestMapping("index")
	public String index(ModelMap model) {
		Role role = new Role();
		model.addAttribute("model", role);
		model.addAttribute("list", getItems());
		return "admin/role/index";
	}
	
	@RequestMapping("insert")
	public String insert(ModelMap model, 
			@ModelAttribute("model") Role role) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(role);
			t.commit();
			model.addAttribute("message", "Them moi thanh cong");
			model.addAttribute("model", new Role());
		} 
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Them moi that bai");
		}
		finally{
			session.close();
		}
		model.addAttribute("list", getItems());
		return "admin/role/index";
	}
	
	@RequestMapping("update")
	public String update(ModelMap model, 
			@ModelAttribute("model") Role role) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(role);
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
		return "admin/role/index";
	}
	
	@RequestMapping("delete")
	public String delete(ModelMap model, 
			@ModelAttribute("model") Role role) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(role);
			t.commit();
			model.addAttribute("message", "Xoa thanh cong");
			model.addAttribute("model", new Role());
		} 
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Xoa that bai");
		}
		finally{
			session.close();
		}
		model.addAttribute("list", getItems());
		return "admin/role/index";
	}

	@RequestMapping("edit/{id}")
	public String edit(ModelMap model, 
			@PathVariable("id") String id) {
		Session session = factory.getCurrentSession();
		Role role = (Role) session.get(Role.class, id);
		model.addAttribute("model", role);
		model.addAttribute("list", getItems());
		return "admin/role/index";
	}
	
	public List<Role> getItems() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Role";
		Query query = session.createQuery(hql);
		List<Role> list = query.list();
		return list;
	}
}
