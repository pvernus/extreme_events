# Data is extracted from the OECD platform as text files.
# There is one text file per year between 2002 and 2022, except for 2002-03 and 2004-05.
# There are 19 files in total.

## LOAD PACKAGES
# NCmisc::list.functions.in.file(here("scripts", "key_crs.R"), alphabetic = TRUE)
if (!require("pacman")) install.packages("pacman")
pacman::p_load(
  data.table,
  dplyr,
  here,
  janitor
)

## IMPORT SOURCE DATA
# create path to folder w/ raw data
folder_path <- here('source', 'crs')
# create list of all files included in the folder
file_list <- list.files(path = folder_path, full.names = TRUE, pattern = '^CRS 2')
# create function to read the csv files
read_clean_and_process <- function(file_path) {
  data <- fread(file_path) |> 
    clean_names() |> # clean variable names
    mutate_if(is.character, str_trim) # delete white space before/after text
  
  return(data)
}

## CREATE KEYS
# apply ad hoc function on all listed csv files in the folder
data_list <- lapply(file_list, read_clean_and_process)
# create a data.table
data_oecd_crs_raw <- rbindlist(data_list, fill = T)

# create ID variables
data_oecd_crs_raw <- data_oecd_crs_raw |> 
  fmutate(
  donor_id = sprintf("%04d", donor_code),
  recipient_id = sprintf("%04d", recipient_code),
  sector_id = sprintf("%04d", sector_code)
)

# define key_donor
key_donor <- distinct(data_oecd_crs_raw, donor_id, donor_name)

# define key_recipient
key_recipient <- distinct(data_oecd_crs_raw, recipient_id, recipient_name)

# define key_sector
key_sector <- distinct(data_oecd_crs_raw, sector_id, sector_name)

## SAVE
save(data_oecd_crs_raw, key_donor, key_recipient, key_sector,
     file = here("data", "data_oecd_crs_raw.RData"))