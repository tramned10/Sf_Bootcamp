public with sharing class DonationController {
//server side controller fetch and insert new data from lightning component
    @AuraEnabled
    Public Static  Donation__c saveDonation(Donation__c saveDon){
        
        insert saveDon;
        return saveDon;
    }
    
       @AuraEnabled
    Public Static List<Donation__c> getDonation(){
       List<Donation__c> donation5 = [SELECT Donar_Name__c, 
                                      Donation_Date__c, 
                                      Note2__c, 
                                      Amount__c 
                                      FROM Donation__c  
                                      ORDER by Amount__c DESC limit 5];
        return donation5;
    }
      @AuraEnabled
    Public Static void sumDonation(){
      AggregateResult[] sumDonate = [SELECT SUM(Amount__c) FROM Donation__c];
        
    }
}