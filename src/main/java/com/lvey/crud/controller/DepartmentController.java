package com.lvey.crud.controller;

import com.lvey.crud.service.DepartmentService;
import com.lvey.crud.util.Message;
import com.lvey.crud.vo.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 处理部门的请求
 */
@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    /**
     * 查询所有的部门信息
     */
    @RequestMapping("depts")
    @ResponseBody
    public Message getDepts() {
        List<Department> list = departmentService.getDepts();
        return Message.success().add("depts", list);
    }
}
