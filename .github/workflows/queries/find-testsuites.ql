/**
 * @description Find all test suites
 * @kind problem
 * @id javascript/find-all-test-suites
 * @problem.severity recommendation
 */
import javascript

//
// Find all calls to a function that has the name "describe"
//
from InvokeExpr e
where e.getCalleeName() = "describe"
select e, "Found test suite: " + e.getArgument(0).toString()