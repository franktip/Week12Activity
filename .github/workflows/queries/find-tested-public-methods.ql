/**
 * @description Find all public methods directly invoked from a test
 * @kind problem
 * @id javascript/find-tested-public-methods
 * @problem.severity recommendation
 */
import javascript

predicate isTest(InvokeExpr e){
  e.getCalleeName() = "it" and
  exists(InvokeExpr e2 | e2.getCalleeName() = "describe" and e.getParent*() = e2)
}

// Find all public methods invoked from tests
from MethodDeclaration md, InvokeExpr call, InvokeExpr test
where 
    isTest(test) and
    call.getParent*() = test and
    md.isPublic() and
    md.getName() = call.getCalleeName()
select call, "Found call to public method " + call.getCalleeName() + " invoked from test " + test.getArgument(0).toString()