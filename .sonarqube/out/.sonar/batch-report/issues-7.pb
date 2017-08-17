Ø
csharpsquidS3881KFix this implementation of 'IDisposable' to conform to the dispose pattern. 2 :~
| nProvide 'protected' overridable implementation of 'Dispose(bool)' on 'AsyncPort' or mark the type as 'sealed'.:i
gww Y'AsyncPort.Dispose()' should only invoke 'Dispose(true)' and 'GC.SuppressFinalize(this)'.f
csharpsquidS1104DMake this field 'private' and encapsulate it in a 'public' property. 2$$ (