# Analyse/filter the data -------------------------------------------------

# Requirements from Ly-Lan - sum the columns: coll_prem, coll_comm, group, ea_ttc, ea_ht, taxes

# 2020 data ---------------------------------------------------------------

names(year2020F)

# "policy""uw_year""paym_freq""anneemoiscomptable" "nbrn""coverage""invoicetype""qte_date_sale""qte_date_efec""coll_prem""coll_comm""group""ea_ttc""ea_ht""taxes""dateOfFile""yearOfFile""monthOfFile" 
# Grouped by x variables and summed
year2020Joined <- year2020F %>% 
  as.data.frame() %>% 
  ungroup() %>%
  group_by(policy, uw_year, paym_freq, nbrn, coverage, qte_date_sale, qte_date_efec) %>% # not grouped by anneemoiscomptable and invoicetype because invoicetype can be refunds
  summarise(sumcoll_prem = sum(coll_prem),
            sumcoll_comm = sum(coll_comm),
            sumgroup = sum(group),
            sumea_ttc = sum(ea_ttc),
            sumea_ht = sum(ea_ht),
            sumtaxes = sum(taxes))

# Policy level summary
policySums2020 <- year2020F %>% 
  as.data.frame() %>% 
  ungroup() %>%
  group_by(policy, uw_year, paym_freq, nbrn) %>% # not grouped by anneemoiscomptable and invoicetype because invoicetype can be refunds and coverage
  summarise(sumcoll_prem = sum(coll_prem),
            sumcoll_comm = sum(coll_comm),
            sumgroup = sum(group),
            sumea_ttc = sum(ea_ttc),
            sumea_ht = sum(ea_ht),
            sumtaxes = sum(taxes))

write.csv(x = policySums2020, file =  "2_results/policySums2020.csv")

# Check unique number of Policy numbers is the same in grouped and ungrouped dataframes year2020F and year2020Joined
length(unique(year2020F$policy)) == length(unique(year2020Joined$policy))

# Year Summary of Premiums
year2020Summary <- year2020F %>% 
  as.data.frame() %>% 
  ungroup() %>%
  group_by(uw_year, paym_freq, nbrn, coverage) %>% # not grouped by anneemoiscomptable
  summarise(sumcoll_prem = sum(coll_prem),
            sumcoll_comm = sum(coll_comm),
            sumgroup = sum(group),
            sumea_ttc = sum(ea_ttc),
            sumea_ht = sum(ea_ht),
            sumtaxes = sum(taxes))

write.csv(x = year2020Summary, file =  "2_results/year2020Summary.csv")

# 2019 data ---------------------------------------------------------------

names(year2019F)

# "policy""uw_year""paym_freq""anneemoiscomptable" "nbrn""coverage""invoicetype""qte_date_sale""qte_date_efec""coll_prem""coll_comm""group""ea_ttc""ea_ht""taxes""dateOfFile""yearOfFile""monthOfFile" 
# Grouped by x variables and summed
year2019Joined <- year2019F %>% 
  as.data.frame() %>% 
  ungroup() %>%
  group_by(policy, uw_year, paym_freq, nbrn, coverage, qte_date_sale, qte_date_efec) %>% # not grouped by anneemoiscomptable and invoicetype because invoicetype can be refunds
  summarise(sumcoll_prem = sum(coll_prem),
            sumcoll_comm = sum(coll_comm),
            sumgroup = sum(group),
            sumea_ttc = sum(ea_ttc),
            sumea_ht = sum(ea_ht),
            sumtaxes = sum(taxes))

# Policy level summary
policySums2019 <- year2019F %>% 
  as.data.frame() %>% 
  ungroup() %>%
  group_by(policy, uw_year, paym_freq, nbrn) %>% # not grouped by anneemoiscomptable and invoicetype because invoicetype can be refunds and coverage
  summarise(sumcoll_prem = sum(coll_prem),
            sumcoll_comm = sum(coll_comm),
            sumgroup = sum(group),
            sumea_ttc = sum(ea_ttc),
            sumea_ht = sum(ea_ht),
            sumtaxes = sum(taxes))

write.csv(x = policySums2019, file =  "2_results/policySums2019.csv")


year2019Joined <- year2019F %>% 
  as.data.frame() %>% 
  ungroup() %>%
  group_by(policy, uw_year, paym_freq, nbrn, qte_date_sale, qte_date_efec) %>% # not grouped by anneemoiscomptable and invoicetype because invoicetype can be refunds and coverage
  summarise(sumcoll_prem = sum(coll_prem),
            sumcoll_comm = sum(coll_comm),
            sumgroup = sum(group),
            sumea_ttc = sum(ea_ttc),
            sumea_ht = sum(ea_ht),
            sumtaxes = sum(taxes))


# Check unique number of Policy numbers is the same in grouped and ungrouped dataframes year2020F and year2020Joined
length(unique(year2019F$policy)) == length(unique(year2019Joined$policy))

# Year Summary of Premiums
year2019Summary <- year2019F %>% 
  as.data.frame() %>% 
  ungroup() %>%
  group_by(uw_year, paym_freq, nbrn, coverage) %>% # not grouped by anneemoiscomptable
  summarise(sumcoll_prem = sum(coll_prem),
            sumcoll_comm = sum(coll_comm),
            sumgroup = sum(group),
            sumea_ttc = sum(ea_ttc),
            sumea_ht = sum(ea_ht),
            sumtaxes = sum(taxes))

write.csv(x = year2019Summary, file =  "2_results/year2019Summary.csv")
