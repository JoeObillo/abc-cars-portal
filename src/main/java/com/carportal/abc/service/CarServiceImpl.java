package com.carportal.abc.service;

import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carportal.abc.dao.Car;
import com.carportal.abc.dao.CarBidding;
import com.carportal.abc.dao.User;
import com.carportal.abc.repository.BidRepository;
import com.carportal.abc.repository.CarRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class CarServiceImpl implements CarService{

	@Autowired
	private CarRepository carRepository;

	@Autowired
	private BidRepository bidRepository;

	public List<Car> getAllCars() {
		return carRepository.findAll();
	}

	public Car save(Car car) {
		return carRepository.save(car);
	}

	public Optional<Car> getCarInfo(long cid) {
		return carRepository.findById(cid);
	}

	public List<Car> findCarPosts(long uid) {
		return carRepository.findBySellerId(uid);
	}

	public void deleteCar(long cid) {
		carRepository.deleteById(cid);
	}

	@Override
	public List<Car> search(String keyword) {
		return carRepository.search(keyword);
	}

	public CarBidding saveBid(CarBidding bid) {
		return bidRepository.save(bid);
	}

	public List<CarBidding> getAllBids() {
		List<CarBidding> allBid = bidRepository.findAll();

		List<CarBidding> sortedList = allBid.stream()
				.sorted(Comparator.comparingDouble(CarBidding::getBidderPrice).reversed()).collect(Collectors.toList());
		
		return sortedList;
	}

	public List<CarBidding> findUserBid(User user, Car car) {
		return bidRepository.findByUserAndCar(user, car);
	}

	public Optional<CarBidding> getBidInfo(long bid) {
		return bidRepository.findById(bid);
	}

	public List<CarBidding> getUserBids(User user) {
		return bidRepository.findByUser(user);
	}

	public void deleteBid(long bid) {
		bidRepository.deleteById(bid);
	}

}
