package com.luo.materialmanagement.service.impl;

import com.luo.materialmanagement.mapper.MaterialMapper;
import com.luo.materialmanagement.pojo.Material;
import com.luo.materialmanagement.pojo.MaterialVO;
import com.luo.materialmanagement.service.MaterialService;
import com.luo.materialmanagement.util.ExcelExportUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Service;

import javax.validation.Valid;

import java.util.Collections;
import java.util.List;

/**
 * @author luo Fuqiang
 * @date 2020/12/4 19:30
 */
@Service("materialService")
public class MaterialServiceImpl implements MaterialService {
    private MaterialMapper materialMapper;

    public MaterialServiceImpl(MaterialMapper materialMapper) {
        this.materialMapper = materialMapper;
    }

    /**
     * 分页查询Material
     *
     * @return
     */
    @Override
    public List<MaterialVO> getMaterialList() {
        List<MaterialVO> result = materialMapper.getMaterialList();
        return result;
    }

    @Override
    public MaterialVO getMaterialByCode(String code) {
        MaterialVO result = materialMapper.getMaterialsByCode(code);
        return result;
    }

    /**
     * 增加Material
     *
     * @param material
     * @return
     */
    @Override
    public void addMaterial(@Valid Material material) {
        material.setCode(getItem());
        materialMapper.addMaterial(material);
    }


    /**
     * 得到物料编码
     * @return
     */
    private String getItem() {
        String maxItem = materialMapper.getMaxItem();
        Long next = Long.valueOf(1 + maxItem) + 1L;
        String item = next.toString().substring(1);
        String result = "ITEM" + item;
        return result;
    }

    /**
     * 根据item_id修改Material
     *
     * @param material
     * @return
     */
    @Override
    public void updateMaterialByCode(Material material) {
        materialMapper.updateMaterialByCode(material);
    }

    /**
     * 根据查询条件获得Material列表
     *
     * @param material
     * @return
     */
    @Override
    public List<MaterialVO> getMaterialByCondition(Material material) {
        List<MaterialVO> result = materialMapper.getMaterialByCondition(material);
        return result;
    }

    /**
     * 删除material
     *
     * @param code
     * @return
     */
    @Override
    public void deleteMaterial(String code) {
        materialMapper.deleteMaterialByCode(code);
    }

    /**
     * 批量删除material
     *
     * @param codes
     * @return
     */
    @Override
    public void deleteMaterials(List<String> codes) {
        materialMapper.deleteMaterials(codes);
    }

    /**
     * 导出Excel
     * @param codes
     * @return
     */
    @Override
    public HSSFWorkbook export(List<String> codes) {
        List<MaterialVO> exportList = materialMapper.getExportList(codes);

        HSSFWorkbook workbook = ExcelExportUtil.GetHSSFWorkbook(exportList, null);
        return workbook;
    }


}
