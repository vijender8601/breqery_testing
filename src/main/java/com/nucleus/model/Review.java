package com.nucleus.model;

import javax.persistence.*;

@Entity
@Table(name = "review_brewer")
public class Review {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "review_id")
    private int reviewId;

    @Column(name = "review_comment")
    private String comment;

    @Column
    private String breweryId;

    @Column(name="user_name")
    private String name;

    @Column
    private int rating;

    public Review() {
        super();
    }

    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getBreweryId() {
        return breweryId;
    }

    public void setBreweryId(String breweryId) {
        this.breweryId = breweryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    @Override
    public String toString() {
        return "Review{" +
                "reviewId=" + reviewId +
                ", comment='" + comment + '\'' +
                ", breweryId='" + breweryId + '\'' +
                ", name='" + name + '\'' +
                ", rating=" + rating +
                '}';
    }
}
