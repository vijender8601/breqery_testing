package com.nucleus.repository;

import com.nucleus.model.Person;

public interface PersonDao {
    boolean registerUser(Person person);
    Person getPerson(String personName);
}
