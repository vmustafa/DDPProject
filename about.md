Predictors Study
----------------

This shiny app is a utility to study the potential predictors to help
the user determine which ones to include for the final prediction model.
This utility will be helpful after the Level 1 stage of covariate
collection for a prediction model.

For this app, the training set under study is the **concrete** data from
the **AppliedPredictiveModeling** library. The Outcome in this data set
is the CompressiveStrength. However, the utility is built flexibly
enough to replace the training sets with minimal efforts.

The 4 features of this utility are briefly described below:-

### Individual Scatterplots

The index (time) based values of the Outcome is shown on the left plot,
while the right plot will display the same plot for the Predictor you
choose from the UI. This will help you judge whether there is any
timewise trend in the data, any skew from normal, any near zero
variations, etc.

### Predictor-Outcome Plots

The x-y plot of the Outcome (Y-axis) is plotted against the Predictor
(X-axis) you choose from the UI. Correlation Ratio between the 2
variables is also calculated & displayed on right extreme. The plot has
'lm' based smoother line. This plot will help determine the contribution
of the Predictor towards predicting the outcome, whether there are near
zero variations, etc.

### Predictor-Predictor Plots

The x-y plot of the 2 Predictors you choose from the UI is plotted here
and the Correlation Ratio between the 2 variables is also displayed on
right extreme. The plot has 'lm' based smoother line. This plot will
help you determine the relationships amongst the Predictors to check for
orthogonality, etc. This feature does not involve Outcome variable.

### Multivariate Correlations

The pairwise relationships between the multiple variables (Outcome &
Predictors) you choose from the UI (you have to choose a minimum of 2
variables) is shown in 2 plots here. The left plot depicts pairwise x-y
plots, histograms & correlation values, while the right plot depicts
color coded correlation ratio variations amongst the chosen variables.
