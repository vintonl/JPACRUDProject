package com.skilldistilley.jpagrocerylist.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistilley.jpagrocerylist.dao.GroceryDAO;
import com.skilldistilley.jpagrocerylist.entities.Grocery;

@Controller
public class GroceryController {

	@Autowired
	private GroceryDAO groceryDao;

	@RequestMapping(path = "/")
	public String index(Model model) {
		List<Grocery> groceries = groceryDao.findAll();
		model.addAttribute("groceries", groceries);

		return "index";
	}

	@RequestMapping(path = "getGroceries.do", method = RequestMethod.GET)
	public ModelAndView getFilm(@RequestParam("find") String find) {
		ModelAndView mv = new ModelAndView();

		List<Grocery> groceries = groceryDao.findByItem(find);
		// film is unmanaged after it is outside of the transaction that exists in the
		// DAO

		mv.addObject("groceries", groceries);
		mv.setViewName("grocery/show");
		return mv;
	}

}
