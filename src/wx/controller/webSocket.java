package com.how2java.bitcoin;



import wx.utils.GetHttpSessionConfigurator;

import java.io.IOException;

import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;

/**
 * @ServerEndpoint 注解是一个类层次的注解，它的功能主要是将目前的类定义成一个websocket服务器端,
 * 注解的值将被用于监听用户连接的终端访问URL地址,客户端可以通过这个URL来连接到WebSocket服务器端
 */
@ServerEndpoint(value = "/ws/bitcoinServer",configurator= GetHttpSessionConfigurator.class)
public class webSocket {

    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;
    private HttpSession httpSession;
    @OnOpen
    public void onOpen(Session session, EndpointConfig config){

    }


    public void sendMessage(String message) throws IOException{
    }

    @OnClose
    public void onClose()
    {
    }


    @OnMessage
    public void onMessage(String message, Session session) {
        System.out.println("来自客户端的消息:" + message);
    }

    @OnError
    public void onError(Session session, Throwable error){
    }


}
