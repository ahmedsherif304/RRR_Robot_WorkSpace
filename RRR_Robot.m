function varargout = RRR_Robot(varargin)
% RRR_ROBOT MATLAB code for RRR_Robot.fig
%      RRR_ROBOT, by itself, creates a new RRR_ROBOT or raises the existing
%      singleton*.
%
%      H = RRR_ROBOT returns the handle to a new RRR_ROBOT or the handle to
%      the existing singleton*.
%
%      RRR_ROBOT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RRR_ROBOT.M with the given input arguments.
%
%      RRR_ROBOT('Property','Value',...) creates a new RRR_ROBOT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RRR_Robot_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RRR_Robot_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RRR_Robot

% Last Modified by GUIDE v2.5 19-Mar-2019 01:09:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RRR_Robot_OpeningFcn, ...
                   'gui_OutputFcn',  @RRR_Robot_OutputFcn, ...
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


% --- Executes just before RRR_Robot is made visible.
function RRR_Robot_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RRR_Robot (see VARARGIN)

% Choose default command line output for RRR_Robot
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RRR_Robot wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RRR_Robot_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
