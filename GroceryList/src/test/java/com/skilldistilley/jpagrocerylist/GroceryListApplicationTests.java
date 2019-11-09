package com.skilldistilley.jpagrocerylist;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.skilldistilley.jpagrocerylist.dao.GroceryDAO;

@SpringBootTest
class GroceryListApplicationTests {

	@Autowired
	private GroceryDAO groceryDao;

	@BeforeEach
	void setUp() throws Exception {

	}

	@AfterEach
	void tearDown() throws Exception {
	}

	@Test
	@Disabled
	@DisplayName("Test to make sure the test starts up")
	void test() {
		fail("Not yet implemented");
	}

	@Test
	@DisplayName("Test findById")
	void test1() {
		assertEquals("bananas", groceryDao.findById(1).getItem());
	}

}
