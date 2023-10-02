function [aRatio, height, width, firstCol, firstRow] = computeAspectRatio(image)
    [tmp, num_rows, num_cols] = size(image);
    firstRow=0;
    lastRow=0;
    firstCol=0;
    lastCol=0;
  
    % Fill your code
    %find the first row
    img=squeeze(image);
    for i=1:num_rows
        
      if sum(img(i, :))>1 
        firstRow=i;
        break;
      end
    end
    
    for i=num_rows:-1:firstRow
        if sum(img(i,:))>1
            lastRow=i;
            break;
        end
    end
    
    
   
    
     for i=1:num_cols
      if sum(img(:, i))>1 
        firstCol=i;
        break;
      end
    end
    
    for i=num_cols:-1:firstCol
        if sum(img(:,i))>1
            lastCol=i;
            break;
        end
    end
    lastRow=lastRow+0.5; %just in order to create better graphs
    firstRow=firstRow-0.5;
    lastCol=lastCol+0.5;
    firstCol=firstCol-0.5;
    height=lastRow-firstRow;
    width=lastCol-firstCol;
    aRatio=width/height;

end

