function []=plotImage(figureNo, image3d, height, width, firstCol, firstRow)
    
    img=squeeze(image3d);
    figure(figureNo);
    image(img)
    colormap(gray); 
    hold on;
    plot([firstCol, firstCol],[firstRow, firstRow+height], 'r', 'LineWidth' , 3);
    plot([firstCol,firstCol+width ],[firstRow+height,firstRow+height],'r', 'LineWidth' , 3 );
    plot([firstCol+width,firstCol+width],[firstRow+height,firstRow], 'r', 'LineWidth' , 3);
    plot([firstCol+width, firstCol], [firstRow,firstRow], 'r', 'LineWidth' , 3);
    grid on;
    hold off;
end