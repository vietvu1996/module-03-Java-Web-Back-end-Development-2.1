package model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class Customer {
    private String name;
    private LocalDate dateOfBirth;
    private String address;
    private String imgFilePath;

    public Customer() {
    }

    public Customer(String name, LocalDate dateOfBirth, String address, String imgFilePath) {
        this.name = name;
        this.dateOfBirth = dateOfBirth;
        this.address = address;
        this.imgFilePath = imgFilePath;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImgFilePath() {
        return imgFilePath;
    }

    public void setImgFilePath(String imgFilePath) {
        this.imgFilePath = imgFilePath;
    }

    public String getFormattedDate() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        return dateOfBirth.format(formatter);
    }
}
