# load ggplot2
library(ggplot2)

# Set seed 
set.seed(42)

n_friends <- 20

true_heights <- rnorm(n_friends, mean = 170, sd = 10)

edward_errors <- rnorm(n_friends, mean = 0, sd = 1.5)
hugo_errors <- rnorm(n_friends, mean = -0.5, sd = 1)
lucy_errors <- rnorm(n_friends, mean = 0.5, sd = 2)

edward_measurements <- true_heights + edward_errors
hugo_measurements <- true_heights + hugo_errors
lucy_measurements <- true_heights + lucy_errors

measurements_df <- data.frame(
  Friend = rep(1:n_friends, 3),
  Height = c(edward_measurements, hugo_measurements, lucy_measurements),
  Measurer = factor(rep(c('Edward', 'Hugo', 'Lucy'), each = n_friends))
)

ggplot(measurements_df, aes(x = Measurer, y = Height, color = Measurer)) +
  geom_point(position = position_jitter(width = 0.2), size = 3) +
  labs(title = 'Height Measurements by Edward, Hugo, and Lucy',
       x = 'Measurer',
       y = 'Height (cm)',
       color = 'Measurer') +
  theme_minimal() +
  theme(legend.position = "bottom")
