package com.example.shop_jdbctmp.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@Repository
public class MemDao {

    @Autowired
    private JdbcTemplate temp;

    public class MemberMapper implements RowMapper<Member> {
        @Override
        public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
            return new Member(rs.getString(1), rs.getString(2), rs.getBoolean(3), rs.getString(4),rs.getString(5));
        }
    }

    public void insert(Member m) {
        String sql = "insert into member(id, pwd, mem_type, tel, addr) values(?, ?, ?, ?, ?)";
        temp.update(sql, new Object[] {m.getId(), m.getPwd(), m.isMem_type(), m.getTel(), m.getAddr()});
    }

    public Member select(String id) {
        String sql = "select * from member where id=?";
        Member m;
        try {
            m = temp.queryForObject(sql, new MemberMapper(), id);
        } catch (EmptyResultDataAccessException e){
            m = null;
        }
        return m;
    }

    public void update(Member m) {
        String sql = "update member set pwd=?, tel=?, addr=? where id=?";
        temp.update(sql, new Object[]{m.getPwd(), m.getTel(), m.getAddr(), m.getId()});
    }

    public void delete(String id) {
        String sql = "delete from member where id=?";
        temp.update(sql, id);
    }

    public ArrayList<Member> selectAll(){
        String sql = "select * from member";
        return (ArrayList<Member>) temp.query(sql, new MemberMapper());
    }
}
