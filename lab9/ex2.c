
#include <stdio.h>  
#include <string.h> 

void bedtimestory(char words[20][15], int current, int number) {
	int i;
	if(current == 0){
		printf("A %s couldn't sleep, so her mother told a story about a little %s,\n", words[0], words[1]);
	}
	else if(current < number-1){
		for(i=0; i<current; i++){
			printf(" ");
		}
		printf("who couldn't sleep, so the %s's mother told a story about a little %s,", words[current], words[current+1]);
	}
	if(current != number)
		bedtimestory(words, current+1, number);
	for(i=0; i<current; i++){
			printf(" ");
		}
	if(current == number)
		printf("... who fell asleep;\n");
	else if(current != 0)
		printf("... and then the little %s fell asleep;", words[current]);
	else
		printf("... and then the %s fell asleep;", words[0]);
}
main()
{
  char names[20][15];
  char end[4]="END\n";
  int num=0;
  fgets(names[0], 15, stdin);
  while(strcmp(names[num],end) != 0){
	num++;
	fgets(names[num], 15, stdin);
  }
  num--;
  bedtimestory(names, 0, num);

  return;
}
