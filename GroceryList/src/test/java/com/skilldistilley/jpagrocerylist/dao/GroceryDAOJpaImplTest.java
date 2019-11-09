package com.skilldistilley.jpagrocerylist.dao;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.skilldistilley.jpagrocerylist.entities.Grocery;

@RunWith(SpringRunner.class)
@SpringBootTest
class GroceryDAOJpaImplTest {

	private Grocery groceryDoa;
	private EntityManager em;
	private static EntityManagerFactory emf;

	@BeforeEach
	void setUp() throws Exception {
		groceryDoa = em.find(Grocery.class, 1);
		
	}

	@AfterEach
	void tearDown() throws Exception {
		groceryDoa = null;
	}

	@Test
	@Disabled
	@DisplayName("Test to make sure the test starts up")
	void test() {
		fail("Not yet implemented");
	}
	
//	@Test
//	@DisplayName("Test findById")
//	void test1() {
//		assertEquals("bananas", groceryDoa.findById(1).getItem());
//	}

}
