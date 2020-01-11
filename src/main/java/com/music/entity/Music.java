package com.music.entity;

import javax.persistence.*;
import java.util.Collection;

@Entity
public class Music {
    private int musicid;
    private String title;
    private String singer;
    private String summary;
    private String path;
    private String nation;
    private Collection<Order> ordersByMusicid;

    @Id
    @Column(name = "musicid", nullable = false)
    public int getMusicid() {
        return musicid;
    }

    public void setMusicid(int musicid) {
        this.musicid = musicid;
    }

    @Basic
    @Column(name = "title", nullable = false, length = 255)
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "singer", nullable = false, length = 255)
    public String getSinger() {
        return singer;
    }

    public void setSinger(String singer) {
        this.singer = singer;
    }

    @Basic
    @Column(name = "summary", nullable = false, length = 255)
    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    @Basic
    @Column(name = "path", nullable = false, length = 255)
    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    @Basic
    @Column(name = "nation", nullable = false, length = 30)
    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Music music = (Music) o;

        if (musicid != music.musicid) return false;
        if (title != null ? !title.equals(music.title) : music.title != null) return false;
        if (singer != null ? !singer.equals(music.singer) : music.singer != null) return false;
        if (summary != null ? !summary.equals(music.summary) : music.summary != null) return false;
        if (path != null ? !path.equals(music.path) : music.path != null) return false;
        if (nation != null ? !nation.equals(music.nation) : music.nation != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = musicid;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (singer != null ? singer.hashCode() : 0);
        result = 31 * result + (summary != null ? summary.hashCode() : 0);
        result = 31 * result + (path != null ? path.hashCode() : 0);
        result = 31 * result + (nation != null ? nation.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "musicByMusic")
    public Collection<Order> getOrdersByMusicid() {
        return ordersByMusicid;
    }

    public void setOrdersByMusicid(Collection<Order> ordersByMusicid) {
        this.ordersByMusicid = ordersByMusicid;
    }
}
