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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;


@Table(name="category", uniqueConstraints=@UniqueConstraint(columnNames={"NAME"}))
public class Category {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="CATEGORY_ID", unique=true, nullable=false)
	private Integer categoryId;
	
	@Column(name="NAME", length=200)
	private String name;
	
	@ManyToMany(fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	@JoinTable(name="blog_category",
	   joinColumns={@JoinColumn(name="CATEGORY_ID", nullable=false, updatable=false)},
	   inverseJoinColumns={@JoinColumn(name="BLOG_ID", nullable=false, updatable=false)})
	private Set<Blog> blogs = new HashSet<Blog>();
	
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Set<Blog> getBlogs() {
		return blogs;
	}
	public void setBlogs(Set<Blog> blogs) {
		this.blogs = blogs;
	}
	
}
