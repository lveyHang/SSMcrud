package com.lvey.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lvey.crud.service.EmployeeService;
import com.lvey.crud.util.Message;
import com.lvey.crud.vo.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 处理员工CRUD请求
 */
@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    /**
     * 查询员工数据（分页查询）
     */
    //@RequestMapping("emps")
    public String getEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
        // 引入PageHelper分页插件
        // 在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn, 5);
        // 紧跟着的第一个select方法会被分页
        List<Employee> list = employeeService.getAll();
        // 用 PageInfo 对结果进行包装, 并传入连续显示的页数
        PageInfo page = new PageInfo(list, 5);
        model.addAttribute("pageInfo", page);

        return "list";
    }

    /**
     * 查询员工数据（分页查询）,返回 JSON 字符串
     */
    @RequestMapping("emps")
    @ResponseBody
    public Message getEmpsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        // 引入PageHelper分页插件
        // 在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn, 5);
        // 紧跟着的第一个select方法会被分页
        List<Employee> list = employeeService.getAll();
        // 用 PageInfo 对结果进行包装, 并传入连续显示的页数
        PageInfo page = new PageInfo(list, 5);

        return Message.success().add("pageInfo", page);
    }
}
