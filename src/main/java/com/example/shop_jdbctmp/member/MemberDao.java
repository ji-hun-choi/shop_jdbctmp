package com.example.shop_jdbctmp.member;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

//dao interface. => mapper interface
@Mapper //mybatis에 정의된 맵퍼 인터페이스 지정.
public interface MemberDao {
	
	@Insert("insert into member values(#{id}, #{pwd}, #{mem_type}, #{tel}, #{addr})")
	void insert(Member m);
	
	@Select("select * from member where id=#{id}")
	Member select(@Param("id") String id);
	
	@Select("select * from member")
	ArrayList<Member> selectAll();
	
	@Update("update member set pwd=#{pwd}, tel=#{tel}, addr=#{addr} where id=#{id}")
	void update(Member m);
	
	@Delete("delete from member where id=#{id}")
	void delete(@Param("id") String id);
}
