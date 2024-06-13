#include <iostream>
#include <fstream>
#include <string>

// Function to check if the first line of a file contains "//vivado"
bool checkFirstLineContains(const std::string &fileName) {
    std::ifstream file(fileName);
    if (!file.is_open()) {
        std::cerr << "Error: could not open file '" << fileName << "'" << std::endl;
        return false;
    }

    std::string firstLine;
    std::getline(file, firstLine);
    file.close();

    return firstLine.find("//vivado") != std::string::npos;
}

std::string removeFirstDoubleSlash(const std::string &line) {
    size_t pos = line.find("//");
    if (pos != std::string::npos) {
        return line.substr(0, pos) + line.substr(pos + 2);
    }
    return line;
}

int main() {
    bool goodbranchValid = checkFirstLineContains("goodbranch.v");
    bool badbranchValid = checkFirstLineContains("badbranch.v");

    std::ifstream inputFile("bug_eval_skel.v");
    std::ofstream outputFile("bug_eval_modified.v");

    if (!inputFile.is_open()) {
        std::cerr << "Error: could not open input file 'bug_eval_skel.v'" << std::endl;
        return 1;
    }

    if (!outputFile.is_open()) {
        std::cerr << "Error: could not open output file 'bug_eval_modified.v'" << std::endl;
        inputFile.close();
        return 1;
    }

    std::string line;
    while (std::getline(inputFile, line)) {
        // Uncomment specific lines if the conditions are met
        if (goodbranchValid && badbranchValid) {
            if (line.find("//`include \"syn_vivado.v\"") != std::string::npos ||
                line.find("//top_vivado eval_top_vivado (.y(y_viv1), .w0(w0_viv1));") != std::string::npos ||
                line.find("//assign w0_viv1 = 1'b0;") != std::string::npos) {
                outputFile << removeFirstDoubleSlash(line) << std::endl;
            } else if (line.find("assign y_viv1 = 1;") != std::string::npos) {
                outputFile << "    //assign y_viv1 = 1;" << std::endl;  // Add // at the beginning
            } else {
                outputFile << line << std::endl;
            }
        } else {
            // Write the line as-is if conditions are not met
            //std::cout << "'//vivado' not found, no changes made." << std::endl;
            outputFile << line << std::endl;
        }
    }

    inputFile.close();
    outputFile.close();

    std::cout << "Processing completed. Output: bug_eval_modified.v" << std::endl;

    return 0;
}
