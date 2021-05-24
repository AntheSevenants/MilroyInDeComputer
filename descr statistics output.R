library(tidyverse)
library(skimr)
library(summarytools)

d_mixed = read_csv("1_strong_rev_run.csv")
d_mixed <- mutate(d_mixed, 
                  "standard_reached"=as.logical(standard_reached))
skim(d_mixed)
d_mixed <- filter(d_mixed, standard_reached == TRUE)
descr_table <- descr(d_mixed)
descr_table <- t(descr_table)
descr_table <- as.data.frame.matrix(descr_table)
write_csv(descr_table, "1_strong_rev_run_descr.csv")

ggplot(d_mixed) +
  geom_histogram(aes(x = runner_up_highest), binwidth = 100)


ggplot(d_mixed) +
  geom_histogram(aes(x = run_length), binwidth = 100)
