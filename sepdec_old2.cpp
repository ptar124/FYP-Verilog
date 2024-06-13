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

//prefix last word of line with the a/b, remove semicolons
std::string prefixLastWordWith(const std::string& line, const std::string& prefix) {
    std::istringstream iss(line);
    std::string word;
    std::vector<std::string> words;

    while (iss >> word) {
        words.push_back(word);
    }

    // Remove ; from last word
    if (!words.empty()) {
        std::string& lastWord = words.back();
        if (!lastWord.empty() && lastWord.back() == ';') {
            lastWord.pop_back();
        }
        lastWord = prefix + lastWord;
    }

    // Combine words into a single string with commas
    std::string result;
    for (size_t i = 0; i < words.size(); ++i) {
        result += words[i];
        if (i != words.size() - 1) {
            result += " ";
        }
    }

    return result;
}

// Function to get the size of the "out" signal from a file
int getOutputSize(const std::string& fileName) {
    std::ifstream file(fileName);
    if (!file.is_open()) {
        std::cerr << "Error: could not open file '" << fileName << "'" << std::endl;
        return -1;
    }

    std::string line;
    const std::string outPrefix = "output wire ";
    while (std::getline(file, line)) {
        std::string trimmedLine = trimLeadingWhitespace(line);
        if (trimmedLine.find(outPrefix) == 0 && trimmedLine.find(" out;") != std::string::npos) {
            size_t start = trimmedLine.find("[");
            size_t end = trimmedLine.find("]");
            if (start != std::string::npos && end != std::string::npos) {
                std::string sizeStr = trimmedLine.substr(start + 1, end - start - 1);
                int size = std::stoi(sizeStr);
                file.close();
                return size;
            }
        }
    }

    file.close();
    return -1;  // Return -1 if not found
}

void processFile(const std::string& inputFileName, const std::string& outputFileName, const std::string& prefix, int maxOutputSize, bool addResultDeclaration) {
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

    // Add the output reg declaration for result if specified
    if (addResultDeclaration) {
        outputFile << "output reg [" << maxOutputSize << ":0] result" << std::endl;
    }

    inputFile.close();
    outputFile.close();

    std::cout << "Processed " << inputFileName << ". Output: " << outputFileName << std::endl;
}

int main() {
    // Get the sizes of the "out" signal from goodbranch.v and badbranch.v
    int goodbranchSize = getOutputSize("goodbranch.v");
    int badbranchSize = getOutputSize("badbranch.v");

    if (goodbranchSize == -1 || badbranchSize == -1) {
        std::cerr << "Error: could not determine the size of the 'out' signal in one of the input files." << std::endl;
        return 1;
    }

    // Determine the larger size
    int maxOutputSize = std::max(goodbranchSize, badbranchSize);

    processFile("goodbranch.v", "goodbranchdec.txt", "a_", maxOutputSize, false);
    processFile("badbranch.v", "badbranchdec.txt", "b_", maxOutputSize, true);

    return 0;
}
