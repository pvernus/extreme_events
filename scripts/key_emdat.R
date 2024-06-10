## PCKGS
# NCmisc::list.functions.in.file(here("scripts", "key_emdat.R"), alphabetic = TRUE)
if (!require("pacman")) install.packages("pacman")
pacman::p_load(
  here,
  dplyr,
  janitor,
  collapse,
  forcats,
  read_xlsx
)

## IMPORT 
data_em_dat <- read_xlsx( # import raw data
  path = here('source', 'emdat', 'public_emdat_custom_request_2024-04-09_b44a5e9a-5bfb-450b-8e72-ab4a9c42fc72.xlsx'),
  sheet = 1,
  trim_ws = T
) |> 
  clean_names()

## ISO
# load OECD data
load(here("data", "data_oecd_crs_raw.RData"))
# merge
key_emdat <- left_join(key_recipient, distinct(data_em_dat, country, iso), 
                                   by = c("recipient_name" = "country")) |> 
  mutate(iso = case_when( # we add the missing ISO
    recipient_name == "Côte d'Ivoire" ~ 'CIV',
    recipient_name == "Moldova" ~ 'MDA',
    recipient_name == "Tanzania" ~ 'TZA',
    recipient_name == "China (People's Republic of)" ~ 'CHN',
    recipient_name == "Bolivia" ~ 'BOL',
    recipient_name == "Venezuela" ~ 'VEN',
    recipient_name == "Iran" ~ 'IRN',
    recipient_name == "Kosovo" ~ 'XKX',
    recipient_name == "Mayotte" ~ 'MYT',
    recipient_name == "Micronesia" ~ 'FSM',
    recipient_name == "Nauru" ~ 'NRU',
    recipient_name == "Wallis and Futuna" ~ 'WLF',
    recipient_name == "West Bank and Gaza Strip" ~ 'PSE',
    # we also add the ISO of recipient countries with no observation in the em-dat (treatment) data set
    recipient_name == "Bahrain" ~ "BHR",
    recipient_name == "Equatorial Guinea" ~ 'GNQ',
    recipient_name == "Montserrat" ~ 'MSR',
    recipient_name == "Turkmenistan" ~ 'TKM',
    .default = iso
  )) |> 
  relocate(iso, .after = recipient_name)

data_emdat_raw <- left_join(data_em_dat, key_emdat, by = "iso")

# save
save(key_emdat, data_emdat_raw,
     file = here("data", "data_emdat_raw.RData"))
