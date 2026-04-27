#include "token.hpp"

Token::Token(Category c, std::string s) {
    type = c;
    val = s;
}

Category Token::getCategory() const {
    return type;
}

std::string Token::getVal() const {
    return val;
}