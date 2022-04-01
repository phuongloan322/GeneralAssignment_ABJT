package loanttp.controller;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import loanttp.model.bean.DichVu;
import loanttp.model.bean.KhachHang;
import loanttp.model.bean.May;
import loanttp.model.dao.DichVuDAO;

@Controller
public class DichVuController {

	DichVuDAO dichvudao = new DichVuDAO();
	
	@RequestMapping("/dichvu")
	public String DichVu(Model model, HttpServletRequest request, HttpSession session) {
		try {
			String search = request.getParameter("search");
			if(search != null) {
				Pattern pattern = Pattern.compile("\\d*");
	            Matcher matcher = pattern.matcher(search);
				if(matcher.matches()) {
					long gia = Integer.parseInt(search);
					List<DichVu> dvList = dichvudao.SearchNumber(search);
					session.setAttribute("dvList", dvList);
				}
				else {
					List<DichVu> dvList = dichvudao.SearchText(search);
					session.setAttribute("dvList", dvList);
				}
				
			}
			else {
				List<DichVu> dvList = dichvudao.getDichVuByPaging(1, 5);
				session.setAttribute("dvList", dvList);
			}
			
			int totalPlace = dichvudao.getAllDichVu().size();
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
		return "QuanLyDichVu";
	}
	
	@RequestMapping("/dichvu/{page}")
	public String Page(Model model, HttpServletRequest request, HttpSession session , @PathVariable int page) {
		try {
			List<DichVu> dvList = dichvudao.getDichVuByPaging(page, 5);
			session.setAttribute("dvList", dvList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "QuanLyDichVu";
	}
	
	@RequestMapping("/add-dichvu")
	public String addDichVu(Model model, HttpServletRequest request) {
		try {
			String madv = request.getParameter("madv");
			String tendv = request.getParameter("tendv");
			String donvitinh = request.getParameter("donvitinh");
			String dongia = request.getParameter("dongia");
			
			DichVu dichVu = new DichVu(madv, tendv, donvitinh, dongia);
						
			DichVu dichvuexists = dichvudao.getDichVuById(madv);
			if(dichvuexists == null) {
				int rs = dichvudao.addDichVu(dichVu);
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
		return "redirect:/dichvu";
	}
	
	@RequestMapping(value="/dichvu/findById/{id}")
	public void findById(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session, @PathVariable String id) {
		try {
			response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
			Gson data = new Gson();
			DichVu dv = dichvudao.getDichVuById(id);
			String dichvu = data.toJson(dv);
			response.getWriter().write(dichvu);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/update-dichvu/{id}") 
	public String UpdateMay(Model model, HttpServletRequest request, HttpSession session, @PathVariable String id) {
		try {
			
			DichVu dv = dichvudao.getDichVuById(id);
			model.addAttribute("dichvu", dv);
			
			String madv = request.getParameter("madv");
			String tendv = request.getParameter("tendv");
			String donvitinh = request.getParameter("donvitinh");
			String dongia = request.getParameter("dongia");
			
			if(madv != null && tendv != null && donvitinh != null && dongia != null) {
				DichVu dichVu = new DichVu(madv, tendv, donvitinh, dongia);
				int rs = dichvudao.updateDichVu(dichVu);

				if (rs > 0) {
					model.addAttribute("msg", "editOK");
					return "redirect:/dichvu";
				} else {
					model.addAttribute("msg", "editERROR");
					return "redirect:/dichvu";
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "EditDichVu";
	}
	
	@RequestMapping("/delete-dv/{id}")
	public String deleteDichVu(Model model, @PathVariable String id) {
		try {
			int rs = dichvudao.deleteDichVu(id);
			if(rs > 0) {
				model.addAttribute("msg", "deleteOK");
			}
			else {
				model.addAttribute("msg", "deleteERROR");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/dichvu";
	}
}
