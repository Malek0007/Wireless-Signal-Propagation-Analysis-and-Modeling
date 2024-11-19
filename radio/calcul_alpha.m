function alpha=calcul_alpha(A,d0,k)
  num=0;
  denom=0; 
  for i=1:k
    num=num+A(i,5)*10*log10(A(i,4)/d0);
    denom=denom+(10*log10(A(i,4)/d0))^2;
  end
  alpha=(-num/denom);
end