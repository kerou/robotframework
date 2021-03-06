This text should be ignored, even though it's no a comment.
We have a devious plan to rule the world with robots.

*Setting*      *Value*

Document       A complex testdata file   in robot format.
Default Tags   default1
Force Tags     force1   force2

Suite Setup    Log   Setup
Test Teardown  Log   Test Teardown
Resource       ../resources/robot_resource.robot
Variables      ../resources/variables.py
Library       OperatingSystem


* Variable

${table_var}   foo
@{table_listvar}   bar   ${table_var}
${quoted}   """this has """"many "" quotes """""
${single_quoted}   s'ingle'qu'ot'es''


***Test Case***

Passing   Log   Passing test case.

Failing        [Document]   FAIL    Failing test case.
   Fail                     Failing test case.
User Keyword   [Document]   FAIL    A cunning argument. != something
   My Keyword With Arg      A cunning argument.
Nön-äscïï
      [Documentation]   FAIL Nön-äscïï error
      Fail    Nön-äscïï error
Own Tags   [Tags]   own1   own2
   Log   tags test

Default Tags   No Operation

Variable Table   Equals   ${table_var}   foo
   Equals   @{table_listvar}[0]   bar
   Equals   @{table_listvar}[1]   foo


Resource File   Keyword from ROBOT resource
   Keyword from ROBOT resource 2
   Equals   ${robot_resource_var}   ROBOT Resource Variable
   Equals   ${robot_resource_var2}   ROBOT Resource Variable From Recursive Resource

Variable File   Equals   @{file_listvar}[0]   ${True}
   Equals   @{file_listvar}[1]   ${3.14}
   Equals   @{file_listvar}[2]   Hello, world!!
   Equals   ${file_var1}   ${-314}
   Equals   ${file_var2}   file variable 2


Library Import   Fail If Dir Empty   ${CURDIR}





Test Timeout   [Timeout]   0.01second
   [Document]   FAIL   Test timeout 10 milliseconds exceeded.
   Sleep   1

Keyword Timeout   [Document]   FAIL   Keyword timeout 2 milliseconds exceeded.
   Timeouted Keyword







Empty Rows
   [Document]   Testing that empty rows are ignored.   FAIL Expected failure.


   Noop

   Fail   Expected failure.

Document   [Document]   Testing the metadata parsing.
   noop

Default Fixture   Noop

Overridden Fixture   [Teardown]   Fail   Failing Teardown
   [Setup]   Log   Own Setup
   [Document]   FAIL   Teardown failed:\n Failing Teardown
   NOOP

Quotes   Equals   ${quoted}   """this has """"many "" quotes """""
   Equals   ${single_quoted}   s'ingle'qu'ot'es''

Escaping
       Should Be Equal    -c:\\temp-\t-\x00-\${x}-    ${ESCAPING}


*User Keywords*   *Action*   *Argument*   *Argument*   *Argument*

My Keyword With Arg   [Arguments]   ${arg1}
   Keyword with no arguments
   Another Keyword   ${arg1}



Another Keyword   [Arguments]   ${arg1}   ${arg2}=something
   Equals   ${arg1}   ${arg2}

Timeouted Keyword   [Timeout]   2ms
   Sleep   0.1

Keyword With No Arguments   Log   Hello world!
