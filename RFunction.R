library('move2')
library('ctmm')

# data <- readRDS("./data/raw/input1_telemetry.list.rds")
# input: telemetry.list - output: move2_loc
rFunction = function(data) {
  mv2 <- mt_as_move2(data)
  # mv2_L <- lapply(data, function(x){
  #   telem2df <- data.frame(x)
  #   telem2df$trackID = if(is.null(x@info$identity)){"unnamed"}else{as.factor(x@info$identity)}
  #   # telem2df$timestamp <- as.POSIXct(telem2df$t, origin = "1970-01-01", tz = telem2df@info$timezone)
  #   mt_as_move2(telem2df,
  #               coords = c("x", "y"),
  #               time_column="timestamp",
  #               track_id_column="trackID",
  #               # track_attributes=c(),
  #               crs= if(is.null(x@info$projection)){as.character(NA)}else{x@info$projection}
  #               )
  # })
  # mv2 <- mt_stack(mv2_L,.track_combine="rename")
  return(mv2)
}
