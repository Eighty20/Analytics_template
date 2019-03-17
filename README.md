# The Analytics Template!

The purpose of this repository is to be a template that analysts can pull to get a running start for each new project.

![](https://statslab.eighty20.co.za/Organize-for-Success.jpg)

It should help you with the following;

- Get a decent folder layout  
- Have a master rmd or notebook for reports  
- Have numbered analysis notebooks showing ordered steps of execution  
- Files for storing and reusing classes and functions for a pipeline or application based development  
- Package management in place  
- Consistent layout that makes sharing code easy  
- Consistent design principals for both R and Python

## Folder layout

<pre>
├── README.md          <- The top-level README for developers using this project.  
├── requirements.txt   <- The requirements file for reproducing the analysis environment, e.g.  
│                         generated with `pip freeze > requirements.txt`  
├── data  
│   ├── external       <- Data from third party sources.  
│   ├── interim        <- Intermediate data that has been transformed.  
│   ├── processed      <- The final, canonical data sets for modeling.  
│   └── raw            <- The original, immutable data dump.  
│  
├── models             <- Trained and serialized models, model predictions, or model summaries  
│  
├── notebooks          <- Jupyter and R notebooks. Naming convention is a number (for ordering),  
│                         the creator's initials, and a short `-` delimited description, e.g.  
│                         `1.0-jqp-initial-data-exploration`.  
│  
├── references         <- Data dictionaries, manuals, and all other explanatory materials.  
│  
├── reports            <- Generated analysis as HTML, PDF, LaTeX, etc.  
│   └── figures        <- Generated graphics and figures to be used in reporting  
│  
├── setup.py           <- Make this project pip installable with `pip install -e`  
├── src                <- Source code for use in this project.  
│   ├── __init__.py    <- Makes src a Python module  
│   │  
│   ├── data           <- Scripts to download or generate data  
│   │   ├── make_dataset.py  
│   │   └── make_dataset.R  
│   │  
│   ├── features       <- Scripts to turn raw data into features for modeling  
│   │   ├── build_features.py  
│   │   └── build_features.R  
│   │  
│   ├── models         <- Scripts to train models and then use trained models to make  
│   │   │                 predictions  
│   │   ├── predict_model.py  
│   │   └── train_model.py  
│   │  
│   └── visualization  <- Scripts to create exploratory and results oriented visualizations  
│   │   ├── visualize.py  
│   │   └── visualize.R  
</pre>
## R

This folder comes with a R project file.  
It was created as a packrat repository and will store and load all packages internally from the folder;

/packrat/

## Package management

In this repository we manage the R packages using packrat as noted above.

For managing python packages we keep the file;  

/requirements.txt

When setting up the python dependencies one would simply use the `requirements.txt` file like normal within a new virtual environment.

After adding any new packages or dependencies make sure to store them with `pip freeze > requirements.txt`  

### Packrat

## Analysis parts

The different analysis scripts were created as a starting point.

Because analytics can extend to nearly any use case I recommend starting from a base script and extending its parts as you wish.

For example you may start with
- 04_modelling.rmd  
  - 04_01_Splitting_data_and_class_balance.rmd  
  

