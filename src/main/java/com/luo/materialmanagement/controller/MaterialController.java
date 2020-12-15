package com.luo.materialmanagement.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.luo.materialmanagement.pojo.Material;
import com.luo.materialmanagement.pojo.MaterialVO;
import com.luo.materialmanagement.pojo.Message;
import com.luo.materialmanagement.service.MaterialService;
import com.luo.materialmanagement.util.StringUtil;
import com.sun.deploy.net.HttpResponse;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;


import javax.validation.Valid;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author luo Fuqiang
 * @date 2020/12/2 13:54
 */
@Controller
public class MaterialController {

    @Autowired
    MaterialService materialService;


    @RequestMapping(value = "/materials", method = RequestMethod.GET)
    @ResponseBody
    public Message getMaterialListWithJson(
            @RequestParam(name = "pageNo", defaultValue = "1") int pageNo,
            @RequestParam(name = "pageSize", defaultValue = "5") int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<MaterialVO> result = materialService.getMaterialList();
        PageInfo pageInfo = new PageInfo(result, 5);
        return Message.success().add("pageInfo", pageInfo);
    }


    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Message addMaterial(@Valid Material material, BindingResult result) {
        if (result.hasErrors()) {
            Map<String, Object> map = new HashMap<>(16);
            List<FieldError> errors = result.getFieldErrors();
            errors.forEach(v -> {
                System.out.println(v.getField());
                System.out.println(v.getDefaultMessage());
                map.put(v.getField(), v.getDefaultMessage());
            });


            return Message.fail().add("errorFields", map);
        }
        materialService.addMaterial(material);
        return Message.success();
    }


    @RequestMapping(value = "/material/{code}", method = RequestMethod.GET)
    @ResponseBody
    public Message getMaterialByCode(@PathVariable String code) {
        MaterialVO material = materialService.getMaterialByCode(code);
        return Message.success().add("mat", material);
    }


    /**
     * 修改
     *
     * @param material
     * @param result
     * @return
     */
    @RequestMapping(value = "/update/{code}", method = RequestMethod.POST)
    @ResponseBody
    public Message updateMaterialByCode(@Valid Material material, BindingResult result) {
        if (result.hasErrors()) {
            Map<String, Object> map = new HashMap<>(16);
            List<FieldError> errors = result.getFieldErrors();
            errors.forEach(v -> {
                map.put(v.getField(), v.getDefaultMessage());
            });
            return Message.fail().add("errorFields", map);
        }
        materialService.updateMaterialByCode(material);
        return Message.success();
    }


    /**
     * 删除
     *
     * @param code
     * @return
     */
    @RequestMapping(value = "/delete/{code}", method = RequestMethod.DELETE)
    @ResponseBody
    public Message deleteMaterialByCode(@PathVariable String code) {
        materialService.deleteMaterial(code);
        return Message.success();
    }


    /**
     * 删除
     *
     * @param codes
     * @return
     */
    @RequestMapping(value = "/deletes/{codes}", method = RequestMethod.DELETE)
    @ResponseBody
    public Message deleteMaterials(@PathVariable String codes) {
        if (codes.contains("-")) {
            materialService.deleteMaterials(StringUtil.getCodeList(codes));
        } else {
            materialService.deleteMaterial(codes);
        }
        return Message.success();
    }



    /**
     * 多条件查询
     *
     * @param material
     * @return
     */
    @RequestMapping(value = "/selects", method = RequestMethod.GET)
    @ResponseBody
    public Message getMaterialsByCondition(
            Material material,
            @RequestParam(name = "pageNo", defaultValue = "1") int pageNo,
            @RequestParam(name = "pageSize", defaultValue = "5") int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<MaterialVO> result = materialService.getMaterialByCondition(material);
        PageInfo pageInfo = new PageInfo(result, 5);
        return Message.success().add("pageInfo", pageInfo);
    }


    /**
     * 导出Excel表
     * @param codes
     * @param response
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/export/{codes}", method = RequestMethod.GET)
    @ResponseBody
    public Message exportExcel(@PathVariable String codes, HttpServletResponse response) throws IOException {
        HSSFWorkbook export = null;
        if (codes.contains("-")) {
            export = materialService.export(StringUtil.getCodeList(codes));
        }
        response.setContentType("application/vnd..ms-excel");
        response.setHeader("content-Disposition", "attachment;filename=" + URLEncoder.encode("materials.xlsx", "utf-8"));
        OutputStream os = response.getOutputStream();
        export.write(os);
        os.flush();
        os.close();
        return Message.success();
    }

}
