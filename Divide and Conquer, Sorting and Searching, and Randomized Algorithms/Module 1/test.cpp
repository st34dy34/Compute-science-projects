#include <iostream>
using namespace std;

string writeMenu(){
    cout << "Choose option!" << endl;
    cout << "1. Karatsuba algorithm" << endl;
}

int RecAlg(int num1, int num2){

}

int main() {
    cout << "Hello World!" << endl;
    int option = 0;
    int num1 = 0;
    int num2 = 0;
    while (true){
        writeMenu();
        cin >> option;
        switch(option){
            case 1:
                cin >> "Enter first number" >> num1;
                cin >> "Enter second number" >> num2;
                cout << RecAlg(num1,num2);
            default:
                cout << "I dont understand..." << endl;
        }
    }
    return 0;
}