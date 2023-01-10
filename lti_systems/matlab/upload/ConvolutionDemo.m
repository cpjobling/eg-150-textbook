%% Preset:
clear all; close all; clc;

%% Define:
tLimits = [-3.5, 3.5];
tNumPoints = 301;
animationDelay = 0.01; % sec

x = @(t) SignalFunction.Rect(t);
% y = @(t) SignalFunction.delta(t-1, 1.5*(tLimits(2)-tLimits(1))/(tNumPoints-1) );
y = @(t) 1.5*SignalFunction.PointedTriangle(t);
% y = @(t) SignalFunction.Rect(t/1.5);

% x = @(t) sin(2*t) + 0.05*randn;
% y = @(t) (1/3)*SignalFunction.Rect(t*3);

%% Plot Basic Plots:
figure;

subplot(1,2,1);
[tVec, xVec] = SignalRealization( x, tLimits, tNumPoints);
plot(tVec, xVec, Color='r', LineWidth=4, LineStyle='-');
title("x"); xlabel("t"); grid on;

subplot(1,2,2);
[tVec, yVec] = SignalRealization( y, tLimits, tNumPoints);
plot(tVec, yVec, Color='b', LineWidth=4, LineStyle='-');
title("y"); xlabel("t"); grid on;

%% Preallocate results:
overlap = zeros(size(xVec));
z = nan(size(tVec));
yInvertedVec = zeros(size(xVec));

%% Plot Convolution Plots:
plotHandels = struct; % keep all plot handels in the same place.
ConvolutionFigure = figure;
t=tLimits(1);

subplot(2,1,1);
plotHandels.x        = plot(tVec, xVec         , color='r' , LineStyle='-', LineWidth=4, DisplayName="$$x(\tau)$$"  );
hold on;
plotHandels.y        = plot(tVec, yInvertedVec , color='b' , LineStyle='-', LineWidth=4, DisplayName="$$y(t-\tau)$$");
hold on;
plotHandels.yCenter  = xline(t, color='k' , LineStyle='--' );
plotHandels.yCenter.Annotation.LegendInformation.IconDisplayStyle = 'off'; % Don't include this line in the legend
hold on;
plotHandels.overlapp = stem(tVec, overlap      , color=[0, 1, 0, 0.1],   DisplayName="Overlap" , MarkerSize=2, LineWidth=0.2 );
title("Convolution Computation"); grid on;
xlabel("$$\tau$$", Interpreter="latex", FontSize=14);
legend(Location='northeast', Interpreter='latex', FontSize=10);
xlim(tLimits);

subplot(2,1,2);
plotHandels.result          = plot(tVec, z      , color='k', LineStyle='-', LineWidth=4 , DisplayName="Result");
hold on;
plotHandels.currentResult   = plot(0   , 0      , color='k', Marker='o'   , MarkerSize=12 );
title("Convolution Result"); grid on;
xlabel("$$t$$", Interpreter="latex", FontSize=14); 
xlim(tLimits);

%% Add User Control:
UIControl.Pause  = uicontrol( ConvolutionFigure, Style="pushbutton", String="Pause" , Callback=@PausePressed  );
UIControl.Invert = uicontrol( ConvolutionFigure, Style="pushbutton", String="Invert", Callback=@InvertPressed );

ArrangeLocations(UIControl);

ConvolutionFigure.UserData = struct();
ConvolutionFigure.UserData.Paused   = false;
ConvolutionFigure.UserData.Inverted = false;

%% Convolution:
tInd = 0;

while (true)
    
    % Check if user closed the plot:
    if ~isgraphics(ConvolutionFigure)
        break;
    end

    % Check animation state:
    if ConvolutionFigure.UserData.Paused
        pause(animationDelay);
        drawnow;
        continue;
    end

    % Direction:
    if ConvolutionFigure.UserData.Inverted
        tInd = tInd - 1;
    else
        tInd = tInd + 1;
    end

    % Check Bounds:
    if InBounds(tInd, tVec)
        t = tVec(tInd);
    else
        ConvolutionFigure.UserData.Paused = true;
        pause(animationDelay);
        drawnow;
        continue;
    end
    
    % Compute Convolution at time t:
    yInverted = @(tau) y(t-tau);
    overlap = ComputeOverlap(x, yInverted, tLimits, tNumPoints);
    z(tInd) = sum(overlap);

    % Update y Inverted (for plots):
    [tVec, yInvertedVec] = SignalRealization( yInverted, tLimits, tNumPoints);

    
    % Update Plots:
    plotHandels.yCenter.Value = t;
    plotHandels.y             = Updateplot( plotHandels.y              , yInvertedVec );
    plotHandels.overlapp      = Updateplot( plotHandels.overlapp       , overlap      );
    plotHandels.result        = Updateplot( plotHandels.result         , z            );
    plotHandels.currentResult.XData = t; plotHandels.currentResult.YData = z(tInd); 

    % Update animation and wait:
    drawnow
    pause(animationDelay);

end
disp("Done.");
%% End



%% Sub Functions:

function [tVec, sigVec] = SignalRealization( func, tLimits, numPoints)
    tVec = linspace( tLimits(1), tLimits(2), numPoints );
    sigVec = zeros(size(tVec));
    for tInd = 1 : numPoints
        t = tVec(tInd);
        sigVec(tInd) = func(t);
    end
end

function overlap = ComputeOverlap(x, y, tLimits, N)
    tauVec = linspace(tLimits(1), tLimits(2), N);
    overlap = zeros(size(tauVec));
    for tauInd = 1 : N
        tau = tauVec(tauInd);
        overlap(tauInd) = x(tau)*y(tau);
    end
end

function plotH = Updateplot( plotH, ValueVec )
    plotH.YData = ValueVec;
end


function PausePressed(src, event)
    FigureH = src.Parent;
    FigureH.UserData.Paused = ~FigureH.UserData.Paused;
    if FigureH.UserData.Paused
        src.String = 'Continue';
    else
        src.String = 'Pause';
    end
    drawnow;
end

function InvertPressed(src, event)
    FigureH = src.Parent;
    FigureH.UserData.Inverted = ~FigureH.UserData.Inverted;
end

function EndPressed(src, event)
    FigureH = src.Parent;
    FigureH.UserData.End = true;
end

function tf = InBounds(ind, Vec)
    tf = (ind>=1) && (ind<=length(Vec));
end


function ArrangeLocations(UIControl)
    FieldNames = string(fieldnames(UIControl).');
    currentLeftPosition = 0;
    for fieldName = FieldNames
        Button = UIControl.(fieldName);
        Button.Position(2) = 0; % Place button in Bottom of screen
        Button.Position(1) = currentLeftPosition;
        currentLeftPosition = currentLeftPosition + Button.Position(3);
    end 
end