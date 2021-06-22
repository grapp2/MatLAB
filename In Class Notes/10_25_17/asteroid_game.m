function varargout = asteroid_game(varargin)
% ASTEROID_GAME MATLAB code for asteroid_game.fig
%      ASTEROID_GAME, by itself, creates a new ASTEROID_GAME or raises the existing
%      singleton*.
%
%      H = ASTEROID_GAME returns the handle to a new ASTEROID_GAME or the handle to
%      the existing singleton*.
%
%      ASTEROID_GAME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASTEROID_GAME.M with the given input arguments.
%
%      ASTEROID_GAME('Property','Value',...) creates a new ASTEROID_GAME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before asteroid_game_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to asteroid_game_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help asteroid_game

% Last Modified by GUIDE v2.5 01-Nov-2017 10:23:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @asteroid_game_OpeningFcn, ...
                   'gui_OutputFcn',  @asteroid_game_OutputFcn, ...
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


% --- Executes just before asteroid_game is made visible.
function asteroid_game_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to asteroid_game (see VARARGIN)

% Choose default command line output for asteroid_game
handles.output = hObject;

%initialize state of game

% data structures to store in 'handles'
handles.ship = struct('position',[0,0]);
handles.ship.angle = 90;
%display the game
handles.ship.h = plot(handles.axes1, handles.ship.position(1),handles.ship.position(2), '*');
hold on

x1 = handles.ship.position(1);
y1 = handles.ship.position(2);
x2 = cosd(handles.ship.angle);
y2 = sind(handles.ship.angle);
handles.ship.nose = plot(handles.axes1, [x1,x2],[y1,y2],'-');
hold off
xlim(handles.axes1, [-5, 5])
ylim(handles.axes1, [-5, 5])
% Update handles structure
guidata(hObject, handles);


% UIWAIT makes asteroid_game wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = asteroid_game_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
move_left(hObject, handles);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ship.position(1) = handles.ship.position(1) + 1;
disp(handles.ship.position);
handles.ship.h.XData = handles.ship.position(1);
handles.ship.h.YData = handles.ship.position(2);
guidata(hObject, handles);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ship.position(2) = handles.ship.position(2) + 1;
disp(handles.ship.position);
handles.ship.h.XData = handles.ship.position(1);
handles.ship.h.YData = handles.ship.position(2);
guidata(hObject, handles);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ship.position(2) = handles.ship.position(2) - 1;
disp(handles.ship.position);
handles.ship.h.XData = handles.ship.position(1);
handles.ship.h.YData = handles.ship.position(2);
guidata(hObject, handles);

% --- Executes on key press with focus on figure1 and none of its controls.
function figure1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
greg = 5;
disp(eventdata)
if strcmp(eventdata.Key, 'leftarrow')
    move_left(hObject, handles)
end

function move_left(hObject, handles)
handles.ship.position(1) = handles.ship.position(1) - 1;
if handles.ship.angle  ~= 180
    handles.ship.angle = 180;
end
while handles.ship.position(1) < -5
    handles.ship.position(1) = handles.ship.position(1) + 10;
end
handles.ship.h.XData = handles.ship.position(1);
x1 = handles.ship.position(1);
y1 = handles.ship.position(2);
x2 = cosd(handles.ship.angle) + x1;
y2 = sind(handles.ship.angle) + y1;
handles.ship.nose.XData = [x1, x2];
handles.ship.nose.YData = [y1, y2];
guidata(hObject, handles);