package com.music.dao;

import com.music.entity.Order;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Transactional(rollbackFor = Exception.class)
//出现Exception异常回滚
@Repository("orderDao") //进行注入
public class OrderDaoImpl implements OrderDao{

    @Resource(name="sessionFactory")
    private SessionFactory sessionFactory;

    @Override
    public List findOrderFromListid(int listid) {
        return sessionFactory.getCurrentSession().createQuery("FROM Order o where o.songlistByList.listid="+listid).list();
        //return  sessionFactory.getCurrentSession().get(Order.class, listid);
    }

    @Override
    public void addOrder(Order order) {
        sessionFactory.getCurrentSession().save(order);
    }

    @Override
    public void deleteOrder(int listid, int musicid) {
        String hql = "select o from Order as o where o.songlistByList.listid=? and o.musicByMusic.musicid=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setInteger(0, (listid));
        query.setInteger(1, (musicid));
        Order o = (Order)query.list().get(0);
        sessionFactory.getCurrentSession().delete(o);
    }


}
