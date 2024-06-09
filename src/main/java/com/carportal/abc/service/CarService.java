package com.carportal.abc.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.carportal.abc.dao.Car;
import com.carportal.abc.dao.CarBidding;
import com.carportal.abc.dao.User;

@Service
public interface CarService {
	
	public List<Car> getAllCars();

	public Car save(Car car);

	public Optional<Car> getCarInfo(long cid);
	
	public List<Car> findCarPosts(long uid);
	
	public void deleteCar(long cid);
	
	public List<Car> search(String keyword);

	public CarBidding saveBid(CarBidding bid);

	public List<CarBidding> getAllBids();
	
	public List<CarBidding> findUserBid(User user, Car car);
	
	public Optional<CarBidding> getBidInfo(long bid);
	
	public List<CarBidding> getUserBids(User user);
	
	public void deleteBid(long bid);

}
