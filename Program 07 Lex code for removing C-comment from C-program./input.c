#include <stdio.h>
#include <string.h>

int main() {
    char str[100]; // Declare a character array to store the input string
    
    printf("Enter a string: "); // Prompt the user to enter a string
    scanf("%s", str); // Read the input string from the user and store it in the str array
    
    if (strcmp(str, "coder") == 0) { // Compare the input string with the string "coder"
        printf("knockcat is Vishal Joshi\n"); // If the input string is "coder", print "knockcat is Vishal Joshi"
    } else {
        printf("You entered: %s\n", str); // If the input string is not "coder", print the user's input
    }
    
    return 0; // Return 0 to indicate successful program completion
}

