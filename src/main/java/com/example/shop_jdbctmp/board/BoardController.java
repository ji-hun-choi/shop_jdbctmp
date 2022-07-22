package com.example.shop_jdbctmp.board;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService service;

    @GetMapping("/add")
    public void addForm(){}

    @PostMapping("/add")
    public String add(Board b){
        service.addBoard(b);
        return "redirect:/board/";
    }

    @RequestMapping("/")
    public String list(Model model){
        ArrayList<Board> list = service.getAll();
        model.addAttribute("list", list);
        return "/board/list";
    }

    @ResponseBody
    @GetMapping("/getByNum")
    public Map getByNum(int num){
        Map map = new HashMap();
        Board b = service.getByNum(num);
        map.put("num", b.getNum());
        map.put("writer", b.getWriter());
        map.put("w_date", b.getW_date());
        map.put("title", b.getTitle());
        map.put("content", b.getContent());

        return map;
    }

    @GetMapping("/detail")
    public String detail(int num, Model model){
        Board b = service.getByNum(num);
        model.addAttribute("b", b);
        return "/board/detail";
    }

    @PostMapping("/detail")
    public String edit(Board b){
        service.editBoard(b);
        return "redirect:/board/";
    }

    @RequestMapping("/delete")
    public String delete(int num){
        service.delBoard(num);
        return "redirect:/board/";
    }

    @PostMapping("/getbytitle")
    public String getByTitle(Model model, String val){
        ArrayList<Board> list = service.getByTitle("%"+val+"%");
        model.addAttribute("list", list);
        return "/board/list";
    }

    @PostMapping("/getbywriter")
    public String getByWriter(Model model, String val){
        ArrayList<Board> list = service.getByWriter(val);
        model.addAttribute("list", list);
        return "/board/list";
    }


    // 3. list.jsp 글목록 위에 검색폼을 추가
    // -> 제목으로 검색, 작성자로 검색
    // 검색한 결과를 list.jsp에 출력
}
