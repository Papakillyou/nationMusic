package com.music.dao;

import com.music.entity.Music;

import java.util.List;

public interface MusicDao {
    //添加music
    public void addMusic(Music music);
    //删除音乐
    public void deleteMusic(int musicId);
    //修改音乐信息
    public void updateMusic(Music music);
    //获取所有音乐音乐
    public List queryAllMusic();
    //根据id查找音乐
    public Music getMusicById(int musicId);
    //根据歌名查询
    public List queryMusicInfo(String keyword);

}
