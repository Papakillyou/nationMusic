package com.music.entity;

import javax.persistence.*;
import java.util.Collection;

@Entity
public class Songlist {
    private int listid;
    private String listname;
    private Collection<Order> ordersByListid;
    private User userByUser;

    @Id
    @Column(name = "listid", nullable = false)
    public int getListid() {
        return listid;
    }

    public void setListid(int listid) {
        this.listid = listid;
    }

    @Basic
    @Column(name = "listname", nullable = false, length = 255)
    public String getListname() {
        return listname;
    }

    public void setListname(String listname) {
        this.listname = listname;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Songlist songlist = (Songlist) o;

        if (listid != songlist.listid) return false;
        if (listname != null ? !listname.equals(songlist.listname) : songlist.listname != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = listid;
        result = 31 * result + (listname != null ? listname.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "songlistByList")
    public Collection<Order> getOrdersByListid() {
        return ordersByListid;
    }

    public void setOrdersByListid(Collection<Order> ordersByListid) {
        this.ordersByListid = ordersByListid;
    }

    @ManyToOne
    @JoinColumn(name = "user", referencedColumnName = "userid", nullable = false)
    public User getUserByUser() {
        return userByUser;
    }

    public void setUserByUser(User userByUser) {
        this.userByUser = userByUser;
    }
}
