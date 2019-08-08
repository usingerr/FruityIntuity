% Image Processing COMP3800-30758
% Section 2, Group 2
% Morgan Whittemore & Ross Usinger
% Fruity Intuity - Determining produce ripeness via images

function varargout = final_gui(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @final_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @final_gui_OutputFcn, ...
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
end
% End initialization code - DO NOT EDIT

% --- Executes just before final_gui is made visible.
function final_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to final_gui (see VARARGIN)

% Choose default command line output for final_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
end

% UIWAIT makes final_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = final_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end


% --- Executes on button press in strawberrydemo.
function strawberrydemo_Callback(hObject, eventdata, handles)
% hObject    handle to strawberrydemo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.image = imread('strawberry (1).jpg');
handles.whichimage = 1;
axes(handles.axes1);
imshow(handles.image);
handles.redt = 0.00926;
handles.greent = 0.05406;
handles.bluet = 0.08259;
guidata(hObject, handles);
end


% --- Executes on button press in tomatodemo.
function tomatodemo_Callback(hObject, eventdata, handles)
% hObject    handle to tomatodemo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.image = imread('tomato_bottom.jpg');
handles.whichimage = 2;
axes(handles.axes1);
imshow(handles.image);
handles.redt = 0.000534128638920152577985;
handles.greent = 0.65223;
handles.bluet = 0.01608;
guidata(hObject, handles);
end


% --- Executes on button press in bananademo.
function bananademo_Callback(hObject, eventdata, handles)
% hObject    handle to bananademo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = imread('banana (1).jpg');
handles.image = image;
handles.whichimage = 3;
axes(handles.axes1);
imshow(handles.image);
handles.redt = 0.00661574979055942105121155718199;
handles.greent = 0.0082390707933790958917109702311;
handles.bluet = 0.14691921781144496;
guidata(hObject, handles);
end


% --- Executes on button press in ownstrawberry.
function ownstrawberry_Callback(hObject, eventdata, handles)
% hObject    handle to ownstrawberry (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file, folder] = uigetfile();
fullfile = strcat(folder, file);
if ~exist(fullfile, 'file')
    set(handles.text3,'string','This file does not exist');
    return;
else
    handles.image = imread(fullfile);
end
axes(handles.axes1);
handles.whichimage = 1;
imshow(handles.image);
handles.redt = 0.00346932;
handles.greent = 0.02646;
handles.bluet = 0.0818557;
guidata(hObject, handles);
end

% --- Executes on button press in owntomato.
function owntomato_Callback(hObject, eventdata, handles)
% hObject    handle to owntomato (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file, folder] = uigetfile();
fullfile = strcat(folder, file);
if ~exist(fullfile, 'file')
    set(handles.text3,'string','This file does not exist');
    return;
else
    handles.image = imread(fullfile);
end
axes(handles.axes1);
handles.whichimage = 2;
imshow(handles.image);
handles.redt = 0.000534128638920152577985;
handles.greent = 0.65223;
handles.bluet = 0.01608;
guidata(hObject, handles);
end

% --- Executes on button press in ownbanana.
function ownbanana_Callback(hObject, eventdata, handles)
% hObject    handle to ownbanana (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file, folder] = uigetfile();
fullfile = strcat(folder, file);
if ~exist(fullfile, 'file')
    set(handles.text3,'string','This file does not exist');
    return;
else
    handles.image = imread(fullfile);
end
axes(handles.axes1);
handles.whichimage = 3;
imshow(handles.image);
handles.redt = 0.00761574979055942105121155718199;
handles.greent = 0.0092390707933790958917109702311;
handles.bluet = 0.04991921781144496;
guidata(hObject, handles);
end


% --- Executes on button press in runbutton.
function runbutton_Callback(hObject, eventdata, handles)
% hObject    handle to runbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%strawberry
if handles.whichimage == 1
    redLow = 39;
    redHigh = 255;
    greenLow = 0;
    greenHigh = 238;
    blueLow = 0;
    blueHigh = 251;
elseif handles.whichimage == 2 %tomato
    redLow = 179;
    redHigh = 226;
    greenLow = 0;
    greenHigh = 112;
    blueLow = 24;
    blueHigh = 78;
%banana
elseif handles.whichimage == 3
    redLow = 66;
    redHigh = 255;
    greenLow = 37;
    greenHigh = 231;
    blueLow = 0;
    blueHigh = 203;
%custom
end

% segment image
im = segmentFruit(handles.image);

% show segmented image
axes(handles.axes2);
imshow(im);

% obtain color bands for image
red = im(:,:,1);
green = im(:,:,2);
blue = im(:,:,3);

% determine number of pixels within the ripe range
redMask = (red >= redLow) & (red <= redHigh);
greenMask = (green >= greenLow) & (green <= greenHigh);
blueMask = (blue >= blueLow) & (blue <= blueHigh);

% use percentage thresholds to determine if enough of the pixels are within
% the ripe range to denote a ripe fruit
if (sum(sum(redMask)))/(sum(sum(red))) >= handles.redt && (sum(sum(greenMask)))/(sum(sum(green))) >= handles.greent && (sum(sum(blueMask)))/(sum(sum(blue))) >= handles.bluet
    if handles.whichimage == 1
        set(handles.text3,'string','ripe strawberry');
    elseif handles.whichimage == 2
        set(handles.text3,'string','ripe tomato');
    elseif handles.whichimage == 3
        set(handles.text3,'string','ripe banana');
    end
else
    if handles.whichimage == 1
        set(handles.text3,'string','unripe strawberry');
    elseif handles.whichimage == 2
        set(handles.text3,'string','unripe tomato');
    elseif handles.whichimage == 3
        set(handles.text3,'string','unripe banana');
    end
end
end

function s = segmentFruit(rgbImage)
    % SEGMENT IMAGE
    [rows, columns, numberOfColorChannels] = size(rgbImage);
    Channel = rgbImage(:, :, 3);
    
    % Create a mask of the background only.
    mask = Channel > 90;
    
    % Mask the image using bsxfun() function
    maskedRgbImage = bsxfun(@times, rgbImage, cast(mask, 'like', rgbImage));
    
    % Mask out the background, leaving only the leaf.
    % Mask the image using bsxfun() function
    maskedRgbImage = bsxfun(@times, rgbImage, cast(~mask, 'like', rgbImage));
    % Display the mask image
    s = maskedRgbImage;
    %imshow(maskedRgbImage);
end

% --- Executes on button press in exitbutton.
function exitbutton_Callback(hObject, eventdata, handles)
% hObject    handle to exitbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all force;
return;
end
