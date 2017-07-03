package main.exception;

/**
 * Created by cnhhdn on 2017/6/19.
 */
public class LoginException extends RuntimeException{

    private static final long serialVersionUID=4L;

    public LoginException(String message) {
        super(message);
    }

    public LoginException(String message, Throwable cause) {
        super(message, cause);
    }
}
