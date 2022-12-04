%% Ring puzzle with periodic boundaries
% Controls:
% move: w,a,s,d
% toggle ring/segment mode: space

%% settings and Inits
NumberOfRings = 4;
NumberOfSegments = 12;
cmap = jet(NumberOfSegments);
Dseg = 360/NumberOfSegments;
quadsx = [];
quadsy = [];
quadsc = [];
quadsci = [];

handleFigure = figure;
hold on;

%% init color index matrix
WheelColors = repmat(1:NumberOfSegments,[NumberOfRings 1]);

%% create vertices for board
for segs=0:(NumberOfSegments-1)
  for r=1:NumberOfRings
    x1 = r*cosd(segs*Dseg);
    x2 = (r+1)*cosd(segs*Dseg);
    x3 = (r+1)*cosd((segs+1)*Dseg);
    x4 = r*cosd((segs+1)*Dseg);
    y1 = r*sind(segs*Dseg);
    y2 = (r+1)*sind(segs*Dseg);
    y3 = (r+1)*sind((segs+1)*Dseg);
    y4 = r*sind((segs+1)*Dseg);
    quadsx = [quadsx; [x1 x2 x3 x4]];
    quadsy = [quadsy; [y1 y2 y3 y4]];
    %quadsc = [quadsc; cmap(segs+1,:)];
    quadsci = [quadsci; segs+1];
  end
end

%% draw game board
p1 = patch(quadsx', quadsy', 1:size(quadsx,1));
colormap(cmap(quadsci,:));

%% draw ring highlights
% store ring handles
p2 = [];
p3 = [];

% highlight selected ring
for iRingSelection = 1:NumberOfRings
  p2(iRingSelection) = plot([quadsx(iRingSelection:NumberOfRings:end,1); quadsx(iRingSelection,1)],[quadsy(iRingSelection:NumberOfRings:end,1); quadsy(iRingSelection,1)],'-','LineWidth',1,'Color','k');
  p3(iRingSelection) = plot([quadsx(iRingSelection:NumberOfRings:end,1+1); quadsx(iRingSelection,1+1)],[quadsy(iRingSelection:NumberOfRings:end,1+1); quadsy(iRingSelection,1+1)],'-','LineWidth',1,'Color','k');
end

p2(5) = plot([quadsx(iRingSelection:NumberOfRings:end,2); quadsx(iRingSelection,2)],[quadsy(iRingSelection:NumberOfRings:end,2); quadsy(iRingSelection,2)],'-','LineWidth',1,'Color','k');
p3(5) = plot([quadsx(iRingSelection:NumberOfRings:end,3); quadsx(iRingSelection,3)],[quadsy(iRingSelection:NumberOfRings:end,3); quadsy(iRingSelection,3)],'-','LineWidth',1,'Color','k');

%% draw segment highlights
% highlight selected segment
for nSegmentSelection = 1:(NumberOfSegments/2-1)
  p4(nSegmentSelection) = patch([quadsx([1:NumberOfRings]+(nSegmentSelection-1)*NumberOfRings,1)' quadsx(NumberOfRings+(nSegmentSelection-1)*NumberOfRings,2) quadsx(2*NumberOfRings+(nSegmentSelection-1)*NumberOfRings,2) quadsx([(2*NumberOfRings):-1:(NumberOfRings+1)]+(nSegmentSelection-1)*NumberOfRings,1)'], [quadsy([1:NumberOfRings]+(nSegmentSelection-1)*NumberOfRings,1)' quadsy(NumberOfRings+(nSegmentSelection-1)*NumberOfRings,2) quadsy(2*NumberOfRings+(nSegmentSelection-1)*NumberOfRings,2) quadsy([(2*NumberOfRings):-1:(NumberOfRings+1)]+(nSegmentSelection-1)*NumberOfRings,1)'], ones(1,2*NumberOfRings+2),'FaceColor','none','LineWidth',1);
  p5(nSegmentSelection) = patch([quadsx([1:NumberOfRings]+(nSegmentSelection-1)*NumberOfRings+NumberOfSegments/2*NumberOfRings,1)' quadsx(NumberOfRings+(nSegmentSelection-1)*NumberOfRings+NumberOfSegments/2*NumberOfRings,2) quadsx(2*NumberOfRings+(nSegmentSelection-1)*NumberOfRings+NumberOfSegments/2*NumberOfRings,2) quadsx([(2*NumberOfRings):-1:(NumberOfRings+1)]+(nSegmentSelection-1)*NumberOfRings+NumberOfSegments/2*NumberOfRings,1)'], [quadsy([1:NumberOfRings]+(nSegmentSelection-1)*NumberOfRings+NumberOfSegments/2*NumberOfRings,1)' quadsy(NumberOfRings+(nSegmentSelection-1)*NumberOfRings+NumberOfSegments/2*NumberOfRings,2) quadsy(2*NumberOfRings+(nSegmentSelection-1)*NumberOfRings+NumberOfSegments/2*NumberOfRings,2) quadsy([(2*NumberOfRings):-1:(NumberOfRings+1)]+(nSegmentSelection-1)*NumberOfRings+NumberOfSegments/2*NumberOfRings,1)'], ones(1,2*NumberOfRings+2),'FaceColor','none','LineWidth',1);
end

nSegmentSelection = NumberOfSegments/2;
p4(nSegmentSelection) = patch([quadsx([1:NumberOfRings]+(nSegmentSelection-1)*NumberOfRings,1)' quadsx(NumberOfRings+(nSegmentSelection-1)*NumberOfRings,2) quadsx(2*NumberOfRings+(nSegmentSelection-1)*NumberOfRings,2) quadsx([(2*NumberOfRings):-1:(NumberOfRings+1)]+(nSegmentSelection-1)*NumberOfRings,1)'], [quadsy([1:NumberOfRings]+(nSegmentSelection-1)*NumberOfRings,1)' quadsy(NumberOfRings+(nSegmentSelection-1)*NumberOfRings,2) quadsy(2*NumberOfRings+(nSegmentSelection-1)*NumberOfRings,2) quadsy([(2*NumberOfRings):-1:(NumberOfRings+1)]+(nSegmentSelection-1)*NumberOfRings,1)'], ones(1,2*NumberOfRings+2),'FaceColor','none','LineWidth',1);
p5(nSegmentSelection) = patch([quadsx([1:NumberOfRings]+(nSegmentSelection-1)*NumberOfRings+NumberOfSegments/2*NumberOfRings,1)' quadsx(NumberOfRings+(nSegmentSelection-1)*NumberOfRings+NumberOfSegments/2*NumberOfRings,2) quadsx(mod(2*NumberOfRings+(nSegmentSelection-1)*NumberOfRings+NumberOfSegments/2*NumberOfRings,NumberOfSegments*NumberOfRings),2) quadsx(mod([(2*NumberOfRings):-1:(NumberOfRings+1)]+(nSegmentSelection-1)*NumberOfRings+NumberOfSegments/2*NumberOfRings,NumberOfSegments*NumberOfRings),1)'], [quadsy([1:NumberOfRings]+(nSegmentSelection-1)*NumberOfRings+NumberOfSegments/2*NumberOfRings,1)' quadsy(NumberOfRings+(nSegmentSelection-1)*NumberOfRings+NumberOfSegments/2*NumberOfRings,2) quadsy(mod(2*NumberOfRings+(nSegmentSelection-1)*NumberOfRings+NumberOfSegments/2*NumberOfRings,NumberOfSegments*NumberOfRings),2) quadsy(mod([(2*NumberOfRings):-1:(NumberOfRings+1)]+(nSegmentSelection-1)*NumberOfRings+NumberOfSegments/2*NumberOfRings,NumberOfSegments*NumberOfRings),1)'], ones(1,2*NumberOfRings+2),'FaceColor','none','LineWidth',1);

hold off;
axis square

%% Main game - we do an event based game mechanic via keypressfcn of the figure
CurrentSelectRing = 1;
CurrentSelectSegment = 1;

% select innermost ring
set(p2(CurrentSelectRing),'LineWidth',3);
set(p3(CurrentSelectRing),'LineWidth',3);

%% attaching data to figure
setappdata(handleFigure,'CurrentSelectRing',CurrentSelectRing);
setappdata(handleFigure,'CurrentSelectSegment',CurrentSelectSegment);
setappdata(handleFigure,'p1',p1);
setappdata(handleFigure,'p2',p2);
setappdata(handleFigure,'p3',p3);
setappdata(handleFigure,'p4',p4);
setappdata(handleFigure,'p5',p5);
setappdata(handleFigure,'mode',0); % 0: ring, 1: segment
setappdata(handleFigure,'WheelColors',WheelColors);
setappdata(handleFigure,'cmap',cmap);
setappdata(handleFigure,'NumberOfRings',NumberOfRings);
setappdata(handleFigure,'NumberOfSegments',NumberOfSegments);
% setting callback for keypress
set(handleFigure,'keypressfcn',@KeypressInput);

%% move pieces according to keypress, see preamble for controls
function KeypressInput(hrsc, evt)
  disp(evt.Character);
  % get data from figure
  CurrentSelectRing = getappdata(hrsc,'CurrentSelectRing');
  CurrentSelectSegment = getappdata(hrsc,'CurrentSelectSegment');
  p1 = getappdata(hrsc,'p1');
  p2 = getappdata(hrsc,'p2');
  p3 = getappdata(hrsc,'p3');
  p4 = getappdata(hrsc,'p4');
  p5 = getappdata(hrsc,'p5');
  WheelColors = getappdata(hrsc,'WheelColors');
  cmap = getappdata(hrsc,'cmap');
  NumberOfRings = getappdata(hrsc,'NumberOfRings');
  NumberOfSegments = getappdata(hrsc,'NumberOfSegments');
  % toggle mode between ring and segment
  mode = getappdata(hrsc,'mode');
  if (evt.Key == 'space')
    mode = ~mode;
    setappdata(hrsc,'mode',mode);
  end
  % hide old selection
  set(p2(CurrentSelectRing),'LineWidth',1);
  set(p3(CurrentSelectRing),'LineWidth',1);
  set(p4(CurrentSelectSegment),'LineWidth',1);
  set(p5(CurrentSelectSegment),'LineWidth',1);
   
  if ~mode % ring mode
    % select new ring based on input
    % move ring selection up
    if evt.Character == 'w'
      CurrentSelectRing = min(CurrentSelectRing + 1,NumberOfRings);
    end
    % move ring selection down
    if evt.Character == 's'
      CurrentSelectRing = max(CurrentSelectRing - 1,1);
    end
    % rotate ring colors
    if evt.Character == 'a'
      WheelColors = [WheelColors(1:CurrentSelectRing-1,:);circshift(WheelColors(CurrentSelectRing,:),1);WheelColors(CurrentSelectRing+1:end,:)];
      colormap(cmap(WheelColors(:),:));
    end
    % rotate ring colors
    if evt.Character == 'd'
      WheelColors = [WheelColors(1:CurrentSelectRing-1,:);circshift(WheelColors(CurrentSelectRing,:),-1);WheelColors(CurrentSelectRing+1:end,:)];
      colormap(cmap(WheelColors(:),:));
    end
    % update selection
    set(p2(CurrentSelectRing),'LineWidth',3);
    set(p3(CurrentSelectRing),'LineWidth',3);
    % update appdata
    setappdata(hrsc,'CurrentSelectRing',CurrentSelectRing);
    setappdata(hrsc,'WheelColors',WheelColors);
  else % segment mode
    % select new segment based on input
    % move segment select counterclockwise
    if evt.Character == 'a'
      CurrentSelectSegment = mod(CurrentSelectSegment + 1,NumberOfSegments/2);
      if CurrentSelectSegment == 0
        CurrentSelectSegment = NumberOfSegments/2;
      end
    end
    % move segment select clockwise
    if evt.Character == 'd'
      CurrentSelectSegment = mod(CurrentSelectSegment - 1,NumberOfSegments/2);
      if CurrentSelectSegment == 0
        CurrentSelectSegment = NumberOfSegments/2;
      end
    end
    % shift segment up
    if evt.Character == 'w'
      if CurrentSelectSegment > NumberOfSegments/2
        nshift = 1;
      else
        nshift = -1;
      end
      shiftindex = mod(CurrentSelectSegment+NumberOfSegments/2,NumberOfSegments);
      if shiftindex == 0
        shiftindex = NumberOfSegments;
      endif
    
      tmp_column = [WheelColors(:,CurrentSelectSegment); flipud(WheelColors(:,shiftindex))];

      shift_column = circshift(tmp_column,nshift);

      WheelColors(:,CurrentSelectSegment) = shift_column(1:end/2);
      WheelColors(:,shiftindex) = flipud(shift_column((end/2+1):end));

      colormap(cmap(WheelColors(:),:));
    end  
    % shift segment down
    if evt.Character == 's'
      if CurrentSelectSegment > NumberOfSegments/2
        nshift = -1;
      else
        nshift = 1;
      end
      shiftindex = mod(CurrentSelectSegment+NumberOfSegments/2,NumberOfSegments);
      if shiftindex == 0
        shiftindex = NumberOfSegments;
      endif
      
      tmp_column = [WheelColors(:,CurrentSelectSegment); flipud(WheelColors(:,shiftindex))];
      
      shift_column = circshift(tmp_column,nshift);
      
      WheelColors(:,CurrentSelectSegment) = shift_column(1:end/2);
      WheelColors(:,shiftindex) = flipud(shift_column((end/2+1):end));
      
      colormap(cmap(WheelColors(:),:));
    end
    set(p4(CurrentSelectSegment),'LineWidth',3);
    set(p5(CurrentSelectSegment),'LineWidth',3);
    % update appdata
    setappdata(hrsc,'CurrentSelectSegment',CurrentSelectSegment);
    setappdata(hrsc,'WheelColors',WheelColors);
  end
end