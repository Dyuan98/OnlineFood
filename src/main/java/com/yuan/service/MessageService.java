package com.yuan.service;

import com.yuan.domain.Message;

import java.util.List;

public interface MessageService {

    // 添加留言
    int addMessage(Message message);

    // 查询所有留言
    List<Message> queryMessages();
}
