     ;; Custom text object for Python function definitions
     (function_definition
       name: (identifier) @function.name
       body: (block) @function.body) @function.outer

     ;; Custom text object for Python classes
     (class_definition
       name: (identifier) @class.name
       body: (block) @class.body) @class.outer

     ;; Additional custom objects can be defined here
