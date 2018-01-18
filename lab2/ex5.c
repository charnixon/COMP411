/*  Exercise 5 */

#include <stdio.h>


main(){
  	int input;
  	printf("Number [1-100]: ?\n");
  	scanf("%d", &input);
	while(input != 0){
		if(input == 1){
			printf("Non-prime (special case)\n");
		}
		else{
			int i;
			for(i=2; (2*i)<input; i++){
				if(input%i == 0){
					printf("Non-prime, divisible by %d\n",i);
					break;
				}
			}
			if(2*i == (input-1)){
				printf("Prime\n");
			}
		}
		printf("Number [1-100]: ?\n");
	  	scanf("%d", &input);
	}
	return;
}

