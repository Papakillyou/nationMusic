package com.music.dao;

import com.music.entity.Order;

import java.util.List;

public interface OrderDao {
    //得到listid，在order表中根据listid获得musicid列表。由musicid得到所有的music信息（连表查询）。
    public List findOrderFromListid(int listid);
    //添加关联
    public void addOrder(Order order);

    //删除关联
    public void deleteOrder(int listid, int musicid);
}
