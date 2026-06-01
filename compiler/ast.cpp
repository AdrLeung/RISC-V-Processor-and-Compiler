#include "ast.hpp"

void ConstantNode::codegen() const {
    std::cout << "li a0, " << val << "\n";
}

void ReturnNode::codegen() const {
    if (expression) {
        expression->codegen();
    }

    std::cout << "ret\n";
}

void FunctionNode::codegen() const {
    std::cout << ".globl " << name << "\n";
    std::cout << name << ":\n";
    for (const auto& statement : body) {
        if (statement) {
            statement->codegen();
        }
    }
}