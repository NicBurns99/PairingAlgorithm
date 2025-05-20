# PAIRING ALGORITHM FUNCTIONS

# Store pairing history
pairing_history <- data.frame(
  student1 = character(),
  student2 = character(),
  stringsAsFactors = FALSE
)

# Randomly pair students
pair_students <- function(Roster, pairing_history) {
  # Get list of present students
  present_students <- get_present_roster(Roster)$Name
  
  # If ODD NUMBER of students, add a placeholder for unpaired student
  if (length(present_students) %% 2 != 0) {
    present_students <- c(present_students, "Unpaired")
  }
  
  # Randomly shuffle student list
  shuffled_students <- sample(present_students)
  
  # Create pairs
  pairs <- list()
  for (i in seq(1, length(shuffled_students), by = 2)) {
    pair <- c(shuffled_students[i], shuffled_students[i + 1])
    pairs <- append(pairs, list(pair))
  }
  
  
  # Add the new pairings to the history
  for (pair in pairs) {
    pairing_history <- rbind(pairing_history, data.frame(student1 = pair[1], student2 = pair[2]))
  }
  
  return(list(pairs = pairs, pairing_history = pairing_history))
}
