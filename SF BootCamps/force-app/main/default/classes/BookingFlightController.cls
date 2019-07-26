public with sharing class BookingFlightController {
    
      @AuraEnabled
    Public Static void getBooking(Booking__c bookFlight){
        bookFlight = [SELECT Email__c, 
                              Name__c
                              FROM Booking__c];

    }
    
     @AuraEnabled
    Public Static List<Flight__c>getFlight(){
        return [SELECT To__c,
                       From__c,
                       Departure_Date__c,
                       No_of_Seats2__c,
                       Packages__c,
                       Departure_Time__c,
                       Arrival_Time__c,
                       Fly__c,
                       Fly_baggage__c,
                       Fly_Baggage_Meal__c
                       FROM Flight__c];

    }
    @AuraEnabled
 public static List < Flight__c > getSearhedDetails(date keyWord , string to_Keyword , string from_Keyword ) {
  List < Flight__c > listOfFlights = [select Name,
                                      Id, 
                                      From__c, 
                                      To__c, 
                                      Flight_Number__c,
                                      Departure_Date__c ,
                                      No_of_Seats2__c,
                      				  Packages__c,
                      				  Departure_Time__c,
                      				  Arrival_Time__c,
                      			      Fly__c,
                      				  Fly_baggage__c,
                      				  Fly_Baggage_Meal__c
                                      from Flight__c
                                   	  where Departure_Date__c =: keyWord 
                                      AND From__c =: from_Keyword 
                                      AND To__c =:to_Keyword
                                     ];
  return listOfFlights; 
 }
    
   
     @AuraEnabled
    public static Map<String, String> getPicklistVal(){
        Map<String, String> options = new Map<String, String>();
        
        Schema.DescribeFieldResult fieldResult = Flight__c.Packages__c.getDescribe();
        
        List<Schema.PicklistEntry> pList = fieldResult.getPicklistValues();
        
        for (Schema.PicklistEntry p: pList) {
            
            options.put(p.getValue(),p.getLabel());
        }
        return options;
    }
    
    @AuraEnabled
    public static  String  saveContact(string keyFirstName, String keyLastName, String keyEmail, Id flightId ) {
        String bookingId = '';
      	system.debug(keyFirstName);
        system.debug(keyLastName);
        system.debug(keyEmail);
     	
      list<Contact> con = [SELECT FirstName,LastName,Email From Contact WHERE Email=: keyEmail];
       booking__c bookingObj = new Booking__c();
        if (con.isEmpty()){
		Contact newCont = new Contact();
        newCont.FirstName = keyFirstName;
        newCont.LastName = keyLastName;
        newCont.Email = keyEmail;
        
        con.add(newCont);
           
        
        insert con;
        
        Flight__c flightObj = [Select Id, Name From Flight__c WHERE id=:flightId];
        
       bookingObj.Flights__c= flightObj.Id;
       bookingObj.Contact__c = newCont.Id;
          try{  
            insert bookingObj;
            bookingId = bookingObj.Id;
            bookingObj.Email__c = keyEmail;
          }
			catch(Exception exc){
                throw new AuraHandledException(exc.getMessage());
            } 
            return bookingId;
        }else{
            Contact contact = [SELECT id, Name, FirstName, LastName, Email From Contact WHERE Email=: keyEmail];
            if (contact.FirstName != keyFirstName || contact.Lastname != keyLastName){
                contact.FirstName = keyFirstName;
                contact.LastName = keyLastName;
                   
                update contact;
       			 }
             Flight__c flightObj = [SELECT Id, Name FROM Flight__c WHERE Id =: flightId];
            bookingObj.Flights__c = flightObj.Id;
            bookingObj.Contact__c = Contact.Id;
            try{
                insert bookingObj;
                bookingId = bookingObj.Id;
                 bookingObj.Email__c = keyEmail;
              // sendEmail(bookingId, bookingObj.Email__c);
            }
            catch(Exception exc){
                throw new AuraHandledException(exc.getMessage());
            }
            return bookingId;
           
        }   
        
    } 
    @future(callout=true)
    public static void sendEmail(String bkId, String bkEmail){
        Messaging.SingleEmailMessage emailSend = new Messaging.SingleEmailMessage();
        string[] to = new string[] {bkEmail};
        
        emailSend.setToAddresses(to);
        emailSend.setSubject('Booking Reference');
        
        emailSend.setHtmlBody('Hello, <br/><br/>This is to inform you about your booking with Deloitte Airline. <br/><br/>Regards<br/> Admin');
        PageReference pdf = Page.bookReference;
        pdf.getParameters().put('id', bkId);

        Attachment attach = new Attachment();
        attach.ParentId = bkId;
        attach.name = 'bookReference.pdf';
        attach.body = pdf.getContent();
        insert attach;
        
        Messaging.EmailFileAttachment emailAtt = new Messaging.EmailFileAttachment();
        emailAtt.setFileName(attach.Name);
      	emailAtt.setBody(attach.Body);
        emailSend.setFileAttachments( new List<Messaging.EmailFileAttachment> {emailAtt});
        
        try{
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { emailSend });
        }catch(exception e){
            apexpages.addmessage(new apexpages.message(apexpages.severity.error,e.getMessage()));
        }
    }
}