/*  Exercise 1 */

#include <stdio.h>


main(){
  	int n1,n2,n3,n4,n5;
  	printf("Enter five floating-point numbers:\n");
  	scanf("%f", &n1);
	scanf("%f", &n2);
	scanf("%f", &n3);
	scanf("%f", &n4);
	scanf("%f", &n5);
	float sum = n1+n2+n3+n4+n5;
	float mean = sum/5;
	float product = n1*n2*n3*n4*n5;
	printf("Sum is %.4f\n", sum);
	printf("Mean is %.4f\n", mean);
	printf("Product is %.4f\n", product);
  return;
}

