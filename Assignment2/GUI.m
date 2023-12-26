function varargout = GUI(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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



function GUI_OpeningFcn(hObject, eventdata, handles, varargin)


handles.output = hObject;

guidata(hObject, handles);


function varargout = GUI_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;



function Histogram_Callback(hObject, eventdata, handles)

image = getappdata(0,'image');
imagehist = image;
imagehist = rgb2gray(imagehist);
axes(handles.axes1);
imhist(imagehist);


function ComplementImage_Callback(hObject, eventdata, handles)

image = getappdata(0,'image');
imagecomp = image;
imagecomp = imcomplement(imagecomp);
axes(handles.axes1);
imshow(imagecomp);


function EdgeDetection_Callback(hObject, eventdata, handles)

image = getappdata(0,'image');
imagedge = image;
imagedge = rgb2gray(imagedge);
imagedge = edge(imagedge,'prewitt');
axes(handles.axes1);
imshow(imagedge);


function Uploadimage_Callback(hObject, eventdata, handles)

image = uigetfile('.jpg')
image = imread(image);
axes(handles.axes1);
imshow(image);
setappdata(0,'image',image)


function rgb2gray_Callback(hObject, eventdata, handles)

image = getappdata(0,'image');
imagegray = rgb2gray(image);
axes(handles.axes1);
imshow(imagegray);


function Convert2image_Callback(hObject, eventdata, handles)

image = getappdata(0,'image');
imagetoBinary = im2bw(image);
axes(handles.axes1);
imshow(imagetoBinary);


function reset_Callback(hObject, eventdata, handles)

image = getappdata(0,'image');
axes(handles.axes1);
imshow(image);