
data_pipeline <- function (x, ...) {
 UseMethod("data_pipeline", x)
}
 
data_pipeline.tbl_spark <- function(df){
  df %>% 
    collect() %>% 
    bake(read_rds("/home/stefan/non_packrat/Analytics_template/models/data_recipe_pipeline.rds"),new_data = .) %>% 
    mutate(Cover_Type = case_when(
    Cover_Type == 1 ~ "cover_type_1",
    Cover_Type == 2 ~ "cover_type_2",
    Cover_Type == 3 ~ "cover_type_3",
    Cover_Type == 4 ~ "cover_type_4",
    Cover_Type == 5 ~ "cover_type_5",
    Cover_Type == 6 ~ "cover_type_6",
    Cover_Type == 7 ~ "cover_type_7"
  )) %>% 
  # mutate(Cover_Type = factor(Cover_Type)) %>% 
  select(-Id) %>% 
  sparklyr::copy_to(dest = sc,df = .,name = "train_tbl", overwrite = T)

}
 
 data_pipeline.data.frame <- function(df){
  df %>% 
    bake(read_rds("/home/stefan/non_packrat/Analytics_template/models/data_recipe_pipeline.rds"),new_data = .) %>% 
    mutate(Cover_Type = case_when(
    Cover_Type == 1 ~ "cover_type_1",
    Cover_Type == 2 ~ "cover_type_2",
    Cover_Type == 3 ~ "cover_type_3",
    Cover_Type == 4 ~ "cover_type_4",
    Cover_Type == 5 ~ "cover_type_5",
    Cover_Type == 6 ~ "cover_type_6",
    Cover_Type == 7 ~ "cover_type_7"
  )) %>% 
  # mutate(Cover_Type = factor(Cover_Type)) %>% 
  select(-Id) 
} 

