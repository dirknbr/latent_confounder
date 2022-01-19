data {
  int n;
  vector[n] wage;
  vector[n] edu;
  vector[n] male;
}

parameters {
  vector[n] u;
  vector[2] a;
  vector[3] b;
  vector<lower=0>[2] c;
  vector<lower=0>[3] sigma;
}

model {

  sigma ~ gamma(1, 1);
  u ~ normal(0, sigma[1]);
  a ~ normal(0, 1);
  b ~ normal(0, 1);
  c ~ normal(0, 1);

  // assume pos effect of u on edu and wage
  edu ~ normal(a[1] + b[1] * male + c[1] * u, sigma[2]);
  wage ~ normal(a[2] + b[2] * edu + b[3] * male + c[2] * u, sigma[3]);  
}