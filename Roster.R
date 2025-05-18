# ROSTER MANAGEMENT FUNCTIONS:
## create_roster() to initialise an empty roster
## add_student() to add a student to the roster (duplicate names check, and sorts alphabetically)
## remove_student() to remove a student from the roster
## mark_present() mark a student present in the class
## mark_absent() mark a student absent for that day
## present_roster() filter absent students so not used in generation of pairs.

# Initialise empty student roster
create_roster <- function() {
  data.frame(
    Name = character(),
    Present = logical(),
    Experience = factor(levels = c("Beginner", "Intermediate", "Advanced")),
    stringsAsFactors = FALSE
  )
}

# Add a student
add_student <- function(Roster, Name, Experience = NA) {
  
  # check for duplicate name
  if (Name %in% Roster$Name) {
    stop(paste("Student", Name, "is already in the roster"))
  }
  
  new_entry <- data.frame(
    Name = Name,
    Present = TRUE,
    Experience = factor(Experience, levels = c("Beginner", "Intermediate", "Advanced"))
  )
  
  # sort alphabetically
  arrange(rbind(Roster, new_entry), Name)
}

# Remove a student
remove_student <- function(Roster, Name) {
  subset(Roster, Name != Name)
}

# Mark student present
mark_present <- function(Roster, Name) {
  Roster$Present[Roster$Name == Name] <- TRUE
  Roster
}

# Mark student absent
mark_absent <- function(Roster, Name) {
  Roster$Present[Roster$Name == Name] <- FALSE
  Roster
}

# Filter out absent students
present_roster <- function(Roster) {
  Roster %>% 
    filter(Present == TRUE)
}