package main.dto;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.io.Serializable;
import java.util.List;

/**
 * Created by cnhhdn on 2017/6/15.
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ListResult<T> implements Serializable{
    private static final long serialVersionUID=3L;
    private String message;
    private List<T> data;
    private String error;
    private int next;

    public ListResult(String message, String error) {
        this.message = message;
        this.error = error;
    }

    public ListResult(String message, List<T> data) {
        this.message = message;
        this.data = data;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public int getNext() {
        return next;
    }

    public void setNext(int next) {
        this.next = next;
    }
}
