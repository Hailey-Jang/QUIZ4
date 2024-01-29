# Install libraries
install.packages("janitor")
library("janitor")
install.packages("knitr")
library("knitr")
install.packages("lubridate")
library("lubridate")
install.packages("tidyverse")
library("tidyverse")

# Set seed
set.seed(123)

# Simulation 
num_friends <- 20

true_heights <- rnorm(num_friends, mean = 170, sd = 10)

error_edward <- rnorm(num_friends, mean = 0, sd = 2)
error_hugo <- rnorm(num_friends, mean = 0, sd = 5)
error_lucy <- rnorm(num_friends, mean = 0, sd = 3)

heights_edward <- true_heights + error_edward
heights_hugo <- true_heights + error_hugo
heights_lucy <- true_heights + error_lucy

# Test

t_test_true_heights <- t.test(true_heights)
print(t_test_true_heights)

t_test_edward_hugo <- t.test(heights_edward, heights_hugo)
print(t_test_edward_hugo)

t_test_hugo_lucy <- t.test(heights_hugo, heights_lucy)
print(t_test_hugo_lucy)
