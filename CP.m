function varargout = CP(varargin)
% CP MATLAB code for CP.fig
%      CP, by itself, creates a new CP or raises the existing
%      singleton*.
%
%      H = CP returns the handle to a new CP or the handle to
%      the existing singleton*.
%
%      CP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CP.M with the given input arguments.
%
%      CP('Property','Value',...) creates a new CP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CP_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CP_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CP

% Last Modified by GUIDE v2.5 28-Nov-2020 21:33:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CP_OpeningFcn, ...
                   'gui_OutputFcn',  @CP_OutputFcn, ...
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


% --- Executes just before CP is made visible.
function CP_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CP (see VARARGIN)

% Choose default command line output for CP
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CP wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CP_OutputFcn(hObject, eventdata, handles) 
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
global a
a=imread('sample_1.jpg')
axes(handles.axes1);
imshow(a);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a
b=histeq(a);
axes(handles.axes2);
imshow(b);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a
AInv = imcomplement(a);
BInv = imreducehaze(AInv, 0.9);
c= imcomplement(BInv);
axes(handles.axes3);
imshow(c);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a
Lab = rgb2lab(a);
LInv = imcomplement(Lab(:,:,1) ./ 100);
LEnh = imcomplement(imreducehaze(LInv,0.8));
LabEnh(:,:,1)   = LEnh .* 100;
LabEnh(:,:,2:3) = Lab(:,:,2:3) * 2;
AEnh = lab2rgb(LabEnh);
axes(handles.axes4);
imshow(AEnh);
