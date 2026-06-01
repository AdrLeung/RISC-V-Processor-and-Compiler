#include "parser.hpp"

Parser::Parser(Lexer& l) : lexer(l), curr(Category::EOF_TOKEN, "") {
    advance();
}

void Parser::advance() {
    curr = lexer.getNext();
}

void Parser::expect(Category expectedType) {
    if (curr.getCategory() == expectedType) {
        advance();
    } else {
        throw std::runtime_error("syntax error");
    }
}

std::unique_ptr<ExpressionNode> Parser::parseExpression() {
    if (curr.getCategory() == Category::INT_LITERAL) {
        auto node = std::make_unique<ConstantNode>(curr.getVal());
        advance();
        return node;
    }
    throw std::runtime_error("syntax error");
}

std::unique_ptr<StatementNode> Parser::parseStatement() {
    if (curr.getCategory() == Category::RETURN_KEYWORD) {
        advance();
        auto expr = parseExpression();
        expect(Category::SEMICOLON);
        return std::make_unique<ReturnNode>(std::move(expr));
    }
    throw std::runtime_error("syntax error");
}

std::unique_ptr<FunctionNode> Parser::parseFunction() {
    expect(Category::INT_KEYWORD);
    
    std::string funcName = curr.getVal();
    expect(Category::IDENTIFIER);

    expect(Category::OPEN_PAREN);
    expect(Category::CLOSE_PAREN);
    expect(Category::OPEN_BRACE);

    std::vector<std::unique_ptr<StatementNode>> body;
    while (curr.getCategory() != Category::CLOSE_BRACE) {
        body.push_back(parseStatement());
    }
    
    expect(Category::CLOSE_BRACE);

    return std::make_unique<FunctionNode>(funcName, std::move(body));
}

std::unique_ptr<ASTNode> Parser::parse() {
    return parseFunction();
}