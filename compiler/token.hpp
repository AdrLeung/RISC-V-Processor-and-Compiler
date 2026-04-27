#pragma once
#include <string>

enum class Category {
    INT_KEYWORD,
    RETURN_KEYWORD,

    IDENTIFIER,
    INT_LITERAL,

    OPEN_PAREN,
    CLOSE_PAREN,
    OPEN_BRACE,
    CLOSE_BRACE,
    SEMICOLON,
    EOF_TOKEN
};

class Token {
    private:
        Category type;
        std::string val;

    public:
        Token(Category type, std::string val = "");
        Category getCategory() const;
        std::string getVal() const;
};

