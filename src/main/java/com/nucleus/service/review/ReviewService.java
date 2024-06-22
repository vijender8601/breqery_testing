package com.nucleus.service.review;

import com.nucleus.model.Review;
import com.nucleus.repository.review.ReviewRepo;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewService {
    @Autowired
    ReviewRepo reviewRepo;

    public void insertReview(Review review)
    {
        reviewRepo.insertReview(review);
    }

    public List<Review> getReviewByBreweryId(String id) {
        return reviewRepo.getReviewByBreweryId(id);
    }
}
