package com.estore.dao;

import java.util.List;

import com.estore.entity.Order;
import com.estore.entity.OrderDetails;

public interface OrderDetailsDAO {
	OrderDetails findById(Integer id);
	List<OrderDetails> findAll();
	OrderDetails create(OrderDetails entity);
	void update(OrderDetails entity);
	OrderDetails delete(Integer id);
	List<OrderDetails> findByOrder(Order order);
}
