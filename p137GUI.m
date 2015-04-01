function varargout = p137GUI(varargin)
% P137GUI MATLAB code for p137GUI.fig
%      P137GUI, by itself, creates a new P137GUI or raises the existing
%      singleton*.
%
%      H = P137GUI returns the handle to a new P137GUI or the handle to
%      the existing singleton*.
%
%      P137GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in P137GUI.M with the given input arguments.
%
%      P137GUI('Property','Value',...) creates a new P137GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before p137GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to p137GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help p137GUI

% Last Modified by GUIDE v2.5 31-Mar-2015 21:39:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @p137GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @p137GUI_OutputFcn, ...
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


% --- Executes just before p137GUI is made visible.
function p137GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to p137GUI (see VARARGIN)

% Choose default command line output for p137GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes p137GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = p137GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in Startbutton.
function Startbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Startbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FPS;%Global variable to carry value to Viewcell file
global Totaltime;
FPS=handles.fps;
Totaltime=handles.tt;
Viewcell(FPS,Totaltime);

function UserinputFPS_Callback(hObject, eventdata, handles)
% hObject    handle to UserinputFPS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of UserinputFPS as text
%        str2double(get(hObject,'String')) returns contents of UserinputFPS as a double

fps = str2num(get(hObject,'String'));
if isnan(fps)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

handles.fps=fps;% Save the new fps value from GUI

guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function UserinputFPS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to UserinputFPS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in Resetbutton.
function Resetbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Resetbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.fps,'string',num2str(0));
set(handles.tt,'string',num2str(0));
clc;
clear all;
% Update handles structure
guidata(hObject,handles)

function Totaltime_Callback(hObject, eventdata, handles)
% hObject    handle to Totaltime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Totaltime as text
%        str2double(get(hObject,'String')) returns contents of Totaltime as a double
tt = str2num(get(hObject,'String'));
if isnan(tt)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

handles.tt=tt;% Save the new totaltime value
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function Totaltime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Totaltime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
