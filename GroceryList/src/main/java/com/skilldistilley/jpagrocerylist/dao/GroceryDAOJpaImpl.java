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
	public List<Grocery> findByWordSearch(String word) {

		String query = "select grocery from Grocery grocery where grocery.item like :word or grocery.description like :word or grocery.store like :word order by grocery.item";

		List<Grocery> itemsFound = em.createQuery(query, Grocery.class).setParameter("word", "%" + word + "%")
				.setParameter("word", "%" + word + "%").setParameter("word", "%" + word + "%").getResultList();

		return itemsFound;
	}

	@Override
	public List<Grocery> findAll() {
		String query = "select grocery from Grocery grocery where grocery.purchased = false order by grocery.item";

		return em.createQuery(query, Grocery.class).getResultList();
	}

	@Override
	public List<Grocery> findAllPurchased() {
		String query = "select grocery from Grocery grocery where grocery.purchased = true order by grocery.item";

		return em.createQuery(query, Grocery.class).getResultList();
	}

	@Override
	public Grocery create(Grocery grocery) {
		em.persist(grocery);

		return grocery;
	}

	@Override
	public Grocery update(int id, Grocery updatedGrocery) {
		Grocery managedGrocery = em.find(Grocery.class, id);

		managedGrocery.setItem(updatedGrocery.getItem());
		managedGrocery.setDescription(updatedGrocery.getDescription());
		managedGrocery.setAmount(updatedGrocery.getAmount());
		managedGrocery.setSize(updatedGrocery.getSize());
		managedGrocery.setStore(updatedGrocery.getStore());

		return managedGrocery;
	}

	@Override
	public Grocery updatePurchased(int id) {
		Grocery managedGrocery = em.find(Grocery.class, id);

		managedGrocery.setPurchased(true);

		return managedGrocery;
	}

	@Override
	public Grocery updateAddBackToList(int id) {
		Grocery managedGrocery = em.find(Grocery.class, id);

		managedGrocery.setPurchased(false);

		return managedGrocery;
	}

	@Override
	public boolean delete(int id) {
		Grocery deleteGrocery = em.find(Grocery.class, id);

		if (deleteGrocery != null) {
			em.remove(deleteGrocery);
		}

		boolean success = !em.contains(deleteGrocery);

		return success;
	}

}
