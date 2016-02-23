package edu.coe.lab.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import edu.coe.lab.domain.user.User;


@Table(name="blog")
public class Blog {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="BLOG_ID", unique=true, nullable=false)
	private Integer blogId;
	@Id
	@Column(name="CONTENT", nullable=false, length=100)
	private String content;
	
	@ManyToOne(fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	@JoinColumn(name="USER_NAME", nullable=false)
	private User user;
	
	@ManyToMany(fetch=FetchType.LAZY, cascade=CascadeType.ALL, mappedBy="blogs")
	private Set<Category> categories = new HashSet<Category>();
	
	
	public Set<Category> getCategories() {
		return categories;
	}
	public void setCategories(Set<Category> categories) {
		this.categories = categories;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getBlogId() {
		return blogId;
	}
	public void setBlogId(Integer blogId) {
		this.blogId = blogId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
