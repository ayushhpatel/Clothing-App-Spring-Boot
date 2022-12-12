package com.Shoping.Cloth.dao;

import java.util.List;

//import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Shoping.Cloth.model.Women;

@Repository
public interface WomenDAO extends JpaRepository<Women, Integer> {
	
	List<Women> findByAmtGreaterThan(int amt);
	List<Women> findByCategory(String category);
}
