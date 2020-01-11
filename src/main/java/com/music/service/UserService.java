package com.music.service;

import com.music.entity.User;

import java.util.List;

public interface UserService {
    public boolean addUser(User user);

    public int login(User user);

    public List getAllUser();

    public User getUserById(int id);

    public boolean updateUser(User user);

    public boolean deleteUser(int id);
}
