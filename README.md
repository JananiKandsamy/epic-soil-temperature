# EPIC soil temperature extraction

Extracts daily soil temperature from EPIC (.DCN) output and estimates
temperature at 15 cm. Used in [Kandasamy, J.; Xue, Y.; Houser, P.; Maggioni, V. Performance of Different Crop Models in Simulating Soil Temperature. Sensors 2023, 23, 2891. https://doi.org/10.3390/s23062891].

## Requirements
MATLAB (no extra toolboxes)

## Usage
extract_soil_temp_15cm('example/sample_input_fresno.DCN')

## Input and output
Input: EPIC .DCN file with daily blocks. Columns 3 and 4 are soil
temperature at 10 cm and 40 cm (deg C).
Output: .xlsx and .mat files with date and 15 cm soil temperature.

## Method
15 cm temperature is estimated from the 10 cm and 40 cm values [Interpolation Method].

## Author
Janani Kandasamy, kjananicivil@gmail.com
