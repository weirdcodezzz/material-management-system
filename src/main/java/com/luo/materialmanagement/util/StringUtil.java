package com.luo.materialmanagement.util;

import java.util.ArrayList;
import java.util.List;

/**
 * 处理字符串的工具类
 * @author luo Fuqiang
 * @date 2020/12/14 10:45
 */
public class StringUtil {

    private StringUtil(){}

    public static List<String> getCodeList(String codes){
        String[] cs = codes.split("-");
        List<String> codeList = new ArrayList<>();
        for (String c : cs) {
            if (c != null) {
                codeList.add(c.trim());
            }
        }
        return codeList;
    }
}
