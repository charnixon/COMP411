/*  Exercise 6 */

#include <stdio.h>


main(){
  	int input;
  	printf("Number [1-1000]: ?\n");
  	scanf("%d", &input);
	while(input != 0){
		int n1 = 0, n2 = 1, n3 = 0;
		while(n3 < input){
			n3 = n1 + n2;
			n1 = n2;
			n2 = n3;
		}
		if(n3 = input){
			printf("Fibonacci number\n");
		}
		else{
			printf("Not a Fibonacci number\n");
		}	
		printf("Number [1-1000]: ?\n");
	  	scanf("%d", &input);
	}
	return;
}

