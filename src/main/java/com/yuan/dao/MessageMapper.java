package com.yuan.dao;

import com.yuan.domain.Message;

import java.util.List;


public interface MessageMapper {

    // 添加留言
    int addMessage(Message message);

    // 查询所有留言
    List<Message> queryMessages();
}
