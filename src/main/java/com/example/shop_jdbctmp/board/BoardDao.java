package com.example.shop_jdbctmp.board;

import org.apache.ibatis.annotations.*;

import java.util.ArrayList;
import java.util.Date;

@Mapper
public interface BoardDao{
    @Insert("insert into board(writer,w_date,title,content) value(#{writer}, now(), #{title}, #{content})")
    void insert(Board b);

    @Select("select * from board where num = #{num}")
    Board select(@Param("num") int num);

    @Select("select * from board")
    ArrayList<Board> selectAll();

    @Select("select * from board where title like #{title} order by num")
    ArrayList<Board> selectByTitleLike(@Param("title") String title);

    @Select("select * from board where writer=#{writer}")
    ArrayList<Board> selectByWriter(@Param("writer") String writer);

    @Update("update board set title=#{title}, content=#{content} where num=#{num}")
    void update(Board b);

    @Delete("delete from board where num=#{num}")
    void delete(@Param("num") int num);
}
