public virtual class HttpRequestService {
    @TestVisible protected HttpRequest myRequest {private set; protected get;}
	@TestVisible private Map<RequestMethod, String> requestMethodMap;

    @TestVisible 
	protected HttpRequestService(String endpointApi, RequestMethod method) {
        this.requestMethodMap = new Map<RequestMethod, String>{
			RequestMethod.GET => 'GET',
			RequestMethod.POST => 'POST', 
			RequestMethod.PUT => 'PUT', 
			RequestMethod.PATCH => 'PATCH', 
			RequestMethod.DEL => 'DELETE'
		};
		this.myRequest = new HttpRequest();
        this.myRequest.setEndpoint(endpointApi);
        this.myRequest.setMethod(requestMethodMap.get(method));
    }

    @TestVisible 
	protected void setCustomHeader(String headerTitle, String headerValue) {
        this.myRequest.setHeader(headerTitle, headerValue);
    }

    @TestVisible 
	protected void setHeaderContentType(String contentType) {
        this.myRequest.setHeader('Content-Type', contentType);
    }

    @TestVisible 
	protected void setRequestBody(String body) {
        this.myRequest.setBody(body);
    }

	@TestVisible 
	protected void setRequestBody(Blob body) {
        this.myRequest.setBodyAsBlob(body);
    }

    @TestVisible 
	protected HttpResponse sendRequest() {
        Http transfer = new Http();
        return transfer.send(this.myRequest);
    }

	public enum RequestMethod { GET, POST, PUT, PATCH, DEL }
}
