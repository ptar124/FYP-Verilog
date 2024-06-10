#include <iostream>
#include <fstream>
#include <string>
#include <algorithm>
#include <cctype>
#include <sstream>

// Function to trim leading whitespace characters
std::string trimLeadingWhitespace(const std::string& str) {
    size_t start = str.find_first_not_of(" \t");
    return (start == std::string::npos) ? "" : str.substr(start);
}

// Function to prefix the last word of the line with the specified prefix
std::string prefixLastWordWith(const std::string& line, const std::string& prefix) {
    std::istringstream iss(line);
    std::string word;
    std::string result;
    std::string lastWord;
    
    // Read all words into result and keep track of the last word
    while (iss >> word) {
        lastWord = word;
    }

    // Find the position of the last word in the original line
    size_t pos = line.rfind(lastWord);
    if (pos != std::string::npos) {
        result = line.substr(0, pos) + prefix + lastWord;
    } else {
        result = line;
    }

    return result;
}

void processFile(const std::string& inputFileName, const std::string& outputFileName, const std::string& prefix) {
    // Open the input and output files
    std::ifstream inputFile(inputFileName);
    std::ofstream outputFile(outputFileName);

    // Check if the input file is open
    if (!inputFile.is_open()) {
        std::cerr << "Error: could not open input file '" << inputFileName << "'" << std::endl;
        return;
    }

    // Check if the output file is open
    if (!outputFile.is_open()) {
        std::cerr << "Error: could not open output file '" << outputFileName << "'" << std::endl;
        inputFile.close();
        return;
    }

    // Define the prefixes we are interested in
    const std::string prefixes[] = {"wire ", "reg ", "input ", "output "};

    std::string line;
    while (std::getline(inputFile, line)) {
        // Trim leading whitespace characters from the line
        std::string trimmedLine = trimLeadingWhitespace(line);

        // Check if the trimmed line starts with any of the prefixes
        for (const auto& prefixMatch : prefixes) {
            if (trimmedLine.compare(0, prefixMatch.size(), prefixMatch) == 0) {
                std::string modifiedLine = prefixLastWordWith(line, prefix);
                outputFile << modifiedLine << std::endl;  // Write the modified line
                break;
            }
        }
    }

    // Close the files
    inputFile.close();
    outputFile.close();

    std::cout << "Processing completed for " << inputFileName << ". Check '" << outputFileName << "' for the output." << std::endl;
}

int main() {
    // Process goodbranch.v with prefix "a_"
    processFile("goodbranch.v", "goodbranchdec.txt", "a_");

    // Process badbranch.v with prefix "b_"
    processFile("badbranch.v", "badbranchdec.txt", "b_");

    return 0;
}
