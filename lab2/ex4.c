/*  Exercise 1 */

#include <stdio.h>


main(){
  	int input;
  	printf("Please enter a number from 1 to 5:\n");
  	scanf("%d", &input);
	if(input>=1 && input<=5){
  		for(int i=1; i<=input; i++){
			printf("%d Hello World\n", i);
		}	
	}
	else{
	printf("Number is not in the range from 1 to 5\n");
	}
  return;
}

