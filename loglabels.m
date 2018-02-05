%% LOGLABELS
% Convert the labels of a (logarithmic) axis to unit prefix notation:
% '1e-10' --> '100 ps'
% All prefixes defined by the International Bureau of Weights and Measures
% are supported, that is yocto (1e-24) until yotta (1e+24).
%
% Author:      Michael Adams
%
% Usage:
%   loglabels(ax,unit,[whichaxis='x'])
%   ax:        Handle of an axis
%   unit:      String representation of the unit (e.g. 's' for seconds)
%   whichaxis: String representation of the axis to be changed ('x', 'y'
%              or 'z'). This parameter is optional. If omitted, 'x' is
%              used.
% Example: 
%   loglabels(gca,'s','x');
%   Result: The x-axis label '1e-9' is changed to '1 ns'
%

function loglabels(ax,unit,whichaxis)
if nargin<=2
    whichaxis = 'x'; % default axis name
end
fig = ax.Parent;
setlabels(ax,unit,whichaxis);
set(zoom(fig),'ActionPostCallback',@(obj,ev) setlabels(ev.Axes,unit,whichaxis));
set(pan(fig),'ActionPostCallback',@(obj,ev) setlabels(ev.Axes,unit,whichaxis));
set(pan(fig),'ActionPreCallback',@(obj,ev) on_pan(ev.Axes,whichaxis));
set(fig,'ResizeFcn',@(a,b) update_axes(fig,unit));
    function setlabels(ax,unit,whichaxis)
        % set the labels of ax to SI log units
        switch whichaxis
            case 'x'
                ax.XTickLabel = powertolabel(ax.XTick,unit);
            case 'y'
                ax.YTickLabel = powertolabel(ax.YTick,unit);
            case 'z'
                ax.ZTickLabel = powertolabel(ax.ZTick,unit);
        end
        ax.UserData.loglabel = whichaxis; % remember that this axes' labels were set
    end

    function on_pan(ax,whichaxis)
        % revert to automatic labels during pan for correct number display
        switch whichaxis
            case 'x'
                ax.XTickLabelMode = 'auto';
            case 'y'
                ax.YTickLabelMode = 'auto';
            case 'z'
                ax.ZTickLabelMode = 'auto';
        end
    end

    function update_axes(fig,unit)
        % relabel all axes in the figure that have been changed previously
        axes=fig.Children;
        for i=1:length(axes)
            if isfield(axes(i).UserData,'loglabel')
                whichaxistmp = axes(i).UserData.loglabel;
                setlabels(axes(i),unit,whichaxistmp);
            end
        end
    end

    function labels=powertolabel(ticks,unit)
        % create label strings from ticks
        labels = {};
        pows=ceil(log10(ticks)); % powers
        oom = floor(pows/3); % order of magnitude, between -8 (yocto) and +8 (yotta)
        prefixlist = 'yzafpnµm kMGTPEZY'; % all BIPM prefixes
        for j=1:length(ticks)
            prefix = strtrim(prefixlist(oom(j)+9));
            div = 10^(oom(j)*3);
            s = num2str(ticks(j)/div);
            labels{end+1}=[s ' ' prefix unit]; %#ok<AGROW>
        end
    end
end