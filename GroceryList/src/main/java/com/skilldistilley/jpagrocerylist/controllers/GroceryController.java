package com.skilldistilley.jpagrocerylist.controllers;

import java.util.List;

import javax.validation.Valid;

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

		List<Grocery> purchasedGroceries = groceryDao.findAllPurchased();
		model.addAttribute("purchasedGroceries", purchasedGroceries);

		return "/WEB-INF/index.jsp";
	}

	@RequestMapping(path = "index.do")
	public String indexPath(Model model) {
		List<Grocery> groceries = groceryDao.findAll();
		model.addAttribute("groceries", groceries);

		List<Grocery> purchasedGroceries = groceryDao.findAllPurchased();
		model.addAttribute("purchasedGroceries", purchasedGroceries);
		
		return "/WEB-INF/index.jsp";
	}

	@RequestMapping(path = "getGroceries.do", method = RequestMethod.GET)
	public ModelAndView getFilm(@RequestParam("find") String find) {
		ModelAndView mv = new ModelAndView();

		List<Grocery> groceries = groceryDao.findByWordSearch(find);

		mv.addObject("groceries", groceries);
		mv.setViewName("/WEB-INF/grocery/show.jsp");
		return mv;
	}

	@RequestMapping(path = "getItemFields.do", params = "itemId", method = RequestMethod.GET)
	public String getItemFields(@RequestParam("itemId") int itemId, Model model) {
		Grocery grocery = groceryDao.findById(itemId);
		model.addAttribute("grocery", grocery);

		return "/WEB-INF/grocery/update.jsp";
	}

	@RequestMapping(path = "updateItemFields.do", params = "itemId", method = RequestMethod.POST)
	public ModelAndView updateItemFields(@RequestParam("itemId") int itemId, @Valid Grocery grocery) {
		ModelAndView mv = new ModelAndView();
		groceryDao.update(itemId, grocery);
		Grocery display = groceryDao.findById(itemId);
		mv.addObject("grocery", display);
		mv.setViewName("index.do");
		return mv;
	}

	@RequestMapping(path = "updateItemPurchased.do", params = "itemId", method = RequestMethod.POST)
	public ModelAndView updateItemPurchased(@RequestParam("itemId") int itemId) {
		ModelAndView mv = new ModelAndView();
		groceryDao.updatePurchased(itemId);
		Grocery display = groceryDao.findById(itemId);
		mv.addObject("grocery", display);
		mv.setViewName("index.do");
		return mv;
	}
	
	@RequestMapping(path = "updateItemAddBackToList.do", params = "itemId", method = RequestMethod.POST)
	public ModelAndView updateItemAddBackToList(@RequestParam("itemId") int itemId) {
		ModelAndView mv = new ModelAndView();
		groceryDao.updateAddBackToList(itemId);
		Grocery display = groceryDao.findById(itemId);
		mv.addObject("grocery", display);
		mv.setViewName("index.do");
		return mv;
	}

	@RequestMapping(path = "deleteItem.do", params = "itemId", method = RequestMethod.POST)
	public ModelAndView deleteFilmFromSearch(@RequestParam("itemId") int itemId) {
		boolean delete = groceryDao.delete(itemId);

		if (!delete) {
			System.out.println("************************************");
			System.out.println("Item not deleted.");
			System.out.println("************************************");
		}

		ModelAndView mv = new ModelAndView();
		Grocery foundGrocery = groceryDao.findById(itemId);
		mv.addObject("grocery", foundGrocery);
		mv.setViewName("index.do");
		return mv;
	}

	@RequestMapping(path = "create.do", method = RequestMethod.GET)
	public ModelAndView createForm(@Valid Grocery grocery) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/WEB-INF/grocery/create.jsp");
		return mv;
	}

	@RequestMapping(path = "createItem.do", method = RequestMethod.POST)
	public ModelAndView newFilm(@Valid Grocery grocery) {
		ModelAndView mv = new ModelAndView();
		Grocery newGrocery = groceryDao.create(grocery);

		mv.addObject("grocery", newGrocery);
		mv.setViewName("index.do");
		return mv;
	}

}
