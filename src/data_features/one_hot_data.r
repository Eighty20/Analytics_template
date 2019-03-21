
library(tidyverse)
library(assertthat)

args <- commandArgs(TRUE)
data_path <- args[1]
recipe_path <- args[2]
n_class <- as.numeric(args[3])
out_path <-args[4]

get_one_hot_array <- function(int, n_class = 7){
  library(assertthat)
  
  assert_that(class(int) == "numeric")
  assert_that(class(n_class) == "numeric")
  
  vec = vector(length = n_class)
  
  for(i in 1:n_class){
    x = as.numeric(int == i) 
    vec[i] <- x
  }
  
  return(vec)
}

one_hot_pipeline <- 
  . %>%
  pull(Cover_Type) %>%
  map(get_one_hot_array,n_class = n_class) %>% 
  reduce(rbind)

  scale_and_one_hot_encode <- function(data_path, recipe_path = "../models/data_recipe_pipeline.rds"){
  
  library(recipes)
  df <- readr::read_csv(data_path)  
  
  recipe <- readRDS(recipe_path)
  
  scale_df <- bake(recipe,df)
  
  one_hot_mat <- one_hot_pipeline(df)
  
  final_array <- cbind(scale_df,one_hot_mat)
  
  return(final_array)
}

# scale_and_one_hot_encode(data_path = "../../data/raw/train.csv", recipe_path = "../../models/data_recipe_pipeline.rds")  %>% 
scale_and_one_hot_encode(data_path, recipe_path)  %>% 
 write_csv(path = out_path)

