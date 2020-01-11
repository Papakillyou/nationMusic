package com.music.service;

import com.music.dao.SongListDao;
import com.music.entity.Songlist;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;

@Service("songlistService")
public class SongListServiceImpl implements SongListService {

    @Resource
    private SongListDao songListDao;

    @Override
    public boolean add(Songlist songlist) {
        System.out.println(songlist.getListname());
        this.songListDao.addList(songlist);
        return true;
    }

    @Override
    public boolean delete(int songlistId) {
        this.songListDao.deleteList(songlistId);
        return true;
    }

    @Override
    public boolean update(Songlist songlist) {
        this.songListDao.updateList(songlist);
        return true;
    }

    @Override
    public ArrayList<Songlist> findByUserId(int userid) {

        return  this.songListDao.getListByUserId(userid);
    }

    @Override
    public Songlist getListById(int songlistId) {

        return this.songListDao.getListById(songlistId);
    }
}
