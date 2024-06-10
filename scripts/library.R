# install.packages('installr')
# library(installr)
# installr()
# install.RStudio()

if (!require("pacman")) install.packages("pacman")
pacman::p_load(
  # setup  
  devtools,
  gitcreds,
  here,
  tidyverse,
  fuzzyjoin, # inexact matching
  data.table, # data transformation
  collapse,
  readxl, # read excel
  labelled, # look_for()
  janitor, # clean_name()
  dlookr, # identical()
  visdat, # vis_miss()
  naniar, # gg_miss_upset
  ggstatsplot, 
  xml2, # import XML files
  XML,
  questionr,
  gt,
  gtsummary,
  tidytext,
  geomtextpath,
  ggpubr, # stat_cor()
  ggridges, # geom_density_ridges()
  scales,
  ggtext,
  hexbin,
  data.tree,
  DiagrammeR,
  jsonlite,
  tidyverse,
  rstatix,
  ggpubr
  )

# remotes::install_github("frbcesab/riati")
# library("riati")








