/*  Exercise 1 */

#include <stdio.h>


main(){
  	int num, bin, i;
	scanf("%d", &num);
	while(num !=0){
		int const = 128;
		for(i = 0; i<8, i++){
			if(const & num == 1)
				printf("1");
			else
				printf("0");
		const = const >> 1;
		}
		printf("%d\n", &bin);
		scanf("%d", &num);
	}
  	return;
}

