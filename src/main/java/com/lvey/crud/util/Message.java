package com.lvey.crud.util;

import java.util.HashMap;

public class Message {

    private int code;  // 100 - 成功  200 - 失败
    private String msg;
    private HashMap<String, Object> extend = new HashMap<>();

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public HashMap<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(HashMap<String, Object> extend) {
        this.extend = extend;
    }

    public static Message success() {
        Message result = new Message();
        result.setCode(100);
        result.setMsg("处理成功！");
        return result;
    }

    public static Message error() {
        Message result = new Message();
        result.setCode(200);
        result.setMsg("处理失败！");
        return result;
    }

    public Message add(String key, Object value) {
        this.getExtend().put(key, value);
        return this;
    }
}
