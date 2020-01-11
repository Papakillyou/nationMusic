package com.music.dao;

import com.music.entity.User;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Iterator;
import java.util.List;

@Transactional(rollbackFor = Exception.class)
//出现Exception异常回滚
@Repository("userDao") //进行注入
public class UserDaoImpl implements UserDao {
    @Resource(name="sessionFactory")
    private SessionFactory sessionFactory;

    @Override
    public void add(User user) {
        sessionFactory.getCurrentSession().save(user);
    }

    @Override
    public int login(User user) {
        Iterator<User> it;
        String hsql="FROM User u where u.username=? and u.userpassword=?";
        System.out.println(hsql);
        Query query = sessionFactory.getCurrentSession().createQuery(hsql);
        query.setString(0, user.getUsername()); //设置hql语句内的参数 将"?"的坑填了。
        query.setString(1, user.getUserpassword());
        System.out.println(user.getUsername());
        it=query.iterate();
        List<User> querylist=(List<User>) query.list();
        if(it.hasNext()) {
            System.out.println("true");
            return querylist.get(0).getUserid();
        } else {
            System.out.println("false");
            return  -1;
        }
    }

    @Override
    public List getUser() {
        return sessionFactory.getCurrentSession().createQuery("FROM User").list();
    }

    @Override
    public User getUser(int id) {
        return (User)sessionFactory.getCurrentSession().get(User.class, id);
    }

    @Override
    public void update(User user) {
        sessionFactory.getCurrentSession().update(user);
    }

    @Override
    public void delete(int id) {
        sessionFactory.getCurrentSession().delete(
                sessionFactory.getCurrentSession().get(User.class, id)
        );
    }
}
