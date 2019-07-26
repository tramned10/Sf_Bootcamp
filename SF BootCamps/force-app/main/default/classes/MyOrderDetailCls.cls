public class MyOrderDetailCls {
   
    // product things
    Public  Order orderRecord {get;set;}
    public string ordr {get;set;}
    Public List<OrderItem> prodList {get;set;}
     //modal things
    Public boolean showPopUp {get;set;}
    //passing the values to modal
    Public id thisId{get;Set;}
    Public Product2 getProd {get;set;}

    
    Public MyOrderDetailCls(ApexPages.StandardController myOrder){
        ordr = myOrder.getId();
        orderRecord = [SELECT id,Account.Name, OrderNumber,TotalAmount,Status  FROM ORDER where id = : ordr];
    	 
		prodList  = [ SELECT id, Product2.Name, UnitPrice, Product2Id FROM OrderItem WHERE Order.Id =  :ordr];
    }
    
    Public void showDetails(){
        getProd = [SELECT Id, Name, Description FROM Product2 WHERE id = :thisId];
    }
     public PageReference popUp() {
         if(showPopUp){
             showPopUp=false;

             
         }else{
             showPopUp=true;
             
         }
                return null;
    	 }
   
    public void updateDescription(){
        update getProd;
        
    }
    }