function sigma=calcul_deviation(A,d0,alpha,k)
n=length(A);
E=0;
  for i=1:k
      E=E+(A(i,5)+10*alpha*log10(A(i,4)/d0))^2; 
  end
 
  sigma=sqrt(E/n);
end