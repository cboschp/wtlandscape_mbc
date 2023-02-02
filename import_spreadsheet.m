function t = import_spreadsheet(topts)
% retreive variables
tpath = topts{1};
trange = topts{2};
theadrange = topts{3};
tunitsrange = topts{4};


% import table
t = readtable(tpath, 'Range', trange, 'ReadVariableNames', false);
h = readtable(tpath, 'Range', theadrange, 'ReadVariableNames', false);
h = h{1,:};
u = readtable(tpath, 'Range', tunitsrange, 'ReadVariableNames', false);
u = u{1,:};
t.Properties.VariableNames = h;

nRows = size(t,1);

% format table (set categorical fields)
t.img_tech = categorical(t.img_tech);
% t.img_tech_simple = categorical(t.img_tech_simple);
t.species = categorical(t.species);
t.dev = categorical(t.dev);
t.region = categorical(t.region);
t.organ = categorical(t.organ);

end