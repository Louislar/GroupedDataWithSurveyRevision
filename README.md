# GroupedDataWithSurveyAdaptation

## Overview

This program will estimate the transition matrix according to revision by cohort data, then apply it to samples of population for aligning versions of questionnaire. 

The detail introduction to this program can refer to this article ...

## Environment

Windows 10

### Python

- Scipy
- Pandas
- Numpy
- Scikit-learn
- Matplotlib

### R

- Nloptr

### Matlab

- R2020a
- Optimization toolbox version 8.5

## Simulation dataset

### Code

Code that generate simulation dataset is generate_simul_data.py which is in the root folder of this repo. There is a config.py that can set parameters of the simulation.

### Pre-generated dataset

Only one simulation datset using parameters that shown in the article is pre-generated in /simul_data/

### Execution order and other tips

Please follow the order below to execute these programs.

1. add_randomness_simulation_data_gen.py
    - This code will generate simulation data, and store in the given directory.

2. add_randomness_simulation_prepare.py
    - This code will use the generated data to compute the essential matrices and vectors.
    - The essential matricse and vectors are store in the directory /qp_input_output/

3. Hand craft
    - Hand craft the ideal revision matrix and put it in /qp_input_output/ and named it Python_G_matrix.csv

4. main_qp.m
    - Use Matlab to solve Quadratic Problem, estimat the revised probability vector and the matrix A.

5. add_randomness_simulation_performance.py
    - Compute the estimated mean of the output of Matlab QP.
    - Prepare data for ploting the result in a figure.

6. add_randomness_simulation_draw_fig.py
    - Draw estimation result in a figure.

## Estimation by VAM

The estimation of matrices and vectors is done by the main_qp.m script. 

### Input

What's the data format?

What's the input data and directary structure?

All the matrix below will compute by add_..._prepare.py, except Matrix G. (Please refer to the article for the method of computing matrix G)

1. Matrix M: Second year underlying distribution matrix
2. Matrix G: First year ideal revision matrix(need to be compute manually)
3. Matrix T: First year transition matrix(including underlying distribution change and revision)
4. Vector c: First year probability vector of response from cohort
5. Vector f: Second year probability vector of response from cohort

### Output

## Figures in the article

All the code and data that needed for drawing figures are in /article_figures/
