# TESTING AND DEVELOPING SCRIPT

# Load functions for roster
source("Roster.R")
library(tidyverse) # for arrange()

# Create empty roster
Roster <- create_roster()

# Add students
Roster <- add_student(Roster, "Nicola", "Beginner")
Roster <- add_student(Roster, "Keith", "Intermediate")
Roster <- add_student(Roster, "John", "Advanced")
# check duplication name validation check works
Roster <- add_student(Roster, "Nicola", "Beginner") # it does

# Mark myself absent
Roster <- mark_absent(Roster, "Nicola")

# View the current roster
print(Roster)

# View roster with only PRESENT students
print(present_roster(Roster)) # works

## test save and load roster
# Save roster
saveRDS(Roster, "Data/Roster.rds")

# Load roster
roster <- readRDS("Data/Roster.rds")
