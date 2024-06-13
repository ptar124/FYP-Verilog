#include <iostream>
#include <fstream>
#include <sstream>
#include <string>

void insertCode(const std::string &skeletonFile, const std::string &outputFile, 
                const std::string &goodbranchdecFile, const std::string &badbranchdecFile, 
                const std::string &goodbranchinstFile, const std::string &badbranchinstFile) {

    std::ifstream skeletonStream(skeletonFile);
    if (!skeletonStream.is_open()) {
        std::cerr << "Error opening skeleton file: " << skeletonFile << std::endl;
        return;
    }
    std::stringstream skeletonBuffer;
    skeletonBuffer << skeletonStream.rdbuf();
    std::string skeletonCode = skeletonBuffer.str();
    skeletonStream.close();

    std::ifstream goodbranchdecStream(goodbranchdecFile);
    if (!goodbranchdecStream.is_open()) {
        std::cerr << "Error opening goodbranchdec file" << std::endl;
        return;
    }
    std::stringstream goodbranchdecBuffer;
    goodbranchdecBuffer << goodbranchdecStream.rdbuf();
    std::string goodbranchdecCode = goodbranchdecBuffer.str();
    goodbranchdecStream.close();

    std::ifstream badbranchdecStream(badbranchdecFile);
    if (!badbranchdecStream.is_open()) {
        std::cerr << "Error opening badbranchdec file" << std::endl;
        return;
    }
    std::stringstream badbranchdecBuffer;
    badbranchdecBuffer << badbranchdecStream.rdbuf();
    std::string badbranchdecCode = badbranchdecBuffer.str();
    badbranchdecStream.close();

    std::ifstream goodbranchinstStream(goodbranchinstFile);
    if (!goodbranchinstStream.is_open()) {
        std::cerr << "Error opening goodbranchinst file" << std::endl;
        return;
    }
    std::stringstream goodbranchinstBuffer;
    goodbranchinstBuffer << goodbranchinstStream.rdbuf();
    std::string goodbranchinstCode = goodbranchinstBuffer.str();
    goodbranchinstStream.close();

    std::ifstream badbranchinstStream(badbranchinstFile);
    if (!badbranchinstStream.is_open()) {
        std::cerr << "Error opening badbranchinst file" << std::endl;
        return;
    }
    std::stringstream badbranchinstBuffer;
    badbranchinstBuffer << badbranchinstStream.rdbuf();
    std::string badbranchinstCode = badbranchinstBuffer.str();
    badbranchinstStream.close();

    size_t pos;

    pos = skeletonCode.find("//goodbranchdec");
    if (pos != std::string::npos) {
        skeletonCode.replace(pos, std::string("//goodbranchdec").length(), goodbranchdecCode);
    }

    pos = skeletonCode.find("//badbranchdec");
    if (pos != std::string::npos) {
        skeletonCode.replace(pos, std::string("//badbranchdec").length(), badbranchdecCode);
    }

    pos = skeletonCode.find("//goodbranchinst");
    if (pos != std::string::npos) {
        skeletonCode.replace(pos, std::string("//goodbranchinst").length(), goodbranchinstCode);
    }

    pos = skeletonCode.find("//badbranchinst");
    if (pos != std::string::npos) {
        skeletonCode.replace(pos, std::string("//badbranchinst").length(), badbranchinstCode);
    }

    std::ofstream outputStream(outputFile);
    if (!outputStream.is_open()) {
        std::cerr << "Error opening output file: " << outputFile << std::endl;
        return;
    }
    outputStream << skeletonCode;
    outputStream.close();

    std::cout << "Completed insertion. Output: " << outputFile << std::endl;
}

int main() {
    std::string skeletonFile = "bug_eval_modified.v";
    std::string outputFile = "bug_eval_combined.v";
    std::string goodbranchdecFile = "goodbranchdec.txt";
    std::string badbranchdecFile = "badbranchdec.txt";
    std::string goodbranchinstFile = "goodbranchinst.txt";
    std::string badbranchinstFile = "badbranchinst.txt";

    insertCode(skeletonFile, outputFile, goodbranchdecFile, badbranchdecFile, goodbranchinstFile, badbranchinstFile);

    return 0;
}
