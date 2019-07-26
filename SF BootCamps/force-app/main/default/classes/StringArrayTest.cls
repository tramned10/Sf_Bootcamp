public class StringArrayTest {
    
    public Static List<string> generateStringArray(Integer n){
        
        List<String> myArray = new List<String>();
       
        for(Integer i = 0 ; i < n; i++){
            
            myArray.add('Test '+ i);
            
            system.debug(myArray[i]);
            
        }
        return myArray;
        
    
    }
}