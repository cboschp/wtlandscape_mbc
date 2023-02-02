%%%%%%%%%%%%%%%%%%%%%%%%%
% History of connectomics datasets
% 
% This script plots data from a previously formatted table.
%
% For any updates on the source data, see the *_generateTable.m script.
%
%%%%%%%%%%%%%%%%%%%%%%%%%

%% init paths
dirs = init_dirs();
fg = init_figOptions();

%% import data
load([dirs.matTable filesep 'mapHistory_230119.mat']);

%% cleanup table
mapHistory.mapID = categorical(mapHistory.mapID);
% note: two entries for mapID E2198
% remove the corresponding analysis paper:
mapHistory(mapHistory.doi=='https://doi.org/10.1038/nature09818',:) = [];

%% group vars
% by technique
% [tg,tgid] = findgroups(mapHistory.img_tech_simple);
[tg,tgid] = findgroups(mapHistory.img_tech);
nTechs = length(tgid);

%% plot historical perspective

fg_year_fov(mapHistory, tg, tgid, 'volumes imaged', fg);
figSave([dirs.fg filesep 'mapHistory_year_fov']);
fg_year_size(mapHistory, tg, tgid, 'dataset size', fg);
figSave([dirs.fg filesep 'mapHistory_year_TB']);
fg_year_rate(mapHistory, tg, tgid, 'imaging rate', fg, false);
figSave([dirs.fg filesep 'mapHistory_year_MHz']);
fg_year_rate(mapHistory, tg, tgid, 'imaging rate', fg, true);
figSave([dirs.fg filesep 'mapHistory_year_MHz_legend']);


%% which techniques have provided 0.1mm3?
current_techs = unique(mapHistory.img_tech(mapHistory.fov_mm3>=0.1));
disp('Techniques that have generated datasets >= 0.1 mm^3:');
disp(current_techs);

%% which are the most commonly used techniques?
dsPerTech = zeros(nTechs,1);
for i = 1:nTechs
    t = mapHistory(mapHistory.img_tech==tgid(i),:);
    dsPerTech(i) = height(t);
end

dsPerTechT = table(tgid,dsPerTech);
disp('Datasets per technique');
disp(dsPerTechT);
