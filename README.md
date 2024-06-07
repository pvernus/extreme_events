Project: 

# STRUCTURE

## source

-- crs
-- emdat (see https://doc.emdat.be/)

## scripts

- library.R
- clean_data_oecd_crs.qmd (source: crs)
- clean_data_emdat.qmd (source: emdat)
- merge_data_crs_emdat.qmd (source: clean_data_*.qmd)
- explore_merged_data.qmd (source: 

## data

- data_oecd_crs_raw.RData (source: clean_data_oecd.qmd)
- data_oecd_crs_clean.RData (source: clean_data_oecd.qmd)
- data_emdat_clean.RData (source: clean_data_emdat.qmd)

# TO DO

- Complete the section *channel of delivery* section in `clean_data_oecd_crs.qmd` from `delivery_channel_crs.qmd`.



