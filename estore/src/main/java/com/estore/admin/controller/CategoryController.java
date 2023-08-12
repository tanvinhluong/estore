package com.estore.admin.controller;

import java.util.List;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.estore.dao.CategoryDAO;
import com.estore.entity.Category;

@Transactional
@Controller
@RequestMapping("admin/category")
public class CategoryController {
	@Autowired
	SessionFactory factory;
	@Autowired
	CategoryDAO dao;
	
	@RequestMapping("index")
	public String index(Model model) {
		Category entity = new Category();
		
		model.addAttribute("model", entity);
		model.addAttribute("list", dao.findAll());
		
		return "admin/category/index";
	}
	
	@RequestMapping("edit/{id}")
	public String edit(Model model,@PathVariable("id") Integer id) {
		Category entity = dao.findById(id);
		
		model.addAttribute("model", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/category/index";
	}
	
	@RequestMapping("insert")
	public String create(RedirectAttributes model,@ModelAttribute("entity") Category entity) {
		dao.create(entity);
		model.addAttribute("message", "Thêm mới thành công!");
		return "redirect:/admin/category/index";
	}
	
	@RequestMapping("update")
	public String update(RedirectAttributes model,@ModelAttribute("entity") Category entity) {
		dao.update(entity);
		model.addAttribute("message", "Cập nhật thành công!");
		return "redirect:/admin/category/edit/" +entity.getId();
	}
	
	@RequestMapping(value={"delete", "delete/{id}"})
	public String delete(RedirectAttributes model,
			@RequestParam(value="id", required=false) Integer id1, 
			@PathVariable(value="id",required=false) Integer id2) {
		if(id1 != null) {
			dao.delete(id1);
		}
		else {
			dao.delete(id2);
		}
		model.addAttribute("message", "Xóa thành công!");
		return "redirect:/admin/category/index";
	
	}
}
