#include <stdio.h>
#include <string.h>

int main() {
    char str[100]; 
    
    printf("Enter a string: "); 
    scanf("%s", str); 
    
    if (strcmp(str, "coder") == 0) { 
        printf("knockcat is Vishal Joshi\n"); 
    } else {
        printf("You entered: %s\n", str); 
    }
    
    return 0; 
}

