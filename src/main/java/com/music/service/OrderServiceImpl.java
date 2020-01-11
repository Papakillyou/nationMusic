package com.music.service;

import com.music.dao.MusicDao;
import com.music.dao.OrderDao;
import com.music.entity.Music;
import com.music.entity.Order;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.xml.bind.SchemaOutputResolver;
import java.util.ArrayList;
import java.util.List;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

    @Resource
    private OrderDao orderDao;
    @Resource
    private MusicDao musicDao;

    @Override
    public List SongsFromSonglist(int listid) {
        // 这个是从Order表中根据歌单id取出的该歌单中所有的歌曲id.
       List<Order> songIdFromOrder=this.orderDao.findOrderFromListid(listid);
       // 用于存放所有的音乐。用于显示
       List <Music> songsFromMusic = new ArrayList<Music>();
       for(int i=0;i<songIdFromOrder.size();i++){
           System.out.println(songIdFromOrder.get(i).getMusicByMusic().getMusicid()+"*******************");
         //  songsFromMusic.add(songIdFromOrder.get(i).getMusicByMusic());
           //根据音乐id查音乐。
           songsFromMusic.add(this.musicDao.getMusicById(songIdFromOrder.get(i).getMusicByMusic().getMusicid())) ;
       }
        return songsFromMusic;
    }

    @Override
    public boolean addOrder(Order order) {
        this.orderDao.addOrder(order);
        return true;
    }

    @Override
    public boolean delOrder(int listid, int musicid) {
        this.orderDao.deleteOrder(listid,musicid);
        return true;
    }
}
