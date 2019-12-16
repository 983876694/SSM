package com.hand.wzl25722.controller;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hand.wzl25722.pojo.Items;
import com.hand.wzl25722.pojo.Message;
import com.hand.wzl25722.service.ItemsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/item")
public class SsmItemController {
    @Autowired
    ItemsService itemsService;
    @RequestMapping("/itemList")
    @ResponseBody
    public Message getSsmItemListByAjax(
            @RequestParam(value = "start",defaultValue = "1")int start, @RequestParam(value = "pagesize",defaultValue = "5")
            int pagesize,
            @RequestParam(value = "itemSelectCode",defaultValue = "")
                    String itemSelectCode,
            @RequestParam(value = "iteSelectDescription",defaultValue = "")
                    String iteSelectDescription,
            @RequestParam(value = "itemSelectUom",defaultValue = "")
                    String itemSelectUom,
            @RequestParam(value = "selectStartActiveDate",defaultValue = "")
                    String selectStartActiveDate,
            @RequestParam(value = "selectEndActiveDate",defaultValue = "")
                    String selectEndActiveDate,
            @RequestParam(value = "selectEnabledFlag",defaultValue = "")
                    String selectEnabledFlag) {
                    Map<String,Object> map = new HashMap<>();
                    map.put("itemSelectCode",itemSelectCode);
                    map.put("iteSelectDescription",iteSelectDescription);
                    map.put("itemSelectUom",itemSelectUom);
                    map.put("selectStartActiveDate",selectStartActiveDate);
                    map.put("selectEndActiveDate",selectEndActiveDate);
                    map.put("selectEnabledFlag",selectEnabledFlag);
                    PageHelper.startPage(start, pagesize);
                    List<Items> list = itemsService.getSsmItems(map);
        PageInfo page = new PageInfo(list);
        Message message = new Message();
        return message.success().add("page",page);
    }
        //删除单个数据
    @RequestMapping("/deleteById")
    @ResponseBody
    public Message getDeleteItemById(@RequestParam("itemId")Long itemId){
        Map<String,Object> map = new HashMap<>();
        map.put("itemId",itemId);
        itemsService.deleteItem(map);
        Map<String,Object> map2 = new HashMap<>();
        map2.put("msg","删除成功！");
        return  Message.success().add("msg",map2);
    }
        //删除批量数据
    @RequestMapping("/deleteByIdList")
    @ResponseBody
    public Message getDeleteItem(@RequestParam("itemId2")String itemId2){
        // System.out.println("hhhhh");
        List<Long> longList =  new ArrayList<>();
        String[] itemids = itemId2.split(",");
        for (String s:itemids){
            longList.add(Long.parseLong(s));
        }
        Map<String,Object> map = new HashMap<>();

        map.put("list",longList);
        itemsService.deleteItem(map);
        return  Message.success();
    }


    @RequestMapping("/addItem")
    @ResponseBody
    public Message addItem(@Valid Items ssmItem){
        int m = itemsService.addSsmItem(ssmItem);
        Message message = new Message();
        if(m<=0){
            return message.fail();
        }
            return message.success();
    }
    @RequestMapping("/updateItemById")
    @ResponseBody
    public Message getUpdateItemById(
            @RequestParam(value = "updateItemId",defaultValue = "")String updateItemId,
            @RequestParam(value = "updateIteDescription",defaultValue = "")String updateIteDescription,
            @RequestParam(value = "updateItemUom",defaultValue = "")String updateItemUom,
            @RequestParam(value = "updateStartActiveDate",defaultValue = "")String updateStartActiveDate,
            @RequestParam(value = "updateEndActiveDate",defaultValue = "")String updateEndActiveDate,
            @RequestParam(value = "updateEnabledFlag",defaultValue = "")String updateEnabledFlag
    ){
        Map<String,Object> map = new HashMap<>();
        map.put("updateItemId",updateItemId);
        map.put("updateIteDescription",updateIteDescription);
        map.put("updateItemUom",updateItemUom);
        map.put("updateStartActiveDate",updateStartActiveDate);
        map.put("updateEndActiveDate",updateEndActiveDate);
        map.put("updateEnabledFlag",updateEnabledFlag);
        int m = itemsService.updateItem(map);
        Message message= new Message();
        return message.success().add("m",m);

    }
    @RequestMapping("/selItemById")
    @ResponseBody
    public Message getItemById(@RequestParam("itemId") String itemId){
        HashMap<String,Object> hashMap =  new HashMap<>();
        hashMap.put("itemId",itemId);
        List<Items> list = itemsService.getSsmItems(hashMap);
        Message message= new Message();
        return message.success().add("list",list);

    }

}
