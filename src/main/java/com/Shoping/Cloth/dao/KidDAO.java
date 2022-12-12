package com.Shoping.Cloth.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Shoping.Cloth.model.Kid;

@Repository
public interface KidDAO extends JpaRepository<Kid, Integer> {
	
	List<Kid> findByAmtGreaterThan(int amt);
	List<Kid> findByCategory(String category);
}
