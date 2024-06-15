
# Open Fraud Detection Kit

Welcome to the Open Fraud Detection Kit project. This project is aimed at providing an open-source solution for managing and updating fraud detection AI models and toolkit.

Author: Tianyi Lu

## Table of Contents

- [Open Fraud Detection Kit](#open-fraud-detection-kit)
	- [Table of Contents](#table-of-contents)
	- [Getting Started](#getting-started)
	- [Prerequisites](#prerequisites)
	- [Usage](#usage)
	- [Contributing](#contributing)
	- [Versioning](#versioning)
	- [Acknowledgments](#acknowledgments)
	- [To run](#to-run)
	- [Installation](#installation)
		- [Requirements](#requirements)
	- [Datasets](#datasets)
		- [DBLP](#dblp)
		- [Example dataset](#example-dataset)
		- [Yelp dataset](#yelp-dataset)
	- [User Guide](#user-guide)
		- [Running the example code](#running-the-example-code)
		- [Running on your datasets](#running-on-your-datasets)
		- [The structure of code](#the-structure-of-code)
	- [Implemented Models](#implemented-models)
	- [Model Comparison](#model-comparison)
- [To test the functionality](#to-test-the-functionality)
	- [Make GET request to http://127.0.0.1:5000/predict](#make-get-request-to-http1270015000predict)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

## Prerequisites

What things you need to install the software and how to install them:

- You need Python < 3.11 (We used 3.7. Guide to build older versions of Python
- Clone the repo `git clone`
- Download model from google drive name it **_model.pkl_** and put it the root of the project
- Install libraries for the project from requirements.txt `pip install -r requirements.txt`
- Run Flask server `python app.py`
- Finish!

## Usage

This section is for providing examples of how your project can be used. 

1. Navigate to the Macros directory to access the Alteryx macros.
2. Use the macros in your Alteryx workflows as necessary.
3. The 'Samples' directory provides examples of how to use the macros.
4. The 'TestMacros' directory contains macros that are used for testing purposes.

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).


## Acknowledgments

- Thanks to Alteryx for providing the platform that this project is built upon.
- All contributors who have helped to evolve this project.

Please note that this is a basic structure for a README file. Depending on your project, you might want to add more sections, for example, about the project's structure, background, or the technology stack used.

## To run


--------------
## Installation
```bash
python setup.py install
```
### Requirements
```bash
* python 3.6, 3.7
* tensorflow>=1.14.0,<2.0
* numpy>=1.16.4
* scipy>=1.2.0
* networkx<=1.11
```
## Datasets

### DBLP
We uses the pre-processed DBLP dataset from [Jhy1993/HAN](https://github.com/Jhy1993/HAN)
You can run the FdGars, Player2Vec, GeniePath and GEM based on the DBLP dataset.
Unzip the archive before using the dataset:
```bash
cd dataset
unzip DBLP4057_GAT_with_idx_tra200_val_800.zip
```

### Example dataset
We implement example graphs for SemiGNN, GAS and GEM in `data_loader.py`. Because those models require unique graph structures or node types, which cannot be found in opensource datasets.


### Yelp dataset
For [GraphConsis](https://arxiv.org/abs/2005.00625), we preprocessed [Yelp Spam Review Dataset](http://odds.cs.stonybrook.edu/yelpchi-dataset/) with reviews as nodes and three relations as edges.

The dataset with `.mat` format is located at `/dataset/YelpChi.zip`. The `.mat` file includes:
- `net_rur, net_rtr, net_rsr`: three sparse matrices representing three homo-graphs defined in [GraphConsis](https://arxiv.org/abs/2005.00625) paper;
- `features`: a sparse matrix of 32-dimension handcrafted features;
- `label`: a numpy array with the ground truth of nodes. `1` represents spam and `0` represents benign.

The YelpChi data preprocessing details can be found in our [CIKM'20](https://arxiv.org/pdf/2008.08692.pdf) paper.
To get the complete metadata of the Yelp dataset, please email to [ytongdou@gmail.com](mailto:ytongdou@gmail.com) for inquiry.


## User Guide

### Running the example code
You can find the implemented models in `algorithms` directory. For example, you can run Player2Vec using:
```bash
python Player2Vec_main.py 
```
You can specify parameters for models when running the code.

### Running on your datasets
Have a look at the load_data_dblp() function in utils/utils.py for an example.

In order to use your own data, you have to provide:
* adjacency matrices or adjlists (for GAS);
* a feature matrix
* a label matrix
then split feature matrix and label matrix into testing data and training data.

You can specify a dataset as follows:
```bash
python xx_main.py --dataset your_dataset 
```
or by editing xx_main.py

### The structure of code
The repository is organized as follows:
- `algorithms/` contains the implemented models and the corresponding example code;
- `base_models/` contains the basic models (GCN);
- `dataset/` contains the necessary dataset files;
- `utils/` contains:
    * loading and splitting the data (`data_loader.py`);
    * contains various utilities (`utils.py`).


## Implemented Models

| Model           | Paper                                                                                                                                                                                    | Venue      | Reference                                                                             |
| --------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------- | ------------------------------------------------------------------------------------- |
| **SemiGNN**     | [A Semi-supervised Graph Attentive Network for Financial Fraud Detection](https://arxiv.org/pdf/2003.01171)                                                                              | ICDM 2019  | [BibTex](https://github.com/safe-graph/DGFraud/blob/master/reference/semignn.txt)     |
| **Player2Vec**  | [Key Player Identification in Underground Forums over Attributed Heterogeneous Information Network Embedding Framework](http://mason.gmu.edu/~lzhao9/materials/papers/lp0110-zhangA.pdf) | CIKM 2019  | [BibTex](https://github.com/safe-graph/DGFraud/blob/master/reference/player2vec.txt)  |
| **GAS**         | [Spam Review Detection with Graph Convolutional Networks](https://arxiv.org/abs/1908.10679)                                                                                              | CIKM 2019  | [BibTex](https://github.com/safe-graph/DGFraud/blob/master/reference/gas.txt)         |
| **FdGars**      | [FdGars: Fraudster Detection via Graph Convolutional Networks in Online App Review System](https://dl.acm.org/citation.cfm?id=3316586)                                                   | WWW 2019   | [BibTex](https://github.com/safe-graph/DGFraud/blob/master/reference/fdgars.txt)      |
| **GeniePath**   | [GeniePath: Graph Neural Networks with Adaptive Receptive Paths](https://arxiv.org/abs/1802.00910)                                                                                       | AAAI 2019  | [BibTex](https://github.com/safe-graph/DGFraud/blob/master/reference/geniepath.txt)   |
| **GEM**         | [Heterogeneous Graph Neural Networks for Malicious Account Detection](https://arxiv.org/pdf/2002.12307.pdf)                                                                              | CIKM 2018  | [BibTex](https://github.com/safe-graph/DGFraud/blob/master/reference/gem.txt)         |
| **GraphSAGE**   | [Inductive Representation Learning on Large Graphs](https://arxiv.org/pdf/1706.02216.pdf)                                                                                                | NIPS 2017  | [BibTex](https://github.com/safe-graph/DGFraud/blob/master/reference/graphsage.txt)   |
| **GraphConsis** | [Alleviating the Inconsistency Problem of Applying Graph Neural Network to Fraud Detection](https://arxiv.org/pdf/2005.00625.pdf)                                                        | SIGIR 2020 | [BibTex](https://github.com/safe-graph/DGFraud/blob/master/reference/graphconsis.txt) |
| **HACUD**       | [Cash-Out User Detection Based on Attributed Heterogeneous Information Network with a Hierarchical Attention Mechanism](https://aaai.org/ojs/index.php/AAAI/article/view/3884)           | AAAI 2019  | [BibTex](https://github.com/safe-graph/DGFraud/blob/master/reference/hacud.txt)       |


## Model Comparison
| Model           | Application     | Graph Type    | Base Model          |
| --------------- | --------------- | ------------- | ------------------- |
| **SemiGNN**     | Financial Fraud | Heterogeneous | GAT, LINE, DeepWalk |
| **Player2Vec**  | Cyber Criminal  | Heterogeneous | GAT, GCN            |
| **GAS**         | Opinion Fraud   | Heterogeneous | GCN, GAT            |
| **FdGars**      | Opinion Fraud   | Homogeneous   | GCN                 |
| **GeniePath**   | Financial Fraud | Homogeneous   | GAT                 |
| **GEM**         | Financial Fraud | Heterogeneous | GCN                 |
| **GraphSAGE**   | Opinion Fraud   | Homogeneous   | GraphSAGE           |
| **GraphConsis** | Opinion Fraud   | Heterogeneous | GraphSAGE           |
| **HACUD**       | Financial Fraud | Heterogeneous | GAT                 |

-----------
# To test the functionality

## Make GET request to http://127.0.0.1:5000/predict
