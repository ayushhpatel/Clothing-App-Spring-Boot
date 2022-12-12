package com.Shoping.Cloth.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.Shoping.Cloth.model.Man;

@Repository
public interface ManDAO extends JpaRepository<Man, Integer> {

	List<Man> findByAmtGreaterThan(int amt);
	List<Man> findByCategory(String category);
}
