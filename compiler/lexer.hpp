#pragma once
#include <string>
#include "token.hpp"

// consumer design pattern
class Lexer {
    private:
        std::string source;
        unsigned int pos = 0;

        char peek() const;
        char advance();
        void skipWhitespace();
        Token handleWord();
        Token handleNumber();

    public:
        Lexer(const std::string& s);
        Token getNext();
};