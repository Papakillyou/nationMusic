package com.music.dao;

import com.music.entity.Songlist;

import java.util.ArrayList;

public interface SongListDao {
    //添加歌单
    public void addList(Songlist songlist);
    //删除歌单
    public void deleteList(int songlistId);
    //修改歌单信息
    public void updateList(Songlist songlist);
    //获取所有歌单
    public java.util.List queryAllList();

    //根据歌单id查找歌单
    public Songlist getListById(int songlistId);

    public ArrayList<Songlist> getListByUserId(int UserId);
}
