public class MyOrderCLS {
    
    Public String Skey {get;set;}
	// inititalize lsit shows list at load page
    Public ApexPages.StandardSetController setCon{
        
        get{
            if(setCon == null){
                
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                    		[SELECT OrderNumber, AccountId, Status, CreatedDate FROM Order]));
               	setCon.setPageSize(5);
                
            }
            return setCon; 
        }
        set;
    }
    
    Public List<Order> getOrderList(){
        return(List<Order>)setCon.getRecords();
    }
    
    //Methods for pagination 
    
     public Boolean hasNext {
  		get {
  			return setCOn.getHasNext();
  		}
  	}
  	
  	public Boolean hasPrevious {
		get {
			return setCOn.getHasPrevious();
		}
		set;
	}
  	
  	public Integer pageNumber {
		get {
			return setCOn.getPageNumber();
		}
		set;
	}
    public Integer totalPages {
		get {
			totalPages = setCOn.getResultSize() / setCOn.getPageSize();
			return totalPages;
		}
		set;
	}
  	
 	public void first() {
 		setCOn.first();
 	}

 	public void last() {
 		setCOn.last();
 	}

 	public void previous() {
 		setCOn.previous();
 	}

 	public void next() {
 		setCOn.next();
 	}

    
    
    
    
    // method for search query shows blank searches and searchey with key variables
    Public PageReference Search(){
        
        if (Skey != null && setCOn != null){
            setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                    		[SELECT OrderNumber, AccountId, Status, CreatedDate FROM Order WHERE OrderNumber  Like : '%'+Skey+'%'] ));
            setCon.setPageSize(5);
            
        }
       return null;
    }
    
   
}