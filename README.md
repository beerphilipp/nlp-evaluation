[![DOI](https://zenodo.org/badge/640462145.svg)](https://zenodo.org/badge/latestdoi/640462145)

# Evaluation of a simple score-based Natural Language Processing (NLP) algorithm


Our study involves the assessment of a rudimentary Natural Language Processing algorithm aimed at rating product reviews. Each positive word increases the score of the review, whereas a negative word decreases its score. While this method may not be well-suited for accurately predicting a review's numerical rating on a scale of 1 to 5, it proves to be an effective approach for categorizing reviews into positive and negative classes with acceptable levels of accuracy.

## Folder structure

- `code` contains the Jupyter notebooks to run the experiment
- `data/input` contains the external datasets used as input files
- `data/ouput` contains files generated while running the experiment
  - Intermediary result [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7933975.svg)](https://doi.org/10.5281/zenodo.7933975)
  - Result [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7933985.svg)](https://doi.org/10.5281/zenodo.7933985)

  - Rating Confusion Matrix [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7933973.svg)](https://doi.org/10.5281/zenodo.7933973)
  - Category Confusion Matrix [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7903932.svg)](https://doi.org/10.5281/zenodo.7903932)
- `documentation` contains the architecture of the pipeline and pipeline metadata


## Data Sources

### Amazon Customer Review Data 

- [![](https://zenodo.org/badge/doi/10.5281/zenodo.3549704.svg)](https://doi.org/10.5281/zenodo.3549704)
- "Amazon Customer Review Data for sentiment analysis"
- Author: Akash Shashikant Vaykar, Abhishek Kaushik ([ORCID](https://orcid.org/0000-0002-3329-1807))
- Publication: November 21, 2019
- License: [Creative Commons Attribution 4.0 International](https://creativecommons.org/licenses/by/4.0/legalcode)


### Google Play Store Data

- [![](https://zenodo.org/badge/doi/10.5281/zenodo.2844022.svg)](https://doi.org/10.5281/zenodo.2844022)
- Mobile App Stores such as Google, Apple have wide range of applications to suffice every need of customers in the digital platform.  Customer feedback and ratings has always been one of the major metrics that can be used to review the performance and accordingly provide suitable recommendations to enhance the functionality. The Given dataset contain the feedback of the customer regarding the app used in app store.
- Author: Abhishek Kaushik ([ORCID](https://orcid.org/0000-0002-3329-1807)), Swathi Venkatakrishnan
- Publication: May 15, 2019
- License: [Creative Commons Attribution 4.0 International](https://creativecommons.org/licenses/by/4.0/legalcode)

### NRC Word-Emotion Association Lexicon

- The NRC Emotion Lexicon is a list of English words and their associations with eight basic emotions (anger, fear, anticipation, trust, surprise, sadness, joy, and disgust) and two sentiments (negative and positive). The annotations were manually done by crowdsourcing.
- http://saifmohammad.com/WebPages/NRC-Emotion-Lexicon.htm
- Author: Saif M. Mohammad
- Publication: July 10, 2011
- License: No licence specified, however the dataset can be used freely for non-commercial research and educational purposes.


## Run the experiment

- You can either run this experiment on your host or in a Docker container. We recommend using Docker.
- The Amazon and Google Play Reviews are already included in this repository
- Due to licensing issues, we are not allowed to distribute the NRC dataset. Thus, it it necessary to manually download it:
  - Download the NRC dataset (http://saifmohammad.com/WebPages/NRC-Emotion-Lexicon.htm), extract it and place the content of the extracted folder into `data/input/nrc`.

### Host

- Make sure that Python 3.0 or higher is installed on your system. If it is not already, follow [https://www.python.org/downloads/](https://www.python.org/downloads/) to install it
- Run `pip install -r requirements.txt` in the project root directory
- Run `jupyter notebook`
- Open [`http://localhost:8888`](http://localhost:8080)
- The `code` directory contains the Jupyter notebooks
- Run the notebooks in the following order: `01_merge_preprocess.ipynb`, `02_score_reviews.ipynb`, `03_ visualize.ipynb`

### Docker

- Make sure that Docker is installed on your device. If it is not already, follow [https://docs.docker.com/get-docker/](https://docs.docker.com/get-docker/) to install it
- Run `docker build . -t simple-nlp` to build the docker container
- Run `docker run -p 8888:8888 simple-nlp`
- Open `localhost:8888`
- The `code` directory contains the Jupyter notebooks
- Run the notebooks in the following order: `01_merge_preprocess.ipynb`, `02_score_reviews.ipynb`, `03_ visualize.ipynb`


### Jupyter notebooks

#### `01_merge_preprocess.ipynb`

This Jupyter notebook file is used to merge the Google Play Store review and Amazon review datasets. Furthermore, it filters out stopwords (e.g. this, ) in the dataset. This file produces the `data/output/[ddmmyyy]_merged_preprocessed.csv` file.

#### `02_score_reviews.ipynb`

This is used to calculate the predicted ranking of the review using the simple NLP algorithm. It produces the output file `data/output/[ddmmyyy]_predicted_rating.csv`.


#### `03_ visualize.ipynb`

Visualizes the data. It creates confusion matrices for the predicted rating (`data/output/rating_confusion.pdf`) and the predicted category (`data/output/category_confusion.pdf`).

## Architecture

![](/documentation/architecture.svg)

## Reusing the software

If you reuse the software, please cite it using the Zenodo DOI.

## License

This project is MIT-licensed, as found in the LICENSE file.
