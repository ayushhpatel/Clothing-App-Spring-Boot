package com.Shoping.Cloth.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.Shoping.Cloth.dao.CustomerDAO;
import com.Shoping.Cloth.dao.KidDAO;
import com.Shoping.Cloth.dao.ManDAO;
import com.Shoping.Cloth.dao.WomenDAO;
import com.Shoping.Cloth.model.Customer;
import com.Shoping.Cloth.model.Kid;
import com.Shoping.Cloth.model.Man;
import com.Shoping.Cloth.model.Women;

@Controller
public class ShopController {

	@Autowired
	CustomerDAO cdao;

	@Autowired
	ManDAO mdao;

	@Autowired
	WomenDAO wdao;

	@Autowired
	KidDAO kdao;

	public ShopController() {
		super();
	}

// giving product review details from all category having product price greater than certain amount to home page
	@RequestMapping("home")                                  // calling particular method if requested url is home
	public ModelAndView home() {
		ModelAndView mv=new ModelAndView("home");            // setting viename during object creation itself
		List<Man> man = mdao.findByAmtGreaterThan(100);      // extracting and storing list of products from man category with each product greater than 100 ruppes
		List<Women> women = wdao.findByAmtGreaterThan(100);
		List<Kid> kid = kdao.findByAmtGreaterThan(100);
		mv.addObject("allpmans", man);                       // binding information
		mv.addObject("allpwomens", women);
		mv.addObject("allpkids", kid);
		return mv;                                           // returning binded information to given viewname
	}
	
// registering user if same username doesn't exist after validating information through html attributes
	@RequestMapping(value = "registered", method = RequestMethod.POST)
	public ModelAndView registered(Customer c,HttpServletResponse response) {
		response.setHeader("Cache-control","no-cache,no-store,must-revalidate");   // not storing cache information so that user can't access previous page by going backwards
		ModelAndView mv = new ModelAndView("home");
		if(cdao.existsByName(c.getName())) {
			mv.addObject("msg", "User already exist");     // sending error message to user if same name already exist
		} else {
			cdao.save(c);                                  // saving user details in database
			mv.addObject("msg", "User Successfully Added");
		}
		return mv;
	}
	
// getting user/admin logged in by verifying credentials and then setting session attribute to check if user is logged in or not in future
	@RequestMapping(value="login",method = RequestMethod.POST)
	public ModelAndView login(HttpServletRequest req,HttpServletResponse response) {
		response.setHeader("Cache-control","no-cache,no-store,must-revalidate");
		String name = req.getParameter("uname");                  // getting and storing post data
		String pwd=req.getParameter("pwd");
		ModelAndView mv=new ModelAndView();
		if(name.equals("admin") && (cdao.existsByPwd(pwd))) {       // admin is recognized with name 'admin'
			mv.addObject("msg","Admin you are successfully logged in");
			HttpSession session=req.getSession();
			session.setAttribute("name", name);
			mv.setViewName("admin");
		}
		else if(cdao.existsByName(name)){
			  if(cdao.existsByPwd(pwd)) {                           // checking if password is correct or not
				mv.addObject("msg","You are successfully logged in");
				HttpSession session=req.getSession();
				session.setAttribute("name", name);
				List<Man> man = mdao.findByAmtGreaterThan(700);
				List<Women> women = wdao.findByAmtGreaterThan(900);
				List<Kid> kid = kdao.findByAmtGreaterThan(500);
				mv.addObject("allpmans", man);
				mv.addObject("allpwomens", women);
				mv.addObject("allpkids", kid);
				mv.setViewName("home");
			 }
			 else {
				mv.addObject("msg","Invalid password");
				mv.setViewName("home");
			 }
		}
		else {
			mv.addObject("msg","Invalid User");
			mv.setViewName("home");
		}
		return mv;
	}
	
// binding user details and giving it to view so that user can see his current details and can update details accordingly	
	@RequestMapping(value="updateacc",method=RequestMethod.GET)
	public ModelAndView accdetails(HttpServletRequest request) {
		String name=request.getParameter("name");
		ModelAndView mv=new ModelAndView();
		Customer c=cdao.findByName(name);
		if(c!=null) {                                       // validating object
			mv.addObject("accdetails",c);
			mv.setViewName("myaccount");
		}
		else {
			mv.addObject("msg","Invalid Credentials");
			mv.setViewName("home");
		}
		return mv;
	}
	
// updating users account details	
	@RequestMapping(value="update",method=RequestMethod.POST)
	public ModelAndView updateacc(HttpServletRequest request) {
		String name=request.getParameter("name");
		String mno=request.getParameter("mno");
		String dob=request.getParameter("dob");
		String pwd=request.getParameter("pwd");
		ModelAndView mv=new ModelAndView("home");
		Customer c=cdao.findByName(name);
		if(c!=null) {
			c.setMno(mno);                              // setting updated details
			c.setDob(dob);
			c.setPwd(pwd);
			cdao.save(c);
			mv.addObject("msg","Account details updated successfully");

		}
		else {
			mv.addObject("msg","Invalid Credentials");
		}
		return mv;
	}
		
// deleting user account and also removing previously set session attribute
	@RequestMapping(value="deleteacc",method=RequestMethod.GET)
	public ModelAndView deleteacc(HttpServletRequest request,HttpServletResponse response) {
		response.setHeader("Cache-control","no-cache,no-store,must-revalidate");
		String name=request.getParameter("name");
		ModelAndView mv=new ModelAndView("home");
		Customer c=cdao.findByName(name);
		if(c!=null) {						
			HttpSession session=request.getSession();
			session.removeAttribute("name");
			session.invalidate();
			cdao.delete(c);                                    // deleting account by giving object
			mv.addObject("msg","Account deleted successfully");
		}
		else {
			mv.addObject("msg","Invalid Credentials");
		}
		return mv;
	}
	
// request to add product from admin
	@RequestMapping("addp")
	public String products() {
		return "addproducts";
	}
	
// adding product to list of all available products	
	@RequestMapping(value="addpdetails",method=RequestMethod.POST)
	public ModelAndView addp(HttpServletRequest request) {
		String name=request.getParameter("name");
		String type=request.getParameter("type");
		String category=request.getParameter("category");
		int aqty=Integer.parseInt(request.getParameter("aqty"));
		int price=Integer.parseInt(request.getParameter("price"));
		String des=request.getParameter("description");
		String path=request.getParameter("imgpath");
		ModelAndView mv=new ModelAndView("admin");
		if(type.equals("man")) {
			Man m=new Man();
			m.setName(name);
			m.setAmt(price);
			m.setAqty(aqty);
			m.setCategory(category);
			m.setDescription(des);
			m.setImgpath(path);
			mdao.save(m);
		}
		else if(type.equals("women")) {
			Women w=new Women();
			w.setName(name);
			w.setAmt(price);
			w.setAqty(aqty);
			w.setCategory(category);
			w.setDescription(des);
			w.setImgpath(path);
			wdao.save(w);
		}
		else if(type.equals("kid")) {
			Kid k=new Kid();
			k.setName(name);
			k.setAmt(price);
			k.setAqty(aqty);
			k.setCategory(category);
			k.setDescription(des);
			k.setImgpath(path);
			kdao.save(k);
		}
		else {
			mv.addObject("msg","Invalid Type");
		}
		return mv;
	}

// to show particular product details from womens category that user is interested in
	@RequestMapping(value = "/product-detailw", method = RequestMethod.GET)
	public ModelAndView dwpage(HttpServletRequest request) {
		int pid = Integer.parseInt(request.getParameter("id"));
		ModelAndView mv = new ModelAndView("/product-detail");
		Women vm = wdao.findById(pid).orElse(new Women());       // getting product details by id
		mv.addObject("pdetails", vm);
		return mv;
	}

// to show particular product details from mans category that user is interested in
	@RequestMapping(value = "/product-detailm", method = RequestMethod.GET)
	public ModelAndView dmpage(HttpServletRequest request) {
		int pid = Integer.parseInt(request.getParameter("id"));
		ModelAndView mv = new ModelAndView("product-detail");
		Man vm = mdao.findById(pid).orElse(new Man());
		mv.addObject("pdetails", vm);
		return mv;
	}
	
// to show particular product details from kids category that user is interested in
	@RequestMapping(value = "/product-detailk", method = RequestMethod.GET)
	public ModelAndView dkpage(HttpServletRequest request) {
		int pid = Integer.parseInt(request.getParameter("id"));
		ModelAndView mv = new ModelAndView("product-detail");
		Kid vm = kdao.findById(pid).orElse(new Kid());
		mv.addObject("pdetails", vm);
		return mv;
	}
	
// to show searched category product details from mens wear that user is interested in
	@RequestMapping(value = "/scm", method = RequestMethod.GET)
	public ModelAndView searchm(HttpServletRequest request) {
		String category = request.getParameter("c");
		ModelAndView mv = new ModelAndView();
		List<Man> cman = mdao.findByCategory(category);             // searching by category in mens section
		if (cman.isEmpty()) {                                       // checking if product data is present for category
			mv.addObject("msg", "Product for this category doesn't exist");
			mv.setViewName("home");
		} else {
			mv.addObject("cval", cman);
			mv.setViewName("category");
		}
		return mv;
	}
	
// to show searched category product details from womens wear that user is interested in
	@RequestMapping(value = "/scw", method = RequestMethod.GET)
	public ModelAndView searchw(HttpServletRequest request) {
		String category = request.getParameter("c");
		ModelAndView mv = new ModelAndView();
		List<Women> cwomen = wdao.findByCategory(category);
		if (cwomen.isEmpty()) {
			mv.addObject("msg", "Product for this category doesn't exist");
			mv.setViewName("home");
		} else {
			mv.addObject("cval", cwomen);
			mv.setViewName("category");
		}
		return mv;
	}

// to show searched category product details from kids wear that user is interested in	
	@RequestMapping(value = "/sck", method = RequestMethod.GET)
	public ModelAndView searchk(HttpServletRequest request) {
		String category = request.getParameter("c");
		ModelAndView mv = new ModelAndView();
		List<Kid> ckid = kdao.findByCategory(category);
		if (ckid.isEmpty()) {
			mv.addObject("msg", "Product for this category doesn't exist");
			mv.setViewName("home");
		} else {
			mv.addObject("cval", ckid);
			mv.setViewName("category");
		}
		return mv;
	}
	
// adding particular product of type mens wear to cart when user adds it
	@RequestMapping(value="/addm",method=RequestMethod.GET)
	public ModelAndView addtocartm(HttpServletRequest request) {
		int pid = Integer.parseInt(request.getParameter("pid"));
		String cname = request.getParameter("cname");
		ModelAndView mv = new ModelAndView("home");
		Customer c=cdao.findByName(cname);                   // getting object by user name
		c.setCartid(pid);                                   // adding product id to users cart
		c.setType("man");
		cdao.save(c);
		mv.addObject("msg","Product added to cart successfully");
		return mv;
	}
	
// adding particular product of type womens wear to cart when user adds it
	@RequestMapping(value="/addw",method=RequestMethod.GET)
	public ModelAndView addtocartw(HttpServletRequest request) {
		int pid = Integer.parseInt(request.getParameter("pid"));
		String cname = request.getParameter("cname");
		ModelAndView mv = new ModelAndView("home");
		Customer c=cdao.findByName(cname);
		c.setCartid(pid);
		c.setType("women");
		cdao.save(c);
		mv.addObject("msg","Product added to cart successfully");
		return mv;
	}
	
// adding particular product of type kids wear to cart when user adds it	
	@RequestMapping(value="/addk",method=RequestMethod.GET)
	public ModelAndView addtocartk(HttpServletRequest request) {
		int pid = Integer.parseInt(request.getParameter("pid"));
		String cname = request.getParameter("cname");
		ModelAndView mv = new ModelAndView("home");
		Customer c=cdao.findByName(cname);
		c.setCartid(pid);
		c.setType("kid");
		cdao.save(c);
		mv.addObject("msg","Product added to cart successfully");
		return mv;
	}
	
// showing cart details of particular user	
	@RequestMapping(value="getcart",method=RequestMethod.GET)
	public ModelAndView getcart(HttpServletRequest request) {
		String name=request.getParameter("name");
		ModelAndView mv=new ModelAndView();
		Customer c=cdao.findByName(name);	
		if(c.getCartid()!=0) {
		  if(c.getType().equals("kid")) {
		  	Kid k=kdao.findById(c.getCartid()).orElse(null);
		  	mv.addObject("cartdetails",k);
		  	mv.setViewName("cart");
		  }
		  else if(c.getType().equals("man")) {
		  	Man m=mdao.findById(c.getCartid()).orElse(null);
		  	mv.addObject("cartdetails",m);
		  	mv.setViewName("cart");
		  }		
		  else if(c.getType().equals("women")) {
		  	Women w=wdao.findById(c.getCartid()).orElse(null);
		  	mv.addObject("cartdetails",w);
		  	mv.setViewName("cart");
		  }
		}
		else {
			mv.addObject("msg", "Your Cart is empty");
			mv.setViewName("home");
		}
		return mv;
	}
	
// removing product from users cart, finding user by current login name and setting cart id to 0
	@RequestMapping(value="rmvcart",method = RequestMethod.GET)
	public ModelAndView clearcart(HttpServletRequest request) {
		String name=request.getParameter("name");
		ModelAndView mv=new ModelAndView("home");
		Customer c=cdao.findByName(name);
		c.setCartid(0);
		c.setType(null);
		cdao.save(c);
		mv.addObject("msg","Item removed from cart");
		return mv;
	}
	
// logging out of users account by removing session attribute and redirecting him to home page with options of login and register
	@RequestMapping("logout")
	public ModelAndView logout(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mv=new ModelAndView("home");
		response.setHeader("Cache-control","no-cache,no-store,must-revalidate");
		HttpSession session=request.getSession();
		session.removeAttribute("name");
		session.invalidate();
		return mv;
	}
	
// for request to register	
	@RequestMapping("account")
	public String acc() {
		return "account";
	}
}
