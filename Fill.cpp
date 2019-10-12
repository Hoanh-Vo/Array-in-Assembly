//Author: Hoanh Vo
//Author email: hvo123@csu.fullerton.edu
//Assigment 4
//Program name: Summation of Array

//Purpose: This function get user's input to an array which was initialized in Control module 
//language: C++




#include<iostream>
#include<string>
//#include<limits>

using namespace std;

//Prototype: the prefix extern "C" is required because the C++ compiler will be used to compile this file.
extern "C" long getInput(long int arr[], long int size);

//note long int  is qword (8bytes in 64bits CPU)
long getInput(long int arr[], long int size)
{
	
	cout << "Funtion getInput in Fill module, written in C++, has begun execution" << endl;
 	
 	long counter = 0;	//keep track of how many elements the user putin
 	long input;	//hold the user's current input
 	cout<<"Enter the array and press Ctr+D when you done: ";

 
 	
 	while(counter < size && !cin.eof())
 	{
 		cin>>input;
 		if(!cin.fail())	//only accepting the valid inputs
 		{
 			arr[counter] = input;
 			counter++;
 		}
 		
	 	
	 	
 	}
 	
 	/*
 	In order to clear the input buffer after the user has entered too many characters, you will need to clear the status flags of the input stream and then ignore all cahracters up to the newline. This can be done like so: cin.clear(); cin.ignore(numeric_limits<streamsize>::max(), '\n');
 	*/
 	//cin.ignore(numeric_limits<streamsize>::max(), '\n');
 	cin.clear();		
 	return counter;  //send the counter back to control module
}//End

