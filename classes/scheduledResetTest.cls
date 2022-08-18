@IsTest
global class scheduledResetTest {
    
    global static testmethod void schedulartestmethod(){
        
        test.startTest();
        scheduledReset sr = new scheduledReset();
        string sch = '0 15 * * * ?';
        system.schedule('scheduledReset', sch, sr);
        
        test.stopTest();
    }

}