/*  Exercise 1 */

#include <stdio.h>


main()
{
  	int fact, integer = 1;
	char ascii[20];
	while(integer != 0){
		fgets(ascii, 20, stdin);
		integer = a_to_i(ascii);
		fact = factorial(integer);
		printf("%d\n", fact);
	}
	return;
}
int a_to_i(char* str)
{
	int i=0, result=0;
	for(; str[i+1]; ++i)
		result = (result*10)+str[i]-'0';
	return result;
}
int factorial(int n){
	if(n==0) return 1;
	else return n*factorial(n-1);
}
