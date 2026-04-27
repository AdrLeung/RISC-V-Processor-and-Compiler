#include "lexer.hpp"
#include <cctype>
#include <stdexcept>


Lexer::Lexer(const std::string& s) {
    source = s;
}

char Lexer::peek() const {
    if (pos < source.size()) {
        return source[pos];
    }

    return '\0';
}

char Lexer::advance() {
    if (pos < source.size()) {
        return source[pos++];
    }

    return '\0';
}

void Lexer::skipWhitespace() {
    while (isspace(peek())) {
        advance();
    }
}

Token Lexer::handleWord() {
    std::string s;
    while (isalnum(peek()) || peek() == '_') {
        s += advance();
    }

    // TODO: implement every single other word in the language lol
    if (s == "int") {
        return Token(Category::INT_KEYWORD, s);
    } else if (s == "return") {
        return Token(Category::RETURN_KEYWORD, s);
    } else {
        return Token(Category::IDENTIFIER, s);
    }
}

Token Lexer::handleNumber() {
    std::string s;
    while(isdigit(peek())) {
        s += advance();
    }

    return Token(Category::INT_LITERAL, s);
}

Token Lexer::getNext() {
    skipWhitespace();
    char c = peek();

    if (c == '\0') {
        return Token(Category::EOF_TOKEN);
    }

    if (isalpha(c) || c == '_') {
        return handleWord();
    }

    if (isdigit(c)) {
        return handleNumber();
    }

    advance();
    switch (c) {
        case '(': 
            return Token(Category::OPEN_PAREN);
        case ')': 
            return Token(Category::CLOSE_PAREN);
        case '{': 
            return Token(Category::OPEN_BRACE);
        case '}': 
            return Token(Category::CLOSE_BRACE);
        case ';': 
            return Token(Category::SEMICOLON);
        case '\0':
            return Token(Category::EOF_TOKEN);
        default:
            throw std::runtime_error("unexpected char " + std::string(1, c));
    }
}