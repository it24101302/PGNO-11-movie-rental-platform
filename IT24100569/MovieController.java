package com.movie.website.controller;

import com.movie.website.data.DataStore;
import com.movie.website.model.Movie;
import com.movie.website.model.Rating;
import com.movie.website.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.logging.Logger;
import java.util.logging.Level;

@Controller
public class MovieController {
    private static final Logger logger = Logger.getLogger(MovieController.class.getName());
    private final DataStore dataStore = DataStore.getInstance();

    @GetMapping("/movies")
    public String allMovies(Model model) {
        try {
            List<Movie> movies = dataStore.getAllMovies();
            model.addAttribute("movies", movies);
            logger.info("Displaying all movies: " + movies.size() + " movies found");
            return "movies";
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error retrieving all movies", e);
            model.addAttribute("error", "An error occurred while retrieving movies");
            return "error/general";
        }
    }
    
    @GetMapping("/movies/{id}")
    public String movieDetails(@PathVariable String id, Model model, HttpSession session) {
        try {
            Movie movie = dataStore.getMovieById(id);
            
            if (movie == null) {
                logger.warning("Movie not found with ID: " + id);
                return "redirect:/movies";
            }
            
            User user = (User) session.getAttribute("user");
            boolean canWatch = user != null && user.isSubscribed();
            
            model.addAttribute("movie", movie);
            model.addAttribute("canWatch", canWatch);
            model.addAttribute("ratings", dataStore.getRatingsByMovieId(id));
            
            logger.info("Displaying movie details for: " + movie.getTitle());
            return "movie-details";
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error retrieving movie details for ID: " + id, e);
            model.addAttribute("error", "An error occurred while retrieving movie details");
            return "error/general";
        }
    }
    
    @GetMapping("/watch/{id}")
    public String watchMovie(@PathVariable String id, Model model, HttpSession session, RedirectAttributes redirectAttributes) {
        try {
            User user = (User) session.getAttribute("user");
            
            if (user == null) {
                logger.warning("Unauthorized attempt to watch movie: " + id);
                return "redirect:/login";
            }
            
            if (!user.isSubscribed()) {
                logger.warning("Unsubscribed user attempted to watch movie: " + id + ", user: " + user.getUsername());
                redirectAttributes.addFlashAttribute("error", "You need a subscription to watch this movie");
                return "redirect:/subscription";
            }
            
            Movie movie = dataStore.getMovieById(id);
            
            if (movie == null) {
                logger.warning("Movie not found with ID: " + id);
                return "redirect:/movies";
            }
            
            // Get suggested movies (same category or top rated)
            List<Movie> allMovies = dataStore.getAllMovies();
            List<Movie> suggestedMovies = allMovies.stream()
                .filter(m -> !m.getId().equals(id)) // Exclude current movie
                .filter(m -> m.getCategory().equals(movie.getCategory()) || m.isTopRated())
                .limit(4) // Limit to 4 suggestions
                .collect(Collectors.toList());
            
            // Add to watch history (in a real app, this would be stored in a database)
            List<String> watchHistory = (List<String>) session.getAttribute("watchHistory");
            if (watchHistory == null) {
                watchHistory = new ArrayList<>();
            }
            
            // Remove if already exists (to move to front)
            watchHistory.remove(id);
            
            // Add to front of list
            watchHistory.add(0, id);
            
            // Keep only last 10
            if (watchHistory.size() > 10) {
                watchHistory = watchHistory.subList(0, 10);
            }
            
            session.setAttribute("watchHistory", watchHistory);
            
            model.addAttribute("movie", movie);
            model.addAttribute("suggestedMovies", suggestedMovies);
            
            logger.info("User " + user.getUsername() + " is watching movie: " + movie.getTitle());
            return "watch-movie";
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error watching movie with ID: " + id, e);
            model.addAttribute("error", "An error occurred while trying to watch the movie");
            return "error/general";
        }
    }
    
    @PostMapping("/rate/{id}")
    public String rateMovie(@PathVariable String id,
                           @RequestParam int stars,
                           @RequestParam String comment,
                           HttpSession session,
                           RedirectAttributes redirectAttributes) {
        
        try {
            User user = (User) session.getAttribute("user");
            
            if (user == null) {
                logger.warning("Unauthorized attempt to rate movie: " + id);
                return "redirect:/login";
            }
            
            Movie movie = dataStore.getMovieById(id);
            
            if (movie == null) {
                logger.warning("Attempt to rate non-existent movie with ID: " + id);
                return "redirect:/movies";
            }
            
            // Validate rating
            if (stars < 1 || stars > 5) {
                logger.warning("Invalid rating value: " + stars);
                redirectAttributes.addFlashAttribute("error", "Rating must be between 1 and 5 stars");
                return "redirect:/movies/" + id;
            }
            
            // Check if user has already rated this movie
            boolean hasRated = movie.getRatings().stream()
                .anyMatch(r -> r.getUserId().equals(user.getId()));
            
            if (hasRated) {
                // Update existing rating
                for (Rating rating : movie.getRatings()) {
                    if (rating.getUserId().equals(user.getId())) {
                        rating.setStars(stars);
                        rating.setComment(comment);
                        logger.info("User " + user.getUsername() + " updated rating for movie: " + movie.getTitle());
                        break;
                    }
                }
            } else {
                // Add new rating
                Rating rating = new Rating(UUID.randomUUID().toString(), user.getId(), id, stars, comment);
                dataStore.addRating(rating);
                logger.info("User " + user.getUsername() + " added new rating for movie: " + movie.getTitle());
            }
            
            // Update movie top rated status
            if (movie.getAverageRating() >= 4.5 && movie.getRatings().size() >= 3) {
                movie.setTopRated(true);
                logger.info("Movie " + movie.getTitle() + " is now top rated with average rating: " + movie.getAverageRating());
            }
            
            redirectAttributes.addFlashAttribute("success", "Your rating has been submitted");
            return "redirect:/movies/" + id;
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error rating movie with ID: " + id, e);
            redirectAttributes.addFlashAttribute("error", "An error occurred while submitting your rating");
            return "redirect:/movies/" + id;
        }
    }

    @GetMapping("/continue-watching")
    public String continueWatching(Model model, HttpSession session) {
        try {
            User user = (User) session.getAttribute("user");
            
            if (user == null) {
                logger.warning("Unauthorized attempt to access continue watching page");
                return "redirect:/login";
            }
            
            List<String> watchHistory = (List<String>) session.getAttribute("watchHistory");
            List<Movie> continueWatchingMovies = new ArrayList<>();
            
            if (watchHistory != null && !watchHistory.isEmpty()) {
                for (String movieId : watchHistory) {
                    Movie movie = dataStore.getMovieById(movieId);
                    if (movie != null) {
                        continueWatchingMovies.add(movie);
                    }
                }
            }
            
            model.addAttribute("movies", continueWatchingMovies);
            model.addAttribute("title", "Continue Watching");
            
            logger.info("User " + user.getUsername() + " accessed continue watching page with " + 
                       continueWatchingMovies.size() + " movies");
            return "continue-watching";
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error accessing continue watching page", e);
            model.addAttribute("error", "An error occurred while retrieving your watch history");
            return "error/general";
        }
    }
}
