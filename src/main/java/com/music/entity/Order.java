package com.music.entity;

import javax.persistence.*;

@Entity
public class Order {
    private int orderid;
    private Songlist songlistByList;
    private Music musicByMusic;

    @Id
    @Column(name = "orderid", nullable = false)
    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Order order = (Order) o;

        if (orderid != order.orderid) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return orderid;
    }

    @ManyToOne
    @JoinColumn(name = "list", referencedColumnName = "listid", nullable = false)
    public Songlist getSonglistByList() {
        return songlistByList;
    }

    public void setSonglistByList(Songlist songlistByList) {
        this.songlistByList = songlistByList;
    }

    @ManyToOne
    @JoinColumn(name = "music", referencedColumnName = "musicid", nullable = false)
    public Music getMusicByMusic() {
        return musicByMusic;
    }

    public void setMusicByMusic(Music musicByMusic) {
        this.musicByMusic = musicByMusic;
    }
}
