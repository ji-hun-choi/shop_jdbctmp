package com.example.shop_jdbctmp.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class MemService {
    @Autowired
    private MemberDao dao;

    public void joinMember(Member m) {
        dao.insert(m);
    }


    public Member getMember(String id) {
        return dao.select(id);
    }


    public void editMember(Member m) {
        dao.update(m);
    }

    public void delMember(String id) {
        dao.delete(id);
    }

    public ArrayList<Member> getAll(){
        return dao.selectAll();
    }
}
