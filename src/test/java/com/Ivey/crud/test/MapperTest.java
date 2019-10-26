package com.Ivey.crud.test;

import com.lvey.crud.dao.DepartmentMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-config.xml"})
public class MapperTest {

    @Autowired
    private DepartmentMapper departmentMapper;

    @Test
    public void TestCRUD() {
        System.out.println(departmentMapper);
    }
}
