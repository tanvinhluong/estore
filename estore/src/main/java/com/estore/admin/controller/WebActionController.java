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

import com.estore.entity.security.WebAction;

@Transactional
@Controller
@RequestMapping("admin/webaction")
public class WebActionController {
	@Autowired
	SessionFactory factory;
	
	@Autowired
	ServletContext app;
	
	@RequestMapping("index")
	public String index(ModelMap model) {
		WebAction webAction = new WebAction();
		model.addAttribute("model", webAction);
		model.addAttribute("list", getItems());
		return "admin/webaction/index";
	}
	
	@RequestMapping("insert")
	public String insert(ModelMap model, 
			@ModelAttribute("model") WebAction webAction) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(webAction);
			t.commit();
			model.addAttribute("message", "Them moi thanh cong");
			model.addAttribute("model", new WebAction());
		} 
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Them moi that bai");
		}
		finally{
			session.close();
		}
		model.addAttribute("list", getItems());
		return "admin/webaction/index";
	}
	
	@RequestMapping("update")
	public String update(ModelMap model, 
			@ModelAttribute("model") WebAction webAction) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(webAction);
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
		return "admin/webaction/index";
	}
	
	@RequestMapping("delete")
	public String delete(ModelMap model, 
			@ModelAttribute("model") WebAction webAction) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(webAction);
			t.commit();
			model.addAttribute("message", "Xoa thanh cong");
			model.addAttribute("model", new WebAction());
		} 
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Xoa that bai");
		}
		finally{
			session.close();
		}
		model.addAttribute("list", getItems());
		return "admin/webaction/index";
	}

	@RequestMapping("edit/{id}")
	public String edit(ModelMap model, 
			@PathVariable("id") Integer id) {
		Session session = factory.getCurrentSession();
		WebAction webAction = (WebAction) session.get(WebAction.class, id);
		model.addAttribute("model", webAction);
		model.addAttribute("list", getItems());
		return "admin/webaction/index";
	}
	
	public List<WebAction> getItems() {
		Session session = factory.getCurrentSession();
		String hql = "FROM WebAction";
		Query query = session.createQuery(hql);
		List<WebAction> list = query.list();
		return list;
	}
}
