package edu.coe.lab.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.coe.lab.dao.CustomerDao;
import edu.coe.lab.domain.mainEntity.Customer;
@Service
public class CustomerServiceImpl implements CustomerService{
	@Resource
	private CustomerDao customerDao;
	public CustomerDao getCustomerDao() {
		return customerDao;
	}
	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}
	@Override
	@Transactional
	public void addCustomer(Customer c) {
		customerDao.addCustomer(c);
		
	}
	
	@Override
	@Transactional
	public Customer getCustomerByUsername(String username) {
		Customer r = customerDao.getCusbyUsername(username);
		return r;
	}
	@Override
	@Transactional
	public void update(Customer c) {
		customerDao.updateCus(c);
		
	}
}
