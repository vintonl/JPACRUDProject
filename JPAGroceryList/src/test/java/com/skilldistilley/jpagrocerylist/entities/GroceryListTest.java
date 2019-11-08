package com.skilldistilley.jpagrocerylist.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class GroceryListTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Grocery gl;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("GroceryList");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		gl = em.find(Grocery.class, 1);
				
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		gl = null;
	}

	@Test
	@DisplayName ("Test connection")
	void test() {
		assertEquals(1, gl.getId());
		assertEquals("bananas", gl.getItem());
	}

}
