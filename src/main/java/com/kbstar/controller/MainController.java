package com.kbstar.controller;

import com.kbstar.dto.Cust;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.servlet.http.HttpSession;

@Slf4j
@Controller
public class MainController {

    @Autowired
    CustService custService;
    @Autowired
    private BCryptPasswordEncoder encoder;
    @RequestMapping("/")
    public String main() {
        return "index";
    }

    @RequestMapping("/charts")
    public String tables(Model model) {
        model.addAttribute("center", "charts");
        return "index";
    }
    @RequestMapping("/livechart")
    public String livechart(Model model) {
        model.addAttribute("center", "livechart");
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("center", "login");
        return "index";
    }
    @RequestMapping("/logout")
    public String logout(Model model, HttpSession session) {
        if(session != null){
            session.invalidate(); //세션 정보 삭제
        }
        return "index";
    }
    @RequestMapping("/loginimpl")
    public String loginimpl(Model model, String id, String pwd,
                            HttpSession session) throws Exception {
        Cust cust = null;
        String nextPage = "loginfail";
        try{
            cust = custService.get(id);
            if(cust != null && encoder.matches(pwd,cust.getPwd())){   //DB에 아이디가 있다.
                nextPage = "loginok";
                session.setMaxInactiveInterval(100000); //세션정보 저장시간
                session.setAttribute("loginadm", cust);
                //세션정보 저장 loginCust라는 이름으로 Cust 정보 저장
            }
        }catch(Exception e){
            throw new Exception("System Error");
        }
        model.addAttribute("center", nextPage);
        return "index";
    }
    @RequestMapping("/register")
    public String register(Model model) {
        model.addAttribute("center", "register");
        return "index";
    }
    @RequestMapping(value ="/registerimpl")
    public String registerImpl(Model model, Cust cust,
                               HttpSession session) throws Exception {
        cust.setPwd(encoder.encode(cust.getPwd()));
        try {
            custService.register(cust);
            session.setMaxInactiveInterval(10000);  //세션정보 저장시간
            session.setAttribute("loginadm", cust); //회원가입되면 바로 로그인될 수 있도록
        } catch (Exception e) {
            throw new Exception("가입 오류");
        }
        model.addAttribute("radm", cust);
        model.addAttribute("center", "registerok");
        return "index";
    } //세션에 로그인 정보를 입력해주면, 회원가입을 하면 바로 login이 될 수 있도록 해주자.
    @RequestMapping(value ="/managerinfo")
    public String managerinfo(Model model, String id) throws Exception {
        Cust cust = null;
        try{
            cust = custService.get(id);
        }catch(Exception e) {
            throw new Exception("System Error");
        }
        model.addAttribute("managerinfo", cust);
        model.addAttribute("center", "managerinfo");
        return "index";
    }
}
