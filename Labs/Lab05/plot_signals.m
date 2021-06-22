function [  ] = plot_signals( x,Y,labels )
%PLOT_SIGNALS Summary of this function goes here
%   Detailed explanation goes here
plot(x, Y(:,1), 'color', [1 .5 0],'marker','o','LineStyle','--','LineWidth',2)
hold on
plot(x, Y(:,2), 'color', [0 1 0],'marker','+','LineStyle',':','LineWidth',2)
hold on
plot(x, Y(:,3), 'color',[0 1 1],'marker','d','LineStyle','-.','LineWidth',2)
hold on
legend(labels)
xlabel('time')
ylabel('amplitude')
title('amplitude vs. time')
end

