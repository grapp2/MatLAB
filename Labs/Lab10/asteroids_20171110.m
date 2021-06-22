function varargout = asteroids_20171110(varargin)
% ASTEROIDS_20171110 MATLAB code for asteroids_20171110.fig
%      ASTEROIDS_20171110, by itself, creates a new ASTEROIDS_20171110 or raises the existing
%      singleton*.
%
%      H = ASTEROIDS_20171110 returns the handle to a new ASTEROIDS_20171110 or the handle to
%      the existing singleton*.
%
%      ASTEROIDS_20171110('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASTEROIDS_20171110.M with the given input arguments.
%
%      ASTEROIDS_20171110('Property','Value',...) creates a new ASTEROIDS_20171110 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before asteroids_20171110_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to asteroids_20171110_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help asteroids_20171110

% Last Modified by GUIDE v2.5 10-Nov-2017 10:55:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @asteroids_20171110_OpeningFcn, ...
                   'gui_OutputFcn',  @asteroids_20171110_OutputFcn, ...
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


% --- Executes just before asteroids_20171110 is made visible.
function asteroids_20171110_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to asteroids_20171110 (see VARARGIN)

% Choose default command line output for asteroids_20171110
handles.output = hObject;

% initialize ship
handles.ship.position = [0, 0];
handles.ship.velocity = [0, 0];
handles.ship.acceleration = [0, 0];
handles.ship.angle = 90;

% initialize asteroids
num_asteroids = 10;
handles.asteroids.positions = rand(num_asteroids, 2) * 10 - 5;
handles.asteroids.angles = rand(num_asteroids, 1) * 360;
handles.asteroids.velocity = [cosd(handles.asteroids.angles), ...
                              sind(handles.asteroids.angles)];
                          
% initialize bullets
handles.bullets.positions = [];
handles.bullets.velocity = [];
handles.bullets.angle = [];

% timer related
handles.delta_t = 0.1;
handles.timer = timer('ExecutionMode', 'fixedRate', 'Period', handles.delta_t, ...
    'TimerFcn', {@update_function, hObject});

% draw ship
handles.ship.h = plot(handles.axes1, 0, 0, '*');
hold on;
x1 = handles.ship.position(1);
y1 = handles.ship.position(2);
x2 = cosd(handles.ship.angle) + x1;
y2 = sind(handles.ship.angle) + y1;
handles.ship.nose = plot(handles.axes1, [x1, x2], [y1, y2], '-');

% plot asteroids
x1 = handles.asteroids.positions(:, 1);
y1 = handles.asteroids.positions(:, 2);
handles.asteroids.h = plot(handles.axes1, x1, y1, 'o', 'MarkerSize', 20);

axis square
hold on

xlim(handles.axes1, [-5, 5])
ylim(handles.axes1, [-5, 5])

% draw bullets
x1 = [];
y1 = [];
handles.bullets.h = plot(handles.axes1,x1,y1,'.');
hold off


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes asteroids_20171110 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = asteroids_20171110_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on key press with focus on figure1 and none of its controls.
function figure1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
if strcmp(eventdata.Key, 'leftarrow')
    handles.ship.angle = handles.ship.angle + 10;
elseif strcmp(eventdata.Key, 'rightarrow')
    handles.ship.angle = handles.ship.angle - 10;
elseif strcmp(eventdata.Key, 'uparrow')
    a = handles.ship.angle;
    accel = [cosd(a), sind(a)];
    handles.ship.acceleration = accel;
elseif strcmp(eventdata.Key, 'downarrow')
    handles.ship.acceleration(1) = -cosd(handles.ship.angle);
    handles.ship.acceleration(2) = -sind(handles.ship.angle);
elseif strcmp(eventdata.Key, 'space')
    handles.bullets.angle = handles.ship.angle;
    handles.bullets.positions = handles.ship.position;
    handles.bullets.velocity = [2*cosd(handles.asteroids.angle),2*sind(handles.asteroids.angle)];
elseif strcmp(eventdata.Key, 't')
    handles.ship.position = [randi([-4,4]),randi([-4,4])];
end
fprintf('angle = %f\n', handles.ship.angle);
fprintf('accel = %s\n', num2str(handles.ship.acceleration));

guidata(hObject, handles)


% --- Executes on key release with focus on figure1 and none of its controls.
function figure1_KeyReleaseFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was released, in lower case
%	Character: character interpretation of the key(s) that was released
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) released
% handles    structure with handles and user data (see GUIDATA)
if strcmp(eventdata.Key, 'uparrow')
    handles.ship.acceleration = [0, 0];
elseif strcmp(eventdata.Key, 'downarrow')
    handles.ship.acceleration = [0, 0];
end
guidata(hObject, handles);

function update_function(obj, event, hfigure)
update_positions(hfigure);
update_display(hfigure);


% --- Executes on button press in start_button.
function start_button_Callback(hObject, eventdata, handles)
% hObject    handle to start_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp(get(handles.timer, 'Running'), 'off')
    disp('Starting timer');
    start(handles.timer)
end


% --- Executes on button press in stop_button.
function stop_button_Callback(hObject, eventdata, handles)
% hObject    handle to stop_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp(get(handles.timer, 'Running'), 'on')
    disp('Stopping timer');
    stop(handles.timer)
end

function update_display(hfigure)
handles = guidata(hfigure);
x1 = handles.ship.position(1);
y1 = handles.ship.position(2);
x2 = cosd(handles.ship.angle) + x1;
y2 = sind(handles.ship.angle) + y1;
handles.ship.h.XData = x1;
handles.ship.h.YData = y1;
handles.ship.nose.XData = [x1, x2];
handles.ship.nose.YData = [y1, y2];

x1 = handles.asteroids.positions(:, 1);
y1 = handles.asteroids.positions(:, 2);
handles.asteroids.h.XData = x1;
handles.asteroids.h.YData = y1;

% x1 = handles.bullets.positions(:,1);
% y1 = handles.bullets.positions(:,2);
% handles.bullets.h.XData = x1;
% handles.bullets.h.YData = y1;

guidata(hfigure, handles);


function update_positions(hfigure)
handles = guidata(hfigure);
x = handles.ship.position;
v = handles.ship.velocity;
a = handles.ship.acceleration;
dt = handles.delta_t;
x = x + v*dt + 0.5*a*dt^2;
x = mod(x + 5, 10) - 5;
v = v + a*dt;
handles.ship.position = x;
handles.ship.velocity = v;

x = handles.asteroids.positions;
v = handles.asteroids.velocity;
x = x + dt * v;
x = mod(x + 5, 10) - 5;
handles.asteroids.positions = x;

x = handles.bullets.positions;
v = handles.bullets.velocity;
x = x + dt * v;
handles.bullets.positions = x;

d = sqrt((handles.asteroids.positions(:,1) - handles.ship.position(1)).^2 + ...
(handles.asteroids.positions(:,2) - handles.ship.position(2)).^2);
for i = 1:length(d)
    if d(i) <= .3
        disp('You Lose')
        stop(handles.timer)
    end
end

guidata(hfigure, handles);

