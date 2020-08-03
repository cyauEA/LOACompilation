# Load data from the location and clean -----------------------------------

# Location of the Files from L'Oliver Assurance
# H:\DIRECTION TECHNIQUE\05 CLIENTS - TARIFICATION\01 Clients\ASSURANCE\LOA L'Olivier Assurance\Borderaux primes\wetransfer-dc50db

# Get names of all xlsx files in the folder
# temp = list.files(path = "H:/DIRECTION TECHNIQUE/05 CLIENTS - TARIFICATION/01 Clients/ASSURANCE/LOA L'Olivier Assurance/Borderaux primes/wetransferAll", pattern="*.xlsx")


# File location of each file
files <- list.files(path = "H:/DIRECTION TECHNIQUE/05 CLIENTS - TARIFICATION/01 Clients/ASSURANCE/LOA L'Olivier Assurance/Borderaux primes/wetransferAll", pattern = "*.xlsx", full.names = T)

# Create empty list to store each year's files
filesByYear <- list()

# Loop to create a list with a list of files from each year
for (i in 1:length(files)) {
  fileYear <- gsub(x = files[i], pattern = "^(.*)([0-9]+[0-9]+[0-9]+[0-9]+)(.*)([0-9][0-9])(.*)", replacement = '\\2')
  if(fileYear %in% names(filesByYear)) {
    filesByYear[[fileYear]] <- c(filesByYear[[fileYear]], files[i])
  } else {
    filesByYear[[fileYear]] <- list(files[i])
  }
}

# Create vectors to hold the lists of files from filesByYear 
for (i in 1:length(filesByYear)) {
  assign(paste0("year", names(filesByYear[i])), unlist(filesByYear[[i]]))
}

# Manually assign variables to read the vectors created above
year2019 <- sapply(year2019, read_excel, simplify=FALSE)
year2020 <- sapply(year2020, read_excel, simplify=FALSE)

# list of colnames
lapply(year2019, colnames)
lapply(year2020, colnames)

# Set column names to lower to remove colname differences for joining
year2019C <- lapply(year2019, setnames, tolower)
year2020C <- lapply(year2020, setnames, tolower)

# Converts list into individual dataframes
# list2env(tbl,envir=.GlobalEnv)

# Bind the tables together, creates a column with an ID that tells you which location it's from, create the dateOfFile to identify the year from ID, unselect ID
year2019F <- year2019C %>%
  bind_rows(.id = "id") %>%
  mutate(dateOfFile = lubridate::ymd(gsub(x = id, pattern = "^(.*)([0-9]+[0-9]+[0-9]+[0-9]+)(.*)([0-9][0-9])(.*)", replacement = paste0('\\2', '-', '\\4', '- 01'))),
         yearOfFile = lubridate::year(dateOfFile),
         monthOfFile = lubridate::month(dateOfFile),
         anneemoiscomptable = lubridate::ymd(anneemoiscomptable),
         qte_date_sale = lubridate::ymd(qte_date_sale),
         qte_date_efec = lubridate::ymd(qte_date_efec)) %>% 
  select(-id)

year2020F <- year2020C %>%
  bind_rows(.id = "id") %>%
  mutate(dateOfFile = lubridate::ymd(gsub(x = id, pattern = "^(.*)([0-9]+[0-9]+[0-9]+[0-9]+)(.*)([0-9][0-9])(.*)", replacement = paste0('\\2', '-', '\\4', '- 01'))),
         yearOfFile = lubridate::year(dateOfFile),
         monthOfFile = lubridate::month(dateOfFile),
         anneemoiscomptable = lubridate::ymd(anneemoiscomptable),
         qte_date_sale = lubridate::ymd(qte_date_sale),
         qte_date_efec = lubridate::ymd(qte_date_efec),
         policy = as.character(policy)) %>% 
  select(-id)

