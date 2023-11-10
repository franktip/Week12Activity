/**
 * @description Find all files with extension "ts" or "tsx" that do not have any comments
 * @kind problem
 * @id javascript/find-all-tests
 * @problem.severity recommendation
 */
import javascript

// Find all calls to a function "it" where the call is nested
// inside a call to a function "describe"
from InvokeExpr e, InvokeExpr e2
where e.getCalleeName() = "describe"
  and e2.getCalleeName() = "it"
  and e2.getParent*() = e // e2 is nested inside e
select e2, "Found test " + e2.getArgument(0).toString() + " in test suite: " + e.getArgument(0).toString()