#include <iostream>
#include <fstream>
#include <string>
#include <algorithm>
#include <cctype>

std::string trimLeadingWhitespace(const std::string& str) {
    size_t start = str.find_first_not_of(" \t");
    return (start == std::string::npos) ? "" : str.substr(start);
}

void processFile(const std::string& inputFileName, const std::string& outputFileName) {
    std::ifstream inputFile(inputFileName);
    std::ofstream outputFile(outputFileName);

    if (!inputFile.is_open()) {
        std::cerr << "Error: could not open input file " << inputFileName << std::endl;
        return;
    }

    if (!outputFile.is_open()) {
        std::cerr << "Error: could not open output file " << outputFileName << std::endl;
        inputFile.close();
        return;
    }

    const std::string excludedPrefixes[] = {"wire ", "reg ", "input ", "output ", "module", "endmodule"};

    std::string line;
    while (std::getline(inputFile, line)) {
        std::string trimmedLine = trimLeadingWhitespace(line);

        bool excludeLine = false;
        for (const auto& prefix : excludedPrefixes) {
            if (trimmedLine.compare(0, prefix.size(), prefix) == 0) {
                excludeLine = true;
                break;
            }
        }

        if (!excludeLine) {
            outputFile << line << std::endl;
        }
    }

    inputFile.close();
    outputFile.close();

    std::cout << "Processed " << inputFileName << ". Output: " << outputFileName << std::endl;
}

int main() {

    processFile("goodbranch.v", "goodbranchcontent.txt");
    processFile("badbranch.v", "badbranchcontent.txt");

    return 0;
}
