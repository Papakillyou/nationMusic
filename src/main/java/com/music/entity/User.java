package com.music.entity;

import javax.persistence.*;
import java.util.Collection;

@Entity
public class User {
    private int userid;
    private String username;
    private String userpassword;
    private Collection<Songlist> songlistsByUserid;

    @Id
    @Column(name = "userid", nullable = false)
    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    @Basic
    @Column(name = "username", nullable = false, length = 255)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "userpassword", nullable = false, length = 255)
    public String getUserpassword() {
        return userpassword;
    }

    public void setUserpassword(String userpassword) {
        this.userpassword = userpassword;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (userid != user.userid) return false;
        if (username != null ? !username.equals(user.username) : user.username != null) return false;
        if (userpassword != null ? !userpassword.equals(user.userpassword) : user.userpassword != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userid;
        result = 31 * result + (username != null ? username.hashCode() : 0);
        result = 31 * result + (userpassword != null ? userpassword.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "userByUser")
    public Collection<Songlist> getSonglistsByUserid() {
        return songlistsByUserid;
    }

    public void setSonglistsByUserid(Collection<Songlist> songlistsByUserid) {
        this.songlistsByUserid = songlistsByUserid;
    }
}
