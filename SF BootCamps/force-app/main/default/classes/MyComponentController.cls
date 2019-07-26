public with sharing Class MyComponentController {

    @AuraEnabled
    Public static List<Account> getAccount(){
       return [SELECT Name FROM Account];
    }
}