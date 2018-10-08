package com.recon.model;


//[{"Side":"FO","BuySell":"Buy","TradeId":"12345","Counterparty ID":"1234","Counterparty name":"ABC DEF",
//"FO Code":"VIP","Status":null,"Attribute":null,"Category":"Singleton","Value":null}]
public class JsonModel {

		private String fileRowId;
		private String side;		
		private String buysell;
		private String tradeid;
		private String counterpartyid;
		private String counterpartyname;
		private String focode;
		private String status;
		private String attribute;
		private String category;
		private String subcategory;
		private String value;
		private String action1;
		private String action2;
		private String comment;
		private String actiontaken;
		private String entereddate;
		
		public String getBreakactionid() {
			return breakactionid;
		}
		public void setBreakactionid(String breakactionid) {
			this.breakactionid = breakactionid;
		}
		private String breakactionid;
		
		public String getAction1() {
			return action1;
		}
		public void setAction1(String action1) {
			this.action1 = action1;
		}
		public String getAction2() {
			return action2;
		}
		public void setAction2(String action2) {
			this.action2 = action2;
		}
		public String getSide() {
			return side;
		}
		public void setSide(String side) {
			this.side = side;
		}
		public String getBuysell() {
			return buysell;
		}
		public void setBuysell(String buysell) {
			this.buysell = buysell;
		}
		public String getTradeid() {
			return tradeid;
		}
		public void setTradeid(String tradeid) {
			this.tradeid = tradeid;
		}
		public String getCounterpartyid() {
			return counterpartyid;
		}
		public void setCounterpartyid(String counterpartyid) {
			this.counterpartyid = counterpartyid;
		}
		public String getCounterpartyname() {
			return counterpartyname;
		}
		public void setCounterpartyname(String counterpartyname) {
			this.counterpartyname = counterpartyname;
		}
		public String getFocode() {
			return focode;
		}
		public void setFocode(String focode) {
			this.focode = focode;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public String getAttribute() {
			return attribute;
		}
		public void setAttribute(String attribute) {
			this.attribute = attribute;
		}
		public String getCategory() {
			return category;
		}
		public void setCategory(String category) {
			this.category = category;
		}
		public String getValue() {
			return value;
		}
		public void setValue(String value) {
			this.value = value;
		}
		public String getComment() {
			return comment;
		}
		public void setComment(String comment) {
			this.comment = comment;
		}
		public String getActiontaken() {
			return actiontaken;
		}
		public void setActiontaken(String actiontaken) {
			this.actiontaken = actiontaken;
		}
		public String getEntereddate() {
			return entereddate;
		}
		public void setEntereddate(String entereddate) {
			this.entereddate = entereddate;
		}
		public String getSubcategory() {
			return subcategory;
		}
		public void setSubcategory(String subcategory) {
			this.subcategory = subcategory;
		}
		public String getFileRowId() {
			return fileRowId;
		}
		public void setFileRowId(String fileRowId) {
			this.fileRowId = fileRowId;
		}
			
}
