package com.example.demo.mapper;

import com.example.demo.model.Area;
import com.example.demo.model.City;
import com.example.demo.model.Pro;
import com.example.demo.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by hasee on 2017/8/30.
 */
@Mapper
@Repository
public interface UserMapper
{
    int count();

    List list(Map map);

    int toDel(Integer id);

    User toUpdate(Integer id);

    void doUpdate(User user);

    List<User> allClazz();

    int doInsert(User user);

	User toLook(Integer id);

    List<Pro> proList();

    List<City> getCity(Integer code);

    List<Area> getArea(Integer code);
}
