function fg_year_size(t,g,gid,ttl, fg, varargin)
% plots TB vs year for all entries in table t grouped by gid as indicated
% by indices g. 
% g, gid comes from previous step such as 
% [g,gid]=findgroups(t.groupingVar);
% fig viz params defined in structure fg.
nThings = length(gid);
c = turbo(nThings);
% retrieve var arguments
if nargin>5
    showLgd = varargin{1}; % boolean, activates legend;
else
    showLgd = false;
end

f = figure();
if showLgd
    f.Position(3:4) = [440 300];
else
    f.Position(3:4) = [340 300];
end

for i = 1:nThings
    idx = g==i;
    semilogy(t.released_year(idx), t.dsSize_TB(idx), ...
        'o','Color',c(i,:),'MarkerFaceColor',c(i,:));
    hold on;
end

% edit
ax = gca;
% ax.PositionConstraint = 'innerposition';
xlim([1980 2025]);
ylim([1e-3 1e6]);
box off;
axis square;
ax.XTick = 1980:10:2020;
ax.YTick = [1e-3 1 1000 5e5];
ax.YTickLabel = {'1 GB'; '1 TB'; '1 PB'; '0.5 EB'};
ax.YGrid = 'on';
% ylabel('dataset size');
ax.FontSize = fg.fsST;
title(ttl);

% legend
if showLgd
    lgd = legend(gid, 'location', 'bestoutside', 'FontSize', fg.fsAx);
end

end