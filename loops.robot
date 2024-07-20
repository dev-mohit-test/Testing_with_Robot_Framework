*** Settings ***
Library     SeleniumLibrary


*** Variables ***
@{LISR}     a   b   v   f   d   g   h
@{LISS}     1  2   7   9   4   0   5
@{LISP}     d   h   i   z   k   c   j
@{LISTS}    @{LISR}     @{LISS}
&{DICD}     a=2     b=4     v=6
${start}=   2



*** Test Cases ***
testcase1
    FOR     ${a}    IN RANGE    4   9
        log to console    ${a}
    END

testcase2
    FOR     ${x}    IN     @{LISR}
        LOG TO CONSOLE    ${x}
    END

testcase3
    FOR     ${B}    IN ENUMERATE    @{LISR}
        LOG TO CONSOLE      ${B}
    END

testcase4
    FOR     ${index}     ${v}    IN ENUMERATE    @{LISR}
        LOG TO CONSOLE      ${index} ${v}
    END

testcase5
    FOR     ${index}    ${v}    IN ENUMERATE    @{LISR}     start=2
        LOG TO CONSOLE    ${index} ${v}
    END

testcase6
    FOR     ${index}    ${v}    IN ENUMERATE    @{LISR}     start=${start}
        LOG TO CONSOLE    ${index} ${v}
    END

testcase7
    FOR     ${f}    IN ENUMERATE    @{LISR}
        LOG TO CONSOLE      Index is ${f}[0] and Item is ${f}[1]
    END

#testcase8
#    FOR    ${p}     ${o}    IN ZIP    @{LISR}   @{LISP}}
#        log many    ${p}        ${o}
#    END

testcase8
    FOR    ${x}     ${y}    IN    &{DICD}
        LOG    key is '${x}' and value is '${y}'.
    END

testcase9
    FOR     ${itemd}    IN    &{DICD}
        LOG TO CONSOLE    key is '${itemd}[0]' and value is '${itemd}[1]'
    END

testcase10
    FOR     ${index}    ${itemd}    IN ENUMERATE    &{DICD}
        LOG TO CONSOLE      on round ${index} key is '${itemd}[0]' and value is '${itemd}[1]'
        log to console    ${DICD.a}
        log to console    ${DICD.b}
    END

testcase11
    WHILE   True    limit=3     on_limit=pass
        log to console    run 3 times
    END

testcase12
    WHILE   True    limit=0.2s    on_limit=pass
        log to console    run 3 times
    END
# loop runs upto 0,2 seconds any no.


#testcase13
#    WHILE  ${start} > 0
#        log to console    devji
#    END


testcase14
    IF  ${start} > 0
        log to console    mohitji
    ELSE
        log to console    devji
    END
