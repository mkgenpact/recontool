package com.recon.model;


//[{"Side":"FO","BuySell":"Buy","TradeId":"12345","Counterparty ID":"1234","Counterparty name":"ABC DEF",
//"FO Code":"VIP","Status":null,"Attribute":null,"Category":"Singleton","Value":null}]
public class JsonModel {

		private String side;		
		private String buysell;
		private String tradeid;
		private String counterpartyid;
		private String counterpartyname;
		private String focode;
		private String status;
		private String attribute;
		private String category;
		private String value;
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
		
		
}
