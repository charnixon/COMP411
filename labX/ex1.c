/*Recursive Merge-Sort*/

#include <stdio.h>


void mergeSort(int arr[], int lo, int hi, int tmp[])
{
	if (lo == hi) 
		return;
	int mid = (lo + hi)/2;

	mergeSort(arr, lo, mid, tmp);
	mergeSort(arr,mid+1,hi, tmp);

	int leftPos = lo; 
	int leftEnd = mid;
	int rightPos = mid+1; 
	int rightEnd = hi;

	int numElements = rightEnd - leftPos + 1;
	
	int tmpPos = leftPos;
	
	while (leftPos <= leftEnd && rightPos <= rightEnd)
		if (arr[leftPos] <= arr[rightPos]) 
			tmp[tmpPos++] = arr[leftPos++];
		else 
			tmp[tmpPos++] = arr[rightPos++];
	while (leftPos <= leftEnd)   
		tmp[tmpPos++] = arr[leftPos++];
	while (rightPos <= rightEnd) 
		tmp[tmpPos++] = arr[rightPos++];
	int i;
	for (i=0; i< numElements; i++, rightEnd--) 
		arr[rightEnd] = tmp[rightEnd];
}

main()
{
	int i, n, arr[50];
	scanf("%d", &n);
	for(i=0; i<n; i++)
		scanf("%d", &arr[i]);
	int  tmp[50];
	mergeSort(arr, 0, n, tmp);
	for(i=0; i<n; i++)
		printf("%d\n", arr[i]);
}

	
