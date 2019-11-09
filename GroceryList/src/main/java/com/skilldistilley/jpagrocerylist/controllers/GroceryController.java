package com.skilldistilley.jpagrocerylist.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
}
