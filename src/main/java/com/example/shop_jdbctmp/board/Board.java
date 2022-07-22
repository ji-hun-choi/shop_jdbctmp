package com.example.shop_jdbctmp.board;

import lombok.*;

import java.sql.Date;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Board {

    private int num;
    private String writer;
    private Date w_date;
    private String title;
    private String content;
}
