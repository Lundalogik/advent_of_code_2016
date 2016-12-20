// day1.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <string>
#include <iostream>
#include <sstream>
#include <algorithm>
#include <iterator>
#include <string>
#include <sstream>
#include <vector>

using namespace std;

const string DIRECTIONS = "L1, R3, R1, L5, L2, L5, R4, L2, R2, R2, L2, R1, L5, R3, L4, L1, L2, R3, R5, L2, R5, L1, R2, L5, R4, R2, R2, L1, L1, R1, L3, L1, R1, L3, R5, R3, R3, L4, R4, L2, L4, R1, R1, L193, R2, L1, R54, R1, L1, R71, L4, R3, R191, R3, R2, L4, R3, R2, L2, L4, L5, R4, R1, L2, L2, L3, L2, L1, R4, R1, R5, R3, L5, R3, R4, L2, R3, L1, L3, L3, L5, L1, L3, L3, L1, R3, L3, L2, R1, L3, L1, R5, R4, R3, R2, R3, L1, L2, R4, L3, R1, L1, L1, R5, R2, R4, R5, L1, L1, R1, L2, L4, R3, L1, L3, R5, R4, R3, R3, L2, R2, L1, R4, R2, L3, L4, L2, R2, R2, L4, R3, R5, L2, R2, R4, R5, L2, L3, L2, R5, L4, L2, R3, L5, R2, L1, R1, R3, R3, L5, L2, L2, R5";
void removeCharsFromString(string &str, char* charsToRemove) {
	for (unsigned int i = 0; i < strlen(charsToRemove); ++i) {
		str.erase(remove(str.begin(), str.end(), charsToRemove[i]), str.end());
	}
}

int _tmain(int argc, _TCHAR* argv[])
{
	istringstream iss(DIRECTIONS);
	vector<string> tokens{istream_iterator<string>{iss}, istream_iterator<string>{}};
	int x = 0;
	int y = 0;
	string token;
	char dir;
	int steps;
	int current_dir = 0;

	for (vector<string>::iterator it = tokens.begin(); it != tokens.end(); ++it) {
		token = *it;
		removeCharsFromString(token, " ,");
			
		dir = token[0];
		steps = stoi(token.substr(1));
		
		if (dir == 'R'){
			current_dir = (current_dir + 1) % 4;
		}
		if (dir == 'L'){
			current_dir = (current_dir + 4 - 1) % 4;
		}

		switch (current_dir){
		case 0:
			y += steps;
			break;
		case 1:
			x += steps;
			break;
		case 2:
			y -= steps;
			break;
		case 3:
			x -= steps;
			break;
		}

	/*		
		std::cout << "---------\n";
		std::cout << token << "\n";
		std::cout << current_dir << "\n";
		std::cout << x << "\n";
		std::cout << y << "\n";
	*/	
	}

	std::cout << "Answer:" << abs(y)+abs(x) << "\n";
}


