package com.luo.materialmanagement.service;

import com.luo.materialmanagement.pojo.Material;
import com.luo.materialmanagement.pojo.MaterialVO;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.util.List;

/**
 * Material服务层接口
 *
 * @author luo Fuqiang
 * @date 2020/12/4 19:27
 */
public interface MaterialService {


    /**
     * 分页查询Material
     *
     * @return
     */
    List<MaterialVO> getMaterialList();

    /**
     * 根据code查询Material
     *
     * @param code
     * @return
     */
    MaterialVO getMaterialByCode(String code);


    /**
     * 增加Material
     *
     * @param material
     * @return
     */
    void addMaterial(Material material);


    /**
     * 根据item_id修改Material
     *
     * @param material
     * @return
     */
    void updateMaterialByCode(Material material);

    /**
     * 根据查询条件获得Material列表
     *
     * @param material
     * @return
     */
    List<MaterialVO> getMaterialByCondition(Material material);


    /**
     * 删除material
     *
     * @param code
     * @return
     */
    void deleteMaterial(String code);

    /**
     * 批量删除material
     *
     * @param codes
     * @return
     */
    void deleteMaterials(List<String> codes);


    /**
     * 导出Excel
     * @param codes
     * @return
     */
    HSSFWorkbook export(List<String> codes);

}
