package com.nucleus.repository;

import com.nucleus.model.Person;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

@Repository
public class PersonDaoImpl implements PersonDao {
    @Autowired
    SessionFactory sessionFactory;

    @Override
    public Person getPerson(String personName) {
        Session session = sessionFactory.openSession();
        return session.createQuery("FROM Person WHERE personName = :personName", Person.class).setParameter("personName", personName).uniqueResult();
    }

    @Override
    public boolean registerUser(Person person) {
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder(10);
        String bCryptPassword = bCryptPasswordEncoder.encode(person.getPersonPassword());
        person.setPersonPassword(bCryptPassword);
        Transaction transaction;
        person.setEnabled(1);
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(person);
            transaction.commit();
            return true;
        }
    }
}