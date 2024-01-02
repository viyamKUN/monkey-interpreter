package lexer

import (
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/viyamKUN/monkey-interpreter/token"
)

func TestNextToken(t *testing.T) {
	input := `=+(){},;`

	tests := []struct {
		expectedType    token.TokenType
		expectedLiteral string
	}{
		{token.ASSIGN, "="},
		{token.PLUS, "+"},
		{token.LPAREN, "("},
		{token.RPAREN, ")"},
		{token.LBRACE, "{"},
		{token.RBRACE, "}"},
		{token.COMMA, ","},
		{token.SEMICOLON, ";"},
		{token.EOF, ""},
	}

	l := New(input)

	for i, tt := range tests {
		tok := l.NextToken()

		assert.Equal(t, tt.expectedType, tok.Type, "tests[%d] - tokentype wrong. expected=%q, got=%q", i, tt.expectedType, tok.Type)
		assert.Equal(t, tt.expectedLiteral, tok.Literal, "tests[%d] - literal wrong. expected=%q, got=%q", i, tt.expectedLiteral, tok.Literal)
	}
}
