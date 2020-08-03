# Turn off scientific notation
options(scipen = 999)

# Load packages -----------------------------------------------------------

for (func in list.files(path = "1_code/0_functions/")) { source(file = paste0("1_code/0_functions/", func))}

pkgInstaller(c("tidyverse", "xlsx", "plotly", "dplyr", "gtools", "data.table", "readxl"))

rm(func, pkgInstaller)

