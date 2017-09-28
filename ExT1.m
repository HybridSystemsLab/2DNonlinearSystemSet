%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simulation of Examples from TOOLS FOR THE STUDY OF STABILITY AND CONVERGENCE IN SET
% DYNAMICAL SYSTEMS WITH APPLICATIONS TO FEEDBACK CONTROL
% Example: 3
% Nathalie Risso. nrisso@email.arizona.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%X0=newset2d([-0.6,0.6],[-0.6,0.6],200);
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
figure(8)
for i=1:J
   plot3(X(:,1,i),X(:,2,i),0*X(:,2,i)+i-1,'LineWidth',2); 
   xlabel('$x_1$', 'Interpreter','latex');ylabel('$x_2$', 'Interpreter','latex');zlabel('j', 'Interpreter','latex')
   xlim([-0.8,0.8]); ylim([-0.8,0.8]);
   hold on;
   grid on
end
figure(9)
for i=1:J
   subplot(1,2,1)
   plot(X(:,1,i),0*X(:,2,i)+i-1,'b','LineWidth',3); grid on; hold on;
  % xlimit([-0.8,0.8]);   ylimit([-0.8,0.8]); 
   xlabel('$x_1$', 'Interpreter','latex'); ylabel('j', 'Interpreter','latex');
end
for i=1:J
    subplot(1,2,2)
    plot(X(:,2,i),0*X(:,2,i)+i-1,'b', 'LineWidth',2 ); 
    xlabel('$x_2$', 'Interpreter','latex'); ylabel('j', 'Interpreter','latex');
   hold on;
   grid on
end