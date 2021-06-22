function varargout = asteroids_20171101(varargin)
% ASTEROIDS_20171101 MATLAB code for asteroids_20171101.fig
%      ASTEROIDS_20171101, by itself, creates a new ASTEROIDS_20171101 or raises the existing
%      singleton*.
%
%      H = ASTEROIDS_20171101 returns the handle to a new ASTEROIDS_20171101 or the handle to
%      the existing singleton*.
%
%      ASTEROIDS_20171101('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASTEROIDS_20171101.M with the given input arguments.
%
%      ASTEROIDS_20171101('Property','Value',...) creates a new ASTEROIDS_20171101 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before asteroids_20171101_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to asteroids_20171101_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help asteroids_20171101

% Last Modified by GUIDE v2.5 07-Nov-2017 14:07:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @asteroids_20171101_OpeningFcn, ...
                   'gui_OutputFcn',  @asteroids_20171101_OutputFcn, ...
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


% --- Executes just before asteroids_20171101 is made visible.
function asteroids_20171101_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to asteroids_20171101 (see VARARGIN)

% Choose default command line output for asteroids_20171101
handles.output = hObject;

% initialize ship
handles.ship.position = [0, 0];
handles.ship.angle = 90;

% Initialize Asteroids
num_asteroids = 10;
handles.asteroid.position = randi([-5,5],num_asteroids,2);
handles.asteroid.angle = randi([0,360],num_asteroids,2);

% Initialize Bullets
handles.bullets.position = [];
handles.bullets.velocity = [];
handles.bullets.angle = [];

% draw ship and asteroids
hold on;
handles.ship.h = plot(handles.axes1, 0, 0, '*');
handles.asteroid.p = plot(handles.axes1, handles.asteroid.position(:,1), handles.asteroid.position(:,2), 'o');
handles.bullets.h = plot(handles.axes1, [], [],'.');
x1 = handles.ship.position(1);
y1 = handles.ship.position(2);
x2 = cosd(handles.ship.angle) + x1;
y2 = sind(handles.ship.angle) + y1;
handles.ship.nose = plot(handles.axes1, [x1, x2], [y1, y2], '-');
axis square
hold off;

xlim(handles.axes1, [-5, 5])
ylim(handles.axes1, [-5, 5])

% Initialize Velocity and Acceleration
handles.ship.v = [0,0];
handles.ship.a = [0,0];

%Initialize Velocity
handles.asteroid.velocity = [cosd(handles.asteroid.angle(:,1)),sind(handles.asteroid.angle(:,2))];

%initialize time
handles.ship.delta_t = 0.1;

%update position and display
handles.timer = timer('ExecutionMode', 'fixedRate','Period', handles.ship.delta_t,...
    'TimerFcn', {@update_function, hObject});

% Update handles structure
guidata(hObject, handles);





% UIWAIT makes asteroids_20171101 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = asteroids_20171101_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_left.
function pushbutton_left_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
move_left(hObject, handles)

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
move_right(hObject, handles)

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
acceleration_up(hObject,handles)

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp(get(handles.timer, 'Running'), 'off')
disp('starting timer')
start(handles.timer);
end

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp(get(handles.timer, 'Running'), 'on')
disp('stopping timer')
stop(handles.timer);
end

% --- Executes on key press with focus on figure1 and none of its controls.
function figure1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
disp(eventdata);
if strcmp(eventdata.Key, 'leftarrow')
    move_left(hObject, handles)
elseif strcmp(eventdata.Key, 'rightarrow')
    move_right(hObject, handles)
elseif strcmp(eventdata.Key, 'uparrow')
    acceleration_up(hObject, handles)
elseif strcmp(eventdata.Key, 'downarrow')
    decelerate(hObject, handles)
elseif strcmp(eventdata.Key, 'spacebar')
    shoot_bullet(hObject, handles)
end

function figure1_KeyReleaseFcn(hObject, eventdata, handles)
disp(eventdata);
if strcmp(eventdata.Key, 'uparrow')
    acceleration_down(hObject, handles)
elseif strcmp(eventdata.Key, 'downarrow')
    acceleration_down(hObject, handles)
end

function move_left(hObject, handles)
handles.ship.angle = handles.ship.angle + 10;

% handles.ship.position(1) = handles.ship.position(1) - 1;
% while handles.ship.position(1) < -5
%     handles.ship.position(1) = handles.ship.position(1) + 10;
% end
handles.ship.h.XData = handles.ship.position(1);
x1 = handles.ship.position(1);
y1 = handles.ship.position(2);
x2 = cosd(handles.ship.angle) + x1;
y2 = sind(handles.ship.angle) + y1;
handles.ship.nose.XData = [x1, x2];
handles.ship.nose.YData = [y1, y2];

guidata(hObject, handles);


function move_right(hObject, handles)
handles.ship.angle = handles.ship.angle - 10;
handles.ship.h.XData = handles.ship.position(1);
x1 = handles.ship.position(1);
y1 = handles.ship.position(2);
x2 = cosd(handles.ship.angle) + x1;
y2 = sind(handles.ship.angle) + y1;
handles.ship.nose.XData = [x1, x2];
handles.ship.nose.YData = [y1, y2];

guidata(hObject, handles)

function acceleration_up(hObject, handles)

handles.ship.a(1) = cosd(handles.ship.angle);
handles.ship.a(2) = sind(handles.ship.angle);
 disp(handles.ship.a)
 
guidata(hObject, handles)

function acceleration_down(hObject, handles)

handles.ship.a = [0,0];
disp(handles.ship.a)

guidata(hObject, handles)

function decelerate(hObject, handles)

handles.ship.a(1) = -cosd(handles.ship.angle);
handles.ship.a(2) = -sind(handles.ship.angle);

guidata(hObject, handles)

function shoot_bullet(hObject, handles)

handles.bullets.angle = handles.ship.angle;
handles.bullets.velocity = [2 * cosd(handles.bullets.angle),2 * sind(handles.bullets.angle)];

guidata(hObject, handles)


function update_function(obj,event,hfigure)

update_positions(hfigure);
update_display(hfigure);

function update_display(hfigure)

handles = guidata(hfigure);
x1 = handles.ship.position(1);
x2 = x1 + cosd(handles.ship.angle);
y1 = handles.ship.position(2);
y2 = y1 + sind(handles.ship.angle);
handles.ship.h.XData = [x1];
handles.ship.h.YData = [y1];
handles.ship.nose.XData = [x1,x2];
handles.ship.nose.YData = [y1,y2];

handles.asteroid.p.XData = handles.asteroid.position(:,1);
handles.asteroid.p.YData = handles.asteroid.position(:,2);

guidata(hfigure, handles);

function update_positions(hfigure)
handles = guidata(hfigure);
x = handles.ship.position;
v = handles.ship.v;
a = handles.ship.a;
dt = handles.ship.delta_t;
v = v + a * dt;
x = x + v * dt + 0.5 * a * dt^2;
if x(1) > 5
    x(1) = x(1) - 10;
elseif x(2) > 5
    x(2) = x(2) - 10;
elseif x(1) < -5
    x(1) = x(1) + 10;
elseif x(2) < -5
    x(2) = x(2) + 10;
end
handles.ship.position = [x];
handles.ship.v = [v];

xa = handles.asteroid.position;
va = handles.asteroid.velocity;
[n1,n2] = size(handles.asteroid.position);
handles.asteroid.position = xa + va * dt;

for i = 1:n1
    for j = 1:n2
        if xa(i,j) > 5
            xa(i,j) = xa(i,j) - 10;
        elseif xa(i,j) < -5
            xa(i,j) = xa(i,j) + 10;
        end
    end
end

xb = handles.bullets.position;
vb = handles.bullets.velocity;
handles.asteroid.position = xb + vb * dt;

d = sqrt((x(1) - xa(1))^2 + (x(2) - xa(2))^2);
if d <= 2
    disp('you lose')
    stop(handles.timer)
end

guidata(hfigure, handles);

% function detect_collision
% rs = handles.ship.position;
% ra = handles.asteroid.position;