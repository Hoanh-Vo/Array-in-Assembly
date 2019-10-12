//Author: Hoanh Vo
//Author email: hvo123@csu.fullerton.edu
//Assigment 4
//Program name: Summation of Array

//Purpose: This program is the Driver of the program
//language: C



#include "stdio.h"

extern long  introduction();

int main()
{
	long   a;   //hold the 
 	
 	
 	printf("Welcome to An Array of Numbers -- the main module has been running.\n");
 	printf("This program is brought to you by Hoanh Vo.\n");
 	a = introduction();
 	
 	
 	printf("This driver program has received the sum of the array = %lX (in hexadecimal) from the control module.\n",  a);
 	printf("Finally! I feel so great.\n");
 	printf("The Main returns 0 to the operating system. Have a great day!\n");
 	return 0;
}//End of main
