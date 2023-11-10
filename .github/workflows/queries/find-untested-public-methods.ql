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
from MethodDeclaration md
where 
    exists(ClassDefinition cd | md.getParent() = cd) and
    md.isPublic() and
    not exists(InvokeExpr call, InvokeExpr test |
      isTest(test) and
      call.getParent*() = test and
      md.getName() = call.getCalleeName()
    )
select md, "Found no tests that call public method " + md.getName()