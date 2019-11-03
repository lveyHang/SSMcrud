package com.lvey.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lvey.crud.service.EmployeeService;
import com.lvey.crud.util.Message;
import com.lvey.crud.vo.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    /**
     * 保存员工信息
     */
    @RequestMapping(value = "emps", method = RequestMethod.POST)
    @ResponseBody
    public Message saveEmp(@Valid Employee employee, BindingResult result) {
        //System.out.println("Employee" + employee);
        if (result.hasErrors()) {
            List<FieldError> errors = result.getFieldErrors();
            Map<String, Object> map = new HashMap<>();
            for (FieldError error : errors) {
                //System.out.println("错误字段：" + error.getField());
                //System.out.println("错误信息：" + error.getDefaultMessage());
                map.put(error.getField(), error.getDefaultMessage());
            }
            return Message.error().add("errorFields", map);
        } else {
            employeeService.saveEmp(employee);
            return Message.success();
        }
    }

    /**
     * 按姓名查询员工信息
     */
    @RequestMapping("checkEmp")
    @ResponseBody
    public Message checkEmp(@RequestParam("name") String empName) {
        //System.out.println(empName);
        boolean exist = employeeService.checkEmp(empName);
        if (exist) {
            return Message.success();
        } else {
            return Message.error();
        }
    }

    /**
     * 按 id 查询员工信息
     */
    @RequestMapping(value = "emp/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Message getEmp(@PathVariable Integer id) {
        Employee employee = employeeService.getEmp(id);
        //System.out.println(employee);
        return Message.success().add("employee", employee);
    }

    /**
     * 保存修改后的员工信息
     */
    @RequestMapping(value = "emp/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public Message updateEmp(Employee employee) {
        employeeService.updateEmp(employee);
        return Message.success();
    }

    /**
     * 删除指定员工信息, 单个删除和批量删除
     */
    @RequestMapping(value = "emp/{ids}", method = RequestMethod.DELETE)
    @ResponseBody
    public Message deleteEmp(@PathVariable("ids") String ids) {
        /*System.out.println(ids);
        System.out.println(ids.contains("-"));*/
        if (ids.contains("-")) {
            List<Integer> list = new ArrayList<>();
            String[] strIds = ids.split("-");
            for (String id : strIds) {
                list.add(Integer.parseInt(id));
            }
            employeeService.deleteBatch(list);
        } else {
            Integer id = Integer.parseInt(ids);
            employeeService.deleteEmp(id);
        }

        return Message.success();
    }
}
