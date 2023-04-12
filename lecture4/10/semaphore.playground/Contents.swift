import UIKit

class SemaphoreTest3 {
    private let semaphore = DispatchSemaphore(value: 2)

    func doWork( ) {
        semaphore.wait( )
        print("test")
        sleep(4) //Do something
        semaphore.signal( )
    }

    func test() {
        DispatchQueue.global ( ).async {
            self.doWork( )//1
        }
        DispatchQueue.global ( ).async {
            self.doWork( )//2
        }
        DispatchQueue.global ( ).async {
            self.doWork( )//3
        }
    }
}

let mySemaphore = SemaphoreTest3()
mySemaphore.test()
