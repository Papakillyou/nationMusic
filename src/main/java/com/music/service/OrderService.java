package com.music.service;

import com.music.entity.Order;

import java.util.List;

public interface OrderService {
    public List SongsFromSonglist(int listid);
    public boolean addOrder(Order order);
    public boolean delOrder(int listid,int musicid);
}
