package com.music.service;

import com.music.dao.MusicDao;
import com.music.entity.Music;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("musicService")
public class MusicServiceImpl implements MusicService{

    @Resource
    private MusicDao musicDao;

    @Override
    public boolean addMusic(Music music) {
        this.musicDao.addMusic(music);
        return true;
    }

    @Override
    public boolean deleteMusic(int musicId) {
        this.musicDao.deleteMusic(musicId);
        return true;
    }

    @Override
    public boolean updateMusic(Music music) {
        this.musicDao.updateMusic(music);
        return true;
    }

    @Override
    public List queryAllMusic() {
        return this.musicDao.queryAllMusic();
    }

    @Override
    public Music getMusicById(int musicId) {
        return this.musicDao.getMusicById(musicId);
    }

    @Override
    public List queryMusicInfo(String keyword) {
        return this.musicDao.queryMusicInfo(keyword);
    }


}
