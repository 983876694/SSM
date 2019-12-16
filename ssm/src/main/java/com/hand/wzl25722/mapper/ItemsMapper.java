package com.hand.wzl25722.mapper;

import com.hand.wzl25722.pojo.Items;

import java.util.List;
import java.util.Map;

public interface ItemsMapper {
    public List<Items> getSsmItems(Map<String,Object> map);
    public int insertSsmItem(Items items);
    public Integer getItemCode();
    public void deleteItem(Map<String,Object> map);
    public int updateItem(Map<String,Object> map);

}
