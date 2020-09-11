// Copyright 2020 Fraunhofer-Gesellschaft zur Förderung der angewandten Forschung e.V.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

parser grammar LoTLanParser;

options {
	tokenVocab = LoTLanLexer;
}

program : 
    (template | instance | task | transportOrderStep)*;

// Template Layout
template: 
    templateStart memberVariable+ END_IN_BLOCK;

templateStart:
    TEMPLATE NEW_LINE+;

// Instance Layout
instance: 
    instanceStart memberVariable+ END_IN_BLOCK;

instanceStart:
    INSTANCE STARTS_WITH_LOWER_C_STR NEW_LINE+;

memberVariable:
    ASSIGNMENT value NEW_LINE+;

value:
    STRING_VALUE
    | NUMERIC_VALUE
    | EMPTY_VALUE
    | INTEGER
    | FLOAT;

// Transport Order Step
transportOrderStep:
    tosStart tosStatement+ END_IN_BLOCK;

tosStart:
    TRANSPORT_ORDER_STEP STARTS_WITH_LOWER_C_STR NEW_LINE+;

tosStatement:
    optTosStatement | locationStatement | parameterStatement;

locationStatement:
    LOCATION STARTS_WITH_LOWER_C_STR NEW_LINE+;

// optional to extend functionality
optTosStatement:
    eventStatement | onDoneStatement;

eventStatement:
    TRIGGERED_BY expression NEW_LINE+
    | FINISHED_BY expression NEW_LINE+;

onDoneStatement:
    ON_DONE (STARTS_WITH_LOWER_C_STR COMMA)* STARTS_WITH_LOWER_C_STR NEW_LINE+;

parameterStatement:
    PARAMETERS (STARTS_WITH_LOWER_C_STR COMMA)* STARTS_WITH_LOWER_C_STR NEW_LINE+;
    
// Task Layout
task:
    taskStart taskStatement+ END_IN_BLOCK;

taskStart:
    TASK STARTS_WITH_LOWER_C_STR NEW_LINE+;

taskStatement:
    transportOrder 
    | optTosStatement
    | repeatStatement
    | constraintsStatement;

constraintsStatement:
    CONSTRAINTS expression NEW_LINE+;

// transport from to 
transportOrder:
    TRANSPORT NEW_LINE 
    fromStatement 
    toStatement;
    
fromStatement:
    FROM STARTS_WITH_LOWER_C_STR parameters? NEW_LINE;

toStatement:
    TO STARTS_WITH_LOWER_C_STR parameters? NEW_LINE+;

parameters:
    value 
    | value COMMA parameters;

repeatStatement:
    REPEAT INTEGER NEW_LINE+;

expression:
    STARTS_WITH_LOWER_C_STR
    | STARTS_WITH_LOWER_C_STR DOT (STARTS_WITH_LOWER_C_STR | STARTS_WITH_UPPER_C_STR)
    | E_LEFT_PARENTHESIS expression E_RIGHT_PARENTHESIS
    | unOperation expression                                        // 
    | expression binOperation expression                            // this sets the precedence when parsing
    | expression E_BOOLEAN_AND expression                           // 
    | expression E_BOOLEAN_OR expression                            // 
    | con;

binOperation:
    E_LESS_THAN
    | E_LESS_THAN_OR_EQUAL
    | E_GREATER_THAN
    | E_GREATER_THAN_OR_EQUAL
    | E_EQUAL
    | E_NOT_EQUAL;

unOperation:
    E_BOOLEAN_NOT;

con:
    E_TRUE 
    | E_FALSE
    | INTEGER
    | FLOAT;
