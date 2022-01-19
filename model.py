
import numpy as np
import stan
import arviz
import matplotlib.pyplot as plt

np.random.seed(22)

# simulate data
n = 100
iq = np.random.normal(0, 1, n) # unobserved
male = np.random.binomial(1, .5, n)
edu = 1 + iq - .6 * male + np.random.normal(0, 1, n)
wage = 1 + iq + edu + .5 * male + np.random.normal(0, 1, n)

data = {'n': n, 'wage': wage, 'edu': edu, 'male': male}

# run model
stancode = open('model.stan').read()
model = stan.build(stancode, data)
fit = model.sample(num_samples=1000, num_chains=2)
inf = arviz.from_pystan(fit)
print(arviz.summary(inf, var_names=['a', 'b', 'c', 'sigma']))

# check u estimate
u = fit['u'].mean(axis=1)
print(u.mean(), u.std())
print(np.corrcoef((u, iq)))
plt.scatter(u, iq)
plt.show()
