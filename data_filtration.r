# Function to load data from a CSV file
# Args:
#   - filepath: the file path of the CSV file to be loaded
# Returns:
#   - data: the loaded data from the CSV file
load_data <- function(filepath){
  return(read.csv(filepath))
}

# Function to extract just the dates column from a data frame
# Args:
#   - data: the input data frame
# Returns:
#   - dates: the dates column extracted from the input data frame
just_dates <- function(data) {
  return(data[,1])
}

# Function to extract just the sels column from a data frame
# Args:
#   - data: the input data frame
# Returns:
#   - sels: the sels column extracted from the input data frame
just_sels <- function(data){
  return(data[,2])
}

# Function to format dates from a character vector to Date class
# Args:
#   - dates: the input dates in string format ("%y-%m-%d")
# Returns:
#   - formatted_dates: the formatted dates in Date class
format_dates <- function(dates){
  return(as.Date(dates, format = "%y-%m-%d"))
}

# Function to create a data frame from dates and sels vectors
# Args:
#   - dates: the dates for the acquisition_date column
#   - sels: the sels for the active_machine column
# Returns:
#   - df: the created data frame with acquisition_date and active_machine columns
create_df <- function(dates, sels){
  return(data.frame(acquisition_date = dates, active_machine = sels))
}

# Function to filter data by month and year
# Args:
#   - data: the input data frame to be filtered
#   - month_year: the month and year to filter by in format "YYYY-MM"
# Returns:
#   - filtered: data frame, the filtered data frame based on month and year
filter_by_month_year <- function(data, month_year) {
  month_year <- as.Date(paste0(month_year, "-01"), format = "%Y-%m-%d") 
  filtered <- data[format(data$ACQUISITION_DATE, "%Y-%m") == format(month_year, "%Y-%m"),]
  return(filtered)
}
