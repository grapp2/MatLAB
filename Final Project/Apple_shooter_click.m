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

% Last Modified by GUIDE v2.5 06-Dec-2017 22:23:19

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
global A
hold on
FraktalT(handles.axes1,4,0.5,[pi/4,-pi/4],[0,0],[0,1])
xlim(handles.axes1, [-1,1])
ylim(handles.axes1, [0,2])
title('Apple Shooter','FontSize',14);

% Initialize Apples Positions and state
% State:
%   0 = initialized and on
%   1 = hit ground
%   2 = killed by player
handles.apples.positions = reshape(A(end,:,:),length(A),2);
for i = 1:length(handles.apples.positions)
    handles.apples.state(i) = 0;
end

%Initialize Apples Velocity
for i = 1:length(handles.apples.positions)
    handles.apples.velocity(i,:) = [0,-.1] * rand() + [0,-.1];
end

% Draw Apples
for i = 1:length(handles.apples.positions)
    handles.apples.h(i) = plot(handles.axes1,handles.apples.positions(i,1), ...
        handles.apples.positions(i,2),'ro', 'MarkerSize', 20);
end

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
global A
handles.apples.positions = reshape(A(end,:,:),length(A),2);

for i = 1:length(handles.apples.positions)
    handles.apples.h(i).XData = handles.apples.positions(i,1);
    handles.apples.h(i).YData = handles.apples.positions(i,2);
    handles.apples.h(i).Visible = 'on';
    handles.apples.state(i) = 0;
end

textLabel = sprintf('');
set(handles.Score, 'String', textLabel);

if strcmp(get(handles.timer, 'Running'), 'on')
    stop(handles.timer)
end

guidata(hObject,handles)

% --- Executes on mouse motion over figure - except title and menu.
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% if strcmp(get(handles.timer, 'Running'), 'on')
handles.cursor = get (gca, 'CurrentPoint');
guidata(hObject,handles)

function figure1_KeyPressFcn(hObject, eventdata, handles)

if strcmp(get(handles.timer, 'Running'), 'on')
    if strcmp(eventdata.Key,'space')
        for i = 1:length(handles.apples.positions)
            d(i) = abs(sqrt((handles.apples.positions(i,1) - handles.cursor(1,1))^2 +...
                (handles.apples.positions(i,2) - handles.cursor(1,2))^2));
            if d(i) <= .07
                handles.apples.state(i) = 2;
                handles.apples.positions(i) = handles.apples.positions(i);
                handles.apples.h(i).Visible = 'off';
            end
        end
    end
end

guidata(hObject,handles)

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

guidata(hfigure, handles);



function update_position(hfigure)
handles = guidata(hfigure);

for i = 1:length(handles.apples.positions)
    if handles.apples.positions(i,2) > 0 && handles.apples.state(i) == 0
        r = handles.apples.positions(i,:);
        v = handles.apples.velocity(i,:);
        t = handles.delta_t;
        r = r + v * t;
        handles.apples.positions(i,:) = r(:);
    elseif handles.apples.positions(i,2) <= 0 && handles.apples.state(i) == 0
        handles.apples.state(i) = 1;
        handles.apples.h(i).Visible = 'off';
    end
end

for i = 1:length(handles.apples.positions)
    handles.alive_apples = handles.apples.state == 0;
    handles.dead_apples = handles.apples.state == 1;
    handles.hit_apples = handles.apples.state == 2;
end

if handles.alive_apples == zeros(1,length(handles.apples.state))
    end_game(handles)
elseif handles.apples.state(:) == 2
    end_game(handles)
end

guidata(hfigure, handles);

function end_game(handles)
% Score
score = sum(handles.hit_apples) / length(handles.apples.state) * 100;
if score < 100
    textLabel = sprintf('You Lose\nScore = %.0f %s', score, '%');
    set(handles.Score, 'String', textLabel);
elseif score == 100
    textLabel = sprintf('Nice Shooting\nScore = %.0f %s', score, '%');
    set(handles.Score, 'String', textLabel);
end

stop(handles.timer)
