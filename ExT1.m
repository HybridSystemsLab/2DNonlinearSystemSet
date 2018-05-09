%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simulation of Examples from TOOLS FOR THE STUDY OF STABILITY AND CONVERGENCE IN SET
% DYNAMICAL SYSTEMS WITH APPLICATIONS TO FEEDBACK CONTROL
% Example: 3 Set Convergence
% Nathalie Risso. nrisso@email.arizona.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X0=newset2d([-0.6,0.6],[-0.6,0.6],200);
J=4;
[f,c]=size(X0);
X=zeros(f,2,J);
X(:,:,1)=X0;
for j=1:J-1
    for i_f=1:f
    X(i_f,1,j+1)=(X(i_f,1,j)).*(X(i_f,1,j));
    X(i_f,2,j+1)=(X(i_f,1,j)).*(X(i_f,2,j));
    end
    end
% plots
figure(1)
for i=1:J
   plot3(X(:,1,i),X(:,2,i),0*X(:,2,i)+i-1,'LineWidth',2); 
%   xlabel('$x_1$', 'Interpreter','latex');ylabel('$x_2$', 'Interpreter','latex');zlabel('j', 'Interpreter','latex')
   xlim([-0.8,0.8]); ylim([-0.8,0.8]);
   hold on;
   grid on
end
print -depsc -tiff -r300 SetConv
figure(2)
for i=1:J
   subplot(1,2,1)
   plot(X(:,1,i),0*X(:,2,i)+i-1,'b','LineWidth',3); grid on; hold on;
   xlabel('$x_1$', 'Interpreter','latex'); ylabel('j', 'Interpreter','latex');
end
for i=1:J
    subplot(1,2,2)
    plot(X(:,2,i),0*X(:,2,i)+i-1,'b', 'LineWidth',2 ); 
    xlabel('$x_2$', 'Interpreter','latex'); ylabel('j', 'Interpreter','latex');
   hold on;
   grid on
end

% This function creates a square 2D set for two vectors
% specifying set limits:
% x = [xmin xmax]
% y = [ymin ymax]
% d = number of points in the original set
function X=newset2d(x,y,d)
% if nargin<3
%     d=0.5;
% else
%     d=d1;
% end
% x1=x(1):d:x(2);
% x2=y(1):d:y(2);
x1=linspace(x(1),x(2),d);
x2=linspace(y(1),y(2),d);
[A,B]=meshgrid(x1,x2);
X=[A(:),B(:)];
end
