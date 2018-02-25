%sets the axises and ratios of the figure window to correct values so the
%plot is showed correctly.
%Input: String with the title of the plot
function setRatios(ttl)
title(ttl);
daspect([1 1 1])
xlim([0 763])
ylim([0 258])