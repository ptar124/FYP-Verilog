#include <iostream>
#include <fstream>
#include <string>
#include <sstream>

std::string removeTrailingSemicolon(const std::string& word) {
    if (!word.empty() && word.back() == ';') {
        return word.substr(0, word.size() - 1);
    }
    return word;
}

void processFile(const std::string& inputFileName, const std::string& outputFileName) {
    std::ifstream inputFile(inputFileName);
    std::ofstream outputFile(outputFileName);

    if (!inputFile.is_open()) {
        std::cerr << "Could not open input file " << inputFileName << std::endl;
        return;
    }

    if (!outputFile.is_open()) {
        std::cerr << "Could not open output file " << outputFileName << std::endl;
        inputFile.close();
        return;
    }

    std::string line;
    std::string lastWord;
    bool firstWord = true;

    while (std::getline(inputFile, line)) {
        std::istringstream iss(line);
        std::string word;
        while (iss >> word) {
            lastWord = word;
        }

        lastWord = removeTrailingSemicolon(lastWord);

        if (firstWord) {
            outputFile << lastWord;
            firstWord = false;
        } else {
            outputFile << "\n" << lastWord;
        }
    }

    inputFile.close();
    outputFile.close();

    std::cout << "Processed " << inputFileName << ". Output: " << outputFileName << std::endl;
}

int main() {
    processFile("goodbranchdec.txt", "goodbranchinst.txt");
    processFile("badbranchdec.txt", "badbranchinst.txt");

    return 0;
}
