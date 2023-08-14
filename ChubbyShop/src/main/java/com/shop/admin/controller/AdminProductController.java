package com.shop.admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.shop.entity.Categories;
import com.shop.entity.ProductColor;
import com.shop.entity.ProductImage;
import com.shop.entity.Products;
import com.shop.repository.CategoriesRepo;
import com.shop.repository.OrdersRepo;
import com.shop.repository.ProductColorRepo;
import com.shop.repository.ProductImageRepo;
import com.shop.repository.ProductsRepo;

@Controller
public class AdminProductController {

	@Autowired
	HttpSession session;

	@Autowired
	CategoriesRepo cateRepo;

	@Autowired
	ProductColorRepo colorRepo;

	@Autowired
	ProductImageRepo imageRepo;

	@Autowired
	ProductsRepo productRepo;

	@Autowired
	OrdersRepo orderRepo;

	@GetMapping("/admin/products-list")
	public String doGetProductsList(@RequestParam Optional<Integer> categoryId, @RequestParam Optional<String> sort,
			@RequestParam Optional<Integer> page, Model model) {
		int p = 0;
		if (page.isPresent()) {
			p = page.get();
		}
		Pageable pageable = null;
		if (sort.isPresent() && sort.get().length() > 0) {
			pageable = PageRequest.of(p, 5, Sort.by(sort.get()).descending());
		} else
			pageable = PageRequest.of(p, 5);

		if (categoryId.isPresent()) {
			model.addAttribute("products", productRepo.findByCategoryId(categoryId.get(), pageable));
		} else {
			model.addAttribute("products", productRepo.findAll(pageable));
		}
		model.addAttribute("categories", cateRepo.findAll());

		return "admin/admin_product_list";
	}

	@GetMapping("/admin/add-product")
	public String doGetAddProduct(Model model) {
		model.addAttribute("categories", cateRepo.findAll());
		return "admin/admin_add_product";
	}

	@GetMapping("/admin/edit-product")
	public String doGetEditProduct(@RequestParam Integer productId, Model model) {
		model.addAttribute("product", productRepo.findById(productId).get());
		model.addAttribute("categories", cateRepo.findAll());
		return "admin/admin_edit_product";
	}

	@SuppressWarnings("resource")
	@PostMapping("/admin/add-product")
	@Transactional
	public String doPostAddProduct(Model model, HttpServletRequest req) {
		try {
			Products product = new Products();
			BeanUtils.populate(product, req.getParameterMap());
			// Get category id
			String categoryId = req.getParameter("categoryId");
			// Get category by id
			Optional<Categories> category = cateRepo.findById(Integer.valueOf(categoryId));
			// Set category for product, color and set created date
			product.setCategory(category.get());
			product.setColors(new ArrayList<>());
			product.setCreateDate(LocalDate.now());
			// Get path to save image
			String path = "src/main/resources/static/images/" + categoryId;
			// Set thumbnail
			product.setThumbnail(
					product.getSlug() + ((int) Math.floor(Math.random() * (99999 - 10000 + 1) + 10000)) + ".jpg");
			// Get thumbnail and save thumbnail to static folder
			MultipartFile thumbnail = ((MultipartHttpServletRequest) req).getFile("thumbnail");
			File file = new File(path + "/" + product.getThumbnail());
			FileOutputStream fileOutput = new FileOutputStream(file);
			fileOutput.write(thumbnail.getBytes());
			// Save product and get it
			product = productRepo.save(product);
			// Loop to get color
			for (int i = 1; true; i++) {
				if (req.getParameter("color" + i) != null && req.getParameter("hex" + i) != null) {
					ProductColor color = new ProductColor();
					color.setColorName(req.getParameter("color" + i));
					color.setColorHex(req.getParameter("hex" + i));
					color.setImages(new ArrayList<>());
					color.setProduct(product);
					// Save color
					color = colorRepo.save(color);
					// Loop for get image
					for (int j = 1; true; j++) {
						if (((MultipartHttpServletRequest) req).getFile("image" + i + "_" + j) != null) {
							ProductImage image = new ProductImage();
							image.setImage(product.getSlug() + color.getId() + j + ".jpg");
							image.setColorId(color.getId());
							// Get thumbnail and save thumbnail to static folder
							MultipartFile imageFile = ((MultipartHttpServletRequest) req)
									.getFile("image" + i + "_" + j);
							File fileImg = new File(path + "/" + image.getImage());
							FileOutputStream fileOutput1 = new FileOutputStream(fileImg);
							fileOutput1.write(imageFile.getBytes());
							// Save image
							imageRepo.save(image);
						} else
							break;
					}
				} else
					break;
			}
			model.addAttribute("success", "Add product successed!");
		} catch (Exception e) {
			model.addAttribute("success", "Add product faided! Error: " + e.getMessage());
		}

		model.addAttribute("categories", cateRepo.findAll());

		return "admin/admin_add_product";
	}

	@SuppressWarnings({ "resource", "deprecation" })
	@PostMapping("/admin/update-product")
	@Transactional
	public String doPostUpdateProduct(@RequestParam Integer productId, Model model, HttpServletRequest req) {
		if (productId != null) {
			try {
				Products product = productRepo.getById(Integer.valueOf(productId));
				BeanUtils.populate(product, req.getParameterMap());
				System.err.println(product.getThumbnail());
				// Get category id
				String categoryId = req.getParameter("categoryId");
				// Get category by id
				Optional<Categories> category = cateRepo.findById(Integer.valueOf(categoryId));
				// Set category for product, color and set created date
				product.setCategory(category.get());
				// Get path to save image
				String path = "src/main/resources/static/images/" + categoryId;
				// Get thumbnail and save thumbnail to static folder
				MultipartFile thumbnail = ((MultipartHttpServletRequest) req).getFile("thumbnail");
				File file = new File(path + "/" + product.getThumbnail());
				FileOutputStream fileOutput = new FileOutputStream(file);
				fileOutput.write(thumbnail.getBytes());
				// Loop to get color
				for (int i = 1; i < product.getColors().size() + 1; i++) {
					ProductColor color = product.getColors().get(i-1);
					color.setColorName(req.getParameter("color" + i));
					color.setColorHex(req.getParameter("hex" + i));

					// Loop for get image
					for (int j = 1; j < color.getImages().size() + 1; j++) {
						ProductImage image = color.getImages().get(j-1);
						// Get thumbnail and save thumbnail to static folder
						MultipartFile imageFile = ((MultipartHttpServletRequest) req).getFile("image" + i + "_" + j);
						File fileImg = new File(path + "/" + image.getImage());
						FileOutputStream fileOutput1 = new FileOutputStream(fileImg);
						fileOutput1.write(imageFile.getBytes());
					}
				}

				// Save product and get it
				product = productRepo.save(product);
				model.addAttribute("success", "Update product successed!");
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("success", "Update product faided! Error: " + e.getMessage());
			}
		}
		return "redirect:/admin/products-list";
	}

	@GetMapping("/admin/order-detail/{id}")
	public String doGetOrderDetail(@PathVariable Integer id, Model model) {

		model.addAttribute("order", orderRepo.findById(id).get());
		return "admin/admin_order_detail";
	}
}
