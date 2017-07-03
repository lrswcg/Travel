package main.exception;

/**
 * Created by cnhhdn on 2017/6/14.
 */
public class CustomException extends RuntimeException {

    private static final long serialVersionUID=1L;

    public CustomException(String message, Throwable cause) {
        super(message, cause);
    }

    public CustomException(String message) {
        super(message);
    }
}
