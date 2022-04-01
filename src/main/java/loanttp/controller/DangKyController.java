package loanttp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import loanttp.model.bean.DichVu;
import loanttp.model.bean.KhachHang;
import loanttp.model.bean.May;
import loanttp.model.dao.DangkyDAO;
import loanttp.model.dao.DichVuDAO;
import loanttp.model.dao.KhachhangDAO;
import loanttp.model.dao.MayDAO;

@Controller
public class DangKyController {
	
	MayDAO maydao = new MayDAO();
	KhachhangDAO khachhangDAO = new KhachhangDAO();
	DangkyDAO dkdao = new DangkyDAO();
	DichVuDAO dvdao = new DichVuDAO();

	@RequestMapping("/dangkysudungmay")
	public String DangKyMay(Model model, HttpSession session, HttpServletRequest request) {
		try {
			List<KhachHang> customerList = khachhangDAO.getAllKhachHang();
			session.setAttribute("customerList", customerList);
			
			List<May> mayList = maydao.getAllMay();
			session.setAttribute("mayList", mayList);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "DangKySuDungMay";
	}
	
	@RequestMapping("/dangkymay") 
	public String AddMay(Model model, HttpServletRequest request) {
		try {
			String makh = request.getParameter("makh");
			String mamay = request.getParameter("mamay");
			String ngaybd = request.getParameter("ngaybd");
			String giobd = request.getParameter("giobd");
			String thoigiansudung = request.getParameter("thoigiansudung");
			
			int rs = dkdao.DangKySuDungMay(makh, mamay, ngaybd, giobd, thoigiansudung);
			if(rs > 0) {
				model.addAttribute("msg", "addOK");
			}
			else {
				model.addAttribute("msg", "addERROR");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/dangkysudungmay";
	}
	
	@RequestMapping("/dangkysudungdichvu")
	public String DangKyDichVu(Model model, HttpSession session, HttpServletRequest request) {
		try {
			List<KhachHang> customerList = khachhangDAO.getAllKhachHang();
			session.setAttribute("customerList", customerList);
			
			List<DichVu> dvList = dvdao.getAllDichVu();
			session.setAttribute("dichvuList", dvList);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "DangKySuDungDichVu";
	}
	
	@RequestMapping("/dangkydichvu") 
	public String AddDichVu(Model model, HttpServletRequest request) {
		try {
			String makh = request.getParameter("makh");
			String madv = request.getParameter("madv");
			String ngaysd = request.getParameter("ngaysd");
			String giosd = request.getParameter("giosd");
			String soluong = request.getParameter("soluong");
			
			int rs = dkdao.DangKySuDungDichVu(makh, madv, ngaysd, giosd, soluong);
			if(rs > 0) {
				model.addAttribute("msg", "addOK");
			}
			else {
				model.addAttribute("msg", "addERROR");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/dangkysudungdichvu";
	}
}
