/*  Exercise 1 */

#include <stdio.h>


main()
{
  	int integer = 1;
	char ascii[20];
	while(integer != 0){
		fgets(ascii, 20, stdin);
		integer = a_to_i(ascii);
		printf("%d\n", integer);
	}
	return
}
int a_to_i(char* str)
{
	int i, result;
	for(i = 0; str[i] != '\0'; i++)
		result = (result*10)+str[i];
	return result;
}
