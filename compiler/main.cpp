#include <iostream>
#include "lexer.hpp"
#include "parser.hpp"

int main() {
    std::string code = "int main() {return 1;}";
    Lexer lexer(code);
    Parser parser(lexer);
    try {
        auto ast = parser.parse();

        ast->codegen();
        
    } catch (const std::exception& e) {
        std::cerr << "Compilation Error: " << e.what() << std::endl;
        return 1;
    }

    return 0;
}