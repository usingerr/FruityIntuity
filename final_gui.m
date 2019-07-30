clc;	% Clear command window.
clear;	% Delete all variables.
close all;

message = sprintf('This application attempts to identify the ripeness of strawberries, tomatoes, and bananas. Continue?');
dialogue_reply = questdlg(message, 'Run program?', 'OK','Cancel', 'OK');
if strcmpi(dialogue_reply, 'Cancel')
	% User wishes to cancel the program so exit.
	return;
else
    % User wishes to continue.
    message2 = sprintf('Do you want to use our demo image or your own image?');
    dialogue2_reply = questdlg(message2, 'Image selection', 'Demo image', 'My image', 'OK');
    current_folder = strcat(pwd,'\img');
    if strcmpi(dialogue2_reply, 'Demo image')
        % User wants to use a demo image
        message3 = ('Which demo image do you want to use?');
        which_image = questdlg(message3, 'Choose an image', 'Strawberry', 'Tomato', 'Banana', 'OK');
        if strcmpi(which_image, 'Strawberry')
            base_image = 'strawberry.jpg';
        elseif strcmpi(which_image, 'Tomato')
            base_image = 'close_tomato.jpg';
        elseif strcmpi(which_image, 'Banana')
            base_image = 'banana.jpg';
        end
        image = fullfile(current_folder, base_image);
    else
        % User is going to use their own image
        [file, folder] = uigetfile('*.*', 'Select your image');
        image = fullfile(folder, file);
    end
    
    % Does the image exist?
    if ~exist(image, 'file')
        message4 = 'The selected image does not exist';
        uiwait(msgbox(message4));
        return;
    end
    
    imshow(image);
end

