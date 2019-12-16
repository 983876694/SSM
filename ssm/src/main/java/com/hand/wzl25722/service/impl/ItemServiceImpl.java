package com.hand.wzl25722.service.impl;

import com.hand.wzl25722.mapper.ItemsMapper;
import com.hand.wzl25722.pojo.Items;
import com.hand.wzl25722.service.ItemsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ItemServiceImpl implements ItemsService {
    @Autowired
    private ItemsMapper itemsMapper;

    @Override
    public void deleteItem(Map<String, Object> map) {
        itemsMapper.deleteItem(map);
    }

    @Override
    public int updateItem(Map<String,Object> map) {
        int m = itemsMapper.updateItem(map);
        return m;
    }

    @Override
    public List<Items> getSsmItems(Map<String, Object> map) {
        List<Items> list = itemsMapper.getSsmItems(map);

        return list;
    }

    @Override
    public int addSsmItem(Items ssmItem) {
        Integer item = itemsMapper.getItemCode();
        System.out.println("isss"+item);
        String itemCode =String.valueOf(item);
        for (int i=itemCode.length();i<10;i++){
            itemCode=0+itemCode;
        }
        String itemCodeEnd = "ITEM"+itemCode;
        ssmItem.setItemCode(itemCodeEnd);
        int m = itemsMapper.insertSsmItem(ssmItem);
        return m;
    }






}
