package com.Ivey.crud.test;

import com.lvey.crud.dao.DepartmentMapper;
import com.lvey.crud.dao.EmployeeMapper;
import com.lvey.crud.vo.Department;
import com.lvey.crud.vo.Employee;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-config.xml"})
public class MapperTest {

    @Autowired
    private DepartmentMapper departmentMapper;

    @Autowired
    private EmployeeMapper employeeMapper;

    @Autowired
    private SqlSession sqlSession;

    @Test
    public void TestCRUD() {
        /*departmentMapper.insertSelective(new Department(null, "开发部"));
        departmentMapper.insertSelective(new Department(null, "测试部"));*/
        /*employeeMapper.insertSelective(new Employee(null, "Tom", "男", "Tom@163.com", 1));
        employeeMapper.insertSelective(new Employee(null, "Jerry", "女", "Jerry@163.com", 2));*/
        //System.out.println(departmentMapper);
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0; i < 1000; i++) {
            String uid = UUID.randomUUID().toString().substring(0, 5) + i;
            mapper.insertSelective(new Employee(null, uid, "男", uid + "@163.com", 1));
        }
    }
}
