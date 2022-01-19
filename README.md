# Estimating a latent confounder with Bayesian model

We have three observed variables: gender, education and wage. We know that IQ 
also influences education (outcome) and wage, but it's unobserved.

$edu_i = a_1 + c_1 \hat{iq_i} + b_1 male_i + \epsilon_1$

$wage_i = a_2 + c_2 \hat{iq_i} + b_2 male_i + b_3 edu_i + \epsilon_2$

$\hat{iq_i} \sim N(0, \sigma)$ is latent

and we constrain c to have positive priors. 

So we can exploit the fact that iq appears in two equations, it's the 
shared hidden factor or edu and wage. 

## Posterior

The posterior results look similar to our simulation parameters

           mean     sd  hdi_3%  hdi_97%  ...  mcse_sd  ess_bulk  ess_tail  r_hat
a[0]      0.836  0.223   0.388    1.224  ...    0.007     440.0     686.0   1.00
a[1]      0.562  0.322  -0.025    1.161  ...    0.052      32.0     167.0   1.07
b[0]     -0.650  0.288  -1.168   -0.095  ...    0.009     475.0    1151.0   1.00
b[1]      1.238  0.312   0.604    1.645  ...    0.067      14.0      45.0   1.12
b[2]      0.899  0.328   0.256    1.470  ...    0.035      65.0     288.0   1.05
c[0]      0.870  0.612   0.003    1.953  ...    0.067      43.0     134.0   1.03
c[1]      0.793  0.547   0.036    1.780  ...    0.051      68.0     143.0   1.03
sigma[0]  1.094  0.879   0.080    2.841  ...    0.253       7.0      30.0   1.23
sigma[1]  1.259  0.398   0.506    1.753  ...    0.105      10.0      44.0   1.16
sigma[2]  1.133  0.287   0.503    1.517  ...    0.027      68.0     110.0   1.01

The correlation between estimated u and actual iq is 0.76.

