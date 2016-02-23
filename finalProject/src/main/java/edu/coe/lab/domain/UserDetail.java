package edu.coe.lab.domain;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import edu.coe.lab.domain.user.User;


@Table(name="user_detail")
public class UserDetail {

	@GenericGenerator(name="generator", strategy="foreign", parameters=@Parameter(name="property", value="user"))
	@Id
	@GeneratedValue(generator="generator")
	@Column(name="USER_ID", unique=true, nullable=false)
	private Integer userId;
	
	@Column(name="DETAIL", length=100)
	private String detail;
	
	@OneToOne(fetch=FetchType.LAZY)
	@PrimaryKeyJoinColumn
	private User user;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
}
