package com.codingdojo.ProductsAndCategories.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.ProductsAndCategories.models.Category;
import com.codingdojo.ProductsAndCategories.models.Product;
import com.codingdojo.ProductsAndCategories.repositories.CategoryRepository;
import com.codingdojo.ProductsAndCategories.repositories.ProductRepository;

@Service
public class HomeService {
	private final ProductRepository productRepo;
	private final CategoryRepository categoryRepo;
	public HomeService(ProductRepository productRepo, CategoryRepository categoryRepo) {
		this.productRepo = productRepo;
		this.categoryRepo = categoryRepo;
	}
	public Product createProduct(Product p) {
		return productRepo.save(p);
	}
	public Category createCategory(Category c) {
		return categoryRepo.save(c);
	}
	public void updateProduct(Product product) {
		productRepo.save(product);
	}
	public void updateCategory(Category category) {
		categoryRepo.save(category);
	}
	public List<Product> getAllProducts(){
	return productRepo.findAll();
	}
	public List<Category> getAllCategories(){
		return categoryRepo.findAll();
	}
	public Product findProduct(Long id) {
		Optional<Product> optionalProduct = productRepo.findById(id);
		if(optionalProduct.isPresent()) {
			return optionalProduct.get();
		} else {
			return null;
		}
	}
	public Category findCategory(Long id) {
		Optional<Category> optionalCategory = categoryRepo.findById(id);
		if(optionalCategory.isPresent()) {
			return optionalCategory.get();
		} else {
			return null;
		}
	}
	public List<Product> getAllProductExcept(Long categoryId) {
		List<Product> products = this.getAllProducts();
		Category category = findCategory(categoryId); 
		List<Product> categoryProducts = category.getProducts();
		products.removeAll(categoryProducts);
		return products;
	}
	public List<Category> getAllCategoryExcept(Long productId){
		List<Category> categories = this.getAllCategories();
		Product product = findProduct(productId);
		List<Category> productCategories = product.getCategories();
		categories.removeAll(productCategories);
		return categories;
	}
}
