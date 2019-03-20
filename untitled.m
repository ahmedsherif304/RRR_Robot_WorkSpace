function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 20-Mar-2019 03:03:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function h = ang(centre,radius,span,x1,y1,x2,y2)
% ANG
% Plots an angle arc with specified position and circumference.
% Example:
%                 ang([3 2],5,[0 pi/2],'k-')
% Plots an arc with centre (3,2) and radius (5) that represents
% The angle specified from 0 to pi/2, and with the preferred style 'k-'.
% Draws heavily from Zhenhai Wang's circle function on the File Exchange.
%
% Husam Aldahiyat, October, 2008.
theta = linspace(span(1),span(2),100);
rho = ones(1,100) * radius;
[x,y] = pol2cart(theta,rho);
x = x + centre(1);
y = y + centre(2);
h = plot(x,y,'k-');
line([centre(1) x1] ,[centre(2),y1]);
line([centre(1) x2] ,[centre(2),y2]);


function axes()
xlim([-100 100]);
ylim([-100 100]);
xL = xlim;
yL = ylim;
line([0 0], yL,'color','k');  %y-axis
line(xL, [0 0],'color','k');  %x-axis

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
q1_min=str2double(handles.q1min.String)*pi/180;
q1_max=str2double(handles.q1max.String)*pi/180;
q2_min=str2double(handles.q2min.String)*pi/180;
q2_max=str2double(handles.q2max.String)*pi/180;
q3_min=str2double(handles.q3min.String)*pi/180;
q3_max=str2double(handles.q3max.String)*pi/180;
L1=str2double(handles.L1.String);
L2=str2double(handles.L2.String);
L3=str2double(handles.L3.String);

x1min=L1*cos(q1_min);
x1max=L1*cos(q1_max);
x2min1=x1min+L2*cos(q1_min+q2_min);
x2max1=x1min+L2*cos(q1_min+q2_max);
x2min2=x1max+L2*cos(q1_max+q2_min);
x2max2=x1max+L2*cos(q1_max+q2_max);


y1min=L1*sin(q1_min);
y1max=L1*sin(q1_max);
y2min1=y1min+L2*sin(q1_min+q2_min);
y2max1=y1min+L2*sin(q1_min+q2_max);
y2min2=y1max+L2*sin(q1_max+q2_min);
y2max2=y1max+L2*sin(q1_max+q2_max);

hold on
axes();
ang([x1min y1min],L2,[q2_min+q1_min q2_max+q1_min],x2min1,y2min1,x2max1,y2max1);
ang([x1max y1max],L2,[q2_min+q1_max q2_max+q1_max],x2min2 ,y2min2,x2max2,y2max2);

x=[x2min1 x2max2];
y=[y2min1 y2max2];




%ang([0 0],sqrt(x2min1^2+y2min1^2),[q1_min+q2_min q1_max+q2_max],x2min1,y2min1,x2max2,y2max2);
%ang([0 0],sqrt(x2max2^2+y2max2^2),[q1_min+q2_max q1_max+q2_max],x2max1,y2max1,x2max2,y2max2);






% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function L1_Callback(hObject, eventdata, handles)
% hObject    handle to L1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of L1 as text
%        str2double(get(hObject,'String')) returns contents of L1 as a double


% --- Executes during object creation, after setting all properties.
function L1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function L2_Callback(hObject, eventdata, handles)
% hObject    handle to L2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of L2 as text
%        str2double(get(hObject,'String')) returns contents of L2 as a double


% --- Executes during object creation, after setting all properties.
function L2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function L3_Callback(hObject, eventdata, handles)
% hObject    handle to L3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of L3 as text
%        str2double(get(hObject,'String')) returns contents of L3 as a double


% --- Executes during object creation, after setting all properties.
function L3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q1min_Callback(hObject, eventdata, handles)
% hObject    handle to q1min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q1min as text
%        str2double(get(hObject,'String')) returns contents of q1min as a double


% --- Executes during object creation, after setting all properties.
function q1min_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q1min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q1max_Callback(hObject, eventdata, handles)
% hObject    handle to q1max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q1max as text
%        str2double(get(hObject,'String')) returns contents of q1max as a double


% --- Executes during object creation, after setting all properties.
function q1max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q1max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q2min_Callback(hObject, eventdata, handles)
% hObject    handle to q2min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q2min as text
%        str2double(get(hObject,'String')) returns contents of q2min as a double


% --- Executes during object creation, after setting all properties.
function q2min_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q2min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q2max_Callback(hObject, eventdata, handles)
% hObject    handle to q2max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q2max as text
%        str2double(get(hObject,'String')) returns contents of q2max as a double


% --- Executes during object creation, after setting all properties.
function q2max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q2max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q3min_Callback(hObject, eventdata, handles)
% hObject    handle to q3min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q3min as text
%        str2double(get(hObject,'String')) returns contents of q3min as a double


% --- Executes during object creation, after setting all properties.
function q3min_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q3min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q3max_Callback(hObject, eventdata, handles)
% hObject    handle to q3max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q3max as text
%        str2double(get(hObject,'String')) returns contents of q3max as a double


% --- Executes during object creation, after setting all properties.
function q3max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q3max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
