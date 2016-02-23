package edu.coe.lab.dao;

import edu.coe.lab.domain.mainEntity.Customer;

public interface CustomerDao {
public void addCustomer(Customer c);
public Customer getCusbyUsername(String username);
public void updateCus(Customer c);
}
