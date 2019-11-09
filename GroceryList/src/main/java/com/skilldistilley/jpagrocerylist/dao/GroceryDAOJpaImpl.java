package com.skilldistilley.jpagrocerylist.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistilley.jpagrocerylist.entities.Grocery;

@Transactional
@Service
public class GroceryDAOJpaImpl implements GroceryDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Grocery findById(int id) {
		return em.find(Grocery.class, id);
	}

	@Override
	public List<Grocery> findByItem(String item) {

		String query = "select grocery from Grocery grocery where item like :searchItem";

		List<Grocery> itemsFound = em.createQuery(query, Grocery.class).setParameter("searchItem", item)
				.getResultList();

		return itemsFound;
	}

	@Override
	public List<Grocery> findByStrore(String store) {
		String query = "select grocery from Grocery grocery where store like :searchStore";

		List<Grocery> itemsFound = em.createQuery(query, Grocery.class).setParameter("searchStore", store)
				.getResultList();

		return itemsFound;
	}

	
	@Override
	public List<Grocery> findAll() {
		String query = "select grocery from Grocery grocery";

		List<Grocery> groceryList = em.createQuery(query, Grocery.class).getResultList();

		return groceryList;
	}

	@Override
	public Grocery create(Grocery grocery) {
		em.getTransaction().begin();
		em.persist(grocery);
		em.flush();
		em.getTransaction().commit();

		return grocery;
	}

	@Override
	public Grocery update(int id, Grocery updatedGrocery) {
		Grocery managedGrocery = em.find(Grocery.class, id);

		em.getTransaction().begin();

		managedGrocery.setItem(updatedGrocery.getItem());
		managedGrocery.setDescription(updatedGrocery.getDescription());
		managedGrocery.setAmount(updatedGrocery.getAmount());
		managedGrocery.setSize(updatedGrocery.getSize());
		managedGrocery.setStore(updatedGrocery.getStore());

		em.flush();
		em.getTransaction().commit();

		return managedGrocery;
	}

	@Override
	public boolean delete(int id) {
		Grocery deleteGrocery = em.find(Grocery.class, id);

		em.getTransaction().begin();
		em.remove(deleteGrocery);
		em.flush();
		em.getTransaction().commit();

		deleteGrocery = findById(id);

		if (deleteGrocery != null) {
			return false;
		}

		return true;
	}

}
