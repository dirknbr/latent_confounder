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

The posterior results look similar to our simulation parameters, they can be seen 
in the posterior.png file.

The correlation between estimated u and actual iq is 0.77.

