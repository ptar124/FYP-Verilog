#include <iostream>
#include <fstream>
#include <string>
#include <algorithm>
#include <cctype>
#include <sstream>
#include <vector>

// Function to trim leading whitespace characters
std::string trimLeadingWhitespace(const std::string& str) {
    size_t start = str.find_first_not_of(" \t");
    return (start == std::string::npos) ? "" : str.substr(start);
}

// Function to remove trailing semicolon from a line
std::string removeTrailingSemicolon(const std::string& line) {
    if (!line.empty() && line.back() == ';') {
        return line.substr(0, line.size() - 1);
    }
    return line;
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
    std::vector<std::string> filteredLines;

    while (std::getline(inputFile, line)) {
        // Trim leading whitespace characters from the line
        std::string trimmedLine = trimLeadingWhitespace(line);

        // Check if the trimmed line starts with any of the prefixes
        for (const auto& prefixMatch : prefixes) {
            if (trimmedLine.compare(0, prefixMatch.size(), prefixMatch) == 0) {
                // Remove trailing semicolon and add to the list of filtered lines
                filteredLines.push_back(removeTrailingSemicolon(trimmedLine));
                break;
            }
        }
    }

    // Write the filtered lines to the output file, comma-separated
    for (size_t i = 0; i < filteredLines.size(); ++i) {
        outputFile << filteredLines[i];
        if (i != filteredLines.size() - 1) {
            outputFile << ",";
        }
        outputFile << std::endl;
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
