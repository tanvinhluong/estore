package com.estore.controller;

import java.util.List;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.estore.dao.CategoryDAO;
import com.estore.dao.ProductDAO;
import com.estore.entity.Category;
import com.estore.entity.Product;

@Controller
public class HomeController {
	@Autowired
	CategoryDAO cdao;
	@Autowired
	ProductDAO pdao;
	
	@Autowired
	JavaMailSender javaMailSender;
	
	
	
	@RequestMapping("/home/index")
	public String index(Model model) {
		
		  List<Category> list = cdao.getRandoms(); 
		  model.addAttribute("rands", list);
		  
		  
		  List<Product> list2 = pdao.findBySpecial(4);
		  model.addAttribute("list", list2);
		 
		return "user/home/index";
	}
	@RequestMapping("/home/about")
	public String about() {
		return "user/home/about";
	}
	@RequestMapping("/home/contact")
	public String contact() {
		return "user/home/contact";
	}
	@RequestMapping("/home/feedback")
	public String showFeedback() {
		return "user/home/feedback";
	}
	@RequestMapping(value = "/home/feedback", method = RequestMethod.POST)
	public String feedback(ModelMap model, @RequestParam("name") String name, @RequestParam("email") String email,
			@RequestParam("comboCate") String comboCate, @RequestParam("info") String info) {

		String category = "";
		if (comboCate.equals("web")) {
			category = "Website";
		} else if (comboCate.equals("service")) {
			category = "Chất lượng sản phẩm - dịch vụ";
		} else {
			category = "Thái độ phục vụ của nhân viên";
		}

		try {
			MimeMessage message = javaMailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true);
			helper.setFrom(email);
			helper.setTo("luongvinh1702@gmail.com");
			helper.setReplyTo("Online Shopping Mall <luongvinh1702@gmail.com>");
			helper.setSubject("[Feedback] Thư đóng góp ý kiến của khách hàng: " + name);
			helper.setText(
					"+ Email phản hồi: " + email + " <br>+ Chủ đề góp ý: " + category + " <br>+ Nội dung: " + info,
					true);
			javaMailSender.send(message);
			model.addAttribute("message", "Gửi phản hồi thành công. Cảm ơn bạn đã đóng góp ý kiến cho Online Shopping Mall.");
		} catch (Exception ex) {
			model.addAttribute("message", "Có lỗi xảy ra trong quá trình gửi thư phản hồi");
		}
		return "user/home/feedback";
	}
	
}
