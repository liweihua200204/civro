function [] = CapturaImagem(tipo,caminho)
global FILEFOLDER DIROUTPUT FILENAME NE TIPO
switch tipo
    case {'jpg','jpeg'}
        TIPO=tipo;
        FILEFOLDER = fullfile(caminho);
        DIROUTPUT = dir(fullfile(FILEFOLDER,strcat('*.',tipo)));
        FILENAME = {DIROUTPUT.name};
        NE= length(FILENAME);
        disp('imagem');
    case {'avi','mpeg'}
         TIPO=tipo;
         FILENAME = mmreader(caminho);
         NE = get(FILENAME, 'numberOfFrames');  
         disp('videoFile')
    case 'camera'
        TIPO=tipo;
        FILENAME = videoinput('winvideo',1);
        stop(FILENAME);
        set(FILENAME,'TriggerRepeat',Inf);
        FILENAME.FrameGrabInterval = 5;
        vid_src = getselectedsource(FILENAME);
        set(vid_src,'Tag','motion detection setup');
        start(FILENAME)     
       disp('tempoRealFile')
    otherwise
        disp('Não Foi possível Realizar a operação')
end
end

