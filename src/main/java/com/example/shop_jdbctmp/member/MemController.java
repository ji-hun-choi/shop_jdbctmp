package com.example.shop_jdbctmp.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Map;

@Controller
@RequestMapping("/member")
public class MemController {
    @Autowired
    private MemService service;


    @GetMapping("/login")
    public String loginForm(){
        return "member/loginForm";
    }
    //로그인

    @PostMapping("/login")
    public String login(Map map, String id, String pwd, HttpSession session){
        Member m = service.getMember(id);
        if(m!=null && pwd.equals(m.getPwd())){
            session.setAttribute("id", id);
            session.setAttribute("type", m.isMem_type());
        }
        map.put("m", m);
        return "redirect:/";
    }


    //회원가입
    @GetMapping("/join")
    public String joinForm(){
        return "member/joinForm";
    }

    @PostMapping("join")
    public String join(Member m){
        service.joinMember(m);
        return "redirect:/";
    }


    @GetMapping("/detail")
    public String detail(HttpSession session, Model mm){
        String id = (String) session.getAttribute("id");
        Member m = service.getMember(id);
        mm.addAttribute("m", m);
        return "member/detail";
    }

    @GetMapping("/Logout")
    public String Logout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }

    @PostMapping("/edit")
    public String edit(Member m){
        service.editMember(m);
        return "redirect:/";
    }
    //내정보확인 및 수정
    //로그아웃 / 탈퇴

    @RequestMapping("/out")
    public String out(HttpSession session){
        String id = (String) session.getAttribute("id");
        service.delMember(id);
        return "redirect:/member/Logout";
    }

    @GetMapping("/list")
    public String list(Model m){
        ArrayList<Member> list = service.getAll();
        m.addAttribute("list", list);
        return "member/list";
    }

}
