pfa = 10e-4;
pd = 0.999;

loc_pfa = norminv(pfa)
loc_pd  = norminv(1-0.999);

%Noise only distribution
x_H0 = -3:.1:3;
pd_H0 = makedist('Normal')
pdf_normal_H0 = pdf(pd_H0,x_H0);
plot(x_H0,pdf_normal)
hold on

%Noise and signal distribution
x_H1 = -3:.1:3;
pd_H1 = makedist('Normal')
pdf_normal_H1 = pdf(pd_H1,x_H1);
plot(x_H1,pdf_normal)

xline(loc_pd)


