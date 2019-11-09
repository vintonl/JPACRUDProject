package com.skilldistilley.jpagrocerylist;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@EntityScan("com.skilldistilley.jpagrocerylist")
//@ComponentScan("com.skilldistilley.jpagrocerylist")
public class GroceryListApplication {

	public static void main(String[] args) {
		SpringApplication.run(GroceryListApplication.class, args);
	}

}
