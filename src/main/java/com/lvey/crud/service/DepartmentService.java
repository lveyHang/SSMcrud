package com.lvey.crud.service;

import com.lvey.crud.dao.DepartmentMapper;
import com.lvey.crud.vo.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    /**
     * 查询所有的部门信息
     */
    public List<Department> getDepts() {
        return departmentMapper.selectByExample(null);
    }
}
