package edu.coe.lab.service;

import edu.coe.lab.domain.mainEntity.Customer;

public interface CustomerService {
public void addCustomer(Customer c);
public Customer getCustomerByUsername(String username);
public void update(Customer c);
}
