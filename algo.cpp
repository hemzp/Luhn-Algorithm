#include <iostream>

using std::cin;
using std::cout;


int doubleDigitValue(int digit);

int main() {
    char digit;
    int oddLengthCheckSum = 0; 
    int evenLengthCheckSum = 0;
    int position = 1;

    cout << "Enter a number: ";
    digit = cin.get();

    while(digit != 10) {  
        if(position % 2 == 0) {
            oddLengthCheckSum += doubleDigitValue(digit - '0');
            evenLengthCheckSum += digit - '0';
        } else {
            oddLengthCheckSum += digit - '0';
            evenLengthCheckSum += doubleDigitValue(digit - '0');
        }
        digit = cin.get();
        position++;
    }

    int checksum;

    if((position - 1) % 2 == 0) {
        checksum = evenLengthCheckSum;
    } else {
        checksum = oddLengthCheckSum;
    }

    cout << "Checksum is " << checksum << ". \n";

    if (checksum % 10 == 0) {
        cout << "Checksum is divisible by 10. Valid. \n";
    } else {
        cout << "Checksum is not divisible by 10. Invalid. \n";
    }

    return 0;  
}

int doubleDigitValue(int digit) {
    int doubleDigit = 2 * digit;
    int sum;

    if(doubleDigit >= 10) {
        sum = 1 + doubleDigit % 10;
    } else {
        sum = doubleDigit;
    }
    return sum;
}
