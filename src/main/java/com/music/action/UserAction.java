package com.music.action;

import com.music.entity.User;
import com.music.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.util.Map;

@Controller("userAction")
@Scope("prototype")
public class UserAction extends ActionSupport {
    @Resource
    private UserService userService;

    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String login() {
        if(userService.login(user)!=-1) {//匹配到了
            Map session = ActionContext.getContext().getSession();
            session.put("username", user.getUsername());
            session.put("userid", userService.login(user));
            System.out.println("*******************************"+userService.login(user));
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    public String reg(){
        if(userService.addUser(user)) {
            Map session = ActionContext.getContext().getSession();
            session.put("userid", user.getUserid());
            session.put("username", user.getUsername());

            return "regsuccess";
        }
        else return ERROR;
    }

}
