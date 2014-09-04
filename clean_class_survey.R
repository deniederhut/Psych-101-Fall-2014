clean_class_survey <- function(file){
  #Cleans and formats the class survey data from the bcourses site
  #Call during an R session with the 'source' command
  #
  #Args:
  #  file: the path to the survey file, expected to be a csv
  #
  #Returns: three versions of the data set: one that is only formatted, one that is formatted
  # and cleaned of illegal responses, and one that is formatted, cleaned, and has missing
  # values imputed
  #
  library(Amelia)
  data <- read.csv(file = file)
  data <- data[,c(1,seq(5,47,2))]
  colnames(data) <- c('section','Q1_subleties','Q2_noises','Q3_withdraw','Q4_startle','Q5_arts',
                       'Q6_rattled','Q7_earlylove','Q8_fallinlove','Q9_father','Q10_mother',
                       'Q11_violence','Q12_tense','Q13_cry','Q14_country','Q15_fewfriends',
                       'Q16_avoidcrowds','Q17_morningperson','Q18_gender','Q19_age',
                       'Q20_oldersiblings','Q21_height','Q22_feelings')
  save(data,file = 'survey_data_formatted.Rda', compress = 'gzip')
  data[,2:18] <- lapply(data[,2:18], function(x){replace(x,(x < 1) | (x > 7), NA)})
  data[data > 99] <- NA
  for (i in c(1:length(data$Q21_height))) {
    if (is.na(data$Q21_height[[i]]) == FALSE) {
      if (data$Q21_height[[i]] < 12) {
        data$Q21_height[[i]] <- data$Q21_height[[i]] * 12
      }
    }
  }
  data[,2:18] <- round(data[,2:18])
  save(data,file = 'survey_data_cleaned.Rda', compress = 'gzip')
  a.out <- amelia(data,m = 1,idvars = 'section', noms = c('Q18_gender','Q22_feelings'),
    ords = c('Q1_subleties','Q2_noises','Q3_withdraw','Q4_startle','Q5_arts',
    'Q6_rattled','Q7_earlylove','Q8_fallinlove','Q9_father','Q10_mother',
    'Q11_violence','Q12_tense','Q13_cry','Q14_country','Q15_fewfriends',
    'Q16_avoidcrowds','Q17_morningperson'
    ), empri = 1)
  data <- a.out$imputations[[1]]
  save(dirty,file = 'survey_data_imputed.Rda', compress = 'gzip')
}
