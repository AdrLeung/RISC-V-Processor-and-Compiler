#pragma once
#include <string>
#include <vector>
#include <memory>
#include <iostream>

class ASTNode {
    public:
        virtual ~ASTNode() = default;
        virtual void codegen() const = 0;
};

// ExpressionNode is an ASTNode
class ExpressionNode : public ASTNode {};

// ConstantNode is an ExpressionNode
class ConstantNode : public ExpressionNode {
    private:
        std::string val;

    public:
        ConstantNode(std::string val) : val(val) {}
};

// StatementNode is an ASTNode
class StatementNode : public ASTNode {};

// ReturnNode is a StatementNode
class ReturnNode : public StatementNode {
    private:
        std::unique_ptr<ExpressionNode> expression;

    public:
        ReturnNode(std::unique_ptr<ExpressionNode> e) : expression(std::move(e)) {}
};

// FunctionNode is an ASTNode
class FunctionNode : public ASTNode {
    private:
        std::string name;
        std::vector<std::unique_ptr<StatementNode>> body;

    public:
        FunctionNode(std::string n, std::vector<std::unique_ptr<StatementNode>> b) : name(n), body(std::move(b)) {}
};