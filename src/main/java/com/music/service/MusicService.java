package com.music.service;

import com.music.entity.Music;

import java.util.List;

public interface MusicService {
    //添加music
    public boolean addMusic(Music music);
    //删除音乐
    public boolean deleteMusic(int musicId);
    //修改音乐信息
    public boolean updateMusic(Music music);
    //获取所有音乐音乐
    public List queryAllMusic();
    //根据id查找音乐
    public Music getMusicById(int musicId);
    //根据歌名查询
    public List queryMusicInfo(String keyword);
}
