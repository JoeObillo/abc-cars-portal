package com.carportal.abc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.carportal.abc.dao.Car;
import com.carportal.abc.dao.CarBidding;
import com.carportal.abc.dao.User;

@Repository
public interface BidRepository extends JpaRepository<CarBidding, Long> {

	List<CarBidding> findByUserAndCar(User user, Car car);
	
	List<CarBidding> findByUser(User user);

}
