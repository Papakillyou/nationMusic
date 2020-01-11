package com.music.dao;

import com.music.entity.Songlist;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Transactional(rollbackFor = Exception.class)
//出现Exception异常回滚
@Repository("listDao") //进行注入
public class SongListDaoImpl implements SongListDao{

    @Resource(name="sessionFactory")
    private SessionFactory sessionFactory;


    @Override
    public void addList(Songlist songlist) {
        System.out.println("进入dao");
        System.out.println(songlist.getListname());
        System.out.println(songlist.getUserByUser().getUserid());
        sessionFactory.getCurrentSession().save(songlist);
    }

    @Override
    public void deleteList(int songlistId) {
        sessionFactory.getCurrentSession().delete(
                sessionFactory.getCurrentSession().get(Songlist.class, songlistId)
        );
    }

    @Override
    public void updateList(Songlist songlist) {
        sessionFactory.getCurrentSession().update(songlist);
    }

    @Override
    public List queryAllList() {
        return sessionFactory.getCurrentSession().createQuery("FROM Songlist ").list();
    }

    @Override
    public Songlist getListById(int listId) {
        return (Songlist) sessionFactory.getCurrentSession().get(Songlist.class, listId);
    }

    @Override
    public ArrayList<Songlist> getListByUserId(int UserId) {
        String hql="from Songlist song where song.userByUser.userid="+UserId;
        return (ArrayList<Songlist>) sessionFactory.getCurrentSession().createQuery(hql).list();
    }
}
