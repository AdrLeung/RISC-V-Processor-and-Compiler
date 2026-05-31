#pragma once
#include "lexer.hpp"
#include "ast.hpp"
#include <memory>
#include <stdexcept>

class Parser {
    private:
        Lexer& lexer;
        Token curr;

        void advance();
        void expect(Category c);

        std::unique_ptr<ExpressionNode> parseExpression();
        std::unique_ptr<StatementNode> parseStatement();
        std::unique_ptr<FunctionNode> parseFunction();


    public:
        Parser(Lexer& l);
        std::unique_ptr<ASTNode> parse();

};