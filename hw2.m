function hw2()

    load('bim488_hw2.mat');
    
    w_init1=[1,1,-0.5].';
    w_init2=[1,1,0.5].';

    rho = 0.01;
    
    finalw1=perceptron(classes,class_labels,w_init1,rho);
    finalw2=perceptron(classes,class_labels,w_init2,rho);
    
    disp(strcat('Final weight vector for w_init1 is [ ',num2str(finalw1(1,1)),{' '},num2str(finalw1(2,1)),{' '},num2str(finalw1(3,1)),' ]'));
    disp(strcat('Final weight vector for w_init2 is [ ',num2str(finalw2(1,1)),{' '},num2str(finalw2(2,1)),{' '},num2str(finalw2(3,1)),' ]'));

    
    plotline(finalw1);
    hold;
    plotline(finalw2);
    plot(classes(1,:),classes(2,:),'b.');
    axis([0 5 0 5]);
    
    
end
function plotline(line)
    a=line(1,1);
    b=line(2,1);
    c=line(3,1);
    x=0:0.01:5;
    y=(-a*x - c )/b;
    plot(x,y);
end
