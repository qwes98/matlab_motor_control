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

% Last Modified by GUIDE v2.5 27-Dec-2018 16:25:46

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
zTEXT = ['y';'a'; '0'; '0'; 'b'; '0'; '0'; '0'; '0'; 'c'; '0'; '0'; '0'; '0'; 'd'; '0'; '0'; 'e'; '0'; '0'; '0'; '0'; 'f'; '0'; '0'; '0'; '0'; 'm'; '0'; 'z'];

IDTEXT = str2double(get(handles.edit1, 'String'));
num1 = floor(IDTEXT / 10);
zTEXT(3) = int2str(num1);
num2 = floor(IDTEXT - num1*10);
zTEXT(4) = int2str(num2);

degreeTEXT = str2double(get(handles.edit2, 'String'));
degreeTEXT = degreeTEXT*(1024/90.0) + 1024;
num3 = floor(degreeTEXT/1000);
zTEXT(6) = int2str(num3);
num4 = floor((degreeTEXT - num3*1000)/100);
zTEXT(7) = int2str(num4);
num5 = floor((degreeTEXT - num3*1000 - num4*100)/10);
zTEXT(8) = int2str(num5);
num6 = floor(degreeTEXT - num3*1000 - num4*100 - num5*10);
zTEXT(9) = int2str(num6);

freqTEXT = str2double(get(handles.edit3, 'String'));
num7 = floor(freqTEXT/1000);
zTEXT(11) = int2str(num7);
num8 = floor((freqTEXT - num7*1000)/100);
zTEXT(12) = int2str(num8);
num9 = floor((freqTEXT - num7*1000 - num8*100)/10);
zTEXT(13) = int2str(num9);
num10 = floor(freqTEXT - num7*1000 - num8*100 - num9*10);
zTEXT(14) = int2str(num10);

IDTEXT2 = str2double(get(handles.edit4, 'String'));
num11 = floor(IDTEXT2 / 10);
zTEXT(16) = int2str(num11);
num12 = floor(IDTEXT2 - num11*10);
zTEXT(17) = int2str(num12);

degreeTEXT2 = str2double(get(handles.edit5, 'String'));
degreeTEXT2 = degreeTEXT2*(1024/90.0) + 2048;
num13 = floor(degreeTEXT2/1000);
zTEXT(19) = int2str(num13);
num14 = floor((degreeTEXT2 - num13*1000)/100);
zTEXT(20) = int2str(num14);
num15 = floor((degreeTEXT2 - num13*1000 - num14*100)/10);
zTEXT(21) = int2str(num15);
num16 = floor(degreeTEXT2 - num13*1000 - num14*100 - num15*10);
zTEXT(22) = int2str(num16);

freqTEXT2 = str2double(get(handles.edit6, 'String'));
num17 = floor(freqTEXT2/1000);
zTEXT(24) = int2str(num17);
num18 = floor((freqTEXT2 - num17*1000)/100);
zTEXT(25) = int2str(num18);
num19 = floor((freqTEXT2 - num17*1000 - num18*100)/10);
zTEXT(26) = int2str(num19);
num20 = floor(freqTEXT2 - num17*1000 - num18*100 - num19*10);
zTEXT(27) = int2str(num20);

for i=1:30
    fwrite(arduino, zTEXT(i), 'char');
    disp(zTEXT(i));
end

global h2
global h4
global time

double Bdegree1;
double Bdegree2;

Bdegree1 = 0;
Bdegree2 = 0;

x1 = 0;
y1 = 0;

L1 = 15;
L2 = 15;

h2 = plot(handles.axes1, x1, y1, 'o', 'MarkerSize', 5, 'MarkerFaceColor', 'b');

xlim([-50 50]);  % x의 범위는 -300 ~ +300 까지
ylim([-50 50]);

curve1 = animatedline('color', 'g');
set(gca, 'XLim', xlim, 'YLim', ylim);
hold on

flushinput(arduino)     % 버퍼 비우는 명령어. 그래프 값 딜레이를 없애줌

while 1
    time = time + 1;
    Bdegree1 = str2num(fscanf(arduino));
    Bdegree1 = (Bdegree1 - 90) * pi / 180;
    %disp(Bdegree1)
    Bdegree2 = str2num(fscanf(arduino));
    Bdegree2 = (Bdegree2 - 180) * pi / 180;
    
    x1 = L1 * cos(Bdegree1) + L2 * cos(Bdegree1 + Bdegree2);
    y1 = L1 * sin(Bdegree1) + L2 * sin(Bdegree1 + Bdegree2);
    xlim([-50 50]);
    set(h2, 'XData', x1, 'YData', y1);
    hold on
    
    addpoints(curve1, x1, y1);
    drawnow;
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(instrfindall);
global arduino;
global time;
arduino = serial('COM3', 'BaudRate', 1000000); 
grid on
grid minor
hold on
fopen(arduino);
time = 0;





% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global arduino;
fclose(arduino);



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global arduino;
zTEXT = ['y';'a'; '0'; '0'; 'b'; '0'; '0'; '0'; '0'; 'c'; '0'; '0'; '0'; '0'; 'd'; '0'; '0'; 'e'; '0'; '0'; '0'; '0'; 'f'; '0'; '0'; '0'; '0'; 'm'; '1'; 'z'];

IDTEXT = str2double(get(handles.edit1, 'String'));
num1 = floor(IDTEXT / 10);
zTEXT(3) = int2str(num1);
num2 = floor(IDTEXT - num1*10);
zTEXT(4) = int2str(num2);

degreeTEXT = str2double(get(handles.edit2, 'String'));
degreeTEXT = degreeTEXT*(1024/90.0) + 1024;
num3 = floor(degreeTEXT/1000);
zTEXT(6) = int2str(num3);
num4 = floor((degreeTEXT - num3*1000)/100);
zTEXT(7) = int2str(num4);
num5 = floor((degreeTEXT - num3*1000 - num4*100)/10);
zTEXT(8) = int2str(num5);
num6 = floor(degreeTEXT - num3*1000 - num4*100 - num5*10);
zTEXT(9) = int2str(num6);

freqTEXT = str2double(get(handles.edit3, 'String'));
num7 = floor(freqTEXT/1000);
zTEXT(11) = int2str(num7);
num8 = floor((freqTEXT - num7*1000)/100);
zTEXT(12) = int2str(num8);
num9 = floor((freqTEXT - num7*1000 - num8*100)/10);
zTEXT(13) = int2str(num9);
num10 = floor(freqTEXT - num7*1000 - num8*100 - num9*10);
zTEXT(14) = int2str(num10);

IDTEXT2 = str2double(get(handles.edit4, 'String'));
num11 = floor(IDTEXT2 / 10);
zTEXT(16) = int2str(num11);
num12 = floor(IDTEXT2 - num11*10);
zTEXT(17) = int2str(num12);

degreeTEXT2 = str2double(get(handles.edit5, 'String'));
degreeTEXT2 = degreeTEXT2*(1024/90.0) + 2048;
num13 = floor(degreeTEXT2/1000);
zTEXT(19) = int2str(num13);
num14 = floor((degreeTEXT2 - num13*1000)/100);
zTEXT(20) = int2str(num14);
num15 = floor((degreeTEXT2 - num13*1000 - num14*100)/10);
zTEXT(21) = int2str(num15);
num16 = floor(degreeTEXT2 - num13*1000 - num14*100 - num15*10);
zTEXT(22) = int2str(num16);

freqTEXT2 = str2double(get(handles.edit6, 'String'));
num17 = floor(freqTEXT2/1000);
zTEXT(24) = int2str(num17);
num18 = floor((freqTEXT2 - num17*1000)/100);
zTEXT(25) = int2str(num18);
num19 = floor((freqTEXT2 - num17*1000 - num18*100)/10);
zTEXT(26) = int2str(num19);
num20 = floor(freqTEXT2 - num17*1000 - num18*100 - num19*10);
zTEXT(27) = int2str(num20);

for i=1:30
    fwrite(arduino, zTEXT(i), 'char');
    disp(zTEXT(i));
end


global h2
global h4
global time

double Bdegree1;
double Bdegree2;

Bdegree1 = 0;
Bdegree2 = 0;

x1 = 0;
y1 = 0;

L1 = 15;
L2 = 15;

h2 = plot(handles.axes1, x1, y1, 'o', 'MarkerSize', 5, 'MarkerFaceColor', 'b');

xlim([-50 50]);  % x의 범위는 -300 ~ +300 까지
ylim([-50 50]);

curve1 = animatedline('color', 'g');
set(gca, 'XLim', xlim, 'YLim', ylim);
hold on

flushinput(arduino)     % 버퍼 비우는 명령어. 그래프 값 딜레이를 없애줌

while 1
    time = time + 1;
    Bdegree1 = str2num(fscanf(arduino));
    Bdegree1 = (Bdegree1 - 90) * pi / 180;
    %disp(Bdegree1)
    Bdegree2 = str2num(fscanf(arduino));
    Bdegree2 = (Bdegree2 - 180) * pi / 180;
    
    x1 = L1 * cos(Bdegree1) + L2 * cos(Bdegree1 + Bdegree2);
    y1 = L1 * sin(Bdegree1) + L2 * sin(Bdegree1 + Bdegree2);
    xlim([-50 50]);
    set(h2, 'XData', x1, 'YData', y1);
    hold on
    
    addpoints(curve1, x1, y1);
    drawnow;
end






% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global arduino;
zTEXT = ['y';'m'; '2'; 'z'];

for i=1:4
    fwrite(arduino, zTEXT(i), 'char');
    disp(zTEXT(i));
end


global h2
global h4
global time

double Bdegree1;
double Bdegree2;

Bdegree1 = 0;
Bdegree2 = 0;

x1 = 0;
y1 = 0;

L1 = 15;
L2 = 15;

h2 = plot(handles.axes1, x1, y1, 'o', 'MarkerSize', 5, 'MarkerFaceColor', 'b');

xlim([-50 50]);  % x의 범위는 -300 ~ +300 까지
ylim([-50 50]);

curve1 = animatedline('color', 'g');
set(gca, 'XLim', xlim, 'YLim', ylim);
hold on

flushinput(arduino)     % 버퍼 비우는 명령어. 그래프 값 딜레이를 없애줌

while 1
    time = time + 1;
    Bdegree1 = str2num(fscanf(arduino));
    Bdegree1 = (Bdegree1 - 90) * pi / 180;
    %disp(Bdegree1)
    Bdegree2 = str2num(fscanf(arduino));
    Bdegree2 = (Bdegree2 - 180) * pi / 180;
    
    x1 = L1 * cos(Bdegree1) + L2 * cos(Bdegree1 + Bdegree2);
    y1 = L1 * sin(Bdegree1) + L2 * sin(Bdegree1 + Bdegree2);
    xlim([-50 50]);
    set(h2, 'XData', x1, 'YData', y1);
    hold on
    
    addpoints(curve1, x1, y1);
    drawnow;
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global arduino;

disp("called");

L1 = 15;
L2 = 15;

zTEXT = ['y';'a'; '0'; '0'; 'b'; '0'; '0'; '0'; '0'; 'c'; '0'; '0'; '0'; '0'; 'd'; '0'; '0'; 'e'; '0'; '0'; '0'; '0'; 'f'; '0'; '0'; '0'; '0'; 'm'; '0'; 'z'];

IDTEXT = str2double(get(handles.edit1, 'String'));
num1 = floor(IDTEXT / 10);
zTEXT(3) = int2str(num1);
num2 = floor(IDTEXT - num1*10);
zTEXT(4) = int2str(num2);

IDTEXT2 = str2double(get(handles.edit4, 'String'));
num11 = floor(IDTEXT2 / 10);
zTEXT(16) = int2str(num11);
num12 = floor(IDTEXT2 - num11*10);
zTEXT(17) = int2str(num12);

goalX = str2double(get(handles.edit7, 'String'));
goalY = str2double(get(handles.edit9, 'String'));
theta2 = acos((goalX^2 + goalY^2 - L1^2 - L2^2)/(2*L1*L2));
theta1 = atan2(goalY, goalX) - atan2(L2*sin(theta2), L1+L2*cos(theta2));

degreeTEXT1 = theta1 * 180 / pi;
degreeTEXT2 = theta2 * 180 / pi;

% dxl value
degreeTEXT1 = degreeTEXT1*(1024/90.0) + 1024;
degreeTEXT2 = degreeTEXT2*(1024/90.0) + 2048;

num3 = floor(degreeTEXT1/1000);
zTEXT(6) = int2str(num3);
num4 = floor((degreeTEXT1 - num3*1000)/100);
zTEXT(7) = int2str(num4);
num5 = floor((degreeTEXT1 - num3*1000 - num4*100)/10);
zTEXT(8) = int2str(num5);
num6 = floor(degreeTEXT1 - num3*1000 - num4*100 - num5*10);
zTEXT(9) = int2str(num6);

num13 = floor(degreeTEXT2/1000);
zTEXT(19) = int2str(num13);
num14 = floor((degreeTEXT2 - num13*1000)/100);
zTEXT(20) = int2str(num14);
num15 = floor((degreeTEXT2 - num13*1000 - num14*100)/10);
zTEXT(21) = int2str(num15);
num16 = floor(degreeTEXT2 - num13*1000 - num14*100 - num15*10);
zTEXT(22) = int2str(num16);

freqTEXT = str2double(get(handles.edit8, 'String'));
num7 = floor(freqTEXT/1000);
% motor id 1 and 2
zTEXT(11) = int2str(num7);  
zTEXT(24) = int2str(num7);
num8 = floor((freqTEXT - num7*1000)/100);
zTEXT(12) = int2str(num8);
zTEXT(25) = int2str(num8);
num9 = floor((freqTEXT - num7*1000 - num8*100)/10);
zTEXT(13) = int2str(num9);
zTEXT(26) = int2str(num9);
num10 = floor(freqTEXT - num7*1000 - num8*100 - num9*10);
zTEXT(14) = int2str(num10);
zTEXT(27) = int2str(num10);

for i=1:30
    fwrite(arduino, zTEXT(i), 'char');
    disp(zTEXT(i));
end


global h2
global h4
global time

double Bdegree1;
double Bdegree2;

Bdegree1 = 0;
Bdegree2 = 0;

x1 = 0;
y1 = 0;

h2 = plot(handles.axes1, x1, y1, 'o', 'MarkerSize', 5, 'MarkerFaceColor', 'b');

xlim([-50 50]);  % x의 범위는 -300 ~ +300 까지
ylim([-50 50]);

curve1 = animatedline('color', 'g');
set(gca, 'XLim', xlim, 'YLim', ylim);
hold on

flushinput(arduino)     % 버퍼 비우는 명령어. 그래프 값 딜레이를 없애줌

while 1
    time = time + 1;
    Bdegree1 = str2num(fscanf(arduino));
    Bdegree1 = (Bdegree1 - 90) * pi / 180;
    %disp(Bdegree1)
    Bdegree2 = str2num(fscanf(arduino));
    Bdegree2 = (Bdegree2 - 180) * pi / 180;
    
    x1 = L1 * cos(Bdegree1) + L2 * cos(Bdegree1 + Bdegree2);
    y1 = L1 * sin(Bdegree1) + L2 * sin(Bdegree1 + Bdegree2);
    xlim([-50 50]);
    set(h2, 'XData', x1, 'YData', y1);
    hold on
    
    addpoints(curve1, x1, y1);
    drawnow;
end