package com.nucleus.model;

import javax.persistence.*;

@Entity
@Table(name = "security_login_brewery")
public class Person {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "user_security_id")
    private int personId;
    @Column(name = "username", nullable = false)
    private String personName;
    @Column(name = "password", nullable = false)
    private String personPassword;
    @Column(name = "email", nullable = false)
    private String email;
    @Column(name = "enabled", nullable = false)
    private int enabled;

    public Person() {
        super();
    }

    public Person(int personId, String personName, String personPassword, String email, int enabled) {
        this.personId = personId;
        this.personName = personName;
        this.personPassword = personPassword;
        this.email = email;
        this.enabled = enabled;
    }

    public int getPersonId() {
        return personId;
    }

    public void setPersonId(int personId) {
        this.personId = personId;
    }

    public String getPersonName() {
        return personName;
    }

    public void setPersonName(String personName) {
        this.personName = personName;
    }

    public String getPersonPassword() {
        return personPassword;
    }

    public void setPersonPassword(String personPassword) {
        this.personPassword = personPassword;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getEnabled() {
        return enabled;
    }

    public void setEnabled(int enabled) {
        this.enabled = enabled;
    }

    @Override
    public String toString() {
        return "Person{" + "personId='" + personId + '\'' + ", personName='" + personName + '\'' + ", personPassword='" + personPassword + '\'' + ", email='" + email + '\'' + ", enabled=" + enabled + '}';
    }
}