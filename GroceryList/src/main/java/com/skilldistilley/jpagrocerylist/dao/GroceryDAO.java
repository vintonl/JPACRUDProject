package com.skilldistilley.jpagrocerylist.dao;

import java.util.List;

import com.skilldistilley.jpagrocerylist.entities.Grocery;

public interface GroceryDAO {
	Grocery findById(int id);

	List<Grocery> findByWordSearch(String item);

	List<Grocery> findByStore(String store);

	List<Grocery> findAll();

	Grocery create(Grocery grocery);

	Grocery update(int id, Grocery grocery);

	boolean delete(int id);

	List<Grocery> findAllPurchased();

	Grocery updatePurchased(int id);
}
