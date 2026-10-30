# EPIC soil temperature extraction

Extracts daily soil temperature from EPIC (.DCN) output and estimates
temperature at 15 cm. Used in [citation of Sensors 2023 paper].

## Requirements
MATLAB (no extra toolboxes)

## Usage
extract_soil_temp_15cm('example/sample_input.DCN')

## Input and output
Input: EPIC .DCN file with daily blocks. Columns 3 and 4 are soil
temperature at 10 cm and 40 cm (deg C).
Output: .xlsx and .mat files with date and 15 cm soil temperature.

## Method
15 cm temperature is estimated from the 10 cm and 40 cm values [state the formula and source].

## Author
Janani Kandasamy, kjananicivil@gmail.com
