package loanttp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import loanttp.model.bean.KhachHang;
import loanttp.model.bean.May;
import loanttp.model.dao.MayDAO;

@Controller
public class MayController {
	MayDAO maydao = new MayDAO();
	
	@RequestMapping("/sign-in")
	public ModelAndView signin(Model model, HttpServletRequest request) {
		return new ModelAndView("sign-in");
	}
	
	@RequestMapping("/may")
	public String may(Model model, HttpServletRequest request, HttpSession session) {
		try {
			
			String search = request.getParameter("search");
			if(search != null) {
				List<May> mayList = maydao.Search(search);
				session.setAttribute("mayList", mayList);	
			}
			else {
				List<May> mayList = maydao.getDichVuByPaging(1, 5);
				session.setAttribute("mayList", mayList);	
			}
			
			int totalPlace = maydao.getAllMay().size();
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
		return "QuanLyMay";
	}
	
	@RequestMapping("/may/{page}")
	public String Page(Model model, HttpServletRequest request, HttpSession session , @PathVariable int page) {
		try {
			List<May> mayList = maydao.getDichVuByPaging(page, 5);
			session.setAttribute("mayList", mayList);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "QuanLyMay";
	}
	
	@RequestMapping(value="/may/findById/{id}")
	public void findById(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session, @PathVariable String id) {
		try {
			response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
			Gson data = new Gson();
			May m = maydao.getMayById(id);
			String may = data.toJson(m);
			response.getWriter().write(may);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping("/add-may")
	public String addMay(Model model, HttpServletRequest request, HttpSession session) {
		try {
			String mamay = request.getParameter("mamay");
			String vitri = request.getParameter("vitri");
			String trangthai = request.getParameter("trangthai");
			
			if(mamay != null && vitri != null && trangthai != null) {
				May may = new May(mamay, vitri, trangthai);
				May mayexist = maydao.getMayById(mamay);
				if(mayexist == null) {
					int rs = maydao.addMay(may);
					
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
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/may";
	}
	
	@RequestMapping("/delete/{maMay}")
	public String deleteMay(Model model,HttpServletRequest request, HttpSession session, @PathVariable String maMay) {
		try {
			int rs1 = maydao.deleteSuDungMay(maMay);
			int rs = maydao.deleteMay(maMay);
			if(rs > 0) {
				model.addAttribute("msg", "deleteOK");
			}
			else {
				model.addAttribute("msg", "deleteERROR");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/may";
	}
	
	@RequestMapping("/update-may") 
	public String UpdateMay(Model model, HttpServletRequest request) {
		try {
			String mamay = request.getParameter("mamay");
			String vitri = request.getParameter("vitri");
			String trangthai = request.getParameter("trangthai");
			
			if(mamay != null && vitri != null && trangthai != null) {
				May may = new May(mamay, vitri, trangthai);
				int rs = maydao.updateMay(may);

				if (rs > 0) {
					model.addAttribute("msg", "editOK");
				} else {
					model.addAttribute("msg", "editERROR");
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/may";
	}
	
}
