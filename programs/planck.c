#include <stdio.h>
#include <math.h>

int main()
{
  double wave,T;
  double p = 1.19106e+27;
  double p1;
  int ni;

  printf("\nEnter the wavelength in Angtroms > ");
  ni = scanf("%lf",&wave);
  printf("\nEnter the temperature in Kelvin > ");
  ni = scanf("%lf",&T);

  p1 = p/(pow(wave,5.00)*(exp(1.43879e+08/(wave*T)) - 1.0));

printf("The Planck function at %7.2f A and %7.2f K in %e\n",wave,T,p1);
return(0);
}
