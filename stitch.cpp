#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <regex>

// Function to read file content into a string
std::string readFile(const std::string& filePath) {
    std::ifstream file(filePath);
    if (!file.is_open()) {
        throw std::runtime_error("Could not open file: " + filePath);
    }
    std::stringstream buffer;
    buffer << file.rdbuf();
    return buffer.str();
}

// Function to prefix variable names in Verilog code
std::string prefixVariableNames(const std::string& code, const std::string& prefix) {
    std::regex wireRegRegex(R"((wire|reg)\s+(\[.*?\]\s*)?(\w+))");
    return std::regex_replace(code, wireRegRegex, "$1 $2" + prefix + "$3");
}

// Function to update the result assignment in the always block
std::string updateResultAssignment(const std::string& code) {
    std::string updatedCode = code;
    std::string goodResultAssign = "result = a_sum;";
    std::string badResultAssign = "result = b_sum;";

    size_t pos = updatedCode.find("//GOOD BRANCH");
    if (pos != std::string::npos) {
        pos = updatedCode.find("//set result = output of goodbranch", pos);
        if (pos != std::string::npos) {
            updatedCode.replace(pos, 34, goodResultAssign);
        }
    }

    pos = updatedCode.find("//BAD BRANCH");
    if (pos != std::string::npos) {
        pos = updatedCode.find("//set result = output of badbranch", pos);
        if (pos != std::string::npos) {
            updatedCode.replace(pos, 33, badResultAssign);
        }
    }

    return updatedCode;
}

// Function to combine files into a new Verilog file
void combineFiles(const std::string& skelContent, const std::string& goodBranchContent, const std::string& badBranchContent, const std::string& outputFilePath) {
    std::ofstream outFile(outputFilePath);
    if (!outFile.is_open()) {
        throw std::runtime_error("Could not open output file: " + outputFilePath);
    }

    // Prefix variable names in goodbranch and badbranch content
    std::string prefixedGoodBranchContent = prefixVariableNames(goodBranchContent, "a_");
    std::string prefixedBadBranchContent = prefixVariableNames(badBranchContent, "b_");

    // Update the skeleton content
    std::string modifiedSkelContent = skelContent;

    // Insert goodbranch declarations
    size_t pos = modifiedSkelContent.find("//goodbranch declarations go here");
    if (pos != std::string::npos) {
        modifiedSkelContent.replace(pos, 30, prefixedGoodBranchContent);
    }

    // Insert badbranch declarations
    pos = modifiedSkelContent.find("//badbranch declarations go here");
    if (pos != std::string::npos) {
        modifiedSkelContent.replace(pos, 29, prefixedBadBranchContent);
    }

    // Insert goodbranch instantiation
    std::string goodBranchInstantiation = "goodbranch goodbranch_instance (.num1(a_num1), .num2(a_num2), .sum(a_sum));";
    pos = modifiedSkelContent.find("//instantiate goodbranch");
    if (pos != std::string::npos) {
        modifiedSkelContent.replace(pos, 23, goodBranchInstantiation);
    }

    // Insert badbranch instantiation
    std::string badBranchInstantiation = "badbranch badbranch_instance (.num1(b_num1), .num2(b_num2), .sum(b_sum));";
    pos = modifiedSkelContent.find("//instantiate badbranch");
    if (pos != std::string::npos) {
        modifiedSkelContent.replace(pos, 22, badBranchInstantiation);
    }

    // Update result assignment
    modifiedSkelContent = updateResultAssignment(modifiedSkelContent);

    // Write the modified skeleton content to the output file
    outFile << modifiedSkelContent;

    outFile.close();
}

int main() {
    try {
        std::string skelContent = readFile("bug_eval_skel.v");
        std::string goodBranchContent = readFile("goodbranch.v");
        std::string badBranchContent = readFile("badbranch.v");

        combineFiles(skelContent, goodBranchContent, badBranchContent, "bug_eval_combined.v");

        std::cout << "Files combined successfully into bug_eval_combined.v" << std::endl;
    } catch (const std::exception& e) {
        std::cerr << e.what() << std::endl;
        return 1;
    }

    return 0;
}
