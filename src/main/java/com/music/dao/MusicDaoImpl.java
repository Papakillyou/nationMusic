package com.music.dao;

import com.music.entity.Music;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Transactional(rollbackFor = Exception.class)
//出现Exception异常回滚
@Repository("musicDao") //进行注入
public class MusicDaoImpl implements MusicDao{

    @Resource(name="sessionFactory")
    private SessionFactory sessionFactory;

    @Override
    public void addMusic(Music music) {
        sessionFactory.getCurrentSession().save(music);
    }

    @Override
    public void deleteMusic(int musicId) {
        sessionFactory.getCurrentSession().delete(
                sessionFactory.getCurrentSession().get(Music.class, musicId)
        );
    }

    @Override
    public void updateMusic(Music music) {
        sessionFactory.getCurrentSession().update(music);
    }

    @Override
    public List queryAllMusic() {
        return sessionFactory.getCurrentSession().createQuery("FROM Music").list();
    }

    @Override
    public Music getMusicById(int musicId) {
        return (Music) sessionFactory.getCurrentSession().get(Music.class, musicId);
    }

    @Override
    public List queryMusicInfo(String keyword) {
        String hql="From Music music where 1=1";
        if (!keyword.equals("")){
            hql=hql+"and music.title like '%"+ keyword +"%'";
            hql=hql+" or music.singer like '%"+ keyword +"%'";
            hql=hql+" or music.nation like '%"+ keyword +"%'";}
        return sessionFactory.getCurrentSession().createQuery(hql).list();
    }


}
