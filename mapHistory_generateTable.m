%%%%%%%%%%%%%%%%%%%%%%%%%
% generate data table
% 
% This script formats the required data into a matlab table.
%
% Any data analysis should take place in a second script which
% would start loading this table. 
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%

%% init paths
dirs = init_dirs();
fg = init_figOptions();

%% import spreadsheet
opts = {[dirs.data filesep 'maps_dates_230119.xlsx'],...
    'A3:Y68', 'A1:Y1', 'A2:Y2'};
mapHistory = import_spreadsheet(opts);

%% edit spreadsheet
mapHistory.doi = categorical(mapHistory.doi);

%%%%%%%%%%%%%%%%%%%%%%%%%
%% save the formatted table for further analysis later
save([dirs.matTable filesep 'mapHistory_230119.mat'], ...
    'mapHistory', ...
    '-v7.3');

% must use the -v7.3 version flag to save it in case the file is >2GB.
%%%%%%%%%%%%%%%%%%%%%%%%%