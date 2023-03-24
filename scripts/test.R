library(dyno)
library(tidyverse)

data("fibroblast_reprogramming_treutlein")

dataset <- wrap_expression(
  counts = fibroblast_reprogramming_treutlein$counts,
  expression = fibroblast_reprogramming_treutlein$expression
)

guidelines <- guidelines_shiny(dataset)
methods_selected <- guidelines$methods_selected

model <- infer_trajectory(dataset, first(methods_selected))
model <- model %>% add_dimred(dyndimred::dimred_mds, expression_source = dataset$expression)

pdf(getwd(),w=8,h=8)

plot_dimred(
  model, 
  expression_source = dataset$expression, 
  grouping = fibroblast_reprogramming_treutlein$grouping
)
