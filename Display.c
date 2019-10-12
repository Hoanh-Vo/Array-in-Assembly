//Author: Hoanh Vo
//Author email: hvo123@csu.fullerton.edu
//Assigment 4
//Program name: Summation of Array

//Purpose: This function print out all array's elememts which's in Control.asm 
//language: C


#include"stdio.h"

extern void show_array(long int arr[], long int size);

//note: long int  is qword (8bytes in 64bits CPU)
void show_array(long int arr[], long int size)
{
	printf("Funtion show_array in Display module, written in C, has begun execution.\n"); 
 	
 	for ( long int i = 0; i < size; i++)
 	{
 		printf("Array's member #%ld:\t%ld \n",i,arr[i]);
 		
 	}
}//End of Dislay

