public with sharing class tstpopup {

    public lead ll { get; set; }

 public Boolean displayPopUp { get; set; }
  public List<Lead> leads { get; set; }
    public tstpopup(){
       leads=new List<Lead>();  
       ll=new lead();
       leads=[select Name,Email from Lead];
    }

    public PageReference closePopup() {
        displaypopup=false;
        return null;
    }
    
  public PageReference showPopup() {
    string ids=apexpages.currentpage().getparameters().get('window');
    ll =[select Name,Email,company,phone from lead  where id=:ids];
       displaypopup=true;
        return null;
    }

}