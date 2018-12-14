package com.codingdojo.ProductsAndCategories.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.ProductsAndCategories.models.Category;
import com.codingdojo.ProductsAndCategories.models.Product;
import com.codingdojo.ProductsAndCategories.services.HomeService;

@Controller
public class HomeController {
	private HomeService homeService;
	
	public HomeController(HomeService homeService) {
		this.homeService = homeService;
	}
	@RequestMapping("/products/new")
	public String addProduct(@ModelAttribute("product")Product product) {
		return "product.jsp";
	}
    @RequestMapping(value="/create/product", method=RequestMethod.POST)
    public String createProduct(@Valid @ModelAttribute("product") Product product, BindingResult result) {
        if (result.hasErrors()) {
            return "product.jsp";
        } else {
        	homeService.createProduct(product);
            return "redirect:/products/new";
        }
    }
	@RequestMapping("/categories/new")
	public String addCategories(@ModelAttribute("category")Category category) {
		return "category.jsp";
	}
    @RequestMapping(value="/create/category", method=RequestMethod.POST)
    public String createCategory(@Valid @ModelAttribute("category") Category category, BindingResult result) {
        if (result.hasErrors()) {
            return "category.jsp";
        } else {
        	homeService.createCategory(category);
            return "redirect:/categories/new";
        }
    }
    @RequestMapping("/products/{id}")
    public String showProduct(Model model, @PathVariable("id")Long id) {
    	Product product = homeService.findProduct(id);
    	model.addAttribute("product", product);
    	model.addAttribute("categories", homeService.getAllCategoryExcept(id));
    	return "productDisplay.jsp";
    }
	@RequestMapping(value="/products/{id}", method=RequestMethod.POST)
	public String addProduct(@PathVariable("id") Long productId, @RequestParam("category") Long categoryId) {
		Product product = homeService.findProduct(productId);
		Category category = homeService.findCategory(categoryId);
		List<Category> categories = product.getCategories();
		categories.add(category);
		homeService.updateProduct(product);
		return "redirect:/products/"+productId;
	}
	@RequestMapping("/categories/{id}")
	public String showCategory(Model model, @PathVariable("id")Long id) {
		Category category = homeService.findCategory(id);
		model.addAttribute("category", category);
		model.addAttribute("products", homeService.getAllCategoryExcept(id));
		return "categoryDisplay.jsp";
	}
	@RequestMapping(value="/categories/{id}", method=RequestMethod.POST)
	public String addCategory(@PathVariable("id") Long categoryId, @RequestParam("product") Long productId) {
		Category category = homeService.findCategory(categoryId);
		Product product = homeService.findProduct(productId);
		List<Product> products = category.getProducts();
		products.add(product);
		homeService.updateCategory(category);
		return "redirect:/categories/"+categoryId;
	}
}
