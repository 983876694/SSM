package com.hand.wzl25722.service;

import com.hand.wzl25722.pojo.Items;

import java.util.List;
import java.util.Map;

public interface ItemsService {
    public void deleteItem(Map<String,Object> map);
    public int updateItem(Map<String,Object> map);
    public List<Items> getSsmItems(Map<String,Object> map);
    public int addSsmItem(Items ssmItem);


}
