#include <iostream>
#include <fstream>
#include <string>
#include <algorithm>
#include <cctype>
#include <sstream>

std::string trimLeadingWhitespace(const std::string& str) {
    size_t start = str.find_first_not_of(" \t");
    return (start == std::string::npos) ? "" : str.substr(start);
}

// Function to get the size of the "out" signal from a file
int getOutputSize(const std::string& fileName) {
    std::ifstream file(fileName);
    if (!file.is_open()) {
        std::cerr << "Error: could not open file '" << fileName << "'" << std::endl;
        return -1;
    }

    std::string line;
    const std::string outPrefix = "output reg ";
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

void processFile(const std::string& inputFileName, const std::string& outputFileName, int maxOutputSize, bool addResultDeclaration) {
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

    std::string line;
    std::vector<std::string> lines;

    while (std::getline(inputFile, line)) {
        std::string trimmedLine = trimLeadingWhitespace(line);

        if (trimmedLine.find("output ") == 0) {
            line.replace(line.find("output "), 6, "input ");
        }
        
        size_t pos = 0;
        while ((pos = line.find("reg", pos)) != std::string::npos) {
            line.replace(pos, 3, "wire");
            pos += 4; // Move past the replaced "wire"
        }

        lines.push_back(line);
    }

    for (size_t i = 0; i < lines.size(); ++i) {
        outputFile << lines[i];
        if (i != lines.size() - 1) {
            outputFile << std::endl;
        } else if (addResultDeclaration) {
            outputFile << "," << std::endl;
        }
    }

    // Add the output reg declaration for result if specified
    if (addResultDeclaration) {
        outputFile << "output reg [" << maxOutputSize << ":0] result" << std::endl;  // No semicolon
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

    // Process goodbranchdec.txt without adding the result declaration
    processFile("goodbranchdec.txt", "goodbranchrminout.txt", maxOutputSize, false);

    // Process badbranchdec.txt and add the result declaration
    processFile("badbranchdec.txt", "badbranchrminout.txt", maxOutputSize, true);

    return 0;
}
