package com.luo.materialmanagement.util;

import java.io.FileOutputStream;
import java.util.List;

import com.luo.materialmanagement.pojo.MaterialVO;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.*;

/**
 * 导出Excel工具类
 * @author luo Fuqiang
 * @date 2020/12/14 11:42
 */
public class ExcelExportUtil {

    /**
     * 将数据导出成Excel文件
     *
     * @param list 物料列表
     * @param wb HSSFWorkbook对象
     * @return 返回一个更新好的HSSFWorkbook对象
     */
    public static HSSFWorkbook GetHSSFWorkbook(List<MaterialVO> list, HSSFWorkbook wb) {

        String[] title = {"物料编码", "物料描述", "物料单位", "生效时间从", "生效时间至", "是否启用"};
        String sheetName = "物料信息表";
        String[][] values = new String[list.size()][6];
        for (int i = 0; i < list.size(); i++) {
            values[i][0] = list.get(i).getCode();
            values[i][1] = list.get(i).getDescription();
            values[i][2] = list.get(i).getUom();
            values[i][3] = String.valueOf(list.get(i).getStartActiveDate());
            values[i][4] = String.valueOf(list.get(i).getEndActiveDate());
            values[i][5] = list.get(i).getEnabledFlag() == 1 ? "是" : "否";
        }

        // 第一步，创建一个HSSFWorkbook，对应一个Excel文件
        if (wb == null) {
            wb = new HSSFWorkbook();
        }

        // 第二步，在workbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet(sheetName);

        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制
        HSSFRow row = sheet.createRow(0);

        // 第四步，创建单元格，并设置值表头 设置表头居中
        HSSFCellStyle style = wb.createCellStyle();

        // 创建一个居中格式
        style.setAlignment(HorizontalAlignment.CENTER);
        //设置单元格宽度自适应，在此基础上把宽度调至1.5倍
        for (int i = 0; i < title.length; i++) {
            sheet.autoSizeColumn(i, true);
            sheet.setColumnWidth(i, sheet.getColumnWidth(i) * 15 / 10);
        }
        // 声明列对象
        HSSFCell cell = null;

        // 创建标题
        for (int i = 0; i < title.length; i++) {
            cell = row.createCell(i);
            cell.setCellValue(title[i]);
            cell.setCellStyle(style);
            sheet.autoSizeColumn(i);
            sheet.setColumnWidth(i, sheet.getColumnWidth(i) * 17 / 10);
        }

        // 创建内容
        for (int i = 0; i < values.length; i++) {
            row = sheet.createRow(i + 1);
            for (int j = 0; j < values[i].length; j++) {
                // 将内容按顺序赋给对应的列对象
                row.createCell(j).setCellValue(values[i][j]);
            }
        }
        return wb;
    }

}
