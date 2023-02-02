function fg_year_fov(t,g,gid,ttl, fg, varargin)
% plots fov vs year for all entries in table t grouped by gid as indicated
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
    semilogy(t.released_year(idx), t.fov_mm3(idx), ...      
        'o','Color',c(i,:),'MarkerFaceColor',c(i,:));
    hold on;
end

% edit
ax = gca;
% ax.PositionConstraint = 'innerposition';
xlim([1980 2025]);
ylim([1e-6 1e3]);
box off;
axis square;
ax.XTick = 1980:10:2020;
ax.YTick = [1e-6 1e-3 1 5e2];
ax.YTickLabel = {'(10 µm)^3'; '(100 µm)^3'; '1 mm^3'; '500 mm^3'};
ax.YGrid = 'on';
% ylabel('mm^3');
ax.FontSize = fg.fsST;
title(ttl);

% legend
if showLgd
    lgd = legend(gid, 'location', 'bestoutside', 'FontSize', fg.fsAx);
end

end