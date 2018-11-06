function varargout = homework(varargin)
% HOMEWORK MATLAB code for homework.fig
%      HOMEWORK, by itself, creates a new HOMEWORK or raises the existing
%      singleton*.
%
%      H = HOMEWORK returns the handle to a new HOMEWORK or the handle to
%      the existing singleton*.
%
%      HOMEWORK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HOMEWORK.M with the given input arguments.
%
%      HOMEWORK('Property','Value',...) creates a new HOMEWORK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before homework_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to homework_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help homework

% Last Modified by GUIDE v2.5 17-Aug-2018 04:16:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @homework_OpeningFcn, ...
                   'gui_OutputFcn',  @homework_OutputFcn, ...
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


% --- Executes just before homework is made visible.
function homework_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to homework (see VARARGIN)

% Choose default command line output for homework
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes homework wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = homework_OutputFcn(hObject, eventdata, handles) 
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
global arduino;
IDTEXT = str2double(get(handles.edit1, 'String'));
zTEXT = ['a'; '0'; '0'];
num1 = floor(IDTEXT / 10);
zTEXT(2) = int2str(num1);
num2 = floor(IDTEXT - num1*10);
zTEXT(3) = int2str(num2);
disp(zTEXT);
for i=1:3
fwrite(arduino, zTEXT(i), 'char');
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global arduino;
degreeTEXT = str2double(get(handles.edit2, 'String'));
zTEXT = ['b'; '0'; '0'; '0'; '0'];
num1 = floor(degreeTEXT/1000);
zTEXT(2) = int2str(num1);
num2 = floor((degreeTEXT - num1*1000)/100);
zTEXT(3) = int2str(num2);
num3 = floor((degreeTEXT - num1*1000 - num2*100)/10);
zTEXT(4) = int2str(num3);
num4 = floor(degreeTEXT - num1*1000 - num2*100 - num3*10);
zTEXT(5) = int2str(num4);

for i=1:5
    fwrite(arduino, zTEXT(i), 'char');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global arduino;
freqTEXT = str2double(get(handles.edit3, 'String'));
zTEXT = ['c'; '0'; '0'; '0'; '0'];
num1 = floor(freqTEXT/1000);
zTEXT(2) = int2str(num1);
num2 = floor((freqTEXT - num1*1000)/100);
zTEXT(3) = int2str(num2);
num3 = floor((freqTEXT - num1*1000 - num2*100)/10);
zTEXT(4) = int2str(num3);
num4 = floor(freqTEXT - num1*1000 - num2*100 - num3*10);
zTEXT(5) = int2str(num4);
for i=1:5
    fwrite(arduino, zTEXT(i), 'char');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global arduino;
zTEXT = ['a'; '0'; '0'; 'b'; '0'; '0'; '0'; '0'; 'c'; '0'; '0'; '0'; '0'];

IDTEXT = str2double(get(handles.edit1, 'String'));
num1 = floor(IDTEXT / 10);
zTEXT(2) = int2str(num1);
num2 = floor(IDTEXT - num1*10);
zTEXT(3) = int2str(num2);

degreeTEXT = str2double(get(handles.edit2, 'String'));
num3 = floor(degreeTEXT/1000);
zTEXT(5) = int2str(num3);
num4 = floor((degreeTEXT - num3*1000)/100);
zTEXT(6) = int2str(num4);
num5 = floor((degreeTEXT - num3*1000 - num4*100)/10);
zTEXT(7) = int2str(num5);
num6 = floor(degreeTEXT - num3*1000 - num4*100 - num5*10);
zTEXT(8) = int2str(num6);

freqTEXT = str2double(get(handles.edit3, 'String'));
num7 = floor(freqTEXT/1000);
zTEXT(10) = int2str(num7);
num8 = floor((freqTEXT - num7*1000)/100);
zTEXT(11) = int2str(num8);
num9 = floor((freqTEXT - num7*1000 - num8*100)/10);
zTEXT(12) = int2str(num9);
num10 = floor(freqTEXT - num7*1000 - num8*100 - num9*10);
zTEXT(13) = int2str(num10);
for i=1:13
    fwrite(arduino, zTEXT(i), 'char');
end


% --- Executes on button press in pushbutton5.
% Start button
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(instrfindall);     % 통신 포트 초기화
global arduino;

arduino = serial('COM3', 'BaudRate', 1000000); 
grid on;        % 그리드를 켠다
grid minor;     % 세부 그리드를 켠다
hold on;        % 그리드 고정
fopen(arduino); 
time = 0;       % 그래프의 X성분

global time;

global h2

double Bdegree1;    % 모터 값 저장할 변수

Bdegree1 = 0;

h2 = plot(handles.axes1, time, Bdegree1, 'o', 'MarkerSize', 5, 'MarkerFaceColor', 'b');

xlim([time-300 time+300]);  % x의 범위는 -300 ~ +300 까지
ylim([0 360]);

curve1 = animatedline('color', 'g');    % 애니메이션 라인 생성
set(gca, 'XLim', xlim, 'YLim', ylim);
hold on

while 1
    time = time + 1;
    Bdegree1 = str2num(fscanf(arduino));
    xlim([time-300 time+300]);
    set(h2, 'XData', time, 'YData', Bdegree1);
    hold on
    
    addpoints(curve1, time, Bdegree1);  % 라인 그리기
    drawnow;    % 그린 거 업데이트
end



% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global arduino;
fclose(arduino);
