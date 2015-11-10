function [ features ] = GetBadFeatures( image, location )

    x = location(:,2);
    y =  location(:,1);
    pt = [ x, y ];
    [ img_g ] = PrepImage( image );

    [ imgX, imgY ] = size(img_g);
    %Determine loop size based on the number of locations in list
    [locX, ~] = size(pt);
    
    features = cell(locX);

    for i = 1: locX
       xPt = pt(i,1);
       yPt = pt(i,2);

       feature = img_g( (yPt-2):(yPt+2),(xPt-2):(xPt+2) );
       
       features{i} = [];
       for j=1: 5
           for k=1:5
               features{i} = [features{i} feature(j,k)];
           end
       end
    end
end