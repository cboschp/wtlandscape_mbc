function fg_year_rate(t, g, gid, ttl, fg, varargin)
% plots rate vs year for all entries in table t grouped by gid as indicated
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
    semilogy(t.released_year(idx), t.imagingRate_perMachine(idx), ...      % try semilogy
        'o','Color',c(i,:),'MarkerFaceColor',c(i,:));
    hold on;
end

% edit
ax = gca;
% ax.PositionConstraint = 'innerposition';
xlim([1980 2025]);
% xlim([2010 2025]);
ylim([1e-3 5e3]);
box off;
axis square;
ax.XTick = 1980:10:2020;
% ax.XTick = 2010:5:2020;
ax.YTick = [1e-3 1 1e2 1e3 5e3];
ax.YTickLabel = {'1 KHz'; '1 MHz'; '100 MHz'; '1 GHz'; '5 GHz'};
ax.YGrid = 'on';
% ylabel('MHz');
ax.FontSize = fg.fsST;
title(ttl);

% legend
if showLgd
    lgd = legend(gid, 'location', 'northwest', 'FontSize', fg.fsAx);
end

end