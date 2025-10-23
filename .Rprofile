# .Rprofile for Data Visualization Course

# Display welcome message
cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
cat("  Data Visualization con ggplot2\n")
cat("  Marco Chiapello - REVELO Training\n")
cat("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n")

# Set options
options(
  # Increase width for better code display
  width = 120,
  
  # Keep numbers in standard notation
  scipen = 10,
  
  # Number of digits to display
  digits = 4,
  
  # Show max 100 rows
  max.print = 100,
  
  # Encoding
  encoding = "UTF-8",
  
  # Better error messages
  show.error.locations = TRUE,
  
  # Repository
  repos = c(CRAN = "https://cloud.r-project.org/")
)

# Set ggplot2 default theme (if ggplot2 is loaded)
if (requireNamespace("ggplot2", quietly = TRUE)) {
  ggplot2::theme_set(ggplot2::theme_minimal(base_size = 12))
  cat("✓ ggplot2 theme impostato a theme_minimal()\n")
}

# Helper function to check required packages
check_packages <- function() {
  required_packages <- c(
    "ggplot2", "dplyr", "tidyr", "readr",
    "scales", "patchwork", "palmerpenguins"
  )
  
  missing <- required_packages[!sapply(required_packages, requireNamespace, quietly = TRUE)]
  
  if (length(missing) > 0) {
    cat("\n⚠️  Pacchetti mancanti:", paste(missing, collapse = ", "), "\n")
    cat("   Installa con: install.packages(c('", paste(missing, collapse = "', '"), "'))\n\n", sep = "")
  } else {
    cat("✓ Tutti i pacchetti richiesti sono installati\n\n")
  }
}

# Check packages on startup
check_packages()

# Helpful aliases
cat("Comandi utili:\n")
cat("  check_packages()  - Verifica pacchetti installati\n")
cat("  ?ggplot2          - Apri documentazione ggplot2\n")
cat("\nBuon corso! 🎨\n\n")

# Clean up
rm(check_packages)
