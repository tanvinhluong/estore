package com.estore.admin.controller;

import java.util.List;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.estore.bean.JSon;
import com.estore.entity.security.Master;
import com.estore.entity.security.MasterRole;
import com.estore.entity.security.Role;

@Transactional
@Controller
@RequestMapping("admin/master-role")
public class MasterRoleController {
	
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("index")
	public String index() {
		return "admin/master-role";
	}
	
	@SuppressWarnings("rawtypes")
	@ResponseBody
	@RequestMapping("get-role-ids")
	public String getRoleIds(@RequestParam("masterId") String masterId) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT role.id FROM MasterRole WHERE master.id=:mid";
		Query query = session.createQuery(hql);
		query.setParameter("mid", masterId);
		List<String> list = query.list();
		return JSon.fromObject(list);
	}
	
	@ResponseBody
	@RequestMapping("update")
	public void update(@RequestParam("masterId") String masterId, @RequestParam("roleId") String roleId) {
		Session session = factory.getCurrentSession();
		try {
			String hql = "FROM MasterRole WHERE master.id=:mid AND role.id=:rid";
			Query query = session.createQuery(hql);
			query.setParameter("mid", masterId);
			query.setParameter("rid", roleId);
			MasterRole mr = (MasterRole) query.uniqueResult();
			session.delete(mr);
		} 
		catch (Exception e) {
			Master master = new Master();
			master.setId(masterId);
			
			Role role = new Role();
			role.setId(roleId);
			
			MasterRole mr = new MasterRole();
			mr.setMaster(master);
			mr.setRole(role);
			
			session.save(mr);
		}
	}
	
	@SuppressWarnings("rawtypes")
	@ModelAttribute("masters")
	public List<Master> getMasters() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Master";
		Query query = session.createQuery(hql);
		List<Master> list = query.list();
		return list;
	}
	
	@SuppressWarnings("rawtypes")
	@ModelAttribute("roles")
	public List<Role> getRoles() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Role";
		Query query = session.createQuery(hql);
		List<Role> list = query.list();
		return list;
	}
}
