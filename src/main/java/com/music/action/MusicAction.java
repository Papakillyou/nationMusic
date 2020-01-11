package com.music.action;

import com.music.entity.Music;
import com.music.service.MusicService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.FileUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.io.File;
import java.util.List;

@Controller("musicAction")
@Scope("prototype")
public class MusicAction extends ActionSupport {
    @Resource
    private MusicService musicService;

    private String keywords;

    private Music music;

    private List<Music> musicList;

    private File upmusic;//上传的音乐

    private String upmusicFileName;//上传的文件名

    private String upmuaicContentType;//文件类型

    public File getUpmusic() {
        return upmusic;
    }

    public void setUpmusic(File upmusic) {
        this.upmusic = upmusic;
    }


    public String getUpmusicFileName() {
        return upmusicFileName;
    }

    public void setUpmusicFileName(String upmusicFileName) {
        this.upmusicFileName = upmusicFileName;
    }

    public String getUpmuaicContentType() {
        return upmuaicContentType;
    }

    public void setUpmuaicContentType(String upmuaicContentType) {
        this.upmuaicContentType = upmuaicContentType;
    }

    public MusicService getMusicService() {
        return musicService;
    }

    public void setMusicService(MusicService musicService) {
        this.musicService = musicService;
    }

    public Music getMusic() {
        return music;
    }

    public void setMusic(Music music) {
        this.music = music;
    }

    public List<Music> getMusicList() {
        return musicList;
    }

    public void setMusicList(List<Music> musicList) {
        this.musicList = musicList;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    //显示添加项
    public String showAdd()throws Exception{
        return "add_view";
    }
    //添加音乐
    public String addMusic() throws Exception{
        music.setPath("/nationMusic_war_exploded/music/"+upmusicFileName);
        musicService.addMusic(music);
        String filePath="F:\\javaworkspace\\nationMusic\\target\\artifacts"+music.getPath();
        System.out.println(music.getPath());
        //String fileLocal="F:/javaworkspace/nationMusic/src/main/webapp/music/"+upmusicFileName;
        File saveFile=new File(filePath);
        FileUtils.copyFile(upmusic,saveFile);
        return "addmessage";
    }

    //显示所有音乐
    public String showMusic(){
        musicList=musicService.queryAllMusic();
        return "show_view";
    }

    //详情页面
    public String showDetail(){
        music=musicService.getMusicById(music.getMusicid());
        return "detail_view";
    }
    //显示修改项
    public String showEdit()throws Exception{
        music=musicService.getMusicById(music.getMusicid());
        return "edit_view";
    }
    //用来修改
    public String editMusic()throws Exception{
        System.out.println(music.getNation());
        System.out.println(music.getMusicid());
        System.out.println(music.getSummary());
        System.out.println(music.getPath());
        System.out.println(music.getSinger());
        System.out.println(music.getTitle());
        System.out.println(music.getOrdersByMusicid());
        musicService.updateMusic(music);
        return "edit_message";
    }
    //删除一首歌
    public String deleteMusic()throws Exception{
        musicService.deleteMusic(music.getMusicid());
        return "delete_message";
    }
    //按歌名查询歌曲
    public String queryMusic()throws Exception{
        musicList=musicService.queryMusicInfo(keywords);
        return "show_view";
    }
}
