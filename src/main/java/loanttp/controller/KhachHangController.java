package loanttp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import loanttp.model.bean.KhachHang;
import loanttp.model.bean.May;
import loanttp.model.dao.KhachhangDAO;

@Controller
public class KhachHangController {
	KhachhangDAO khachhangDAO = new KhachhangDAO();
	
	@RequestMapping("/khachhang")
	public String getAll(Model model, HttpServletRequest request, HttpSession session) {
		try {
			String search = request.getParameter("search");
			if(search != null) {
				List<KhachHang> customerList = khachhangDAO.Search(search);
				session.setAttribute("customerList", customerList);
			}
			else {
				List<KhachHang> customerList = khachhangDAO.getAccountByPaging(1, 5);
				session.setAttribute("customerList", customerList);
			}
			
			int totalPlace = khachhangDAO.getAllKhachHang().size();
			int totalPageNumber = 1;
			if(totalPlace > 0) {
				if(totalPlace % 5 == 0)
					 totalPageNumber = totalPlace/5;
				else
					totalPageNumber = totalPlace/5 + 1;
			}
			session.setAttribute("totalPageNumber", totalPageNumber);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "QuanLyKhachHang";
	}
	
	@RequestMapping("/khachhang/{page}")
	public String Page(Model model, HttpServletRequest request, HttpSession session , @PathVariable int page) {
		try {
			List<KhachHang> customerList = khachhangDAO.getAccountByPaging(page, 5);
			session.setAttribute("customerList", customerList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "QuanLyKhachHang";
	}
	
	@RequestMapping("/add-khachhang")
	public String addKhachHang(Model model, HttpServletRequest request) {
		try {
			String makh  = request.getParameter("makh");
			String tenkh = request.getParameter("tenkh");
			String diachi = request.getParameter("diachi");
			String sdt = request.getParameter("sdt");
			String email = request.getParameter("email");
			
			KhachHang khachHang = new KhachHang(makh, tenkh, diachi, sdt, email);
			
			KhachHang khexists = khachhangDAO.getKhachHangById(makh);
			
			if(khexists == null) {
				int rs = khachhangDAO.addKhachHang(khachHang);
				if(rs > 0) {
					model.addAttribute("msg", "addOK");
				}
				else {
					model.addAttribute("msg", "addERROR");
				}
			}
			else {
				model.addAttribute("msg", "addexists");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/khachhang";
	}
	
	@RequestMapping("/update-khachhang") 
	public String UpdateMay(Model model, HttpServletRequest request) {
		try {
			String makh  = request.getParameter("makh");
			String tenkh = request.getParameter("tenkh");
			String diachi = request.getParameter("diachi");
			String sdt = request.getParameter("sdt");
			String email = request.getParameter("email");
			
			KhachHang khachHang = new KhachHang(makh, tenkh, diachi, sdt, email);
			int rs = khachhangDAO.updateKhachHang(khachHang);

			if (rs > 0) {
				model.addAttribute("msg", "updateOK");
			} else {
				model.addAttribute("msg", "updateERROR");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/khachhang";
	}
	
	
	@RequestMapping("/delete-kh/{id}")
	public String deleteKH(Model model, HttpServletRequest request, @PathVariable String id) {
		try {
			int rs = khachhangDAO.deleteKhachHang(id);
			if(rs > 0) {
				model.addAttribute("msg", "deleteOK");
			}
			else {
				model.addAttribute("msg", "deleteERROR");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/khachhang";
	}

}
