#Command Pattern

The Command design pattern intends to separate and decouple an object of invocation from the object that receives the message of invocation. We will encapsulate all pertinent information of a method and execute the method at a later time. Essentially, the Command pattern gives us the ability to queue a series of operations for a later time. Let's dig in. 

#Five Main Points

1. Separate the things that change from the things that stay the same.

  - promotes DRY code
  - improves maintability

2. Program to an interface, not an implementation
  Code should belong to the most general object possible, and specific classes should inherit from the general class.
  
  - increases modularity

3. Prefer composition over inheritance
  Avoid saying that an object is a kind of something and instead say that it has something. In other words, it's often better to reference other classes or modules  than to put functionality in superclasses.
  
  - increases encapsulation
  - increases modularity, implementations can be easily swapped

4. delegate, delegate Let other classes handle functionality withing their domain. 

5. You ain't gonna need it (russ Olsen's addition)

  Don't implement features or design in flexibility that you don't immediately need because you will probably never need it. 
