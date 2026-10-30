function extract_soil_temp_15cm(input_file, num_header_lines)
% EXTRACT_SOIL_TEMP_15CM  Daily soil temperature from an EPIC .DCN output file.
%   Reads soil temperature at two depths (10 cm and 40 cm) from each daily
%   block and writes a 15 cm estimate to .xlsx and .mat files.
%
%   input_file        path to the EPIC .DCN output file
%   num_header_lines  header lines to skip (default 15937 for the example run)
%
%   Author: Janani Kandasamy   Created: 04/26/2023

if nargin < 2
    num_header_lines = 15937;
end

fid = fopen(input_file, 'r');
if fid == -1
    error('Could not open file: %s', input_file);
end
textscan(fid, '%s', num_header_lines, 'delimiter', '\n');   % skip header

dates = [];
t10 = [];
t40 = [];

while ~feof(fid)
    d = textscan(fid, '%f%f%f', 1, 'delimiter', '\n');       % year, month, day
    textscan(fid, '%s', 3, 'delimiter', '\n');               % skip lines
    s = textscan(fid, '%s%f%f%f%f%f%f%f%f', 1);              % soil temperature row
    textscan(fid, '%s', 9, 'delimiter', '\n');               % skip lines
    dates = [dates; datenum(d{1,1}, d{1,2}, d{1,3})];
    t10   = [t10; s{1,3}];   % soil temperature, 10 cm (deg C)
    t40   = [t40; s{1,4}];   % soil temperature, 40 cm (deg C)
end
fclose(fid);

% 15 cm estimate (average of the two depths, as used in the study)
t15 = (t10 + t40) ./ 2;

[folder, name] = fileparts(input_file);
out_base = fullfile(folder, name);
writetable(table(datestr(dates), t15, 'VariableNames', {'Date','SoilTemp15cm_C'}), ...
           [out_base '.xlsx']);
save([out_base '.mat'], 'dates', 't15');
end