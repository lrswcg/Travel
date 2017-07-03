package main.dto;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.io.Serializable;

/**
 * Created by cnhhdn on 2017/6/15.
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
public class BaseResult<T> implements Serializable{
    private static final long serialVersionUID=2L;
    private String error;
    private T data;
    private String message;
    private int next;

    public BaseResult(String message, String error) {
        this.message = message;
        this.error = error;
    }

    public BaseResult(String message, T data) {
        this.message = message;
        this.data = data;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getNext() {
        return next;
    }

    public void setNext(int next) {
        this.next = next;
    }

}
