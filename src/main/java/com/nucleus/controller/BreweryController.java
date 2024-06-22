package com.nucleus.controller;

import com.nucleus.model.Review;
import com.nucleus.service.review.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/brewery")
public class BreweryController {

    @Autowired
    ReviewService reviewService;

    @GetMapping
    public String home() {
        return "home_page2";
    }

    @GetMapping("/{id}")
    public String getBreweryById(@PathVariable String id, Model model)
    {
        System.out.println(id);
        model.addAttribute("id", id);

        List<Review> reviewList = reviewService.getReviewByBreweryId(id);
        System.out.println(reviewList);
        model.addAttribute("reviewList", reviewList);

        int totalRating = 0;
        for(Review review : reviewList)
            totalRating += review.getRating();

        if(reviewList.size()>0)
        model.addAttribute("avgRating", totalRating/reviewList.size());
        else
            model.addAttribute("avgRating", 0);

        return "breweryDetail";
    }

    @PostMapping("/{id}")
    public String submitReview(@PathVariable String id, @RequestParam("rating") int rating, @RequestParam("comment") String comment, Model model, Principal principal)
    {
        System.out.println(rating+" "+comment+" ");

        Review review = new Review();
        review.setBreweryId(id);
        review.setComment(comment);
        review.setRating(rating);
        review.setName(principal.getName());

        reviewService.insertReview(review);

        System.out.println(review);
        model.addAttribute("id", id);
        List<Review> reviewList = reviewService.getReviewByBreweryId(id);
        System.out.println(reviewList+" here bro");
        model.addAttribute("reviewList", reviewList);
        int totalRating = 0;
        if(reviewList.size()>0)
            model.addAttribute("avgRating", totalRating/reviewList.size());
        else
            model.addAttribute("avgRating", 0);
        return "breweryDetail";
    }

}
