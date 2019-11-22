function varargout = start(varargin)
% START MATLAB code for start.fig
%      START, by itself, creates a new START or raises the existing
%      singleton*.
%
%      H = START returns the handle to a new START or the handle to
%      the existing singleton*.
%
%      START('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in START.M with the given input arguments.
%
%      START('Property','Value',...) creates a new START or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before start_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to start_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help start

% Last Modified by GUIDE v2.5 14-Oct-2019 09:12:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @start_OpeningFcn, ...
                   'gui_OutputFcn',  @start_OutputFcn, ...
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


% --- Executes just before start is made visible.
function start_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to start (see VARARGIN)

% Choose default command line output for start
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes start wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = start_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%set(handles.edit4,'String','250');
axes(handles.axes3)
    matlabImage = imread('C:\Users\Bhaskar Datta\Desktop\GUI\CompressionMember Matlab\column axis.png');
    image(matlabImage)
    axis off

s=sprintf('Click on NEXT after selecting appropriate options above to go ahead');
set(handles.pushbutton1,'TooltipString',s);

s1=sprintf('Click on EXIT to exit from application');
set(handles.pushbutton2,'TooltipString',s1);

s2=sprintf('Click to know the procedure of this application');
set(handles.pushbutton3,'TooltipString',s2);


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
radio1=get(handles.radiobutton1, 'Value');
radio2=get(handles.radiobutton2, 'Value');
radio3=get(handles.radiobutton3, 'Value');
radio4=get(handles.radiobutton4, 'Value');
radio5=get(handles.radiobutton5, 'Value');
radio6=get(handles.radiobutton6, 'Value');
radio7=get(handles.radiobutton7, 'Value');
radio8=get(handles.radiobutton8, 'Value');
radio9=get(handles.radiobutton9, 'Value');
radio10=get(handles.radiobutton10, 'Value');
radio11=get(handles.radiobutton11, 'Value');
%radio12=get(handles.radiobutton12, 'Value');
%radio13=get(handles.radiobutton13, 'Value');
%radio14=get(handles.radiobutton14, 'Value');


P=str2double(get(handles.edit1,'String'));
Ly=str2double(get(handles.edit2,'String'));
Lz=str2double(get(handles.edit3,'String'));
Fy=str2double(get(handles.edit4,'String'));

if (radio1==1)
    Ky=1;
elseif (radio2==1)
    Ky=2;
elseif (radio3==1)
    Ky=0.8;
elseif (radio4==1)
    Ky=0.65;
end

if (radio5==1)
    Kz=1;
elseif (radio6==1)
    Kz=2;
elseif (radio7==1)
    Kz=0.8;
elseif (radio8==1)
    Kz=0.65;
end

if (radio9==1)
    ISMB={'ISLB75','ISLB100','ISLB125','ISLB150','ISLB175','ISLB200','ISLB225','ISLB250','ISLB275','ISLB300','ISLB325','ISLB350','ISLB400','ISLB450','ISLB500','ISLB550','ISLB600'};
    w=[6.1 8.0 11.9 14.2 16.7 19.8 23.5 27.9 33.0 37.7 43.1 49.5 56.9 65.3 75.0 86.3 99.5];
    H=[75 100 125 150 175 200 225 250 275 300 325 350 400 450 500 550 600]*(10^-3);
    Ze=[19.4 33.6 65.1 91.8 125.3 169.7 222.4 297.4 392.4 488.9 607.7 751.9 965.3 1223.8 1543.2 1933.2 2428.9]*(10^-6);
    Zp=[22.35 38.89 73.93 104.50 143.30 184.34 254.72 338.69 443.09 554.32 687.76 851.11 1099.45 1401.35 1773.67 2228.16 2798.56]*(10^-6);
    Ae=[7.71 10.21 15.12 18.08 21.30 25.27 29.92 35.53 42.02 48.08 54.90 63.01 72.43 83.14 95.50 109.97 126.69]*(10^-4);
    Tf=[5.0 6.4 6.5 6.8 6.9 7.3 8.6 8.2 8.8 9.4 9.8 11.4 12.5 13.4 14.1 15.0 15.5]*(10^-3);
    Bf=[50 50 75 80 90 100 100 125 140 150 165 165 165 170 180 190 210]*(10^-3);
    Tw=[3.7 4.0 4.4 4.8 5.1 5.4 5.8 6.1 6.4 6.7 7.0 7.4 8.0 8.6 9.2 9.9 10.5]*(10^-3);
    Rf=[6.5 7.0 8.0 9.5 9.5 9.5 12.0 13.0 14.0 15.0 16.0 16.0 16.0 16.0 17.0 18.0 20.0]*(10^-3);
    Ry=[1.14 1.12 1.69 1.75 1.93 2.13 1.94 2.33 2.61 2.80 3.05 3.17 3.15 3.20 3.34 3.48 3.79]*(10^-2);
    Rz=[3.07 4.06 5.19 6.17 7.17 8.19 9.15 10.23 11.31 12.35 13.41 14.45 16.33 18.20 20.10 21.99 23.98]*(10^-2);
    Iy=[1.0 12.7 43.4 55.2 79.6 115.4 112.7 193.4 287.0 376.2 510.8 631.9 716.4 853.0 1063.9 1335.1 1821.9]*(10^-8);
end
if (radio10==1)
    ISMB={'ISMB100', 'ISMB125','ISMB150','ISMB175', 'ISMB200', 'ISMB225' ,'ISMB250' ,'ISMB300', 'ISMB350','ISMB400','ISMB450','ISMB500','ISMB550','ISMB600'};
    w=[11.5 13.0 14.9 19.3 35.4 31.2 37.3 44.2 52.4 61.6 72.4 86.9 103.7 122.6];
    H=[100 125 150 175 200 225 250 300 350 400 450 500 550 600]*(10^-3);
    Ze=[51.5 71.8 96.9 145.4 223.5 305.9 410.5 573.6 778.9 1022.9 1350.7 1808.7 2359.8 3060.4]*(10^-6);
    Zp=[41.68 81.85 110.48 166.08 253.86 348.27 465.71 651.74 889.57 1176.18 1533.36 2074.67 2711.98 3510.63]*(10^-6);
    Ae=[14.60 16.60 19.0 24.62 32.33 39.72 47.55 56.26 66.71 78.46 92.27 110.74 132.11 156.21]*(10^-4);
    Tf=[7.2 7.6 7.6 8.6 10.8 11.8 12.5 12.4 14.2 16.0 17.4 17.2 19.3 20.8]*(10^-3);
    Bf=[75 75 80 90 100 110 125 140 140 140 150 180 190 210]*(10^-3);
    Tw=[4.0 4.4 4.8 5.5 5.7 6.5 6.9 7.5 8.1 8.9 9.4 10.2 11.2 12.0]*(10^-3);
    Rf=[9 9 9 10 11 12 13 14 14 14 15 17 18 20]*(10^-3);
    Ry=[1.67 1.62 1.66 1.86 2.15 2.34 2.65 2.84 2.84 2.82 3.01 3.52 3.73 4.12]*(10^-2);
    Rz=[4.20 5.20 6.18 7.19 8.32 9.31 10.39 12.37 14.29 16.15 18.15 20.21 22.16 24.24]*(10^-2);
    Iy=[40.8 43.7 52.6 85.0 150.0 218.3 334.5 453.9 537.7 622.1 834.0 1369.8 1833.8 2651.0]*(10^-8);
end
if (radio11==1)
    ISMB={'ISWB150','ISWB175','ISWB200','ISWB225','ISWB250','ISWB300','ISWB350','ISWB400','ISWB450','ISWB500','ISWB550','ISWB600','ISWB600'};
    w=[17.0 22.1 28.8 33.9 40.9 48.1 56.9 66.7 79.4 95.2 112.5 133.7 145.1];
    H=[150 175 200 225 250 300 350 400 450 500 550 600 600]*(10^-3);
    Ze=[111.9 172.5 262.5 348.5 475.4 654.8 887.0 1171.3 1558.1 2091.6 2723.9 3540.0 3854.2]*(10^-6);
    Zp=[126.86 194.20 293.99 389.93 527.57 731.21 995.49 1290.19 1760.59 2351.35 3066.29 3986.66 4341.63]*(10^-6);
    Ae=[21.67 28.11 36.71 43.24 52.05 61.33 72.50 85.01 101.15 121.22 143.34 170.38 184.86]*(10^-4);
    Tf=[7.0 7.4 9.0 9.9 9.0 10.0 11.4 13.0 15.4 14.7 17.6 21.3 23.6]*(10^-3);
    Bf=[100 125 140 150 200 200 200 200 200 250 250 250 250]*(10^-3);
    Tw=[5.4 5.8 6.1 6.4 6.7 7.4 8.0 8.6 9.2 9.9 10.5 11.2 11.8]*(10^-3);
    Rf=[8.0 8.0 9.0 9.0 10.0 11.0 12 13 14 15 16 17 18]*(10^-3);
    %HfValues=(HValues)-(TfValues);
    Ry=[2.09 2.59 2.99 3.22 4.06 4.02 4.03 4.04 4.11 4.96 5.11 5.25 5.35]*(10^-2);
    Rz=[4.20 5.20 6.18 7.19 8.32 9.31 10.39 12.37 14.29 16.15 18.15 20.21 22.16 24.24]*(10^-2);
    Iy=[94.8 188.6 328.8 448.6 857.5 990.1 1175.9 1388.0 1706.7 2987.8 3740.6 4702.5 5298.3]*(10^-8);
end
[~,length]=size(ISMB);
Fy=Fy*10^3;
E=2*(10^8);
Gamma=1.1;
Result_version=0;
Classy='';
Classz='';
for i=1:length
    if (radio9==1 || radio10==1 || radio11==1)
        if((H(i)/Bf(i))>1.2)
            if((Tf(i)*10^3)<=40)
            Alphaz=0.21;
            Classz='A';
            Alphay=0.34;
            Classy='B';
            elseif (((Tf(i)*10^3)>=40) && ((Tf(i)*10^3)<=100))
            Alphaz=0.34;
            Classz='B';
            Alphay=0.49;
            Classy='C';
            end
        elseif((H(i)/Bf(i))<=1.2)
            if((Tf(i)*10^3)<=100)
            Alphaz=0.34;
            Classz='B';
            Alphay=0.49;
            Classy='C';
            elseif ((Tf(i)*10^3)>100)
            Alphaz=0.76;
            Classz='D';
            Alphay=0.76;
            Classy='D';
            end
        end
    end
    
    if (radio9==1 || radio10==1 || radio11==1)
    Fccy=((pi^2)*E)/((Ky*Ly/Ry(i))^2);
    Lambday=sqrt(Fy/Fccy);
    Phiy=0.5*(1+(Alphay*((Lambday)-0.2))+((Lambday)^2));
    Fcdy=(Fy/Gamma)/(Phiy+(((Phiy^2)-(Lambday^2))^0.5));
    F1=Fcdy*Ae(i);
    
    Fccz=((pi^2)*E)/((Kz*Lz/Rz(i))^2);
    Lambdaz=sqrt(Fy/Fccz);
    Phiz=0.5*(1+(Alphaz*(Lambdaz-0.2))+(Lambdaz^2));
    Fcdz=(Fy/Gamma)/(Phiz+(((Phiz^2)-(Lambdaz^2))^0.5));
    F2=Fcdz*Ae(i);
    end
    
    Pd=min(F1,F2);
    
    if (P<=Pd)
        if((Ky*Ly/Ry(i))<=180)
            if((Kz*Lz/Rz(i))<=180)
        Result_version=1;
        break;
            end
        end
    end 
    
end
if (Result_version==1)
setappdata(0,'ISMBvalue',ISMB{i});
setappdata(0,'wvalue',w(i));
setappdata(0,'Hvalue',H(i)*10^3);
setappdata(0,'Bfvalue',Bf(i)*10^3);
setappdata(0,'Tfvalue',Tf(i)*10^3);
setappdata(0,'Rfvalue',Rf(i)*10^3);
setappdata(0,'Twvalue',Tw(i)*10^3);
setappdata(0,'Aevalue',Ae(i)*10^4);
setappdata(0,'Ryvalue',Ry(i)*10^2);
setappdata(0,'Rzvalue',Rz(i)*10^2);
setappdata(0,'Ivalue',i);
setappdata(0,'radio1value',radio1);
setappdata(0,'radio2value',radio2);
setappdata(0,'radio3value',radio3);
setappdata(0,'radio4value',radio4);
setappdata(0,'radio5value',radio5);
setappdata(0,'radio6value',radio6);
setappdata(0,'radio7value',radio7);
setappdata(0,'radio8value',radio8);
setappdata(0,'radio9value',radio9);
setappdata(0,'radio10value',radio10);
setappdata(0,'radio11value',radio11);
setappdata(0,'Pvalue',P);
setappdata(0,'Lyvalue',Ly);
setappdata(0,'Lzvalue',Lz);
setappdata(0,'Fyvalue',Fy);
setappdata(0,'Kyvalue',Ky);
setappdata(0,'Kzvalue',Kz);
setappdata(0,'Fcdyvalue',(Fcdy*10^-3));
setappdata(0,'Fcdzvalue',(Fcdz*10^-3));
setappdata(0,'F1value',F1);
setappdata(0,'F2value',F2);
setappdata(0,'Classyvalue',Classy);
setappdata(0,'Classzvalue',Classz);
result
else
    Warning;
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
HelpColumn


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


% --- Executes on button press in radiobutton9.
function radiobutton9_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton9


% --- Executes on button press in radiobutton10.
function radiobutton10_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton10


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over edit2.
function edit2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on edit2 and none of its controls.
function edit2_KeyPressFcn(hObject, eventdata, handles)

% hObject    handle to edit2 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on edit3 and none of its controls.
function edit3_KeyPressFcn(hObject, eventdata, handles)
axes(handles.axes1)
        hold on;
        cla;
        Ly=str2double(get(handles.edit2,'String'));
        p = get(handles.edit1,'String');
        plot([0 0],[0 Ly],'LineWidth',5,'Color','k')
        %text((Ly/3),-1,'Beam','Color','k','FontSize',14)
        ylim([0 Ly+2]);
        xlim([-5 5]);
        str1={'P=' num2str(p) ' KN'};
        text(1,Ly+1,str1,'Color','red','Fontsize',14)
        drawArrow = @(x,y) quiver( x(1),y(1),x(2)-x(1),y(2)-y(1),0,'Color','red','LineWidth',3,'MaxHeadSize',0.5);    
        x_arrow = [0 0];
        y_arrow = [Ly+2 Ly];
        drawArrow(x_arrow,y_arrow);
        hold off;
        
% hObject    handle to edit3 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on edit4 and none of its controls.
function edit4_KeyPressFcn(hObject, eventdata, handles)
        axes(handles.axes2)
        hold on;
        cla;
        Lz=str2double(get(handles.edit3,'String'));
        p = get(handles.edit1,'String');
        plot([0 0],[0 Lz],'LineWidth',5,'Color','k')
        %text((Lz/3),-1,'Beam','Color','k','FontSize',14)
        ylim([0 Lz+2]);
        xlim([-5 5]);
        str1=['P=' num2str(p) ' KN'];
        text(1,Lz+1,str1,'Color','red','Fontsize',14)
        drawArrow = @(x,y) quiver( x(1),y(1),x(2)-x(1),y(2)-y(1),0,'Color','red','LineWidth',3,'MaxHeadSize',0.5);    
        x_arrow = [0 0];
        y_arrow = [Lz+2 Lz];
        drawArrow(x_arrow,y_arrow);
        hold off;
% hObject    handle to edit4 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on radiobutton1 and none of its controls.
function radiobutton1_KeyPressFcn(hObject, eventdata, handles)


% hObject    handle to radiobutton1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on radiobutton4 and none of its controls.
function radiobutton4_KeyPressFcn(hObject, eventdata, handles)

% hObject    handle to radiobutton4 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over radiobutton3.
function radiobutton3_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
switch get(eventdata.NewValue, 'Tag')
    case 'radiobutton1'
        axes(handles.axes1)
        hold on;
        cla
        Ly=str2double(get(handles.edit2,'String'));
        p = get(handles.edit1,'String');
        plot([0 0],[1 Ly+1],'LineWidth',10,'Color','k')
        plot([1 0],[Ly+2 Ly+1],'LineWidth',5,'Color',[0.4660, 0.6740, 0.1880])
        plot([1 0],[Ly Ly+1],'LineWidth',5,'Color',[0.4660, 0.6740, 0.1880])
        plot([1 0],[2 1],'LineWidth',5,'Color',[0.4660, 0.6740, 0.1880])
        plot([1 0],[0 1],'LineWidth',5,'Color',[0.4660, 0.6740, 0.1880])
        plot([1 1],[0 2],'LineWidth',5,'Color',[0.4660, 0.6740, 0.1880])
        plot([1 1],[Ly+2 Ly],'LineWidth',5,'Color',[0.4660, 0.6740, 0.1880])
        %text((Ly/3),-1,'Beam','Color','k','FontSize',14)
        ylim([0 Ly+3]);
        xlim([-5 5]);
        str1=['P=' num2str(p) ' KN'];
        text(-4,Ly+2,str1,'Color','red','Fontsize',14)
        drawArrow = @(x,y) quiver( x(1),y(1),x(2)-x(1),y(2)-y(1),0,'Color','red','LineWidth',3,'MaxHeadSize',0.5);    
        x_arrow = [0 0];
        y_arrow = [Ly+3 Ly+1];
        drawArrow(x_arrow,y_arrow);
        hold off;
    case 'radiobutton4'
        axes(handles.axes1)
        hold on;
        cla
        Ly=str2double(get(handles.edit2,'String'));
        p = get(handles.edit1,'String');
        plot([0 0],[0 Ly],'LineWidth',10,'Color','k')
        plot([-2 2],[0 0],'LineWidth',10,'Color',[0.4660, 0.6740, 0.1880])
        plot([-2 2],[Ly Ly],'LineWidth',5,'Color',[0.4660, 0.6740, 0.1880])
        %text((Ly/3),-1,'Beam','Color','k','FontSize',14)
        ylim([0 Ly+2]);
        xlim([-5 5]);
        str1=['P=' num2str(p) ' KN'];
        text(1,Ly+1,str1,'Color','red','Fontsize',14)
        drawArrow = @(x,y) quiver( x(1),y(1),x(2)-x(1),y(2)-y(1),0,'Color','red','LineWidth',3,'MaxHeadSize',0.5);    
        x_arrow = [0 0];
        y_arrow = [Ly+2 Ly];
        drawArrow(x_arrow,y_arrow);
        hold off;
       case 'radiobutton2'
        axes(handles.axes1)
        hold on;
        cla
        Ly=str2double(get(handles.edit2,'String'));
        p = get(handles.edit1,'String');
        plot([0 0],[0 Ly],'LineWidth',10,'Color','k')
        plot([-2 2],[0 0],'LineWidth',10,'Color',[0.4660, 0.6740, 0.1880])
        %plot([-2 2],[Ly Ly],'LineWidth',5,'Color',[0.4660, 0.6740, 0.1880])
        %text((Ly/3),-1,'Beam','Color','k','FontSize',14)
        ylim([0 Ly+2]);
        xlim([-5 5]);
        str1=['P=' num2str(p) ' KN'];
        text(1,Ly+1,str1,'Color','red','Fontsize',14)
        drawArrow = @(x,y) quiver( x(1),y(1),x(2)-x(1),y(2)-y(1),0,'Color','red','LineWidth',3,'MaxHeadSize',0.5);    
        x_arrow = [0 0];
        y_arrow = [Ly+2 Ly];
        drawArrow(x_arrow,y_arrow);
        hold off;
        case 'radiobutton3'
        axes(handles.axes1)
        hold on;
        cla
        Ly=str2double(get(handles.edit2,'String'));
        p = get(handles.edit1,'String');
        plot([0 0],[0 Ly],'LineWidth',10,'Color','k')
        plot([1 0],[Ly-1 Ly],'LineWidth',5,'Color',[0.4660, 0.6740, 0.1880])
        plot([1 0],[Ly+1 Ly],'LineWidth',5,'Color',[0.4660, 0.6740, 0.1880])
        plot([1 1],[Ly+1 Ly-1],'LineWidth',5,'Color',[0.4660, 0.6740, 0.1880])
        plot([-2 2],[0 0],'LineWidth',10,'Color',[0.4660, 0.6740, 0.1880])
        %plot([-2 2],[Lz Lz],'LineWidth',5,'Color',[0.4660, 0.6740, 0.1880])
        %text((Lz/3),-1,'Beam','Color','k','FontSize',14)
        ylim([0 Ly+2]);
        xlim([-5 5]);
        str1=['P=' num2str(p) ' KN'];
        text(-4,Ly+1,str1,'Color','red','Fontsize',14)
        drawArrow = @(x,y) quiver( x(1),y(1),x(2)-x(1),y(2)-y(1),0,'Color','red','LineWidth',3,'MaxHeadSize',0.5);    
        x_arrow = [0 0];
        y_arrow = [Ly+2 Ly];
        drawArrow(x_arrow,y_arrow);
        hold off;
end
        
        
        


% --- Executes when selected object is changed in uibuttongroup2.
function uibuttongroup2_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup2 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
switch get(eventdata.NewValue, 'Tag')
    case 'radiobutton5'
        axes(handles.axes2)
        hold on;
        cla
        Lz=str2double(get(handles.edit3,'String'));
        p = get(handles.edit1,'String');
        plot([0 0],[1 Lz+1],'LineWidth',10,'Color','k')
        plot([1 0],[Lz+2 Lz+1],'LineWidth',5,'Color',[0.4660, 0.6740, 0.1880])
        plot([1 0],[Lz Lz+1],'LineWidth',5,'Color',[0.4660, 0.6740, 0.1880])
        plot([1 0],[2 1],'LineWidth',5,'Color',[0.4660, 0.6740, 0.1880])
        plot([1 0],[0 1],'LineWidth',5,'Color',[0.4660, 0.6740, 0.1880])
        plot([1 1],[0 2],'LineWidth',5,'Color',[0.4660, 0.6740, 0.1880])
        plot([1 1],[Lz+2 Lz],'LineWidth',5,'Color',[0.4660, 0.6740, 0.1880])
        %text((Lz/3),-1,'Beam','Color','k','FontSize',14)
        ylim([0 Lz+3]);
        xlim([-5 5]);
        str1=['P=' num2str(p) ' KN'];
        text(-4,Lz+2,str1,'Color','red','Fontsize',14)
        drawArrow = @(x,y) quiver( x(1),y(1),x(2)-x(1),y(2)-y(1),0,'Color','red','LineWidth',3,'MaxHeadSize',0.5);    
        x_arrow = [0 0];
        y_arrow = [Lz+3 Lz+1];
        drawArrow(x_arrow,y_arrow);
        hold off;
    case 'radiobutton8'
        axes(handles.axes2)
        hold on;
        cla
        Lz=str2double(get(handles.edit3,'String'));
        p = get(handles.edit1,'String');
        plot([0 0],[0 Lz],'LineWidth',10,'Color','k')
        plot([-2 2],[0 0],'LineWidth',10,'Color',[0.4660, 0.6740, 0.1880])
        plot([-2 2],[Lz Lz],'LineWidth',5,'Color',[0.4660, 0.6740, 0.1880])
        %text((Lz/3),-1,'Beam','Color','k','FontSize',14)
        ylim([0 Lz+2]);
        xlim([-5 5]);
        str1=['P=' num2str(p) ' KN'];
        text(1,Lz+1,str1,'Color','red','Fontsize',14)
        drawArrow = @(x,y) quiver( x(1),y(1),x(2)-x(1),y(2)-y(1),0,'Color','red','LineWidth',3,'MaxHeadSize',0.5);    
        x_arrow = [0 0];
        y_arrow = [Lz+2 Lz];
        drawArrow(x_arrow,y_arrow);
        hold off;
      case 'radiobutton6'
        axes(handles.axes2)
        hold on;
        cla
        Lz=str2double(get(handles.edit3,'String'));
        p = get(handles.edit1,'String');
        plot([0 0],[0 Lz],'LineWidth',10,'Color','k')
        plot([-2 2],[0 0],'LineWidth',10,'Color',[0.4660, 0.6740, 0.1880])
        %plot([-2 2],[Lz Lz],'LineWidth',5,'Color',[0.4660, 0.6740, 0.1880])
        %text((Lz/3),-1,'Beam','Color','k','FontSize',14)
        ylim([0 Lz+2]);
        xlim([-5 5]);
        str1=['P=' num2str(p) ' KN'];
        text(1,Lz+1,str1,'Color','red','Fontsize',14)
        drawArrow = @(x,y) quiver( x(1),y(1),x(2)-x(1),y(2)-y(1),0,'Color','red','LineWidth',3,'MaxHeadSize',0.5);    
        x_arrow = [0 0];
        y_arrow = [Lz+2 Lz];
        drawArrow(x_arrow,y_arrow);
        hold off;
        case 'radiobutton7'
        axes(handles.axes2)
        hold on;
        cla
        Lz=str2double(get(handles.edit3,'String'));
        p = get(handles.edit1,'String');
        plot([0 0],[0 Lz],'LineWidth',10,'Color','k')
        plot([1 0],[Lz+1 Lz],'LineWidth',5,'Color',[0.4660, 0.6740, 0.1880])
        plot([1 0],[Lz-1 Lz],'LineWidth',5,'Color',[0.4660, 0.6740, 0.1880])
        plot([1 1],[Lz-1 Lz+1],'LineWidth',5,'Color',[0.4660, 0.6740, 0.1880])
        plot([-2 2],[0 0],'LineWidth',10,'Color',[0.4660, 0.6740, 0.1880])
        %plot([-2 2],[Lz Lz],'LineWidth',5,'Color',[0.4660, 0.6740, 0.1880])
        %text((Lz/3),-1,'Beam','Color','k','FontSize',14)
        ylim([0 Lz+2]);
        xlim([-5 5]);
        str1=['P=' num2str(p) ' KN'];
        text(-4,Lz+1,str1,'Color','red','Fontsize',14)
        drawArrow = @(x,y) quiver( x(1),y(1),x(2)-x(1),y(2)-y(1),0,'Color','red','LineWidth',3,'MaxHeadSize',0.5);    
        x_arrow = [0 0];
        y_arrow = [Lz+2 Lz];
        drawArrow(x_arrow,y_arrow);
        hold off;
end
