package com.yuan.service;

import com.yuan.dao.MessageMapper;
import com.yuan.domain.Message;

import java.util.List;

public class MessageServiceImpl implements MessageService {

    private MessageMapper messageMapper;
    public void setMessageMapper(MessageMapper messageMapper) {
        this.messageMapper = messageMapper;
    }

    /**
     * 添加留言信息
     * @param message
     * @return
     */
    @Override
    public int addMessage(Message message) {
        return messageMapper.addMessage(message);
    }

    @Override
    public List<Message> queryMessages() {
        return messageMapper.queryMessages();
    }


}
