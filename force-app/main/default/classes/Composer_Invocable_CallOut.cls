public class Composer_Invocable_CallOut {
    @InvocableMethod(label='Composer Invocable Callout' callout='true')
    public static List<FlowOutputs> startProcess(List<FlowInputs> inputArguments) {
        system.debug('Input: ' + inputArguments);
        Datetime dt = Datetime.now();
		Long l = dt.getTime();
        String body = '{	' +
    						'"orderId": ' + inputArguments[0].orderId + ', ' +
    						'"Enddate": ' + inputArguments[0].Enddate + ', ' +
    						'"Startdate": ' + inputArguments[0].Startdate + ', ' +
    						'"itemId": "' + inputArguments[0].itemId + '", ' +
    						'"Name": "' + inputArguments[0].Name + '", ' +
    						'"accountInternalId": "' + inputArguments[0].accountInternalId + '", ' +
    						'"memo": "' + inputArguments[0].memo + '", ' +
                        '}';

        
        Http httpClass = new Http();
        HttpRequest httpReq = new HttpRequest();
        httpReq.setEndpoint('https://flow-e8b62da6-cd4d-4c27-9c69-a6ba6fb8486e-atba6q.2oyih5-1.usa-e1.cloudhub.io/');
		httpReq.setMethod('POST');
		httpReq.setHeader('Authorization', 'Basic N2ViMDk4ZWYzMmI4NDY3YWFiNjg1MWEyNGZiM2ZjZjA6MDJBNEQwOTNGZGU4NDQ1N2EzMDI2M2NjQTdhMDgwRGU='); 
		httpReq.setHeader('Content-Type', 'application/json');
        httpReq.setBody(body);
        
        HttpResponse httpRes = httpClass.send(httpReq);
        Integer responseCode = httpRes.getStatusCode();
        Map<String, Object> deserialized = (Map<String, Object>)JSON.deserializeUntyped(httpRes.getBody());
        List<Integer> listofInt = new List<Integer> {responseCode};
        system.debug(responseCode);
        FlowOutputs results = new FlowOutputs();
        results.responseCode = String.valueOf(responseCode);
        results.requestId = String.valueOf(deserialized.get('requestId'));
        List<FlowOutputs> theResults = new List<FlowOutputs>();
        theResults.add(results) ;
        return theResults;
    }
       
    //input details that comes to apex from flow
    public class FlowInputs{
    
        @InvocableVariable
        public String orderId;
        
        @InvocableVariable
        public String Enddate;

        @InvocableVariable
        public String Startdate;
        
        @InvocableVariable
        public String itemId;

        @InvocableVariable
        public String Name;
        
        @InvocableVariable
        public String accountInternalId;

        @InvocableVariable
        public String memo;

    }
    
    //output details which goes from apex to flow
    public class FlowOutputs{
        
        @InvocableVariable
        public String requestId;
        
        @InvocableVariable
        public String responseCode;
        
    }

    
    


}