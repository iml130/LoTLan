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


lexer grammar LoTLanLexer;

TEMPLATE: 'Template ' STARTS_WITH_UPPER_C_STR-> pushMode(BLOCK);
TASK: 'Task ' -> pushMode(BLOCK);
TRANSPORT_ORDER_STEP: 'TransportOrderStep ' -> pushMode(BLOCK);
INSTANCE: STARTS_WITH_UPPER_C_STR ' ' -> pushMode(BLOCK);

WHITESPACE: [ \t\r\n]+ -> skip;
COMMENT: '#' ~[\n]* -> skip;

mode BLOCK;

NEW_LINE:  [ \t]* '\n';
fragment INDENTATION: ('    ' | '\t');

COMMENT_IN_BLOCK : '#' ~[\n]+  -> channel(HIDDEN);
COMMENT_LINE_IN_BLOCK : INDENTATION '#' ~[\n]+ '\n'-> channel(HIDDEN);

END_IN_BLOCK: 'End' -> popMode;

ASSIGNMENT: INDENTATION STARTS_WITH_LOWER_C_STR [ \t\r]* EQUAL [ \t\r]*;

// Only For TransportOrderStep
LOCATION: INDENTATION 'Location';
PARAMETERS: INDENTATION 'Parameters';

// Only For Task
REPEAT: INDENTATION 'Repeat';
CONSTRAINTS: INDENTATION 'Constraints';

TRANSPORT: INDENTATION 'Transport';
FROM: INDENTATION 'From';
TO: INDENTATION 'To';

// Used in both TOS and Task
ON_DONE: INDENTATION 'OnDone';
TRIGGERED_BY: INDENTATION 'TriggeredBy';
FINISHED_BY: INDENTATION 'FinishedBy';

EQUAL: '=';
COMMA: ',';

DOT: '.';

E_LEFT_PARENTHESIS: '(';
E_RIGHT_PARENTHESIS: ')';
E_LESS_THAN: '<';
E_LESS_THAN_OR_EQUAL: '<=';
E_GREATER_THAN: '>';
E_GREATER_THAN_OR_EQUAL: '>=';
E_EQUAL: '==';
E_NOT_EQUAL: '!=';
E_BOOLEAN_AND: 'and';
E_BOOLEAN_OR: 'or';
E_BOOLEAN_NOT: '!';
E_TRUE: 'True' | 'TRUE';
E_FALSE: 'False' | 'FALSE';

STARTS_WITH_LOWER_C_STR: [a-z][a-zA-Z0-9_]*;
STARTS_WITH_UPPER_C_STR: [A-Z][a-zA-Z0-9_]*;

STRING_VALUE: '"' [a-zA-Z0-9_]+ '"';
NUMERIC_VALUE: '"' ['*'' ''/'0-9]+ '"';
EMPTY_VALUE: '""';

INTEGER: [0-9]+;
FLOAT: [0-9]+( '.' [0-9]+);

WHITESPACE_BLOCK: [ \t\r]+ -> channel(HIDDEN);
