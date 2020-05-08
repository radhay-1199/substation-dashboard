package com.gl.substation.view;

public class Names {
private int id;
private String name;


public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}


@Override
public String toString() {
	return "Names [id=" + id + ", name=" + name + "]";
}

}
