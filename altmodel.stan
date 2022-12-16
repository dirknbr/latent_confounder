data {
  int n;
  vector[n] wage;
  vector[n] edu;
  vector[n] male;
}

parameters {
  vector[2] a;
  vector[3] b;
  vector<lower=0>[2] sigma;
}

model {

  sigma ~ gamma(1, 1);
  a ~ normal(0, 1);
  b ~ normal(0, 1);

  edu ~ normal(a[1] + b[1] * male, sigma[1]);
  wage ~ normal(a[2] + b[2] * edu + b[3] * male, sigma[2]);  
}
