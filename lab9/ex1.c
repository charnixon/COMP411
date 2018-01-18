/*  Exercise 1 */

#include <stdio.h>


main()
{
  	int fib, input = 1;
	while(integer != 0){
		scanf("%d", &input);
		fib = fibonacci(input);
		printf("%d\n", fib);
	}
	return;
}
int fibonacci(int n){
	if(n=0) return 0;
	if(n=1) return 1;
	return fibonacci(n-1)+factorial(n-2);
}
