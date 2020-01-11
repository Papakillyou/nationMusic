package com.music.service;

import com.music.entity.Songlist;

import java.util.ArrayList;


public interface SongListService {
    public boolean add(Songlist songlist);

    public boolean delete(int songlistId);

    public boolean update(Songlist songlist);

    public ArrayList<Songlist> findByUserId(int userid);
    //根据歌单id查找歌单
    public Songlist getListById(int songlistId);
}
