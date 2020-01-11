package com.music.action;


import com.music.entity.Music;
import com.music.entity.Order;
import com.music.entity.Songlist;
import com.music.entity.User;
import com.music.service.MusicService;
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

@Controller("OrderAction")
@Scope("prototype")
public class OrderAction {
    @Resource
    private OrderService orderService;
    @Resource
    private SongListService songListService;

    @Resource
    private MusicService musicService;

    private List<Music> musicList;

    private int listid;
    private int musicid;

    private ArrayList<Songlist> songlistList;


    public int getListid() {
        return listid;
    }

    public void setListid(int listid) {
        this.listid = listid;
    }

    public OrderService getOrderService() {
        return orderService;
    }

    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    public List<Music> getMusicList() {
        return musicList;
    }

    public void setMusicList(List<Music> musicList) {
        this.musicList = musicList;
    }

    public SongListService getSongListService() {
        return songListService;
    }

    public void setSongListService(SongListService songListService) {
        this.songListService = songListService;
    }

    public ArrayList<Songlist> getSonglistList() {
        return songlistList;
    }

    public void setSonglistList(ArrayList<Songlist> songlistList) {
        this.songlistList = songlistList;
    }

    public int getMusicid() {
        return musicid;
    }

    public void setMusicid(int musicid) {
        this.musicid = musicid;
    }

    //显示歌单内歌曲
    public String showSongFromList(){
        musicList=orderService.SongsFromSonglist(listid);
        return "showSongsFromSongList";
    }

    //显示用户歌单列表，用于向歌单里添加歌曲
    public String showListToAdd(){
        User user=new User();
        HttpServletRequest request= ServletActionContext.getRequest();
        HttpSession session= request.getSession();
        if((Integer) session.getAttribute("userid")==null)
            return "nologin";
        else{
        Integer userid=(Integer) session.getAttribute("userid");
        user.setUserid(userid);
        System.out.println(userid);
        songlistList=songListService.findByUserId(userid);
        for (int i=0;i<songlistList.size();i++){
            System.out.println(songlistList.get(i).getListname());
        }
        return "showListToAdd";
        }
    }

    public String addOrder(){
        System.out.println(musicid+"***********************");
        Music music=this.musicService.getMusicById(musicid);
        Songlist songlist=this.songListService.getListById(listid);
        Order order=new Order();
//        Music music=new Music();
//        music.setMusicid(musicid);
//        Songlist songlist=new Songlist();
//        songlist.setListid(listid);
        order.setMusicByMusic(music);
        order.setSonglistByList(songlist);
        orderService.addOrder(order);
        return "addOrder_message";
    }

    public String delOrder(){
        orderService.delOrder(listid,musicid);
        return "delOrder_message";
    }

}
