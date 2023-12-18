library('move2')
library('ctmm')

# input: telemetry.list - output: move2_loc
rFunction = function(data) {
  ## converting ordered factor variables into factors to be able to join in to move2 "stack". Probably only affected variables are: argos_nopc and argos_lc, but just in case keeping it general
  telem <- lapply(data, function(tl){
    for(x in 1:length(tl@.Data)){
      if(all(any(class(tl@.Data[[x]])=="ordered")& any(class(tl@.Data[[x]])=="factor"))){
        tl@.Data[[x]] <- factor(tl@.Data[[x]],ordered = F)
      }
    }
    return(tl)
  })
  mv2 <- mt_as_move2(telem)
  # mv2 <- mt_as_move2(data)
  
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
