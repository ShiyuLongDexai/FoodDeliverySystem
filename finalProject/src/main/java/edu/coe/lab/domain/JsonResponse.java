package edu.coe.lab.domain;

public class JsonResponse {
	 
	  private String status = "";
	  private String errorMessage = "";
	  private Object result = null;
	 
	  public JsonResponse() {
		   
		  }
	  
	  public JsonResponse(String status, String errorMessage) {
	    this.status = status;
	    this.errorMessage = errorMessage;
	  }

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public Object getResult() {
		return result;
	}

	public void setResult(Object result) {
		this.result = result;
	}
	  
	  
	}
