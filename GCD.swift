/*
http://www.appcoda.com/grand-central-dispatch/


*/

/*  
    Two ways to do multitasking: 
    1) The Grand Central Dispatch (GCD) and 
    2) NSOperationQueue frameworks
    
    There’s one rule that should be always respected: The main thread must be always remain free so it serves the UI and UX.
    Any time-consuming or CPU demanding tasks should run on concurrent or background queues.
    
    Until Swift 3, Syntax for GCD is C-like! 
    
*/

/*  
DISPATCH-QUEUE
A queue is actually a block of code that can be executed synchronously or asynchronously, either on the main or on a background thread.
Once a queue is created, the operating system is the one that manages it and gives it time to be processed on any core of the CPU
Queues are following the FIFO pattern (First In, First Out), meaning that the queue that comes first for execution will also finish first. :)

WORK-ITEM
A work item is literally a block of code that a dispatch queue will run which is 
either written along with the queue creation, or it gets assigned to a queue and it can be used more than once (reused).
This execution can be synchronous or asynchronous. 
In the synchronous case, the running app does not exit the code block of the item until the execution finishes. 
On the other hand, when queues are scheduled to run asynchronously, then the running app calls the work item block and it returns at once. Once again, we’ll see all those differences later in action.


A queue can be either serial or concurrent
Serial  =>  a work item starts to be executed once the previous one has finished
Parallel=>  the work items are executed in parallel

Keep in mind that it’s not always necessary to create your own QUEUES:
The system creates global dispatch queues that can be used for any kind of tasks you want to run.

Similarly for THREAD that a queue will RUN TO, iOS maintains what Apple calls a 'pool of threads', meaning a collection of threads other than the main one, and the system chooses one or more of them to use (depending always on how many queues you create, and how you create them).
Which threads will be used are undefined to the developer, as the operating system “decides” depending on the number of other concurrent tasks, the load on the processor, etc

*/


/*  SYNTAX  */

//Create a new dispatch queue
let queue = DispatchQueue(label: "com.appcoda.myqueue")
//for labels, reverse DNS notation is recommended but not mandatory

//Once queue is created, we can execute a block(closure) syncly or asycly
queue.sync {
  for i in 1...10 
    {print("💖: \(i)")}
  
  for i in 100..<110 
    {print("Ⓜ️", i)}
}








  
