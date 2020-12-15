package com.luo.materialmanagement.mapper;

import com.luo.materialmanagement.pojo.Material;
import com.luo.materialmanagement.pojo.MaterialVO;
import io.swagger.models.auth.In;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author luo Fuqiang
 * @date 2020/12/2 11:54
 */
public interface MaterialMapper {

    /**
     * 得到列表
     *
     * @return
     */
    List<MaterialVO> getMaterialList();

    /**
     * 增加Material
     *
     * @param material
     * @return
     */
    void addMaterial(Material material);


    /**
     * 通过code查询material
     *
     * @param code
     * @return
     */
    MaterialVO getMaterialsByCode(String code);


    /**
     * 得到当前最大编号
     *
     * @return
     */
    String getMaxItem();

    /**
     * 根据code修改Material
     *
     * @param material
     * @return
     */
    void updateMaterialByCode(Material material);


    /**
     * 条件查询Material
     *
     * @param material
     * @return
     */
    List<MaterialVO> getMaterialByCondition(Material material);


    /**
     * 根据物料编码删除Material
     *
     * @param code
     * @return
     */
    void deleteMaterialByCode(String code);

    /**
     * 批量删除
     *
     * @param codes
     */
    void deleteMaterials(@Param("codes") List<String> codes);


    /**
     * 查询出要导出的列表
     * @param codeList
     * @return
     */
    List<MaterialVO> getExportList(@Param("codeList") List<String> codeList);


}
