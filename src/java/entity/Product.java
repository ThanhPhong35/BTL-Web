/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author YOU
 */
public class Product {
    private int id;
    private String name;
    private String image;
    private double price;
    private String title;
    private String des;
    private Category category;

    public Product() {
    }

    public Product(int id, String name, String image, double price, String title, String des, Category category) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
        this.title = title;
        this.des = des;
        this.category = category;
    }

    public Product(String name, String image, double price, String title, String des, Category category) {
        this.name = name;
        this.image = image;
        this.price = price;
        this.title = title;
        this.des = des;
        this.category = category;
    }
    
    
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", image=" + image + ", price=" + price + ", title=" + title + ", des=" + des + ", category=" + category + '}';
    }
   
    
}
