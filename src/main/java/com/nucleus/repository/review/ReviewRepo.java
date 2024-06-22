package com.nucleus.repository.review;

import com.nucleus.model.Review;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class ReviewRepo {
    @Autowired
    SessionFactory sessionFactory;


    public void insertReview(Review review){
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.save(review);
        session.getTransaction().commit();
        session.close();

    }

    public List<Review> getReviewByBreweryId(String breweryId) {
        Session session = sessionFactory.openSession();
        String hql = "from Review where breweryId = :breweryId";

        List<Review> reviewList = null;

        try {
            reviewList =  session.createQuery(hql, Review.class)
                    .setParameter("breweryId", breweryId)
                    .getResultList();
        } catch (Exception e)
        {
            e.printStackTrace();
        }

        return reviewList;
    }
}
