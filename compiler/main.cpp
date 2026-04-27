#include <iostream>
#include "lexer.hpp"

int main() {
    std::string code = "int main() {return 1;}";
    Lexer lexer(code);
    Token t = lexer.getNext();
    while (t.getCategory() != Category::EOF_TOKEN) {
        std::cout << "\nType: " << (int) t.getCategory() << "\nValue: " << t.getVal() << std::endl;
        t = lexer.getNext();
    }

    return 0;
}