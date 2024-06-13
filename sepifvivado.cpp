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

int main() {
    bool goodbranchValid = checkFirstLineContains("goodbranch.v");
    bool badbranchValid = checkFirstLineContains("badbranch.v");

    if (goodbranchValid && badbranchValid) {
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
            // Uncomment specific lines
            if (line == "//`include \"syn_vivado.v\"" ||
                line == "    //top_vivado eval_top_vivado (.y(y_viv1), .w0(w0_viv1));" ||
                line == "    //assign w0_viv1 = 1'b0;") {
                outputFile << line.substr(2) << std::endl;  // Remove the first two characters (//)
            }
            // Comment specific line
            else if (line == "    assign y_viv1 = 1;") {
                outputFile << "    //assign y_viv1 = 1;" << std::endl;  // Add // at the beginning
            }
            // Copy all other lines as-is
            else {
                outputFile << line << std::endl;
            }
        }

        inputFile.close();
        outputFile.close();

        std::cout << "Processing completed. Check 'bug_eval_modified.v' for the output." << std::endl;
    } else {
        std::cout << "The first line of either goodbranch.v or badbranch.v does not contain '//vivado'. No changes were made." << std::endl;
    }

    return 0;
}
