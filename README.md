# Telemtry.list to move2_loc

MoveApps

Github repository: https://github.com/movestore/telemetryTOmove2

## Description
Transformation of data in I/O type `telemetry.list` to `move2_loc` 

## Documentation
Be aware that although most attributes are kept, some attributes associated to the locations can be lost in this transformation. The projection of the data might have changed while working with apps with I/O type 'telemetry.list'. To change the projection of the data, use the App "Change Projection" subsequently.

### Input data
Telemetry.list

### Output data
move2_loc

### Artefacts
no artefacts

### Parameters 
none

### Null or error handling
**Data**: if the input data is empty, the output will also empty 