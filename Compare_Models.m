tic; Solve_Homogenized_Model; th = num2str(toc);
display(['Homogenized simulation took ', th, ' seconds.'])
tic; Solve_Microscale_Model; tm = num2str(toc);
display(['Homogenized simulation took ', th, ' seconds.'])
close all; plot(x,UM(end,uN),'linewidth',2); hold on; plot(x,UH(end,uN),'--','linewidth',2)
