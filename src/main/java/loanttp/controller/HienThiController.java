package loanttp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import loanttp.model.bean.SuDungDichVu;
import loanttp.model.bean.SuDungMay;
import loanttp.model.dao.HienThiThongTinDAO;

@Controller
public class HienThiController {
	HienThiThongTinDAO htttdao = new HienThiThongTinDAO();

	@RequestMapping("/hienthithongtin")
	public String HienThiThongTin(Model model, HttpServletRequest request, HttpSession session) {
		try {
			List<SuDungMay> dsSDMay = htttdao.SuDungMay();
			session.setAttribute("dsSDMay", dsSDMay);
			
			List<SuDungDichVu> dsSDDV = htttdao.SuDungDichVu();
			session.setAttribute("dsSDDV", dsSDDV);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "HienThiThongTin";
	}
}
