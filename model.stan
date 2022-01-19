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
  matrix[3, 3] Sigma;
  vector[n] e1;
  vector[n] e2;
  matrix[n, 3] uee;

  for (i in 1:3) {
  	for (j in 1:3) {
  	  if (i == j) {
  	  	Sigma[i, j] = sigma[i];
  	  } else {
  	  	Sigma[i, j] = .001;
  	  }
  	}
  }

  sigma ~ gamma(1, 1);
  u ~ normal(0, sigma[1]);
  a ~ normal(0, 1);
  b ~ normal(0, 1);
  c ~ normal(0, 1);

  # assume pos effect of u on edu and wage
  edu ~ normal(a[1] + b[1] * male + c[1] * u, sigma[2]);
  wage ~ normal(a[2] + b[2] * edu + b[3] * male + c[2] * u, sigma[3]);
  e1 = edu - (a[1] + b[1] * male + c[1] * u);
  e2 = wage - (a[2] + b[2] * edu + b[3] * male + c[2] * u);
  uee[, 1] = u;
  uee[, 2] = e1;
  uee[, 3] = e2;
  // for (i in 1:n) {
  //	uee[i] ~ multi_normal(rep_vector(0, 3), Sigma);
  //}
  
}