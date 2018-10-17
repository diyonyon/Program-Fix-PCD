function varargout = tubespcdfix(varargin)
% TUBESPCDFIX MATLAB code for tubespcdfix.fig
%      TUBESPCDFIX, by itself, creates a new TUBESPCDFIX or raises the existing
%      singleton*.
%
%      H = TUBESPCDFIX returns the handle to a new TUBESPCDFIX or the handle to
%      the existing singleton*.
%
%      TUBESPCDFIX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUBESPCDFIX.M with the given input arguments.
%
%      TUBESPCDFIX('Property','Value',...) creates a new TUBESPCDFIX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tubespcdfix_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tubespcdfix_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tubespcdfix

% Last Modified by GUIDE v2.5 10-May-2016 02:34:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tubespcdfix_OpeningFcn, ...
                   'gui_OutputFcn',  @tubespcdfix_OutputFcn, ...
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


% --- Executes just before tubespcdfix is made visible.
function tubespcdfix_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tubespcdfix (see VARARGIN)

% Choose default command line output for tubespcdfix
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
movegui(hObject,'center');
clc;clear;

% UIWAIT makes tubespcdfix wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tubespcdfix_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile({'*.*'});

if ~isequal(filename,0)
    Info = imfinfo(fullfile(pathname,filename));
    if Info.BitDepth == 24
        Img = imread(fullfile(pathname,filename));
        axes(handles.axes6)
        cla('reset')
        imshow(Img)
        title('RGB Image')
    else
        msgbox('Citra masukan harus citra RGB');
        return
    end
else
    return
end

handles.Img = Img;
guidata(hObject,handles);

set(handles.radiobutton1,'Enable','on')
set(handles.radiobutton2,'Enable','on')
set(handles.radiobutton3,'Enable','on')



% --- Executes on button press in radiobutton1.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
set(handles.radiobutton1,'Value',0)
set(handles.radiobutton2,'Value',0)
set(handles.radiobutton3,'Value',0)
set(handles.radiobutton4,'Value',1)
set(handles.radiobutton5,'Value',0)
set(handles.radiobutton6,'Value',0)
set(handles.slider1,'Value',0)
set(handles.edit1,'String',0)
set(handles.popupmenu1,'Enable','off')

Img = handles.Img;
R = Img(:,:,1);
G = Img(:,:,2);
B = Img(:,:,3);
Red_Channel = cat(3,R,G*0,B*0);
axes(handles.axes6)
cla('reset')
imshow(Red_Channel)
title('Red Channel')


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
set(handles.radiobutton1,'Value',0)
set(handles.radiobutton2,'Value',1)
set(handles.radiobutton3,'Value',0)
set(handles.radiobutton4,'Value',0)
set(handles.radiobutton5,'Value',0)
set(handles.radiobutton6,'Value',0)
set(handles.slider1,'Value',0)
set(handles.edit1,'String',0)
set(handles.popupmenu1,'Enable','off')

Img = handles.Img;
R = Img(:,:,1);
G = Img(:,:,2);
B = Img(:,:,3);
Green_Channel = cat(3,R*0,G,B*0);
axes(handles.axes1)
cla('reset')
imshow(Green_Channel)
title('Green Channel')
axes(handles.axes2)
cla('reset')
h = histogram(G(:));
h.FaceColor = [0 1 0];
xlim([0 255])
grid on
title('Histogram')


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
