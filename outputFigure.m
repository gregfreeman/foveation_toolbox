function outputFigure(figureN,filename,pageIndex,format)

if ~exist('format','var')
    format=	'-dpsc2';
end
if ~exist('pageIndex','var')
    pageIndex=1;
end

if isempty(strfind(filename,':'))
    filename=[pwd '/' filename];
end
filename=strrep(filename,'.','_');

figure(figureN)
set(gcf,'PaperPositionMode','auto')
if pageIndex>1 && strcmp(format,'-dpsc2')
    print(gcf,format,'-append',filename)
else
    print(gcf,format,filename)
end    


