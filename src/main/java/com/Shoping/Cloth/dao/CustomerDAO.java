package com.Shoping.Cloth.dao;


import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.Shoping.Cloth.model.Customer;


@Repository
public interface CustomerDAO extends JpaRepository<Customer, Integer> {

	boolean existsByName(String string);

	boolean existsByPwd(String pwd);

	Customer findByName(String cname);

	Customer findByCartid(int id);

}
