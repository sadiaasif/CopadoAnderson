/**
* A controller class to used to Latest RSS Feed for Anderson Advisors.
* 
* @author prateeks
* @version 1.0 - Dec 28, 2018
*/
public class RssFeedController {
  
    public RssFeedController(ApexPages.StandardController controller){}
    
    public List<Tuple> getRSSFeed() {        
        
        // Get the XML document from the external server      
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://andersonadvisors.com/blog/feed/');
        req.setMethod('GET');
        List<Tuple> results=new List<Tuple>();
        try {
            HttpResponse res = Http.send(req);
            Dom.Document doc = res.getBodyDocument();            
            Dom.XMLNode rss = doc.getRootElement();          
            for(Dom.XMLNode child : rss.getChildren()) {
                for(Dom.XMLNode channel : child.getChildren()) {              
                    if(channel.getName() == 'item') {
                        String titleName = channel.getChildElement('title',null).getText();
                        String linkTitle = channel.getChildElement('link',null).getText();
                        Tuple tup=new Tuple(titleName, linkTitle);
                        results.add(tup);
                    }
                }
            }
            
        }  catch (system.calloutexception e) {
            System.debug('Callout error: ' + e);            
        } 
        return results;
    }
    public class Tuple
    {
        public String titleName {get; set;}
        public String tLink {get; set;}
        
        public Tuple(String val1, String val2)
        {
            titleName=val1;
            tLink=val2;
        }
    }
    
}