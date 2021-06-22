function varargout = Fractal_Game(varargin)
% FRACTAL_GAME MATLAB code for Fractal_Game.fig
%      FRACTAL_GAME, by itself, creates a new FRACTAL_GAME or raises the existing
%      singleton*.
%
%      H = FRACTAL_GAME returns the handle to a new FRACTAL_GAME or the handle to
%      the existing singleton*.
%
%      FRACTAL_GAME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FRACTAL_GAME.M with the given input arguments.
%
%      FRACTAL_GAME('Property','Value',...) creates a new FRACTAL_GAME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Fractal_Game_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Fractal_Game_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Fractal_Game

% Last Modified by GUIDE v2.5 11-Dec-2017 22:43:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Fractal_Game_OpeningFcn, ...
    'gui_OutputFcn',  @Fractal_Game_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Fractal_Game is made visible.
function Fractal_Game_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Fractal_Game (see VARARGIN)

% Choose default command line output for Fractal_Game
handles.output = hObject;
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
global A
hold on
FraktalT(handles.axes1,4,0.5,[pi/4,-pi/4],[0,0],[0,1]);
title(gca, 'Apple Shooter', 'FontSize', 20);
handles.xl = [-1,1];
handles.yl = [0,2];
set(handles.axes1, 'YTick', [], 'XTick', []);
xlim(handles.axes1, handles.xl)
ylim(handles.axes1, handles.yl)


% Initialize Apples Positions and state
% State:
%   0 = initialized and on
%   2 = killed by player
handles.easybutton.Value = true; % Default Easy

handles.apples.positions = reshape(A(end,:,:),length(A),2);
for i = 1:length(handles.apples.positions)
    handles.apples.state(i) = 0;
    handles.apples.GC(i) = 1; % Growth counter
end

%Initialize Apples Velocity
for i = 1:length(handles.apples.positions)
    handles.apples.velocity(i,:) = [0,-.2] * rand() + [0,-.2];
end

% Draw Apples
for i = 1:length(handles.apples.positions)
    handles.apples.h(i) = plot(handles.axes1,handles.apples.positions(i,1), ...
        handles.apples.positions(i,2),'ro', 'MarkerSize', 20);
end

% Initialize Gun and Bullets
handles.gun.position = [];
handles.bullets.positions = [];
handles.bullets.velocity = [0,1];
handles.bullets.count = 0;
handles.bullets.timer = 0;
handles.mouseDown = [];

% Draw Gun
handles.gun.h = plot(handles.axes1,NaN,NaN,...
    'o','MarkerSize',10);
handles.bullets.h = plot(handles.axes1,NaN,NaN,...
    '.','MarkerSize',10);

% Timer
handles.delta_t = 0.03;
handles.timer = timer('ExecutionMode', 'fixedRate', 'Period', handles.delta_t, ...
    'TimerFcn', {@update_function, hObject});
% Update handles structure
guidata(hObject, handles);


% UIWAIT makes Fractal_Game wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Fractal_Game_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp(get(handles.timer, 'Running'), 'off')
    start(handles.timer)
end



% --- Executes on start button press.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp(get(handles.timer, 'Running'), 'on')
    stop(handles.timer)
end


% --- Executes on stop button press.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp(get(handles.timer, 'Running'), 'on')
    stop(handles.timer)
end
reset(hObject,handles)



% --- Executes on button press in easybutton.
function easybutton_Callback(hObject, eventdata, handles)
% hObject    handle to easybutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp(get(handles.timer, 'Running'), 'on')
    stop(handles.timer)
end
if handles.mediumbutton.Value == true
    handles.mediumbutton.Value = false;
end
if handles.hardbutton.Value == true
    handles.hardbutton.Value = false;
end

reset(hObject,handles)

% Hint: get(hObject,'Value') returns toggle state of easybutton


% --- Executes on button press in mediumbutton.
function mediumbutton_Callback(hObject, eventdata, handles)
% hObject    handle to mediumbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp(get(handles.timer, 'Running'), 'on')
    stop(handles.timer)
end

if handles.easybutton.Value == true
    handles.easybutton.Value = false;
end

if handles.hardbutton.Value == true
    handles.hardbutton.Value = false;
end


reset(hObject,handles)



% Hint: get(hObject,'Value') returns toggle state of mediumbutton

% --- Executes on button press in hardbutton.
function hardbutton_Callback(hObject, eventdata, handles)
% hObject    handle to hardbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp(get(handles.timer, 'Running'), 'on')
    stop(handles.timer)
end
if handles.mediumbutton.Value == true
    handles.mediumbutton.Value = false;
end
if handles.easybutton.Value == true
    handles.easybutton.Value = false;
end

reset(hObject,handles)




% Hint: get(hObject,'Value') returns toggle state of hardbutton

% --- Executes on mouse motion over figure - except title and menu.
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% if strcmp(get(handles.timer, 'Running'), 'on')
handles.cursor = get (gca, 'CurrentPoint');
guidata(hObject,handles)

% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
IsMouseDown(hObject,handles)


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonUpFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
IsMouseUp(hObject,handles)



function update_function(obj, event, hfigure)
update_position(hfigure)
update_display(hfigure)


function update_display(hfigure)
handles = guidata(hfigure);

for i = 1:length(handles.apples.h)
    x = handles.apples.positions(i,1);
    y = handles.apples.positions(i,2);
    handles.apples.h(i).XData = x;
    handles.apples.h(i).YData = y;
end

handles.gun.h.XData = handles.gun.position(1,1);
handles.gun.h.YData = handles.gun.position(1,2);



if isempty(handles.bullets.positions) == 0
    handles.bullets.h.XData = handles.bullets.positions(:,1);
    handles.bullets.h.YData = handles.bullets.positions(:,2);
end

guidata(hfigure, handles);



function update_position(hfigure)
handles = guidata(hfigure);
global A
handles.apples.SP = reshape(A(end,:,:),length(A),2); % Original Starting Positions of Apples

if handles.easybutton.Value == true
    handles.mode = 'E';
elseif handles.mediumbutton.Value == true
    handles.mode = 'M';
elseif handles.hardbutton.Value == true
    handles.mode = 'H';
end

if handles.mode == 'E'
    for i = 1:length(handles.apples.positions)
        if handles.apples.positions(i,2) > 0 && handles.apples.state(i) == 0
            r = handles.apples.positions(i,:);
            v = handles.apples.velocity(i,:);
            t = handles.delta_t;
            r = r + v * t;
            handles.apples.positions(i,:) = r(:);
        elseif handles.apples.positions(i,2) <= 0 && handles.apples.state(i) == 0 && handles.apples.GC(i) < 2
            handles.apples.positions(i,:) = handles.apples.SP(i,:);
            handles.apples.GC(i) = handles.apples.GC(i)+1;
        elseif handles.apples.positions(i,2) <= 0 && handles.apples.state(i) == 0 && handles.apples.GC(i) == 2
            handles.apples.positions(i,:) = handles.apples.SP(i,:);
        end
    end
end

if handles.mode == 'M'
    for i = 1:length(handles.apples.positions)
        if handles.apples.positions(i,2) > 0 && handles.apples.state(i) == 0
            r = handles.apples.positions(i,:);
            v = handles.apples.velocity(i,:);
            t = handles.delta_t;
            r = r + v * t;
            handles.apples.positions(i,:) = r(:);
        elseif handles.apples.positions(i,2) <= 0 && handles.apples.state(i) == 0 && handles.apples.GC(i) < 3
            handles.apples.positions(i,:) = handles.apples.SP(i,:);
            handles.apples.GC(i) = handles.apples.GC(i)+1;
        elseif handles.apples.positions(i,2) <= 0 && handles.apples.state(i) == 0 && handles.apples.GC(i) == 3
            handles.apples.positions(i,:) = handles.apples.SP(i,:);
        end
    end
end

if handles.mode == 'H'
    for i = 1:length(handles.apples.positions)
        if handles.apples.positions(i,2) > 0 && handles.apples.state(i) == 0
            r = handles.apples.positions(i,:);
            v = handles.apples.velocity(i,:);
            t = handles.delta_t;
            r = r + v * t;
            handles.apples.positions(i,:) = r(:);
        elseif handles.apples.positions(i,2) <= 0 && handles.apples.state(i) == 0 && handles.apples.GC(i) < 4
            handles.apples.positions(i,:) = handles.apples.SP(i,:);
            handles.apples.GC(i) = handles.apples.GC(i)+1;
        elseif handles.apples.positions(i,2) <= 0 && handles.apples.state(i) == 0 && handles.apples.GC(i) == 4
            handles.apples.positions(i,:) = handles.apples.SP(i,:);
        end
    end
end

for i = 1:length(handles.apples.positions)
    handles.alive_apples = handles.apples.state == 0;
    handles.hit_apples = handles.apples.state == 2;
end

handles.gun.position = [handles.cursor(1,1),.05];

if handles.bullets.timer > 0
    handles.bullets.timer = mod(handles.bullets.timer+1,10);
elseif handles.mouseDown
    handles.bullets.positions = [handles.bullets.positions; handles.gun.position];
    handles.bullets.timer = handles.bullets.timer + 1;
end

handles.bullets.count = size(handles.bullets.positions,1);

if ~isempty(handles.bullets.positions)
    for i = 1:handles.bullets.count
        if handles.bullets.positions(i,2) > 2
            handles.bullets.positions(i,:) = NaN;
        end
    end
end


for i = 1:length(handles.apples.positions)
    for j = 1:handles.bullets.count
        d(i) = abs(sqrt((handles.apples.positions(i,1) - handles.bullets.positions(j,1))^2 +...
            (handles.apples.positions(i,2) - handles.bullets.positions(j,2))^2));
        
        if d(i) <= .05 && handles.apples.GC(i) == 1
            handles.apples.GC(i) = handles.apples.GC(i) - 1;
            handles.bullets.positions(j,:) = NaN;
        elseif d(i) <= .02 && handles.apples.GC(i) == 0
            handles.apples.GC(i) = handles.apples.GC(i) - 1;
            handles.bullets.positions(j,:) = NaN;
        elseif d(i) <= .08 && handles.apples.GC(i) == 2
            handles.apples.GC(i) = handles.apples.GC(i) - 1;
            handles.bullets.positions(j,:) = NaN;
        elseif d(i) <= .09 && handles.apples.GC(i) == 3
            handles.apples.GC(i) = handles.apples.GC(i) - 1;
            handles.bullets.positions(j,:) = NaN;
        elseif d(i) <= .12 && handles.apples.GC(i) == 4
            handles.apples.GC(i) = handles.apples.GC(i) - 1;
            handles.bullets.positions(j,:) = NaN;
        end
        if handles.apples.GC(i) < 0
            handles.apples.positions(i) = NaN;
            handles.apples.state(i) = 2;
        end
    end
end

if isempty(handles.bullets.positions) == 0
    handles.bullets.positions(:,:) = handles.bullets.positions(:,:) + handles.bullets.velocity * handles.delta_t;
end

for i = 1:length(handles.apples.positions) % Check GC and increase size
    if handles.apples.GC(i) == 2
        handles.apples.h(i).MarkerSize = 30;
    elseif handles.apples.GC(i) == 1
        handles.apples.h(i).MarkerSize = 20;
    elseif handles.apples.GC(i) == 0
        handles.apples.h(i).MarkerSize = 10;
    elseif handles.apples.GC(i) == 3
        handles.apples.h(i).MarkerSize = 40;
    elseif handles.apples.GC(i) == 4
        handles.apples.h(i).MarkerSize = 50;
    end
end

score = handles.timer.TasksExecuted * handles.delta_t;
textLabel = sprintf('Time = %.2f seconds', score);
set(handles.Score, 'String', textLabel);

if handles.apples.state(:) == 2
    end_game(hfigure,handles)
end

guidata(hfigure, handles);

function end_game(hfigure,handles)
% Score
stop(handles.timer)

textLabel = sprintf('');
set(handles.Score, 'String', textLabel);
score = handles.timer.TasksExecuted * handles.delta_t;


handles.scores = csvread('ASscores.csv');
handles.scores = [handles.scores,score];
if score < min(handles.scores)
    highscore = score;
else
    highscore = min(handles.scores);
end
textLabel = sprintf('Nice Shooting!\nTime to shoot all apples = %.2f seconds\n High Score: %.2f', score,highscore);
set(handles.Score, 'String', textLabel);
csvwrite('ASscores.csv',handles.scores)



handles.bullets.positions = [];
handles.bullets.h.XData = NaN;
handles.bullets.h.YData = NaN;
handles.gun.position = [];


guidata(hfigure,handles)


function IsMouseDown(hObject,handles)
handles.mouseDown = true;
guidata(hObject,handles)

function IsMouseUp(hObject,handles)
handles.mouseDown = false;
guidata(hObject,handles)
z
function reset(hObject,handles)
global A
handles.apples.positions = reshape(A(end,:,:),length(A),2);
for i = 1:length(handles.apples.positions)
    handles.apples.h(i).XData = handles.apples.positions(i,1);
    handles.apples.h(i).YData = handles.apples.positions(i,2);
    handles.apples.h(i).Visible = 'on';
    handles.apples.state(i) = 0;
    handles.apples.GC(i) = 1;
end

handles.bullets.positions = [];
handles.bullets.h.XData = NaN;
handles.bullets.h.YData = NaN;
textLabel = sprintf('');
set(handles.Score, 'String', textLabel);

for i = 1:length(handles.apples.positions)
    if handles.apples.GC(i) == 2
        handles.apples.h(i).MarkerSize = 30;
    elseif handles.apples.GC(i) == 1
        handles.apples.h(i).MarkerSize = 20;
    elseif handles.apples.GC(i) == 0
        handles.apples.h(i).MarkerSize = 10;
    elseif handles.apples.GC(i) == 3
        handles.apples.h(i).Markersize = 40;
    end
end

guidata(hObject,handles)
