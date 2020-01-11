package com.music.action;

import com.music.entity.Music;
import com.music.entity.Songlist;
import com.music.entity.User;
import com.music.service.OrderService;
import com.music.service.SongListService;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller("SongListAction")
@Scope("prototype")
public class SongListAction {
    @Resource
    private SongListService songListService;

    private Songlist songlist;

    private ArrayList<Songlist> songlistList;


    private int userId;

    public SongListService getSongListService() {
        return songListService;
    }

    public void setSongListService(SongListService songListService) {
        this.songListService = songListService;
    }

    public Songlist getSonglist() {
        return songlist;
    }

    public void setSonglist(Songlist songlist) {
        this.songlist = songlist;
    }

    public ArrayList<Songlist> getSonglistList() {
        return songlistList;
    }

    public void setSonglistList(ArrayList<Songlist> songlistList) {
        this.songlistList = songlistList;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    //显示添加项
    public String showAdd()throws Exception{
        return "addsonglist_view";
    }
    //添加歌单
    public String addSongList(){
        System.out.println("进入addsonglist");
//        songlist.setListid(null);
        User user=new User();
        HttpServletRequest request= ServletActionContext.getRequest();
        HttpSession session= request.getSession();
        Integer userid=(Integer) session.getAttribute("userid");
        user.setUserid(userid);
        songlist.setUserByUser(user);
        System.out.println("歌单名"+songlist.getListname());
        System.out.println(songlist.getUserByUser().getUserid());
        if(songListService.add(songlist))
            return "addsonglist_message";
        else
            return "error";
    }

    //根据当前用户名id，获取该用户的歌单
    public String showSongList(){
       songlistList=songListService.findByUserId(userId);
       System.out.println("******************"+userId);
       return "songlist";
    }
//删除歌单
    public String delSongList(){
        if(songListService.delete(songlist.getListid()))
             return "delete_songList";
        else return "error";
    }

}
