Project: 

# STRUCTURE

## source

-- crs
-- emdat (see https://doc.emdat.be/)

## scripts

- library.R

- key_crs.qmd (source: crs)
- key_emdat.qmd (source: emdat)

- clean_data_oecd_crs.qmd (source: crs)
- clean_data_emdat.qmd (source: emdat)

- merge_data_crs_emdat.qmd (source: clean_data_*.qmd)
- explore_merged_data.qmd (source: 

## data

- data_oecd_crs_raw.RData (source: key_crs.qmd)
-- data_oecd_crs_raw
-- key_donor
-- key_recipient

- data_oecd_crs_clean.RData (source: clean_data_oecd.qmd)

- data_emdat_raw.RData
-- em_dat_raw

- data_emdat_clean.RData (source: clean_data_emdat.qmd)
-- data_emdat

# TO DO

- Complete the section *channel of delivery* section in `clean_data_oecd_crs.qmd` from `delivery_channel_crs.qmd`.



keys: name, code, cohort

#KEYS
source::crs --> scripts::key_crs --> data::key_donor --> scripts::clean_data_oecd_crs --> data::data_oecd_crs_clean
source::crs --> scripts::key_crs --> data::key_recipient
#CRS
source::crs --> scripts::clean_data_oecd_crs --> data::data_oecd_crs_raw
source::crs --> scripts::clean_data_oecd_crs --> data::data_oecd_crs_clean
#EMDAT
source::emdat --> scripts::clean_data_emdat --> data::data_emdat_clean

MERGE: 

expand by key(s)
cohort <= year



data::data_oecd_crs_clean <--> data::key_recipient <--> data::data_emdat_clean