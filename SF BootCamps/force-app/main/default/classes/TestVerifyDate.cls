@isTest    
public class TestVerifyDate {
    
    @isTest static void testVerifyDate() {
    
        //Check Method 1
        Date checkDate1 = VerifyDate.CheckDates(Date.newinstance(2018, 12, 1), Date.newinstance(2018, 12, 11));
        System.assertequals(checkDate1, Date.newinstance(2018, 12, 11));
        Date checkDate2 = VerifyDate.CheckDates(Date.newinstance(2018, 12, 11), Date.newinstance(2018, 12, 1));
        System.assertequals(checkDate2, Date.newinstance(2018, 12, 31));
        
    }

}