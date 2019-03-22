
# script name:
# predict.R

# set API title and description to show up in curl "http://127.0.0.1:8000/predict"/__swagger__/
#' @apiTitle Run predictions for the forest cover type based on various sample data
#' @apiDescription This API takes various data on features such as soil samples related to the forest canopy and predicts what cover type is present.
#' indicates cover type

# load model
# this path would have to be adapted if you would deploy this
data_pipeline_path = "/home/stefan/non_packrat/Analytics_template/src/data_features/data_pipeline.r"
recipe_path = "/home/stefan/non_packrat/Analytics_template/models/data_recipe_pipeline.rds"
source(data_pipeline_path)

# core function follows below:
# define parameters with type and description
# name endpoint
# return output as html/text
# specify 200 (okay) return

#' predict Cover Type using H2O gradient boosted model, expects the following variables as imput
#' @param Id
#' @param Elevation
#' @param Aspect
#' @param Slope
#' @param Horizontal_Distance_To_Hydrology
#' @param Vertical_Distance_To_Hydrology
#' @param Horizontal_Distance_To_Roadways
#' @param Hillshade_9am
#' @param Hillshade_Noon
#' @param Hillshade_3pm
#' @param Horizontal_Distance_To_Fire_Points
#' @param Wilderness_Area1
#' @param Wilderness_Area2
#' @param Wilderness_Area3
#' @param Wilderness_Area4
#' @param Soil_Type1
#' @param Soil_Type2
#' @param Soil_Type3
#' @param Soil_Type4
#' @param Soil_Type5
#' @param Soil_Type6
#' @param Soil_Type7
#' @param Soil_Type8
#' @param Soil_Type9
#' @param Soil_Type10
#' @param Soil_Type11
#' @param Soil_Type12
#' @param Soil_Type13
#' @param Soil_Type14
#' @param Soil_Type15
#' @param Soil_Type16
#' @param Soil_Type17
#' @param Soil_Type18
#' @param Soil_Type19
#' @param Soil_Type20
#' @param Soil_Type21
#' @param Soil_Type22
#' @param Soil_Type23
#' @param Soil_Type24
#' @param Soil_Type25
#' @param Soil_Type26
#' @param Soil_Type27
#' @param Soil_Type28
#' @param Soil_Type29
#' @param Soil_Type30
#' @param Soil_Type31
#' @param Soil_Type32
#' @param Soil_Type33
#' @param Soil_Type34
#' @param Soil_Type35
#' @param Soil_Type36
#' @param Soil_Type37
#' @param Soil_Type38
#' @param Soil_Type39
#' @param Soil_Type40
#' @param Cover_Type
#' @get /predict
calculate_prediction <- function(req) {
  
  input_json = fromJSON(txt = req$postBody) %>% data_pipeline() %>% toJSON()
  
  pred_h2o = h2o.predict_json(model = '/home/stefan/non_packrat/Analytics_template/models/GBM_model_R_1553005339156_4.zip',json = input_json)
  
  req <- paste(pred_h2o %>% toJSON)

  req
  
}

