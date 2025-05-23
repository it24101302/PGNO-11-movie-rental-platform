package com.movie.website.model;

import java.io.Serial;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Movie implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;
    
    private String id;
    private String title;
    private String description;
    private String category;
    private String imageUrl;
    private String videoUrl;
    private double rentalPrice;
    private List<Rating> ratings;
    private boolean isNewArrival;
    private boolean isTopRated;
    private boolean isTvSeries;

    public Movie(String id, String title, String description, String category, 
                String imageUrl, String videoUrl, double rentalPrice) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.category = category;
        this.imageUrl = imageUrl;
        this.videoUrl = videoUrl;
        this.rentalPrice = rentalPrice;
        this.ratings = new ArrayList<>();
        this.isNewArrival = false;
        this.isTopRated = false;
        this.isTvSeries = false;
    }

    public void addRating(Rating rating) {
        if (rating != null) {
            ratings.add(rating);
            // Update top rated status if applicable
            if (getAverageRating() >= 4.5 && ratings.size() >= 3) {
                setTopRated(true);
            }
        }
    }

    public double getAverageRating() {
        if (ratings == null || ratings.isEmpty()) {
            return 0.0;
        }
        
        double sum = 0.0;
        for (Rating rating : ratings) {
            sum += rating.getStars();
        }
        
        return sum / ratings.size();
    }

    // Getters and Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    public double getRentalPrice() {
        return rentalPrice;
    }

    public void setRentalPrice(double rentalPrice) {
        this.rentalPrice = rentalPrice;
    }

    public List<Rating> getRatings() {
        return ratings;
    }

    public void setRatings(List<Rating> ratings) {
        this.ratings = ratings != null ? ratings : new ArrayList<>();
    }

    public boolean isNewArrival() {
        return isNewArrival;
    }

    public void setNewArrival(boolean newArrival) {
        isNewArrival = newArrival;
    }

    public boolean isTopRated() {
        return isTopRated;
    }

    public void setTopRated(boolean topRated) {
        isTopRated = topRated;
    }

    public boolean isTvSeries() {
        return isTvSeries;
    }

    public void setTvSeries(boolean tvSeries) {
        isTvSeries = tvSeries;
    }
    
    @Override
    public String toString() {
        return "Movie{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", category='" + category + '\'' +
                ", rentalPrice=" + rentalPrice +
                ", isNewArrival=" + isNewArrival +
                ", isTopRated=" + isTopRated +
                ", isTvSeries=" + isTvSeries +
                '}';
    }
}
