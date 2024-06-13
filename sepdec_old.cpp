#include <iostream>
#include <fstream>
#include <string>
#include <algorithm>
#include <cctype>
#include <sstream>
#include <vector>

std::string trimLeadingWhitespace(const std::string& str) {
    size_t start = str.find_first_not_of(" \t");
    return (start == std::string::npos) ? "" : str.substr(start);
}

std::string prefixLastWordWith(const std::string& line, const std::string& prefix) {
    std::istringstream iss(line);
    std::string word;
    std::vector<std::string> words;

    while (iss >> word) {
        words.push_back(word);
    }

    if (!words.empty()) {
        std::string& lastWord = words.back();
        if (!lastWord.empty() && lastWord.back() == ';') {
            lastWord.pop_back();
        }
        lastWord = prefix + lastWord;
    }

    std::string result;
    for (size_t i = 0; i < words.size(); ++i) {
        result += words[i];
        if (i != words.size() - 1) {
            result += " ";
        }
    }

    return result;
}

void processFile(const std::string& inputFileName, const std::string& outputFileName, const std::string& prefix) {
    std::ifstream inputFile(inputFileName);
    std::ofstream outputFile(outputFileName);

    if (!inputFile.is_open()) {
        std::cerr << "Error: could not open input file '" << inputFileName << "'" << std::endl;
        return;
    }

    if (!outputFile.is_open()) {
        std::cerr << "Error: could not open output file '" << outputFileName << "'" << std::endl;
        inputFile.close();
        return;
    }

    const std::string prefixes[] = {"wire ", "reg ", "input ", "output "};

    std::string line;
    std::vector<std::string> modifiedLines;

    while (std::getline(inputFile, line)) {
        std::string trimmedLine = trimLeadingWhitespace(line);

        for (const auto& prefixMatch : prefixes) {
            if (trimmedLine.compare(0, prefixMatch.size(), prefixMatch) == 0) {
                std::string modifiedLine = prefixLastWordWith(line, prefix);
                modifiedLines.push_back(modifiedLine);
                break;
            }
        }
    }

    for (size_t i = 0; i < modifiedLines.size(); ++i) {
        outputFile << modifiedLines[i];
        if (i != modifiedLines.size() - 1) {
            outputFile << ",";
        }
        outputFile << std::endl;
    }

    inputFile.close();
    outputFile.close();

    std::cout << "Processed " << inputFileName << ". Output: " << outputFileName << std::endl;
}

int main() {

    processFile("goodbranch.v", "goodbranchdec.txt", "a_");

    processFile("badbranch.v", "badbranchdec.txt", "b_");

    return 0;
}
