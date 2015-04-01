function saveImage(obj, event, arg1, arg2)
global filenum;
filenum =filenum+1;
fname = ['cells' num2str(filenum) '.jpg'];
saveas(gcf,fname);
disp(['image saved ' fname]);
end

% fname = ['cells' num2str(FileNum) '.jpg'];
% imwrite(ss, fname, 'JPG');
% disp(['image saved ' fname]);
% FileNum = FileNum + 1;